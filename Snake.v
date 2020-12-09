`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 04:08:40 PM
// Design Name: 
// Module Name: Snake
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


module Snake(
    input clk,
    input kclk,
    input kdata,
    input arst,
    
    output [3:0]r,
    output [3:0]g,
    output [3:0]b,
    output vsync,
    output hsync,
    output [7:0]anode,
    output wire o_Segment_A,
    output wire o_Segment_B,
    output wire o_Segment_C,
    output wire o_Segment_D,
    output wire o_Segment_E,
    output wire o_Segment_F,
    output wire o_Segment_G
    );
    wire [9:0] x, y;
    wire de;
    wire [31:0] keycodeout;
    wire [2:0] move;
    wire clk25;
    wire reset;
    wire locked;
    wire rst;
    wire [7:0]score;
    wire animate;
    
    assign rst = ~arst;
    
     clk_wiz_0 instx
  (
  // Clock out ports  
  .clk25(clk25),
  // Status and control signals               
  .reset(reset), 
  .locked(locked),
 // Clock in ports
  .clk_in1(clk)
  );
  
  
    
    PS2Receiver keyboard(.clk(clk), .kclk(kclk), .kdata(kdata), .keycodeout(keycodeout));
    
    decoder dcode(.x(keycodeout), .movement(move));
    
    vga_gen_two VGArefresh(.clk(clk25), .x(x), .y(y), .v_sync(vsync), .h_sync(hsync), .display(de), .animate(animate));
    
    VGAmov Snakemake(.animate(animate), .inmove(move), .x(x), .y(y), .de(de), .rst(rst), .clk(clk25), .r(r), .g(g), .b(b), .score(score));
    
    top wrapper(.clk(clk), .ans(score), .anode(anode), .o_Segment_A(o_Segment_A), .o_Segment_B(o_Segment_B), .o_Segment_C(o_Segment_C), .o_Segment_D(o_Segment_D), .o_Segment_E(o_Segment_E), .o_Segment_F(o_Segment_F), .o_Segment_G(o_Segment_G));
    
endmodule