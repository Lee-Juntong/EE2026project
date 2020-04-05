`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2020 16:57:38
// Design Name: 
// Module Name: name_seg
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


module name_seg(
    input reset,
    input [1:0]flag,
    input CLK3125,//3125khz
    input clk,//1.5Hz
    output reg [6:0] seg3,
    output reg [6:0] seg2,
    output reg [6:0] seg1,
    output reg [6:0] seg0
    );
    reg [3:0]count=0;
    wire CLK;//single pulse 3125kHz
    Button db(clk,CLK3125,CLK);
    
    always @ (posedge CLK3125) begin
    if (reset) count<=0;
    else if (CLK==1) begin 
    count<=count+1;
     case (flag)
    1:begin //wong
    case (count)
    0:begin 
    seg0=7'b0100001;//d
    seg1=7'b0101111;//r
    seg2=7'b1010101;//w
    seg3=7'b1000000;//o
    end
    1:begin
    seg0=7'b0101111; 
    seg1=7'b1010101; 
    seg2=7'b1000000; 
    seg3=7'b0101011;//n
    end
    2:begin
    seg0=7'b1010101;
    seg1=7'b1000000;
    seg2=7'b0101011;
    seg3=7'b0010000;//g
    end
    3:begin
    seg0=7'b1000000;
    seg1=7'b0101011;
    seg2=7'b0010000;
    seg3=7'b1011111;//'
    end
    4:begin 
    seg0=7'b0101011;
    seg1=7'b0010000;
    seg2=7'b1011111;
    seg3=7'b0010010;//s
    end
    5:begin
    seg0=7'b0010000;
    seg1=7'b1011111;
    seg2=7'b0010010;
    seg3=7'b0001110;//F
    end
    6:begin
    seg0=7'b1011111;
    seg1=7'b0010010;
    seg2=7'b0001110;
    seg3=7'b0001000;//A
    end
    7:begin
    seg0=7'b0010010;
    seg1=7'b0001110;
    seg2=7'b0001000;
    seg3=7'b0101011;//n
    end
    8:begin
    seg0=7'b0001110;
    seg1=7'b0001000;
    seg2=7'b0101011;
    seg3=7'b0010010;//s
    end
    9:begin
    seg0=7'b0001000;
    seg1=7'b0101011;
    seg2=7'b0010010;
    seg3=7'b1111111;// " "
    end
    10:begin
    seg0=7'b0101011;
    seg1=7'b0010010;
    seg2=7'b1111111;
    seg3=7'b0100001;//D
    end
    11:begin
    seg0=7'b0010010;
    seg1=7'b1111111;
    seg2=7'b0100001;
    seg3=7'b0101111;//r 
     end
    12:begin 
    seg0=7'b1111111;
    seg1=7'b0100001;
    seg2=7'b0101111;
    seg3=7'b1010101;//w
    count<=0;
    end
    endcase
    end
    2:begin
    case (count)        
    0:begin             
    seg0=7'b0100001;//d 
    seg1=7'b0101111;//r 
    seg2=7'b1000110;//c 
    seg3=7'b0001001;//h 
    end                 
    1:begin             
    seg0=7'b0101111;    
    seg1=7'b1000110;    
    seg2=7'b0001001;    
    seg3=7'b1000001;//u 
    end                 
    2:begin             
    seg0=7'b1000110;    
    seg1=7'b0001001;    
    seg2=7'b1000001;    
    seg3=7'b0001000;//a 
    end                 
    3:begin             
    seg0=7'b0001001;    
    seg1=7'b1000001;    
    seg2=7'b0001000;    
    seg3=7'b1011111;//' 
    end                 
    4:begin             
    seg0=7'b1000001;    
    seg1=7'b0001000;    
    seg2=7'b1011111;    
    seg3=7'b0010010;//s 
    end                 
    5:begin             
    seg0=7'b0001000;    
    seg1=7'b1011111;    
    seg2=7'b0010010;    
    seg3=7'b0001110;//F 
    end                 
    6:begin             
    seg0=7'b1011111;    
    seg1=7'b0010010;    
    seg2=7'b0001110;    
    seg3=7'b0001000;//A 
    end                 
    7:begin             
    seg0=7'b0010010;    
    seg1=7'b0001110;    
    seg2=7'b0001000;    
    seg3=7'b0101011;//n 
    end                 
    8:begin             
    seg0=7'b0001110;    
    seg1=7'b0001000;    
    seg2=7'b0101011;    
    seg3=7'b0010010;//s 
    end                 
    9:begin              
    seg0=7'b0001000;     
    seg1=7'b0101011;     
    seg2=7'b0010010;     
    seg3=7'b1111111;// " 
    end                  
    10:begin             
    seg0=7'b0101011;     
    seg1=7'b0010010;     
    seg2=7'b1111111;     
    seg3=7'b0100001;//D  
    end                  
    11:begin             
    seg0=7'b0010010;     
    seg1=7'b1111111;     
    seg2=7'b0100001;     
    seg3=7'b0101111;//r 
     end                
    12:begin             
    seg0=7'b1111111;    
    seg1=7'b0100001;    
    seg2=7'b0101111;    
    seg3=7'b1000110;//C 
    count<=0;           
    end
    
    endcase             
    end      
        
    endcase
    end
    end
    
    
    
endmodule
