`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 07:24:49 PM
// Design Name: 
// Module Name: game_over
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


module game_over(
    input vga_clk,
    input [7:0] score,
    input [9:0] snakex,
    input [9:0] snakey,
    input [199:0] storex,
    input [199:0] storey,
    input [9:0] x,
    input [9:0] y,
    output reg GameOver,
    output reg border
    );
    
    
    
    reg body;
    
    always@(posedge vga_clk) begin
        border <= (x < 10 || (x > 630 && x < 640) || y < 10 || (y > 470 && y < 480));
        
    end   
	
    always@(posedge vga_clk)
    begin
        body = (snakex == storex[29:20] && snakey == storey[29:20] && score > 1) ||  (snakex == storex[39:30] && snakey == storey[39:30] && score > 2); 
    end
    
   
    
    always@(posedge vga_clk) begin
        
        if(body || snakex > 640 || snakex < 0 || snakey > 480 || snakey < 0)
            GameOver <= 1;
        else
            GameOver <= 0;
        end         
endmodule
