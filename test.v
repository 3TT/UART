`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:12 11/11/2014 
// Design Name: 
// Module Name:    test 
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
`define D_BIT 7 //Por ser de 0 a 7 son 8 bits.

module test(input clk,
				input [`D_BIT:0] r_data,
				input rx_empty,
				input tx_full,
				output reg rd,
				output reg [`D_BIT:0] w_data,
				output reg wr
    );
	
	reg [`D_BIT:0] dato_leido;
	initial
		begin
			rd = 0;
			wr = 0;
		end
	
	//always @ (posedge clk, negedge tx_full)
	always @ (posedge clk)
	begin
		w_data = 8'b01110011;
		w_data = dato_leido;
		if (tx_full) wr = 0;
		else wr = 1;
	end
	
	//always @ (posedge clk, posedge rx_empty)
	always @ (posedge clk)
	begin
		if(rx_empty) rd = 0;
		else rd = 1;
		dato_leido = r_data;
	end
	
endmodule
