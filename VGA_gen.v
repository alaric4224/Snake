`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2020 11:28:28 AM
// Design Name: 
// Module Name: VGA_gen
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


module VGA_gen(clk, x, y, v_sync, h_sync, display);

    input clk;
    output reg [9:0] x, y;
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
        v_porch <= (x > 656 && x < 752);
        h_porch <= (y > 490 && y < 492);
    end
    
    always @(posedge new_clk)
    begin
        display <= (x < 640) && (y < 480);
    end
    
    assign v_sync = ~v_porch;
    assign h_sync = ~h_porch;        
    
endmodule
