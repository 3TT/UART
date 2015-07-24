`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:12:54 11/05/2014
// Design Name:   Rx
// Module Name:   /home/uboldi/workspace_ISEXilinx_14.7/UART/Rx_tb.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Rx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Rx_tb;

	// Inputs
	reg clock;
	reg dato_in;
	//reg tick_in;

	// Outputs
	wire tick;
	wire [7:0] dato_out;
	wire rx_done_tick;

	//Otras variables
	reg [7:0] contador;
	//reg [3:0] cont_bits;
	// Instantiate the Unit Under Test (UUT)
	Rx uut (
		.dato_in(dato_in), 
		.tick_in(tick), 
		.dato_out(dato_out), 
		.rx_done_tick(rx_done_tick)
	);
	
	Baud_Rate_Generator baud_rate (
		.clock(clock), 
		.tick(tick)
	);
	
	
	

	initial begin
		// Initialize Inputs
		clock = 0;
		dato_in = 1; //Porque 0 es el bit de start.
		//tick_in = 0;
		contador = 0;
		//cont_bits = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
   always #1 clock = ~clock;
	
	always@ (posedge tick)
	begin
		//tick_in = tick;
		if(contador == 15)
			begin
				dato_in = ~dato_in;
				//cont_bits = cont_bits +1;
				contador = 0;
			end
		else
			begin
				contador = contador +1;
			end
	end
	
	
endmodule

