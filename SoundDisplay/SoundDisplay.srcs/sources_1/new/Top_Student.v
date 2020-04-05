`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  EE2026 Final Project

//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (

    // ===========================================================================
    //                                         Port Declarations                                                
    // ===========================================================================
    
    input J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    input CLOCK,
    input multiplexerSwitch,
    input centerPushButton,
    input [12:1] sw,
    input btnU,                 
    input btnL,                   
    input btnR,                   
    input btnD,
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output [15:0] led,
    output cs,
    output sdin,
    output sclk,
    output d_cn,
    output resn,
    output vccen,
    output pmoden,
    output [3:0] an,
    output [6:0] seg,
    output dp
    );
    
    // ===========================================================================
    //                               Parameters, Regsiters, and Wires                                  
    // ===========================================================================
    
    wire NEWCLOCK; //20kHz
    wire ANOTHERCLOCK; //6.25MHz
    wire clk3125; //3125kHz
    wire clk15; //1.5Hz
    wire clkShine; //5.96Hz
    wire clk381;//381Hz
    wire [11:0] mic_in;
    wire frame_begin;
    wire sending_pixels;
    wire sample_pixel;
    wire [12:0] pixel_index;
    wire [4:0]teststate;
    wire [15:0] oled_data ;
    wire [15:0] ordinary_oled;
    wire [11:0] max;
    wire [15:0]led_bar;
    wire [15:0]NTUled;
    wire [3:0]volume_level;
    assign volume_level = led_bar[15] + led_bar[14] + led_bar[13]
    + led_bar[12] + led_bar[11] + led_bar[10] + led_bar[9]+led_bar[8] + led_bar[7] 
    + led_bar[6] + led_bar[5] + led_bar[4] + led_bar[3] + led_bar[2] + led_bar[1];
    // Volume level ranges from 0 to 15, where 0 is lowest and 15 the highest
    wire [5:0] y;
    wire [6:0] x;  
    clk20k CLK1 (CLOCK, NEWCLOCK);
    slowClk CLK2 (CLOCK, ANOTHERCLOCK, clk3125,clk15,clkShine,clk381); 
    
    //Pushbuttons
    wire _BC,_BU,_BD,_BL,_BR; //These are push button signals after debounce
    
    Button button1 (centerPushButton, clkShine, _BC); 
    Button button2 (btnU,clkShine,_BU);
    Button button3 (btnL,clkShine,_BL);
    Button button4 (btnR,clkShine,_BR);
    Button button5 (btnD,clkShine,_BD);
    
    assign y = 63 - pixel_index/ 96;
    assign x = pixel_index % 96;
    Max_Intensity mi1(NEWCLOCK, mic_in, max);
    Led_Bar lb1(max, led_bar);
    //controls signal output to seg and an
    wire [3:0]ordinary_an;
    wire [6:0]ordinary_seg;
    wire [3:0]eyeSight_an;
    wire [6:0]eyeSight_seg;
    wire [3:0]Dr_w_an;
    wire [6:0]Dr_w_seg;
    wire Dr_w_dp;
    //the followsing are ordinary function modules
    Segment_Display sd1(volume_level, NEWCLOCK, ordinary_an, ordinary_seg);
    
    assign led = (sw[8]||sw[9])?NTUled:(multiplexerSwitch == 0) ? led_bar : mic_in;
    My_Volume_Bar vb(ANOTHERCLOCK, y, x, sw[6:1], volume_level, ordinary_oled);
    
    wire [15:0]sw7_oled;
    wire [15:0]sw89_oled;
    wire [15:0]sw10_oled;
    wire [15:0]sw11_oled;
    wire [15:0]sw12_oled;
    
    //the followings are function modules (improvements)
    Circle_And_Mr_XiaoChuan sw7out(sw[7], y, x, clk3125, volume_level, sw7_oled);
    NTU nus(ANOTHERCLOCK,clk15,sw[8],sw[9],y,x,volume_level,sw89_oled,NTUled);
    EyeSight_test EST(clk3125,_BC,_BU,_BD,_BR,_BL,y,x,sw[10],sw10_oled,eyeSight_an,eyeSight_seg);
    Dr_W_And_C CSEE(sw[11],volume_level,y,x,clk3125,clkShine,clk15,clk381,_BC,_BU,_BL,_BD,_BR,Dr_w_an,Dr_w_seg,sw11_oled,Dr_w_dp);//
    spongeBOB sb(clk3125,clk15,sw[12],volume_level,y,x,sw12_oled);
    
    //followings deal with choosing which function is active
    assign oled_data = (sw[12])?sw12_oled:(sw[11])?sw11_oled:(sw[10])?sw10_oled:(sw[8]||sw[9])?sw89_oled:(sw[7]) ? sw7_oled : ordinary_oled;//
    assign an=(sw[11])?Dr_w_an:(sw[10])?eyeSight_an:ordinary_an;//
    assign seg=(sw[11])?Dr_w_seg:(sw[10])?eyeSight_seg:ordinary_seg;//
    assign dp=(sw[11])?Dr_w_dp:1;
    // ===========================================================================
    //                                         Implementation                                                   
    // ===========================================================================
    
    Audio_Capture DISPLAY_AND_AUDIO(CLOCK, NEWCLOCK, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);
    Oled_Display OLED(ANOTHERCLOCK, 0, frame_begin, sending_pixels,sample_pixel, pixel_index, oled_data, cs, sdin, sclk, d_cn, resn, vccen, pmoden,teststate);
    //we understand that testsate is 4:0, but we don't know where it should connect to and how to use it
    //we try to send email to our TA but did not get any reply
    //since the oled works fine without this output, we just let it hang there
endmodule