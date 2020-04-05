`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2020 01:28:43
// Design Name: 
// Module Name: NTU
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


module NTU(
    input CLK,//6.25m
    input CLK15,//1.5hz
    input sw8,
    input sw9,
    input [5:0] y,
    input [6:0] x,
    input [3:0]volume,
    output reg [15:0]pixel_data,
    output [15:0]ledbar
    );
    reg flag8;
    reg flag9;
    
    assign ledbar=(flag8&&flag9)?16'b0000011111100100:0;
    
    //these 2 are for sw8==sw9==1
    reg [15:0] NotDone [6143:0];
    reg [15:0] Done[6143:0];
    
    //these 2 are for sw8==1 and sw9==0
    reg [15:0] shoutPlz [6143:0];
    reg [15:0] shoutDone [6143:0];
    
    //these 2 are for sw8==0 and sw9==1
    reg [15:0] quietPlz [6143:0];
    reg [15:0] quietDone [6143:0];
    
    initial begin
    $readmemh("NotDone.mem",NotDone);
    $readmemh("Done.mem",Done);
    $readmemh("shoutPlz.mem",shoutPlz);
    $readmemh("shoutDone.mem",shoutDone);
    $readmemh("quietPlz.mem",quietPlz);
    $readmemh("quietDone.mem",quietDone);
    end
    
    reg [1:0] countShout=0;//you need to shout for 2 second
    reg [2:0] countQuiet=0;//you need to be quiet for 5 second
    always @(posedge CLK15) begin
    if (sw8==0&&sw9==0) begin
    countShout=0;
    countQuiet=0;
    flag8<=0;
    flag9<=0;
    end
    
    else if (sw8==1&&sw9==0) begin
    if (countShout<2'b11&&volume>=13)
    countShout<=countShout+1;
    else if (countShout<2'b11&&volume<13)
    countShout=0;
    else if(countShout==2'b11&&volume>=13) flag8<=1;
    end
    
    else if(sw8==0&&sw9==1) begin
    if (countQuiet<3'b111&&volume<=3)
        countQuiet<=countQuiet+1;
        else if (countQuiet<3'b111&&volume>3)
        countQuiet=0;
        else if(countQuiet==3'b111&&volume<=3) flag9<=1;
        end
    end
    
    
  
    always @(posedge CLK) begin
    
    if (sw8 && sw9) begin
    if (flag8&&flag9) pixel_data=Done[96*y+x];
    else  pixel_data=NotDone[96*y+x];
    end
    
    if (sw8==1&&sw9==0) begin 
    if (flag8) pixel_data=shoutDone[96*y+x];
    else pixel_data=shoutPlz[96*y+x];
    end
    
    if (sw9==1&&sw8==0) begin     
    if (flag9) pixel_data=quietDone[96*y+x];    
    else pixel_data=quietPlz[96*y+x];    
    end    
    
    end
    
    
    

endmodule
