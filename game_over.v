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
    
    reg head;
    reg Hazard;
    reg body;
    
    always@(posedge vga_clk) begin
        border <= (x < 10 || (x > 630 && x < 640) || y < 10 || (y > 470 && y < 480));
        head <= ((x > snakex[9:0] && x < (snakey[9:0] + 20)) && (y > snakey[0]) && y < (snakey[0] + 20));
    end   
	
    always@(posedge vga_clk)
        if(score == 1)
            body <= ((x > storex[9:0] && x < (storey[9:0] + 20)) && (y > storey[9:0] && y < (storey[9:0] + 20)));
        else if(score == 2)
            body <= ((x > storex[19:0] && x < (storey[19:0] + 40)) && (y > storey[19:0] && y < (storey[19:0] + 40)));
        else if(score == 3)
            body <= ((x > storex[29:0] && x < (storey[29:0] + 60)) && (y > storey[29:0] && y < (storey[29:0] + 60)));
        else if(score == 4)
            body <= ((x > storex[39:0] && x < (storey[39:0] + 80)) && (y > storey[39:0] && y < (storey[39:0] + 80)));
        else if(score == 5)
            body <= ((x > storex[49:0] && x < (storey[49:0] + 100)) && (y > storey[49:0] && y < (storey[49:0] + 100)));
    
    always@(posedge vga_clk) begin
        assign Hazard = border || body;
        if(Hazard && head)
            GameOver <= 1;
        else
            GameOver <= 0;
        end         
endmodule
