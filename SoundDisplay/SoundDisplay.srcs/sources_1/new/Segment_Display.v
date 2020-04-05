`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2020 09:53:59
// Design Name: 
// Module Name: Segment_Display
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


module Segment_Display(
    input [3:0] volume,
    input CLK,
    output reg [3:0] an,
    output reg [6:0] seg
    );
    
    always @ (*) begin   
        if (volume == 0) begin an = 4'b1110; seg = 7'b1000000;end // 0
        else if (volume == 1) begin an = 4'b1110; seg = 7'b1111001; end // 1  
        else if (volume == 2) begin an = 4'b1110; seg = 7'b0100100; end // 2  
        else if (volume == 3) begin an = 4'b1110; seg = 7'b0110000; end // 3  
        else if (volume == 4) begin an = 4'b1110; seg = 7'b0011001; end // 4   
        else if (volume == 5) begin an = 4'b1110; seg = 7'b0010010; end // 5
        else if (volume == 6) begin an = 4'b1110; seg = 7'b0000010; end // 6   
        else if (volume == 7) begin an = 4'b1110; seg = 7'b1111000; end // 7   
        else if (volume == 8) begin an = 4'b1110; seg = 7'b0000000; end // 8   
        else if (volume == 9) begin an = 4'b1110; seg = 7'b0010000; end // 9
        else if (volume == 10) begin    
            if (CLK == 1) begin 
                an = 4'b1101; seg = 7'b1111001; // 1 
            end 
            else begin 
            an = 4'b1110; seg = 7'b1000000; // 0
            end 
        end   
        else if (volume == 11) begin 
            if (CLK == 1) begin
                an = 4'b1101; seg = 7'b1111001; // 1 
            end
            else begin 
                an = 4'b1110; seg = 7'b1111001; // 1
            end
        end          
        else if (volume == 12) begin 
            if (CLK == 1) begin
                an = 4'b1101; seg = 7'b1111001; // 1
            end
            else begin
                an = 4'b1110; seg = 7'b0100100; // 2 
            end
        end   
        else if (volume == 13) begin 
            if (CLK == 1) begin
                an = 4'b1101; seg = 7'b1111001; // 1
            end
            else begin
                an = 4'b1110; seg = 7'b0110000; // 3    
            end
        end   
        else if (volume == 14) begin 
            if (CLK == 1) begin
                an = 4'b1101; seg = 7'b1111001; // 1
            end
            else begin
                an = 4'b1110; seg = 7'b0011001; // 4    
            end
        end   
        else if (volume == 15) begin 
            if (CLK == 1) begin
                an = 4'b1101; seg = 7'b1111001; // 1
            end   
            else begin
                an = 4'b1110; seg = 7'b0010010; // 5
            end  
        end
    end
    
endmodule
