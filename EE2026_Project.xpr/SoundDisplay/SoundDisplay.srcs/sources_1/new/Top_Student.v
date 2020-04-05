`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: ZHUANG MENGJIN
//  STUDENT A MATRICULATION NUMBER: A0204716L
//
//  STUDENT B NAME: ZHU ZIKUN
//  STUDENT B MATRICULATION NUMBER: A0205947X
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    input CLOCK,
    input multiplexerSwitch,
    input centerPushButton,
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output [11:0] led,
    output cs,
    output sdin,
    output sclk,
    output d_cn,
    output resn,
    output vccen,
    output pmoden
    );
    
    wire NEWCLOCK;//20k
    wire ANOTHERCLOCK;//6.25m
    wire [11:0] mic_in;
    wire reset;
    wire frame_begin;
    wire sending_pixels;
    wire sample_pixel;
    wire pixel_index;
    wire teststate;
    reg [15:0] oled_data = 0; // 16'h07E0;
    
    wire [11:0] max;
    wire [15:0]led_bar;
    Max_Intensity mi1(NEWCLOCK,mic_in,max);
    Led_Bar lb1(max,led_bar);
    assign led = (multiplexerSwitch == 0) ? led_bar: mic_in;
    
    always @ (*) begin  
        oled_data = {mic_in[11:7], 6'b0, mic_in[11:7]};
    end
    
    clk20k CLK1 (CLOCK, NEWCLOCK);
    clk6p25m CLK2 (CLOCK, ANOTHERCLOCK);
    Button button (centerPushButton, NEWCLOCK, reset); 
    
    Audio_Capture DISPLAY_AND_AUDIO(CLOCK, NEWCLOCK, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);
    Oled_Display OLED(ANOTHERCLOCK, reset, frame_begin, sending_pixels,sample_pixel, pixel_index, oled_data, cs, sdin, sclk, d_cn, resn, vccen, pmoden,teststate);


endmodule