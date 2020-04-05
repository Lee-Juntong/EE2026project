`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2020 11:03:08
// Design Name: 
// Module Name: Max_Intensity
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


module Max_Intensity(
    input clk,
    input [11:0]mic_in,
    output reg [11:0] max=0
    );
    
    reg [11:0] peak_volume = 0;
    reg [12:0] count = 0;
    
    always @ (posedge clk) begin
        if (peak_volume < mic_in) begin
            peak_volume = mic_in;
        end
        count <= count + 1;
        if (count == 0) begin
            max = peak_volume;
            peak_volume = 0;
        end
    end

endmodule
