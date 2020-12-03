`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Thomas Kappenman
// 
// Create Date:    03/03/2015 09:08:33 PM 
// Design Name: 
// Module Name:    seg7decimal 
// Project Name: Nexys4DDR Keyboard Demo
// Target Devices: Nexys4DDR
// Tool Versions: 
// Description: 7 segment display driver
// 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module decoder(

	input [31:0] x,
    
    output reg [2:0] movement
	 );

//reg [2:0] movement;

always @(*)
	case(x[7:0])
	8'b01101011 : //Left
	begin
	   movement = 3'b010;
	end
	8'b01110010 : //Down
	begin
	   movement = 3'b011;
	end
	8'b01110100 : //Right
	begin
	   movement = 3'b000;
	end
	8'b01110101 : //Up
	begin
	   movement = 3'b001;
	end
	endcase






endmodule
