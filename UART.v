`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:05 11/11/2014 
// Design Name: 
// Module Name:    UART 
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

module UART(input clk100,
				input rd,
				input wr,
				input [`D_BIT:0] w_data,
				input rx,
				output tx,
				output [`D_BIT:0] r_data,
				output rx_empty,
				output tx_full
    );

	wire tick, rx_done_tick, tx_done_tick, tx_start;
	
	wire [`D_BIT:0] rx_dato_out;
	wire [`D_BIT:0] tx_dato_in;
	
	wire clk, clkX2;
	
	/*Baud_Rate_Generator BRG (.clock(clk),
									.tick(tick));*/
									
	// Instantiate the module
  clockReductor clockReductor(
													 .CLK_IN1(clk100),
													 .CLK_OUT1(clk),
													 .CLK_OUT2(clkX2)
													 ); 
	
	baud BRG (
					 .sys_clk(clk), 
					 .baud_clk(tick)
					 );

	/*Rx reciever (.dato_in(rx),	
					.tick_in(tick),
					.dato_out(rx_dato_out),
					.rx_done_tick(rx_done_tick));
					
	Tx transmitter (.dato_in(rx_dato_out),	
						.tick_in(tick),
						.tx_start(rx_done_tick),
						.dato_out(tx),
						.tx_done_tick(tx_done_tick));*/
						
	//assign r_data = rx_dato_out;
	
	Rx reciever (.dato_in(rx),	
					.tick_in(tick),
					.dato_out(rx_dato_out),
					.rx_done_tick(rx_done_tick));
					
	Tx transmitter (.dato_in(tx_dato_in),	
						.tick_in(tick),
						.tx_start(tx_start),
						.dato_out(tx),
						.tx_done_tick(tx_done_tick));
						

	 debug_unit debug (
										 .clk(clk), 
										 .rx_dato_out(rx_dato_out), 
										 .rx_done(rx_done_tick), 
										 .tx_done(tx_done_tick), 
										 .tx_dato_in(tx_dato_in), 
										 .tx_start(tx_start)
										 );
						
	/*Rx reciever (.dato_in(rx),	
					.tick_in(tick),
					.dato_out(rx_dato_out),
					.rx_done_tick(rx_done_tick));
					
	Tx transmitter (.dato_in(tx_dato_in),	
						.tick_in(tick),
						.tx_start(tx_start),
						.dato_out(tx),
						.tx_done_tick(tx_done_tick));*/
						
	/*Interface_circuit IC(.wr(wr),
							.wr_data(w_data), //Lo que se quiere transmitir por TX
							.rd(rd),
							.rx_dato_out(rx_dato_out), //Recibido desde RX
							.rx_done(rx_done_tick),
							.tx_done(tx_done_tick),
							.rd_data(r_data), //Lo que se leyo desde RX
							.rx_empty(rx_empty),
							.tx_dato_in(tx_dato_in), //Enviado a TX
							.tx_start(tx_start),
							.tx_full(tx_full));*/

endmodule
