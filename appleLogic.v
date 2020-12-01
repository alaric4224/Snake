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
    input [9:0] applex,
    input [9:0] appley,
    input clk,
    output reg [9:0] newapplex,
    output reg [9:0] newappley,
    output reg [7:0] score
    );
    reg [11:0] counter;
    
    initial begin
        counter = 0;
    end
    
    always@ (posedge clk) begin
        if(counter == 4000)begin
            counter <= 0;
        end
        if(newposx == applex && newposy == appley) begin
            score <= score + 1;
            newapplex = counter % 32;
            newappley = counter % 24;
            if(newposx == newapplex && newposy == newappley && newposx == 0 && newposy == 0) begin
                newapplex = newapplex + 4;
                newappley = newappley + 7;
            end
            else if(newposx == applex && newposy == appley) begin
                newapplex = newapplex - 1;
                newappley = newappley - 1;
            end
            newapplex = newapplex*5'd20;
            newappley = newappley*5'd20;
        end
        else begin
            newapplex <= applex;
            newappley <= appley;
        end
    end
endmodule
