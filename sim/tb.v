`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:57:50 08/21/2022
// Design Name:   tap_controller
// Module Name:   D:/teekam/jtag_tap_controller_fsm/tap_controler_asm_tb.v
// Project Name:  jtag_tap_controller_fsm
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tap_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tap_controler_asm_tb;

	// Inputs
	reg tck;
	reg tms;
	reg trst;

	// Outputs
	wire cdr1;
	wire sdr1;
	wire udr1;
	wire cir1;
	wire sir1;
	wire uir1;

	// Instantiate the Unit Under Test (UUT)
	tap_controller uut (
		.tck(tck), 
		.tms(tms), 
		.trst(trst), 
		.cdr1(cdr1), 
		.sdr1(sdr1), 
		.udr1(udr1), 
		.cir1(cir1), 
		.sir1(sir1), 
		.uir1(uir1)
	);

	
// my vwerifcation stratergy 
// clk generation 
initial begin
		// Initialize Inputs
		tck = 0;
		forever #10 tck = ~tck;
end

initial begin
		// Initialize Inputs
		// tck = 0;
		tms = 0;
		trst = 0;
		#20;
		// logic for generating cdr1 and sd1 high
		trst = 1;
#20;
		tms = 1;
		
	   #20;
	   tms = 0;
      #20;	
     tms = 0;
	  #20;
	   tms = 0; //repeat for shift high
		#20;
		tms = 1;
	  #20;
	   tms = 1; //udr1 is highr
		
		#20;
		tms=0;
		#20;
		tms = 1;
	  #20;
	   tms = 1; //reached on select ir
		#20
		
		tms = 0;
		#20;
		// logic for generating cir1 and sd1 high
		tms = 1;
	   #10;
	   tms = 0;
      #20;	
     tms = 0;
	  #20;
	   tms = 0; //repeat for shift high
		#20;
		tms = 1;
	  #20;
	   tms = 1; //udr1 is highr
		#20;
		
		
		// logic for 5 time one to reach on initial state
		tms=1;
		#100;
		tms=0;
		
	

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

