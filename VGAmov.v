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
    input animate,
    input [2:0] inmove,
    input [9:0] x,
    input [9:0] y,
    input clk,
    input de,
    input rst,
    
    output reg [3:0] r,
    output reg [3:0] g,
    output reg [3:0] b,
    output [7:0] score
    );
    reg [9:0] snakex;
    reg [9:0] snakey;
    reg [9:0] applex;
    reg [9:0] appley;
    wire [9:0] newapplex;
    wire [9:0] newappley;
    reg [199:0] storex;
    reg [199:0] storey;
    //wire [7:0] score;
    wire clk4;
    wire GameOver;
    wire border;
    reg [2:0]move;
    
    
    Clock_Divider clkfour(.divider(32'd12_500_000), .clk(clk), .new_clk(clk4));
   // Clock_Divider clk_divider(.divider(2), .clk(clk), .new_clk(clk25));
    initial begin
        snakex <= 10'd380;
        snakey <= 10'd280;
        storex[199:20] <= 180'b0;
        storey[199:20] <= 180'b0;
        storex[9:0] <= 10'd360;
        storey[9:0] <= 10'd280;
        storex[19:10] <= 10'd340;
        storey[19:10] <= 10'd280;
    end
    
    
    appleLogic regAppleGen(.newposx(snakex), .newposy(snakey), .clk(clk), .score(score), .newapplex(newapplex), .newappley(newappley), .rst(rst));
    
    game_over loseCondition(.vga_clk(clk), .score(score), .snakex(snakex), .snakey(snakey), .storex(storex), .storey(storey), .x(x), .y(y), .GameOver(GameOver), .border(border));
    
    
    
    always @ (posedge clk4) begin
    if(rst)
        begin
            snakex <= 10'd380;
            snakey <= 10'd280;
            storex[199:20] <= 180'b0;
            storey[199:20] <= 180'b0;
            storex[9:0] <= 10'd360;
            storey[9:0] <= 10'd280;
            storex[19:10] <= 10'd340;
            storey[19:10] <= 10'd280;
            
        end
        else
        begin
        if(GameOver)
        begin
            move = 3'b100;
        end
        else
        begin
            move = inmove;
        end
        
        if(animate)
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
    end
    
    always @ (posedge clk) begin
    if(de) begin
    
    if(~GameOver)
    begin    
       
       
        if(((x < (newapplex + 20)) && (x >= newapplex)) && ((y < (newappley + 20)) && (y >= newappley))) begin
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
        else if(((x < (storex[59:50] + 20)) && (x >= storex[59:50])) && ((y < (storey[59:50] + 20)) && (y >= storey[59:50])) && (score > 8'd3)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[69:60] + 20)) && (x >= storex[69:60])) && ((y < (storey[69:60] + 20)) && (y >= storey[69:60])) && (score > 8'd4)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[79:70] + 20)) && (x >= storex[79:70])) && ((y < (storey[79:70] + 20)) && (y >= storey[79:70])) && (score > 8'd5)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[89:80] + 20)) && (x >= storex[89:80])) && ((y < (storey[89:80] + 20)) && (y >= storey[89:80])) && (score > 8'd6)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[99:90] + 20)) && (x >= storex[99:90])) && ((y < (storey[99:90] + 20)) && (y >= storey[99:90])) && (score > 8'd7)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[109:100] + 20)) && (x >= storex[109:100])) && ((y < (storey[109:100] + 20)) && (y >= storey[109:100])) && (score > 8'd8)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[119:110] + 20)) && (x >= storex[119:110])) && ((y < (storey[119:110] + 20)) && (y >= storey[119:110])) && (score > 8'd9)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[129:120] + 20)) && (x >= storex[129:120])) && ((y < (storey[129:120] + 20)) && (y >= storey[129:120])) && (score > 8'd10)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[139:130] + 20)) && (x >= storex[139:130])) && ((y < (storey[139:130] + 20)) && (y >= storey[139:130])) && (score > 8'd11)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[149:140] + 20)) && (x >= storex[149:140])) && ((y < (storey[149:140] + 20)) && (y >= storey[149:140])) && (score > 8'd12)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[159:150] + 20)) && (x >= storex[159:150])) && ((y < (storey[159:150] + 20)) && (y >= storey[159:150])) && (score > 8'd13)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[169:160] + 20)) && (x >= storex[169:160])) && ((y < (storey[169:160] + 20)) && (y >= storey[169:160])) && (score > 8'd14)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[179:170] + 20)) && (x >= storex[179:170])) && ((y < (storey[179:170] + 20)) && (y >= storey[179:170])) && (score > 8'd15)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[189:180] + 20)) && (x >= storex[189:180])) && ((y < (storey[189:180] + 20)) && (y >= storey[189:180])) && (score > 8'd16)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(((x < (storex[199:190] + 20)) && (x >= storex[199:190])) && ((y < (storey[199:190] + 20)) && (y >= storey[199:190])) && (score > 8'd17)) begin
            r = 4'hB;
            g = 4'h4;
            b = 4'h2;
        end
        else if(x % 20 == 0 || y % 20 == 0) begin
        r = 4'h0;
        g = 4'h0;
        b = 4'h0;
        end
        else if(border)
        begin
        r = 4'h7;
        g = 4'h5;
        b = 4'h0;
        end
        else begin
            r = 4'h0;
            g = 4'h0;
            b = 4'h8;
        end
    end
    
    else
    begin
        r = 4'h8;
        g = 4'h0;
        b = 4'h0;
    end
        
    end
    else begin
        r = 4'h0;
        g = 4'h0;
        b = 4'h0;
    end
    end
endmodule
