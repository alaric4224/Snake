`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2020 02:38:52 PM
// Design Name: 
// Module Name: Clock_Divider
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


module Clock_Divider(divider, clk, new_clk
    );

input [27:0] divider;
input clk;
output new_clk;

reg [27:0] counter = 0;

always @(posedge clk)
begin
    counter <= counter + 1;
    if(counter >= (divider-1))
        counter <= 28'b0;  
end
assign new_clk = (counter < divider/2)?1'b0:1'b1;

endmodule
