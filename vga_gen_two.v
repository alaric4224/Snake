`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 07:39:00 PM
// Design Name: 
// Module Name: vga_gen_two
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


module vga_gen_two(
clk, x, y, v_sync, h_sync, display
    );
    input clk;
    output reg [15:0] x, y;
    output v_sync, h_sync;
    output reg display;
    reg v_porch, h_porch;
    wire new_clk;
    
    Clock_Divider clk_divider(2, clk, new_clk);
    
    parameter max_x = 800;
    parameter max_y = 525;
    
    always @(posedge new_clk)
    begin
        if (max_x == x)
            x <= 0;
        else
            x <= x + 1;
    end
    
    always @(posedge new_clk)
    begin
        if (max_x == x)
        begin
            if (max_y == y)
                y <= 0;
            else
                y <= y + 1;
        end        
    end
    
    always @(posedge new_clk)
    begin
        display <= (x >= 144 && x <= 784) && (y >= 35 && y <= 515);
    end
    
    assign v_sync = (y < 96) ? 1'b1:1'b0;
    assign h_sync = (x < 2) ? 1'b1:1'b0;
    
endmodule
