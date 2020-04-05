`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2020 09:40:37
// Design Name: 
// Module Name: My_Volume_Bar
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

// This module deals with volume bar and border
module My_Volume_Bar(
    input CLK,
    input [5:0] y,
    input [6:0] x,
    input [6:1] sw, //sw1:on/off border. sw2:on/off volume bar sw3: freeze sw4: 3pixel border/1pixel border sw5&6: select theme
    input [3:0]real_volume_level,
    output reg [15:0] pixel_data=1'b0
    );
    
    // Theme:00-> original 
   // wire [12:0]pixel_index_local;
    reg [3:0]volume_level;
    reg sw1,sw2,sw4,sw5,sw6;
    reg [15:0] local_led_bar;
    

    always @ (posedge CLK) begin
        if (sw[3] == 0) begin //sw[3] == 0 means not freezed
            volume_level=real_volume_level;
            sw1 = sw[1];
            sw2 = sw[2];
            sw4 = sw[4];
            sw5 = sw[5];
            sw6 = sw[6];
        end
    
    if (sw1 == 1) begin //border is on
    if (sw4 == 0) begin //1 pixel   
    if (x == 0||y == 0||x == 95||y == 63) begin
    if (sw5 == 0 && sw6 == 0) begin pixel_data = 16'hFFFF; end //white
    else if(sw5 == 1 && sw6 == 0) begin pixel_data = 16'h07E0; end //green
    else if(sw5 == 0 && sw6 == 1) begin pixel_data = 16'hFFE0; end //yellow
    end
    else if (x <= 2 || y <= 2 || x >= 93 || y >= 61) begin //background
        if (sw5 == 0 && sw6 == 0) begin pixel_data = 1'b0; end //black
        else if(sw5 == 1 && sw6 == 0) begin pixel_data = 16'h0008; end //dark blue
        else if(sw5 == 0 && sw6 == 1) begin pixel_data = 16'b01000_000011_01010; end //purple
        end
    end
    else if (x <= 2 || y <= 2 || x >= 93 || y >= 61) begin //3 pixel
    if (sw5 == 0 && sw6 == 0) begin pixel_data = 16'hFFFF; end //white
    else if (sw5 == 1 && sw6 == 0) begin pixel_data = 16'h07E0; end //green
    else if(sw5 == 0 && sw6 == 1) begin pixel_data = 16'hFFE0; end //yellow   
    end
    if (x == 3 && y >= 3 && y <= 60) begin //background
        if (sw5 == 0 && sw6 == 0) begin pixel_data = 1'b0; end //black
        else if (sw5 == 1 && sw6 == 0) begin pixel_data = 16'h0008; end //dark blue
        else if (sw5 == 0&& sw6 == 1) begin pixel_data = 16'b01000_000011_01010; end //purple
    end
    end //take care of border
    
    if (sw2 == 1) begin //volume bar is on
         if((y >= 3 && y <= 60) && x == 54) begin
            if (sw5 == 0 && sw6 == 0) begin pixel_data = 1'b0; end //black
            else if (sw5 == 1 && sw6== 0) begin pixel_data = 16'h0008; end //dark blue
            else if (sw5 == 0 && sw6== 1) begin pixel_data = 16'b01000_000011_01010;end //purple
        end
         //if(volume_level>=0) begin      
        if(x >= 42 && x <= 53 && (y >= 8 && y <= 9)) begin  
            if (sw5==0&&sw6==0) begin pixel_data=16'h07E0; end //green
            else if(sw5 == 1 && sw6 == 0) begin pixel_data = 16'h001F; end //light blue
            else if(sw5 == 0 && sw6 == 1)begin pixel_data = 16'b10100_111100_10100; end//light green
        end 
        //end
        if (volume_level >= 1) begin 
        if ((x >= 42 && x <= 53) && (y >= 11 && y <= 12)) begin  
            if (sw5 == 0 && sw6 == 0)     pixel_data = 16'h07E0;//green
            else if (sw5 == 1 && sw6 == 0)      pixel_data = 16'h001F;//light blue
            else if (sw5 == 0 && sw6 == 1)      pixel_data = 16'b10100_111100_10100;//light green
        end
        end 
        if(volume_level>=2) begin 
        if((x>=42&&x<=53)&&(y>=14&&y<=15)) begin  
              if (sw5==0&&sw6==0)     pixel_data=16'h07E0;//green
         else if(sw5==1&&sw6==0)      pixel_data=16'h001F;//light blue
         else if(sw5==0&&sw6==1)      pixel_data=16'b10100_111100_10100;//light green
        end
        end 
        if(volume_level>=3) begin 
        if((x>=42&&x<=53)&&(y>=17&&y<=18)) begin  
              if (sw5==0&&sw6==0)     pixel_data=16'h07E0;//green
         else if(sw5==1&&sw6==0)      pixel_data=16'h001F;//light blue
         else if(sw5==0&&sw6==1)      pixel_data=16'b10100_111100_10100;//light green
        end
        end 
        if(volume_level>=4) begin 
        if((x>=42&&x<=53)&&(y>=20&&y<=21)) begin  
              if (sw5==0&&sw6==0)     pixel_data=16'h07E0;//green
         else if(sw5==1&&sw6==0)      pixel_data=16'h001F;//light blue
         else if(sw5==0&&sw6==1)      pixel_data=16'b10100_111100_10100;//light green
        end
        end
        if(volume_level>=5) begin 
        if((x>=42&&x<=53)&&(y>=23&&y<=24)) begin  
              if (sw5==0&&sw6==0)     pixel_data=16'h07E0;//green
         else if(sw5==1&&sw6==0)      pixel_data=16'h001F;//light blue
         else if(sw5==0&&sw6==1)      pixel_data=16'b10100_111100_10100;//light green
        end
        end
        
        
        if(volume_level>=6) begin 
        if((x>=42&&x<=53)&&(y>=26&&y<=27)) begin  
              if (sw5==0&&sw6==0)     pixel_data=16'hFFE0;//yellow
         else if(sw5==1&&sw6==0)      pixel_data=16'hF80F;//purple
         else if(sw5==0&&sw6==1)      pixel_data=16'b11111_101111_11000;//light pink
        end 
        end
        if(volume_level>=7) begin 
        if((x>=42&&x<=53)&&(y>=29&&y<=30))  begin  
             if (sw5==0&&sw6==0)     pixel_data=16'hFFE0;//yellow
        else if(sw5==1&&sw6==0)      pixel_data=16'hF80F;//purple
        else if(sw5==0&&sw6==1)      pixel_data=16'b11111_101111_11000;//light pink
       end
        end
        if(volume_level>=8) begin 
        if((x>=42&&x<=53)&&(y>=32&&y<=33))  begin  
              if (sw5==0&&sw6==0)     pixel_data=16'hFFE0;//yellow
         else if(sw5==1&&sw6==0)      pixel_data=16'hF80F;//purple
         else if(sw5==0&&sw6==1)      pixel_data=16'b11111_101111_11000;//light pink
        end
        end
        if(volume_level>=9) begin 
        if((x>=42&&x<=53)&&(y>=35&&y<=36))  begin  
             if (sw5==0&&sw6==0)     pixel_data=16'hFFE0;//yellow
        else if(sw5==1&&sw6==0)      pixel_data=16'hF80F;//purple
        else if(sw5==0&&sw6==1)      pixel_data=16'b11111_101111_11000;//light pink
        end
        end
        if(volume_level>=10) begin 
        if((x>=42&&x<=53)&&(y>=38&&y<=39))  begin  
             if (sw5==0&&sw6==0)     pixel_data=16'hFFE0;//yellow
        else if(sw5==1&&sw6==0)      pixel_data=16'hF80F;//purple
        else if(sw5==0&&sw6==1)      pixel_data=16'b11111_101111_11000;//light pink
        end
        end       
        
        
        if(volume_level>=11) begin 
        if((x>=42&&x<=53)&&(y>=41&&y<=42))  begin  
             if (sw5==0&&sw6==0)     pixel_data=16'hF800;//red
        else if(sw5==1&&sw6==0)      pixel_data=16'hF8E0;//orange
        else if(sw5==0&&sw6==1)      pixel_data=16'b11111_110010_01001;//light yellow
        end
        end
        if(volume_level>=12) begin 
        if((x>=42&&x<=53)&&(y>=44&&y<=45)) begin  
             if (sw5==0&&sw6==0)     pixel_data=16'hF800;//red
        else if(sw5==1&&sw6==0)      pixel_data=16'hF8E0;//orange
        else if(sw5==0&&sw6==1)      pixel_data=16'b11111_110010_01001;//light yellow
        end
        end
        if(volume_level>=13) begin 
        if((x>=42&&x<=53)&&(y>=47&&y<=48)) begin  
             if (sw5==0&&sw6==0)     pixel_data=16'hF800;//red
        else if(sw5==1&&sw6==0)      pixel_data=16'hF8E0;//orange
        else if(sw5==0&&sw6==1)      pixel_data=16'b11111_110010_01001;//light yellow
        end
        end
        if(volume_level>=14) begin 
        if((x>=42&&x<=53)&&(y>=50&&y<=51)) begin  
             if (sw5==0&&sw6==0)     pixel_data=16'hF800;//red
        else if(sw5==1&&sw6==0)      pixel_data=16'hF8E0;//orange
        else if(sw5==0&&sw6==1)      pixel_data=16'b11111_110010_01001;//light yellow
        end
        end
        if(volume_level==15) begin 
        if((x>=42&&x<=53)&&(y>=53&&y<=54)) begin  
             if (sw5==0&&sw6==0)     pixel_data=16'hF800;//red
        else if(sw5==1&&sw6==0)      pixel_data=16'hF8E0;//orange
        else if(sw5==0&&sw6==1)      pixel_data=16'b11111_110010_01001;//light yellow
        end
        end                        

       end
     
    end

endmodule
