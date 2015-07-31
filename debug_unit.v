`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:14 07/22/2015 
// Design Name: 
// Module Name:    debug_unit 
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


module debug_unit(
										input clk,
										input [`D_BIT:0] rx_dato_out, //Recibido desde RX
										input rx_done,
										input tx_done,
										output reg [`D_BIT:0] tx_dato_in, //Enviado a TX
										output reg tx_start
										);

	localparam [3:0]	IDLE = 4'b0001,
									  START = 4'b0010,
									  DATA = 4'b0100,
									  STOP = 4'b1000;
									  
reg [3:0] estado_actual;
initial estado_actual = IDLE;
						  
always @ (posedge clk)
case(estado_actual)
			IDLE:
				begin
					if(rx_done == 1)
						begin
							estado_actual = START; //Se cambia de estado.
						end
					else
						begin
							estado_actual = IDLE; //Mantiene el estado. 
						end
				end
			START:
				begin
					if(rx_done == 0)	//¿PORQUE SI SE SACA ESTE IF TIRA CUALQUIER COSA?
						begin
							tx_dato_in = rx_dato_out;
							tx_start = 1;
							estado_actual = DATA;
						end
					/*if(rx_dato_out == "a")
						begin
							tx_dato_in = "p";
							tx_start = 1;
							estado_actual = DATA;
						end
					else if(rx_dato_out == "s")
						begin
							tx_dato_in = "0";
							tx_start = 1;
							estado_actual = DATA;
						end*/
					else 
						begin
							estado_actual = estado_actual;
						end
				end
			DATA:
				begin
					
					if(tx_done == 1)
						begin
							tx_start = 0;
							estado_actual = IDLE;
						end
					else 
						begin
							estado_actual = DATA;
						end
				end
			default:
				begin
					estado_actual = IDLE;
				end
		endcase
endmodule
