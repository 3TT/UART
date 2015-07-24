`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:24:32 11/11/2014
// Design Name:   prueba
// Module Name:   /home/uboldi/workspace_ISEXilinx_14.7/UART/prueba_tb.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: prueba
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prueba_tb;

	// Inputs
	reg clock;

	// Instantiate the Unit Under Test (UUT)
	prueba uut (
		.clock(clock)
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

