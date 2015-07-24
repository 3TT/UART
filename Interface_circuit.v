`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:53:35 11/06/2014 
// Design Name: 
// Module Name:    Interface_circuit 
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

module Interface_circuit(input wr,
						input [`D_BIT:0] wr_data, //Lo que se quiere transmitir por TX
						input rd,
						input [`D_BIT:0] rx_dato_out, //Recibido desde RX
						input rx_done,
						input tx_done,
						output reg [`D_BIT:0] rd_data, //Lo que se leyo desde RX
						output reg rx_empty,
						output reg [`D_BIT:0] tx_dato_in, //Enviado a TX
						output reg tx_start,
						output reg tx_full
    );

	reg [`D_BIT:0] buff_rx; //Buffer de una palabra.
	//reg [`D_BIT:0] buff_tx;	
	
/*	always @ (posedge rx_done)
	begin	
		buffer_rx = rx_dato_out; 
		rx_empty = 1; //Hay dato en buffer.				
	end
	
	always @ (posedge rd)
	begin
		rd_data = buffer_rx;
		rx_empty = 0; //No hay dato en buffer.
	end*/

	always @ (posedge rx_done, posedge rd)
	begin
		if(rx_done == 1)
		begin 	
			buff_rx = rx_dato_out; 
			rd_data = rd_data;
			rx_empty = 1; //Hay dato en buffer.				
		end
		else
		begin
			buff_rx = buff_rx;
			rd_data = buff_rx;
			rx_empty = 0;
		end
	end

		
	always @ (posedge wr, posedge tx_done)
	begin
		if (wr == 1)
			begin
				//buff_tx = wr_data;
				tx_dato_in = wr_data;
				tx_full = 1; //El buffer de transmision esta lleno.
				tx_start = 1;
			end
		else
			begin
				tx_dato_in = tx_dato_in;
				tx_full = 0; //El buffer de transmision esta vacio.
				tx_start = 0;
			end
	end
endmodule
