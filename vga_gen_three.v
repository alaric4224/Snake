`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:47:08 AM
// Design Name: 
// Module Name: vga_gen_three
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


module vga_gen_three(
    input clk,
    output H_Sync,
    output V_Sync,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B
    );
    
    wire vga_clk, v_count_enable;
    wire [15:0] v_value, h_value;
    
    clk_master_control Clk(clk, 2, vga_clk);
    horiz_count Horiz(vga_clk, v_count_enable, h_value);
    vertic_count Vertic(vga_clk, v_count_enable, v_value);
    
    assign H_Sync = (h_value < 96) ? 1'b1:1'b0;
    assign V_Sync = (v_value < 2) ? 1'b1:1'b0;
    assign R = (h_value < 784 && h_value > 143 && v_value < 515 && v_value > 34) ? 4'hF:4'h0;
    assign G = (h_value < 784 && h_value > 143 && v_value < 515 && v_value > 34) ? 4'hF:4'h0;
    assign B = (h_value < 784 && h_value > 143 && v_value < 515 && v_value > 34) ? 4'hF:4'h0;
endmodule
