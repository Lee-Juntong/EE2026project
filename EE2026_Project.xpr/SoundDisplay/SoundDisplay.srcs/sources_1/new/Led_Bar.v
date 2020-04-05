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
        if (max < (max / 16)) begin led_bar = 16'b0; end // ((max + 1) / 16)
        else if (max < (max / 8)) begin led_bar = 16'b0000000000000001; end // ((max + 1) / 16), ((max + 1) / 8)
        else if (max < (max / 8)) begin led_bar = 16'b0000000000000011; end
        else if (max < (max / 8)) begin led_bar = 16'b0000000000000111; end
        else if (max < (max / 8)) begin led_bar = 16'b0000000000001111; end
        else if (max < (max / 8)) begin led_bar = 16'b0000000000011111; end
        else if (max < (max / 8)) begin led_bar = 16'b0000000000111111; end
        else if (max < (max / 8)) begin led_bar = 16'b0000000001111111; end
        else if (max < (max / 8)) begin led_bar = 16'b0000000011111111; end
        else if (max < (max / 8)) begin led_bar = 16'b0000000111111111; end
        else if (max < (max / 8)) begin led_bar = 16'b0000001111111111; end
        else if (max < (max / 8)) begin led_bar = 16'b0000011111111111; end
        else if (max < (max / 8)) begin led_bar = 16'b0000111111111111; end
        else if (max < (max / 8)) begin led_bar = 16'b0001111111111111; end
        else if (max < (max / 8)) begin led_bar = 16'b0011111111111111; end
        else if (max < (max / 8)) begin led_bar = 16'b0111111111111111; end
        else if (max < (max / 8)) begin led_bar = 16'b1111111111111111; end
    end
        
endmodule
