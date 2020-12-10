`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 02:28:26 PM
// Design Name: 
// Module Name: top
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


module top(
input clk,
input [7:0]ans,
//input c_out,
//input wire [15:0] switch,
//input wire mode,

output [7:0]anode,
output wire o_Segment_A,
output wire o_Segment_B,
output wire o_Segment_C,
output wire o_Segment_D,
output wire o_Segment_E,
output wire o_Segment_F,
output wire o_Segment_G
    );

wire refresh_clock;
wire [2:0] refreshcounter;
wire [7:0] ONE_DIGIT;

Clok refreshclock_generator(.clk(clk), .divided_clk(refresh_clock));

refreshcounter Refreshcounter_wrapper(.refresh_clock(refresh_clock), .refreshcounter(refreshcounter));

anode_control anode_control_wrapper(.refreshcounter(refreshcounter), .anode(anode));

BCD_control BCD_control_wrapper( .ans(ans), .refreshcounter(refreshcounter), .ONE_DIGIT(ONE_DIGIT));

BCD_to_Cathodes BCD_to_Cathodes_wrapper(.digit(ONE_DIGIT), .o_Segment_A(o_Segment_A),.o_Segment_B(o_Segment_B),.o_Segment_C(o_Segment_C),.o_Segment_D(o_Segment_D),.o_Segment_E(o_Segment_E),.o_Segment_F(o_Segment_F),.o_Segment_G(o_Segment_G));


endmodule
