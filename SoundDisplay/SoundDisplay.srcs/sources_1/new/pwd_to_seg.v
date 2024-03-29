`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2020 13:57:39
// Design Name: 
// Module Name: pwd_to_seg
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


module pwd_to_seg(
    input [3:0] pwd,
    output reg [6:0] seg
    );
      always @(*) begin
      case(pwd)
      0:seg=7'b1000000;
      1:seg=7'b1111001;
      2:seg=7'b0100100;
      3:seg=7'b0110000;
      4:seg=7'b0011001;
      5:seg=7'b0010010;
      6:seg=7'b0000010;
      7:seg=7'b1111000;
      8:seg=7'b0000000;
      9:seg=7'b0010000;
      default:seg=7'b0110110;
      endcase
      end
endmodule
