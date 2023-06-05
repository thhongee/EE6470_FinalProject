#ifndef _SYSTEM_H_
#define _SYSTEM_H_

// Include some required files.
#include <systemc.h>	 // SystemC definitions.
#include <esc.h>		 // Cadence ESC functions and utilities.
#include <stratus_hls.h> // Cadence Stratus definitions.
#include <cynw_p2p.h>	 // The cynw_p2p communication channel.
#include "defines.h"
#include "tb.h"
#include "dut_wrap.h" // use the generated wrapper for all hls_modules

SC_MODULE(System)
{
	// clock and reset signals
	sc_clock clk_sig;
	sc_signal<bool> rst_sig;

	// cynw_p2p channels
	cynw_p2p<input_t> chan1;  // For data going into the design
	cynw_p2p<output_t> chan2; // For data coming out of the design

	// The testbench and DUT modules.
	dut_wrapper *m_dut; // use the generated wrapper for the DUT hls module
	tb *m_tb;

	SC_CTOR(System)
		: clk_sig("clk_sig", CLOCK_PERIOD, SC_NS), rst_sig("rst_sig"), chan1("chan1"), chan2("chan2")
	{
		// Connect the design module
		m_dut = new dut_wrapper("dut_wrapper");
		m_dut->clk(clk_sig);
		m_dut->rst(rst_sig);
		m_dut->din(chan1);
		m_dut->dout(chan2);

		// Connect the testbench
		m_tb = new tb("tb");
		m_tb->clk(clk_sig);
		m_tb->rst(rst_sig);
		m_tb->dout(chan1);
		m_tb->din(chan2);
	}

	~System()
	{
		delete m_tb;
		delete m_dut;
	}
};

#endif // _SYSTEM_H_
