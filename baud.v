`timescale 1us / 1us
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:04 03/11/2015 
// Design Name: 
// Module Name:    baud 
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
/* XTAL_CLK = 3072000, 
	BAUD = 9600, 
	CLK_DIV = XTAL_CLK / (BAUD * 16) ---> 20
*/
module baud(
		input sys_clk,
		output baud_clk				
	);
	mod_m_counter #(.N(9), .M(20)) modu(
		.clk(sys_clk),
		.reset(1'b0),
		.q(),
		.max_tick(baud_clk)
	);

endmodule
