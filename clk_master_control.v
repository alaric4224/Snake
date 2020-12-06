`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 07:08:20 PM
// Design Name: 
// Module Name: clk_master_control
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


module clk_master_control(
    input clk,
    input [27:0] divider,
    output vga_clk
    );
    
    reg [27:0] counter = 0;
    
    always @(posedge clk) begin
        counter <= counter + 1;
        if(counter >= (divider-1))
            counter <= 28'b0;  
        end
        
assign vga_clk = (counter < divider/2)?1'b0:1'b1;

endmodule
