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
        body = (snakex == storex[29:20] && snakey == storey[29:20] && score > 0) 
        ||  (snakex == storex[39:30] && snakey == storey[39:30] && score > 1)
        ||  (snakex == storex[49:40] && snakey == storey[49:40] && score > 2)
        ||  (snakex == storex[59:50] && snakey == storey[59:50] && score > 3)
        ||  (snakex == storex[69:60] && snakey == storey[69:60] && score > 4)
        ||  (snakex == storex[79:70] && snakey == storey[79:70] && score > 5)
        ||  (snakex == storex[89:80] && snakey == storey[89:80] && score > 6)
        ||  (snakex == storex[99:90] && snakey == storey[99:90] && score > 7)
        ||  (snakex == storex[109:100] && snakey == storey[109:100] && score > 8)
        ||  (snakex == storex[119:110] && snakey == storey[119:110] && score > 9)
        ||  (snakex == storex[129:120] && snakey == storey[129:120] && score > 10)
        ||  (snakex == storex[139:130] && snakey == storey[139:130] && score > 11)
        ||  (snakex == storex[149:140] && snakey == storey[149:140] && score > 12)
        ||  (snakex == storex[159:150] && snakey == storey[159:150] && score > 13)
        ||  (snakex == storex[169:160] && snakey == storey[169:160] && score > 14)
        ||  (snakex == storex[179:170] && snakey == storey[179:170] && score > 15)
        ||  (snakex == storex[189:180] && snakey == storey[189:180] && score > 16)
        ||  (snakex == storex[199:190] && snakey == storey[199:190] && score > 17); 
    end
    
   
    
    always@(posedge vga_clk) begin
        
        if(body || snakex > 640 || snakex < 0 || snakey > 480 || snakey < 0)
            GameOver <= 1;
        else
            GameOver <= 0;
        end         
endmodule
