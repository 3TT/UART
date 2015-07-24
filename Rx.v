`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:32 10/30/2014 
// Design Name: 
// Module Name:    Rx 
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

module Rx(input dato_in,	
			input tick_in,
			output reg [`D_BIT:0] dato_out,
			output reg rx_done_tick
    );

	localparam [3:0] IDLE = 4'b0001,
						  START = 4'b0010,
						  DATA = 4'b0100,
						  STOP = 4'b1000;
	
	reg [`D_BIT:0] shift;				  
	reg [3:0] estado_actual, estado_siguiente;
	reg [3:0] tickCounter; //ES el s que esta en las filminas, cuenta la cantidad de ticks del baud rate generator
	reg [3:0] dataCounter; //Es el n que esta en las filminas del TP, cuenta los bits que se van leyendo.
	reg cambioEstado;
	
	initial dato_out = 0;
	initial rx_done_tick = 0;
	initial estado_actual = IDLE;
	initial estado_siguiente = IDLE; //Este no se usa porque los estados se cambian directamente en el always, ver always de logica de cambio de estado. Esta al final
	
	//Logica de tickCounter
/*	always @(posedge tick_in)
	begin
		case(estado_actual)
			IDLE:
				begin
					tickCounter = 0;
				end
			START:
				begin
					if(tickCounter == 7)
						begin
							tickCounter = 0;
						end
					else
						begin
							tickCounter = tickCounter +1;
						end
				end
			DATA:
				begin
					if(tickCounter == 15)
						begin
							tickCounter = 0;
						end
					else
						begin
							tickCounter = tickCounter +1;
						end
				end
			STOP:
				begin
					tickCounter = 0;
				end
			default:
				begin
					tickCounter = 0;
				end
		endcase
	end //Always tickCounter*/
	
	always@ (posedge tick_in) //En esta lista quizas solo tengamos que poner el tick_in.
	begin
		case(estado_actual)
			IDLE:
				begin
					cambioEstado = 0;
					tickCounter = 0;
					dataCounter = 0;
					rx_done_tick = 0;
					if(dato_in == 0)
						begin
							//cambioEstado = 1;
							estado_actual = START; //Se cambia de estado.
						end
					else
						begin
							estado_actual = IDLE; //Mantiene el estado. 
						end
					//No pongo el else porque esta asignado por defecto el valor de cambioEstado antes del if, entonces no va a generar latch.
				end
			START:
				begin
					//cambioEstado = 0;
					shift = 0;
					dataCounter = 0; //Es el n que esta en las filminas del TP, cuenta los bits que se van leyendo.
					
					if(tickCounter == 7) //Estoy a la mitad del bit de start.
						begin
							//cambioEstado = 1;
							tickCounter = 0;
							estado_actual = DATA; //Se cambia de estado.
						end
					else
						begin
							tickCounter = tickCounter +1;
							estado_actual = START; //Mantiene el estado.
						end
				end
			DATA:
				begin
					//cambioEstado = 0;
					//Se ve si hay que tomar el dato.
					
					if(tickCounter == 15)
						begin
							shift = shift >> 1;
							shift = {dato_in, shift[`D_BIT-1:0]};
							dataCounter = dataCounter + 1;
							tickCounter = 0;
						end
					else
						begin
							tickCounter = tickCounter +1;
							shift = shift;
							dataCounter = dataCounter;
						end
					
					//Se ve si ya se tomaron todos los datos.
					if (dataCounter == `D_BIT+1) //D_BIT vale 7 y se esperan 8 bits por eso el +1. En el diagrma de estados resta porque actualiza el dataCounter despues de esto, aca se actualiza apenas se agrega el dato al shift register, en el if de arriba.
						begin
							//cambioEstado = 1;
							estado_actual = STOP; //Cambia el estado.
						end
					else
						begin
							//cambioEstado = 0;
							estado_actual = DATA; //Mantiene el estado.
						end
				end
			STOP:
				begin
					//cambioEstado = 0;
					//Se espera hasta estar en la mitad del bit de stop.
	
					if(tickCounter == 15)
						begin
							if(cambioEstado == 1)
								estado_actual = IDLE;
							cambioEstado = 1;
							
							//estado_actual = IDLE; //Cambia el estado.
							rx_done_tick = 1;
							dato_out = shift;
							tickCounter = 0;
						end
					else
						begin
							tickCounter = tickCounter +1;
						end
				end
			default:
				begin
					//estado_siguiente = IDLE; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
					estado_actual = IDLE;
					tickCounter = 0;
				end
		endcase
	end//always de logica de salida
	
	
	//Logica de cambio de estado
/*	always@ (posedge cambioEstado)
	begin
		case(estado_actual)
			IDLE:
				begin
					//estado_siguiente = START;
					estado_actual = START;
				end
			START:
				begin
					//estado_siguiente = DATA;
					estado_actual = DATA;
				end
			DATA:
				begin
					//estado_siguiente = STOP;
					estado_actual = STOP;
				end
			STOP:
				begin
					//estado_siguiente = IDLE;
					estado_actual = IDLE;
				end
			default:
				begin
					//estado_siguiente = IDLE; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
					estado_actual = IDLE;
				end
		endcase
	end //always de logica cambio de estado*/

endmodule
