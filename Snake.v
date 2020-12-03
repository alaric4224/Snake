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
    output r,
    output g,
    output b,
    output vsync,
    output hsync
    );
    wire [9:0] x, y;
    wire de;
    wire [31:0] keycodeout;
    wire [2:0] move;
    
    PS2Receiver keyboard(.clk(clk), .kclk(kclk), .kdata(kdata), .keycodeout(keycodeout));
    
    decoder dcode(.x(keycodeout), .movement(move));
    
    VGA_gen VGArefresh(.clk(clk), .x(x), .y(y), .v_sync(vsync), .h_sync(hsync), .display(de));
    
    VGAmov Snakemake(.move(move), .x(x), .y(y), .clk(clk), .r(r), .g(g), .b(b));
    
endmodule