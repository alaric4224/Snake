`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:34:27 AM
// Design Name: 
// Module Name: horiz_count
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


module horiz_count(
    input vga_clk,
    output reg v_count_enable = 0,
    output reg [15:0] h_value = 0
    );
    
    always@(posedge vga_clk) begin
        if(h_value < 799) begin 
            h_value <= h_value + 1;
            v_count_enable <= 0;
        end    
        else begin
            h_value <= 0;
            v_count_enable <= 1;
        end
    end        
endmodule
