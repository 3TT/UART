`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:17:44 11/06/2014
// Design Name:   Tx
// Module Name:   /home/uboldi/workspace_ISEXilinx_14.7/UART/Tx_tb.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Tx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Tx_tb;

	// Inputs
	reg clock;
	reg [7:0] dato_in;
	reg tx_start;
	//reg tick_in;

	// Outputs
	wire tick;
	wire dato_out;
	wire tx_done_tick;
	
	//Otras variables
	reg [7:0] contador;
	
	// Instantiate the Unit Under Test (UUT)
	Tx uut (
		.dato_in(dato_in),	
		.tick_in(tick),
		.tx_start(tx_start),
		.dato_out(dato_out),
		.tx_done_tick(tx_done_tick)
   );
	 	
	Baud_Rate_Generator baud_rate (
		.clock(clock), 
		.tick(tick)
	);


	initial begin
		// Initialize Inputs
		clock = 0;
		tx_start = 0;
		contador = 0;
		dato_in = 8'b00100101;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #1 clock = ~clock;

	always@ (posedge tick, posedge tx_done_tick)
	begin
		tx_start = 0;
		if(contador == 15)
			begin
				tx_start = 1;
				contador = contador + 1;
				//cont_bits = cont_bits +1;
			end
		else
			begin
				contador = contador + 1;
			end
		
		if(tx_done_tick == 1)
			begin
				contador = 0;
			end
	end

      
endmodule

