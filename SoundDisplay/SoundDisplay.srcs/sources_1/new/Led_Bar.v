`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2020 11:20:10
// Design Name: 
// Module Name: Led_Bar
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


module Led_Bar(
    input [11:0] max,
    output reg [15:0] led_bar = 0
    );
    
    always @ (*) begin
        if (max < 2000) begin led_bar = 16'b0; end 
        else if (max < 2131) begin led_bar = 16'b0000000000000001; end 
        else if (max < 2262) begin led_bar = 16'b0000000000000011; end
        else if (max < 2393) begin led_bar = 16'b0000000000000111; end
        else if (max < 2524) begin led_bar = 16'b0000000000001111; end
        else if (max < 2655) begin led_bar = 16'b0000000000011111; end
        else if (max < 2786) begin led_bar = 16'b0000000000111111; end
        else if (max < 2917) begin led_bar = 16'b0000000001111111; end
        else if (max < 3048) begin led_bar = 16'b0000000011111111; end
        else if (max < 3179) begin led_bar = 16'b0000000111111111; end
        else if (max < 3310) begin led_bar = 16'b0000001111111111; end
        else if (max < 3441) begin led_bar = 16'b0000011111111111; end
        else if (max < 3572) begin led_bar = 16'b0000111111111111; end
        else if (max < 3703) begin led_bar = 16'b0001111111111111; end
        else if (max < 3834) begin led_bar = 16'b0011111111111111; end
        else if (max < 3965) begin led_bar = 16'b0111111111111111; end
        else begin led_bar = 16'b1111111111111111; end
    end
        
endmodule
