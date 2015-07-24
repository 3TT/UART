`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:42:10 10/30/2014
// Design Name:   Baud_Rate_Generator
// Module Name:   /home/uboldi/workspace_ISEXilinx_14.7/UART/Baud_Rate_Generator_tb.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Baud_Rate_Generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Baud_Rate_Generator_tb;

	// Inputs
	reg clock;

	// Outputs
	wire tick;

	// Instantiate the Unit Under Test (UUT)
	Baud_Rate_Generator uut (
		.clock(clock), 
		.tick(tick)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #1 clock = ~clock;
      
endmodule

