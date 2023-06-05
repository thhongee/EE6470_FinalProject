#ifndef DUT_H
#define DUT_H

#include <cynw_p2p.h>
#include "defines.h"

SC_MODULE(dut)
{
	// Declare the clock and reset ports
	sc_in<bool> clk;
	sc_in<bool> rst;

	// Declare the input port and the output port.
	// The template specializations <DT_*> configure the
	// modular interfaces to carry the desired datatypes.
	cynw_p2p<input_t>::in din;	  // The input port
	cynw_p2p<output_t>::out dout; // The output port

	SC_CTOR(dut)
		: clk("clk"), rst("rst"), din("din"), dout("dout")
	{
		SC_CTHREAD(thread1, clk.pos());
		reset_signal_is(rst, 0);

		// Connect the P2P ports to clk and rst
		din.clk_rst(clk, rst);
		dout.clk_rst(clk, rst);
	}

	void thread1(); // the thread function
};

#endif // DUT_H
