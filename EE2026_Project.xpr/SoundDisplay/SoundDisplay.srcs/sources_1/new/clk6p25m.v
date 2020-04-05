`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2020 00:27:09
// Design Name: 
// Module Name: clk6p25m
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


module clk6p25m(
    input CLOCK,
    output reg NEWCLOCK = 0
    );
    
    reg [2:0] COUNT = 3'b0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
    if (COUNT == 3'b000) begin
        NEWCLOCK = ~NEWCLOCK;
    end
    end
  
endmodule
