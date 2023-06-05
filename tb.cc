

#include "tb.h"
#include <esc.h> // for the latency logging functions
#include <string>
#include <iostream>

// The source thread reads data from a file and sends it to the DUT
void tb::source()
{
	dout.reset(); // reset the outputs and cycle the design's reset
	rst.write(0); // assert reset (active low)
	wait(2);	  // wait 2 cycles
	rst.write(1); // deassert reset
	wait();

	// Open the stimulus file
	char stim_file[256] = "stimulus.dat";
	infp = fopen(stim_file, "r");
	if (infp == NULL)
	{
		cout << "Couldn't open stimulus.dat for reading." << endl;
		exit(0);
	}

	// Read stimulus values from file and send to DUT
	for (int i = 0; i < 16; i++)
	{
		int value;
		fscanf(infp, "%d\n", &value);
		dout.put((input_t)value);		 // send the stimulus value
		start_time[i] = sc_time_stamp(); // mark the time value was sent
	}

	// Guard condition: after 100000 cycles the sink() thread should have ended the simulation.
	// If we're still here, timeout and print error message.
	wait(100000);
	fclose(infp);
	cout << "Error! TB source thread timed out!" << endl;
	esc_stop();
}

// The sink thread reads all the expected values from the design
void tb::sink()
{
	din.reset();
	wait(); // to synchronize with reset

	// Extract clock period from clk port
	sc_clock *clk_p = dynamic_cast<sc_clock *>(clk.get_interface());
	sc_time clock_period = clk_p->period();

	// Open the simulation results file
	char output_file[256];
	sprintf(output_file, "%s/response.dat", getenv("BDW_SIM_CONFIG_DIR"));
	outfp = fopen(output_file, "wb");
	if (outfp == NULL)
	{
		cout << "Couldn't open output.dat for writing." << endl;
		exit(0);
	}

	// Read outputs from DUT
	unsigned long total_latency = 0;
	for (int i = 0; i < 16; i++)
	{

		output_t inVal = din.get();
		fprintf(outfp, "%d\n", (int)inVal); // write value to response file

		// Calculate latency for this particular output
		unsigned long latency = (sc_time_stamp() - start_time[i]) / clock_period;
		cout << "Latency for sample " << i << " is " << latency << endl;

		// Keep running total of all latency cycles for later
		total_latency += latency;
	}

	// Calculate, log and print average latency
	unsigned long average_latency = total_latency / 16;
	esc_log_latency("dut", average_latency, "average_latency");
	cout << "Average latency " << average_latency << "." << endl;

	// Close the results file and end the simulation
	fclose(outfp);
	esc_stop();
}
