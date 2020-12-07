`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 03:21:27 PM
// Design Name: 
// Module Name: VGAmov
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


module VGAmov(
    input [2:0] move,
    input [9:0] x,
    input [9:0] y,
    input clk,
    input de,
    input rst,
    
    output reg [3:0] r,
    output reg [3:0] g,
    output reg [3:0] b
    );
    reg [9:0] snakex;
    reg [9:0] snakey;
    reg [9:0] applex;
    reg [9:0] appley;
    wire [9:0] newapplex;
    wire [9:0] newappley;
    reg [199:0] storex;
    reg [199:0] storey;
    wire [7:0] score;
    wire clk4;
    
    Clock_Divider clkfour(.divider(32'd12_500_000), .clk(clk), .new_clk(clk4));
   // Clock_Divider clk_divider(.divider(2), .clk(clk), .new_clk(clk25));
    initial begin
        snakex <= 10'b00001_01000;
        snakey <= 10'b00000_00000;
        storex[199:20] <= 180'b0;
        storey[199:20] <= 180'b0;
        storex[19:0] <= 20'b00000_00000_00000_10100;
        storey[19:0] <= 20'b00000_00000_00000_00000;
        applex = (16) * 20;
        appley = (12) * 20;
    end
    
    
    appleLogic regAppleGen(.newposx(snakex), .newposy(snakey), .clk(clk), .applex(applex), .appley(appley), .score(score), .newapplex(newapplex), .newappley(newappley));
    
    always @ (score[0]) begin
        applex <= newapplex;
        appley <= newappley;
    end
    
    always @ (posedge clk4) begin
    if(rst)
        begin
            snakex <= 10'b00001_01000;
            snakey <= 10'b00000_00000;
            storex[199:20] <= 180'b0;
            storey[199:20] <= 180'b0;
            storex[19:0] <= 20'b00000_00000_00000_10100;
            storey[19:0] <= 20'b00000_00000_00000_00000;
            
        end
        else
        begin
        
        case(move)
        3'b000 : begin
            storex = storex << 10;
            storey = storey << 10;
            storex[9:0] = snakex;
            storey[9:0] = snakey;
            snakex = snakex + 20;
        end
        3'b001 : begin
            storex = storex << 10;
            storey = storey << 10;
            storex[9:0] = snakex;
            storey[9:0] = snakey;
            snakey = snakey - 20;
        end
        3'b010 : begin
            storex = storex << 10;
            storey = storey << 10;
            storex[9:0] = snakex;
            storey[9:0] = snakey;
            snakex = snakex - 20;
        end
        3'b011 : begin
            storex = storex << 10;
            storey = storey << 10;
            storex[9:0] = snakex;
            storey[9:0] = snakey;
            snakey = snakey + 20;
        end
        3'b100 : begin end
        endcase
        end
    end
    
    always @ (posedge clk) begin
    if(de) begin
        
       
       
        if(((x < (applex + 20)) && (x >= applex)) && ((y < (appley + 20)) && (y >= appley))) begin
            r = 4'hF;
            g = 4'h0;
            b = 4'h0;
        end
        else if(((x < (snakex + 20)) && (x >= snakex)) && ((y < (snakey + 20)) && (y >= snakey))) begin
            r = 4'h2;
            g = 4'h4;
            b = 4'h8;
        end
        else if(((x < (storex[9:0] + 20)) && (x >= storex[9:0])) && ((y < (storey[9:0] + 20)) && (y >= storey[9:0]))) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[19:10] + 20)) && (x >= storex[19:10])) && ((y < (storey[19:10] + 20)) && (y >= storey[19:10]))) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[29:20] + 20)) && (x >= storex[29:20])) && ((y < (storey[29:20] + 20)) && (y >= storey[29:20])) && (score > 8'd0)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[39:30] + 20)) && (x >= storex[39:30])) && ((y < (storey[39:30] + 20)) && (y >= storey[39:30])) && (score > 8'd1)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[49:40] + 20)) && (x >= storex[49:40])) && ((y < (storey[49:40] + 20)) && (y >= storey[49:40])) && (score > 8'd2)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(x % 20 == 0 || y % 20 == 0)
        begin
        r = 4'h0;
        g = 4'h0;
        b = 4'h0;
        end
        else begin
            r = 4'h0;
            g = 4'h0;
            b = 4'hF;
        end
        
    end
    else begin
        r = 4'h0;
        g = 4'h0;
        b = 4'h0;
    end
    end
endmodule
