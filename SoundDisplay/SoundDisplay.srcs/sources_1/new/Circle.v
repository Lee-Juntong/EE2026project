`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2020 22:04:55
// Design Name: 
// Module Name: Circle_And_Mr_XiaoChuan
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


module Circle_And_Mr_XiaoChuan(
    input sw,

    input [5:0]y,
    input [6:0]x,
    input CLK,//here we use 3125kHz
    input [3:0]sound_level,
    output reg [15:0]pixel_data=0
    );
    reg status;//when status==1, display the desired picture
    reg [21:0]COUNT=0;
    function [5:0] sqrt;
        input [11:0] num;  //declare input
        //intermediate signals.
        reg [11:0] a;
        reg [5:0] q;
        reg [7:0] left,right,r;   
        integer i;
    begin
        //initialize all the variables.
        a = num;
        q = 0;
        i = 0;
        left = 0;   //input to adder/sub
        right = 0;  //input to adder/sub
        r = 0;  //remainder
        //run the calculations for 16 iterations.
        for(i=0;i<6;i=i+1) begin
            right = {q,r[7],1'b1};
            left = {r[5:0],a[11:10]};
            a = a<<2;    //left shift by 2 bits.
            if (r[7] == 1) //add if r is negative
                r = left + right;
            else    //subtract if r is positive
                r = left - right;
            q = {q[4:0],!r[7]};      
        end
        sqrt = q;   //final assignment of output.
    end
    endfunction //end of Function
    
    wire [11:0]dist_sqr;
    assign dist_sqr=((y>=32)?(y-32)*(y-32):(32-y)*(32-y))+((x>=48)?(x-48)*(x-48):(48-x)*(48-x));
    //this is the square of the distance from the origin (centre of the oled screen)
    wire [5:0]dist;
    assign dist=sqrt(dist_sqr);
    reg [15:0] picXC[6143:0];
    initial
        begin 
        $readmemh("XC.mem",picXC);
        end
    
    always @ (posedge CLK) begin
    if (sw==0) begin COUNT<=0; status<=0; end//when switch is off, reset
    if (status==0) begin
    if (dist-sound_level <=2) begin 
    pixel_data=(sound_level*2-5)*2048+(sound_level*4-15)*32+(sound_level*2-10);//gradient color
    end
    else pixel_data=0; 
    COUNT<=(sound_level==15)?COUNT+1:COUNT;
    status<=COUNT[21];//after some delay, display the picture
    end
    else if (status == 1) pixel_data=picXC[96*y+x];
    end
    
endmodule
