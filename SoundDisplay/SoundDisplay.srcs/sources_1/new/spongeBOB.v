`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2020 00:12:38
// Design Name: 
// Module Name: spongeBOB
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


module spongeBOB(
    input CLK,//3125k
    input CLKslow,//1.5hz
    input sw,
    input [3:0]volume,
    input [5:0]y,
    input [6:0]x,
    output reg [15:0] pixel_data
    );
    reg [15:0] pic1[6143:0];//level1
    reg [15:0] pic2[6143:0];//level2
    reg [15:0] pic3[6143:0];//level3
    reg [15:0] pic4[6143:0];//level4 
        
    initial begin
    $readmemh("spongeBOB1.mem",pic1);
    $readmemh("spongeBOB2.mem",pic2);
    $readmemh("spongeBOB3.mem",pic3);
    $readmemh("spongeBOB4.mem",pic4);
    end
    
    reg [1:0]count=1'b0;
    reg flag=0;
    //you need to shout for a while or be quiet for a while to call Captain Eugene H. Armor Abs Krabs 
    //and be quiet for a while to let Captain Eugene H. Armor Abs Krabs go
    always @ (posedge CLKslow) begin
     if (~sw) begin count=1'b0; flag=0; end
     else begin
     if (volume>=13&&count<2'b11) count<=count+1;
     if (volume>=13&&count==2'b11) flag<=1;
     if (volume<13&&count>0) count<=count-1;
     if (volume<13&&count==0) flag<=0;
     end
     end
     
    always @ (posedge CLK) begin
    if (!flag) begin
     if (volume<=3) pixel_data=pic1[96*y+x];
    else if (volume<=9&&volume>3) pixel_data=pic2[96*y+x];
    else if(volume>9) pixel_data=pic3[96*y+x];
    end
    else  pixel_data=pic4[96*y+x];    
    end
    
endmodule
