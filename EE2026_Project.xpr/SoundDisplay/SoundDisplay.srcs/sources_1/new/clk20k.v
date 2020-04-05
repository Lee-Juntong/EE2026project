`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2020 00:22:49
// Design Name: 
// Module Name: clk20k
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


module clk20k(
    input CLOCK,
    output reg NEWCLOCK = 0
    );
    
    reg [11:0] COUNT = 12'b0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
    if (COUNT == 12'b100111000100) begin
        NEWCLOCK <= ~NEWCLOCK;
    end
    end
      
endmodule
