`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:00 10/30/2014 
// Design Name: 
// Module Name:    Baud_Rate_Generator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Baud_Rate_Generator(clock,
									tick);
	
	input clock;
	output reg tick;
	reg [7:0] contador = 0;
	
	
	initial tick = 0;
	
	always@(posedge clock)
	begin
		contador = contador + 1;
		if(contador == 163)
		begin
			tick = 1;
			contador = 0;
		end
		else begin 
			contador = contador;
			tick = 0;
		end
		
	end //Always

endmodule
