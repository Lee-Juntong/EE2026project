`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2020 00:38:28
// Design Name: 
// Module Name: Button
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


module Button(
    input button,
    input NEWCLOCK,
    output buttonOut
    );
    
    wire Q1;
    wire Q2;
    
    DFF dut1 (NEWCLOCK, button, Q1);
    DFF dut2 (NEWCLOCK, Q1, Q2);
    
    assign buttonOut = Q1 & ~Q2;
    
endmodule
