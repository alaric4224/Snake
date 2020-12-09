`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 02:28:41 PM
// Design Name: 
// Module Name: clock_divider
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


module Clok(
input clk,

output reg divided_clk = 0
    );
localparam div_value = 4999;
integer counter_value = 0;

always@ (posedge clk)
begin
    if(counter_value == div_value)
    counter_value <= 0;
    else
    counter_value <= counter_value + 1;
end

always@ (posedge clk)
begin
    if(counter_value == div_value)
    divided_clk <= ~divided_clk;
    else
    divided_clk <= divided_clk;
end
endmodule
