`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:35:25 07/17/2015
// Design Name:   prueba
// Module Name:   /home/laryc05/Workspace.arq/TP_UART/UART/prueba2_tb.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: prueba
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prueba2_tb;

	// Inputs
	reg clock;
	reg rx;

	// Outputs
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	prueba uut (
		.clock(clock), 
		.rx(rx), 
		.tx(tx)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		rx = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		  //ENVIO PRIMER DATO
		  rx=0; //star
		  #2;
		  rx=1;
		  #2;
		  rx=0;
		  #2;
		  rx=1;
		  #2;
		  rx=0;
		  #2;
		  rx=1;
		  #2;
		  rx=1;
		  #2;
		  rx=0;
		  #2;
		  rx=1;
		  #2;
		  rx=1; //stop
		  #2;
		 
			#100;
        
		  //ENVIO SEGUNDO DATO
		  rx=0; //star
		  #1;
		  rx=0;
		  #1;
		  rx=0;
		  #1;
		  rx=1;
		  #1;
		  rx=1;
		  #1;
		  rx=1;
		  #1;
		  rx=1;
		  #1;
		  rx=0;
		  #1;
		  rx=0;
		  #1;
		  rx=1; //stop
		  #1;
		
		#100;
        
		  //ENVIO TERCER DATO
		  rx=0; //star
		  #1;
		  rx=1;
		  #1;
		  rx=0;
		  #1;
		  rx=1;
		  #1;
		  rx=0;
		  #1;
		  rx=1;
		  #1;
		  rx=1;
		  #1;
		  rx=0;
		  #1;
		  rx=1;
		  #1;
		  rx=1; //stop
		  #1;
		
		#100;
        
		  //ENVIO CUARTO DATO
		  rx=0; //star
		  #1;
		  rx=1;
		  #1;
		  rx=0;
		  #1;
		  rx=1;
		  #1;
		  rx=0;
		  #1;
		  rx=1;
		  #1;
		  rx=1;
		  #1;
		  rx=0;
		  #1;
		  rx=1;
		  #1;
		  rx=1; //stop
		  #1;
		
		  
		// Add stimulus here

	end
	
	always #1 clock = !clock;
      
endmodule

