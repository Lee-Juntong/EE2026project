`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2020 13:15:36
// Design Name: 
// Module Name: Dr_W_And_C
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


module Dr_W_And_C(
    input switch,
    input [3:0] volume,//when Dr Wong or Dr Chua is displayed, shout to back to initial input
    input [5:0] y,
    input [6:0] x,
    input CLK3125,
    input CLK5_96,
    input CLK15,//1.5Hz
    input CLK381,
    input PBC,
    input PBU,
    input PBL,
    input PBD,
    input PBR,
    output reg [3:0] an,
    output reg [6:0] seg=7'b1111111,
    output reg [15:0] pixel_data,
    output reg dp=1
    );

    
    wire clk381;//a single pulse clk
    wire pbc,pbu,pbl,pbd,pbr;
    Button singlePulseCLK1(CLK381,CLK3125,clk381);
    Button singlePulseButton1(PBC,CLK3125,pbc);
    Button singlePulseButton2(PBD,CLK3125,pbd);
    Button singlePulseButton3(PBU,CLK3125,pbu);
    Button singlePulseButton4(PBL,CLK3125,pbl);
    Button singlePulseButton5(PBR,CLK3125,pbr);
    reg [15:0]Wong[6143:0];
    reg [15:0]Chua[6143:0];
    reg [15:0]NUS[6143:0];
    reg qn[6143:0];
    
    initial begin
    $readmemh("Wong.mem",Wong);
    $readmemh("Chua.mem",Chua);
    $readmemh("NUS.mem",NUS);
    $readmemh("qn.mem",qn);
    end
    
    reg [2:0] delayCount1=0;//when flag is 3, delay  some time to prevent input
    reg [2:0] delayCount2=0;//when flag is 1 or 2, shout for some time to reset
    wire [6:0]seg0;
    wire [6:0]seg1;
    wire [6:0]seg2;
    wire [6:0]seg3;

    wire [6:0]char[0:3];
    reg [3:0] pwd0,pwd1,pwd2,pwd3;//from right to left
    reg [1:0]flag=2'b0;//0 allow input, 1 Dr Wong, 2 Dr Chua, 3 NUS. 123 do not allow input

     reg resetflag=0;
     pwd_to_seg ps0(pwd0,seg0);
     pwd_to_seg ps1(pwd1,seg1);
     pwd_to_seg ps2(pwd2,seg2);
     pwd_to_seg ps3(pwd3,seg3);
     
     name_seg ns(PBC,flag,CLK3125,CLK15,char[3],char[2],char[1],char[0]);
     
     always @ (posedge CLK5_96) begin//this part only changes count and resetflag
     if (!switch) resetflag<=1;

    else begin
     if (flag==3 && delayCount1<7) delayCount1<=delayCount1+1;
     if (flag==3 && delayCount1==7) begin resetflag<=1; delayCount1<=0; end//reset delay Count1 after done set reset flag to 1
     if ((flag==2||flag==1)&&volume>=13&&delayCount2<7) delayCount2<=delayCount2+1;
     if ((flag==2||flag==1)&&volume>=13&&delayCount2==7) begin resetflag<=1;delayCount2<=0; end//reset delay Count2 after done set reset flag to 1
     else resetflag=0;
     if (resetflag==1) begin delayCount1<=0; delayCount2<=0; end
     end
     end 
      
      reg [1:0]AP=0;
      reg [1:0]pwd_flag=0;//this indicates which digit is displayed
      reg [1:0]name_flag=0;
      
      always @ (posedge CLK3125) begin
      if(resetflag==1) begin 
       pwd0=10;
       pwd1=10;
       pwd2=10;
       pwd3=10;
       flag<=0;
         AP=0;
         dp=1;
      end
      else if (flag==0) begin 
      
      pixel_data=qn[96*y+x]*16'hFFFF;
      
      if(pbl==1 && AP<3) AP <= AP+1;
      if(pbr==1 && AP>0) AP <= AP-1;
      
      case(AP)
      0:begin
       if(pbu==1)
       begin
       if(pwd0<10) pwd0=pwd0+1;
       else pwd0=0;
       end
       if(pbd==1)
       begin
       if(pwd0>0) pwd0=pwd0-1;
       else pwd0=10;
       end
       end
      
       1:begin
          if(pbu==1)
          begin
          if(pwd1<10) pwd1=pwd1+1;
          else pwd1=0;
          end
          if(pbd==1)
          begin
          if(pwd1>0) pwd1=pwd1-1;
          else pwd1=10;
          end
          end
            
        2:begin
          if(pbu==1)
          begin
          if(pwd2<10) pwd2=pwd2+1;
          else pwd2=0;
          end
          if(pbd==1)
          begin
          if(pwd2>0) pwd2=pwd2-1;
          else pwd2=10;
          end
          end
          
        3:begin
           if(pbu==1)
           begin
           if(pwd3<10) pwd3=pwd3+1;
           else pwd3=0;
           end
           if(pbd==1)
           begin
           if(pwd3>0) pwd3=pwd3-1;
           else pwd3=10;
           end
           end
         endcase
         
      if (clk381) begin
      case (pwd_flag)//indicates what's Anode Pointer now
          0:begin if(AP==0 && CLK5_96==0) seg=7'b1111111; else seg=seg0; an=4'b1110; pwd_flag<=pwd_flag+1; end
          1:begin if(AP==1 && CLK5_96==0) seg=7'b1111111; else seg=seg1; an=4'b1101; pwd_flag<=pwd_flag+1; end
          2:begin if(AP==2 && CLK5_96==0) seg=7'b1111111; else seg=seg2; an=4'b1011; pwd_flag<=pwd_flag+1; end
          3:begin if(AP==3 && CLK5_96==0) seg=7'b1111111; else seg=seg3; an=4'b0111; pwd_flag<=pwd_flag+1; end
          endcase
      end
      
      if (pwd3==1&&pwd2==2&&pwd1==3&&pwd0==1 && pbc==1) flag<=1;//Dr. Wong!!!
      else if (pwd3==2&&pwd2==0&&pwd1==2&&pwd0==6 && pbc==1) flag<=2;//Dr. Chua!!!
      else if(pbc==1) flag<=3;//wrong input! NUS!
      end
   
      
      if (flag==1) begin
      pixel_data=Wong[96*y+x];
      if (clk381) begin
      case(name_flag) 
      0:begin seg=char[3]; an=4'b1110;dp<=~(char[3]==7'b0101111); name_flag<=name_flag+1; end //
      1:begin seg=char[2]; an=4'b1101;dp<=~(char[2]==7'b0101111); name_flag<=name_flag+1; end //
      2:begin seg=char[1]; an=4'b1011;dp<=~(char[1]==7'b0101111); name_flag<=name_flag+1; end //
      3:begin seg=char[0]; an=4'b0111;dp<=~(char[0]==7'b0101111); name_flag<=name_flag+1; end //
      endcase 
      end
      end
      
      if (flag==2) begin
      pixel_data=Chua[96*y+x];
      if (clk381) begin
      case(name_flag) 
      0:begin seg=char[3]; an=4'b1110; dp<=~(char[3]==7'b0101111); name_flag<=name_flag+1; end//
      1:begin seg=char[2]; an=4'b1101; dp<=~(char[2]==7'b0101111); name_flag<=name_flag+1; end//
      2:begin seg=char[1]; an=4'b1011; dp<=~(char[1]==7'b0101111); name_flag<=name_flag+1; end//
      3:begin seg=char[0]; an=4'b0111; dp<=~(char[0]==7'b0101111); name_flag<=name_flag+1; end//
      endcase 
      end
      end
      
      
      
      if (flag==3) begin
      pixel_data=NUS[96*y+x];
      an=4'b1111;
      end
      
      end
endmodule
