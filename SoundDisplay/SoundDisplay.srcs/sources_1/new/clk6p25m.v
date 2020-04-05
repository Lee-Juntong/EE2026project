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


module slowClk(
    input CLOCK,//100m
    output NEWCLOCK ,//6.25m
    output clk,//3125k
    output clk298,
    output clkShine,
    output clk381//381Hz
    );
    
    reg [25:0] COUNT = 1'b0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
    end
    assign clk381=COUNT[17];//381Hz 
    assign clkShine = COUNT[23]; //5.96Hz
    assign clk298 = COUNT[25]; //1.5Hz
    assign NEWCLOCK = COUNT[3];
    assign clk = COUNT[4]; //3125kHz
    
endmodule
