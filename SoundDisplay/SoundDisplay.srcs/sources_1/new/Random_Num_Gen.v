`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2020 22:51:08
// Design Name: 
// Module Name: Random_Num_Gen
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


module Random_Num_Gen(
    input CLK,
    input reset,
    output [1:0] num
    ); //this module generates a random number to be used between 0 to 3
    
    wire [7:0]seed;
    assign seed=8'hFF;
    reg [7:0] rand_num;
    always@(posedge CLK)
      begin
        if(reset)
          rand_num    <=seed+rand_num;
        else
          begin
            rand_num[0] <= rand_num[7];
            rand_num[1] <= rand_num[0];
            rand_num[2] <= rand_num[1];
            rand_num[3] <= rand_num[2];
            rand_num[4] <= rand_num[3]^rand_num[7];
            rand_num[5] <= rand_num[4]^rand_num[7];
            rand_num[6] <= rand_num[5]^rand_num[7];
            rand_num[7] <= rand_num[6];
          end
    
      end
      
      assign num=rand_num[7]+
      rand_num[6]+
      rand_num[5]+
      rand_num[4]+
      rand_num[3]+
      rand_num[2]+
      rand_num[1]+
      rand_num[0];
endmodule
