`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 02:09:09 PM
// Design Name: 
// Module Name: BCD_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD_control(
//input [5:0] digit1,
//input [5:0] digit2,
//input [3:0] digit3,
input [7:0]ans,
input [2:0] refreshcounter,

output reg [7:0] ONE_DIGIT
    );
    
wire [7:0]a1;
wire [7:0]a2;
wire [7:0]ans_inv;
wire [7:0]ans_inv2;   
//assign a2 = ans % 8'b01100100;
assign a1 = ans % 8'b00001010;
assign ans_inv = ~(ans - 8'b00000001);
assign ans_inv2 = ans_inv % 8'b00001010;

always@(refreshcounter)
begin

case(refreshcounter)
    3'd0:                                   //First digit
    begin
        ONE_DIGIT = ans % 10; 
    end
    
    
    
    
    3'd1:                                           //Second digit
    begin
        if(ans > 4'b1001)
        begin
            ONE_DIGIT = ans % 10;
        end
        else
        begin
            ONE_DIGIT = 8'b11111111;
        end
    end



    3'd2: ONE_DIGIT = 8'b11111110;//Third digit -> -
    
    3'd3: ONE_DIGIT = 8'b00001110;// Fourth digit -> E
    3'd4: ONE_DIGIT = 8'b00001011;// Fifth digit -> R
    3'd5: ONE_DIGIT = 8'b00000000;// Sixth digit -> O
    3'd6: ONE_DIGIT = 8'b00001100;// Seventh digit -> C
    3'd7: ONE_DIGIT = 8'b00001010;// Eighth digit -> S
    endcase
    end
endmodule
