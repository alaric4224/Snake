`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2020 03:37:08 PM
// Design Name: 
// Module Name: appleLogic
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


module appleLogic(
    input [9:0] newposx,
    input [9:0] newposy,
    input clk,
    input rst,
    
    output reg [9:0] newapplex,
    output reg [9:0] newappley,
    output reg [9:0] papplex,
    output reg [9:0] pappley,
    output reg [7:0] score
    );
    reg [11:0] counter;
    
    initial begin
        newapplex = 320;
        newappley = 240;
        papplex = 20;
        pappley = 20;
        counter = 2000;
        score <= 0;
    end
    
    
    
        
    always@ (posedge clk) begin
        if(counter == 4000)begin
            counter <= 0;
        end
        else
        begin
        counter <= counter + 1;
        end
        if(rst)
        begin
            score <= 0;
        end
        if(newposx < newapplex + 30 && newposx > newapplex - 30 && newposy < newappley + 30 && newposy > newappley - 30) begin
            score <= score + 1;
            newapplex = (counter % 28) + 3;
            newappley = (counter % 20) + 3;
            if(newposx == newapplex && newposy == newappley && newposx == 0 && newposy == 0) begin
                newapplex = newapplex + 4;
                newappley = newappley + 7;
            end
            else if(newposx == newapplex && newposy == newappley) begin
                newapplex = newapplex - 1;
                newappley = newappley - 1;
            end
            newapplex = newapplex*5'd20;
            newappley = newappley*5'd20;
        end
        else begin
            newapplex <= newapplex;
            newappley <= newappley;
        end
        if(newposx < papplex + 30 && newposx > papplex - 30 && newposy < pappley + 30 && newposy > pappley - 30) begin
            score <= score - 1;
            papplex = (counter % 28) + 3;
            pappley = (counter % 20) + 3;
            if(newposx == papplex && newposy == pappley && newposx == 0 && newposy == 0) begin
                papplex = papplex + 4;
                pappley = pappley + 7;
            end
            else if(newposx == papplex && newposy == pappley) begin
                papplex = papplex - 1;
                pappley = pappley - 1;
            end
            else if(newapplex == papplex && newappley == pappley) begin
                papplex = papplex - 2;
                pappley = pappley - 2;
            end
            papplex = papplex*5'd20;
            pappley = pappley*5'd20;
        end
        else begin
            newapplex <= newapplex;
            newappley <= newappley;
            papplex = papplex;
            pappley = pappley;
        end
    end
endmodule
