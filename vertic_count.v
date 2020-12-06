`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:42:14 AM
// Design Name: 
// Module Name: vertic_count
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


module vertic_count(
    input vga_clk,
    input v_count_enable,
    output reg [15:0] v_value = 0
    );
    
    always@(posedge vga_clk) begin
        if(v_count_enable == 1'b1) begin
            if(v_value < 524)
                v_value <= v_value + 1;
            else
                v_value <= 0;
            end
        end
endmodule
