`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:53 11/11/2014 
// Design Name: 
// Module Name:    prueba 
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
module prueba(	input clock,
								input rx,
								output tx
								//output recibido
								);

	wire read, write, empty, full;
	wire [7:0] transmitir, recibido;
	
	
	
	UART uart(.clk100(clock),
				.rd(read),
				.wr(write),
				.w_data(transmitir),
				.rx(rx),
				.tx(tx),
				.r_data(recibido),
				.rx_empty(empty),
				.tx_full(full)
    );
	 
	 
	

	 
	/* test tst(.clk(clock),
				.r_data(recibido),
				.rx_empty(empty),
				.tx_full(full),
				//.pulsador_enviar(pulsador_enviar),
				.rd(read),
				.w_data(transmitir),
				.wr(write)
    );*/


endmodule
