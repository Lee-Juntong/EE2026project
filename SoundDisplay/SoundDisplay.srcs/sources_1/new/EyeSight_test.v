`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2020 18:00:49
// Design Name: 
// Module Name: EyeSight_test
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


module EyeSight_test(
input CLK3125,
input _BC,
input _BU,
input _BD,
input _BR,
input _BL,
input [5:0]y,
input [6:0]x,
input sw,
output reg [15:0]pixel_data,
output reg [3:0] an=4'b1110,
output reg [6:0] seg
    );
    wire pbc,pbd,pbu,pbl,pbr;
    Button singlePulseButton1(_BC,CLK3125,pbc);
    Button singlePulseButton2(_BD,CLK3125,pbd);
    Button singlePulseButton3(_BU,CLK3125,pbu);
    Button singlePulseButton4(_BL,CLK3125,pbl);
    Button singlePulseButton5(_BR,CLK3125,pbr);
   reg A_DOWN [6143:0];
   reg A_UP   [6143:0];
   reg A_LEFT [6143:0];
   reg A_RIGHT[6143:0];
   reg B_DOWN [6143:0];
   reg B_UP   [6143:0];
   reg B_LEFT [6143:0];
   reg B_RIGHT[6143:0];
   reg C_DOWN [6143:0];
   reg C_UP   [6143:0];
   reg C_LEFT [6143:0];
   reg C_RIGHT[6143:0];
   reg D_DOWN [6143:0];
   reg D_UP   [6143:0];
   reg D_LEFT [6143:0];
   reg D_RIGHT[6143:0];
   reg E_DOWN [6143:0];
   reg E_UP   [6143:0];
   reg E_LEFT [6143:0];
   reg E_RIGHT[6143:0];
   reg S_DOWN [6143:0]; 
   reg S_UP   [6143:0];   
   reg S_LEFT [6143:0]; 
   reg S_RIGHT[6143:0];
   reg [15:0] A[6143:0];
   reg [15:0] B[6143:0];
   reg [15:0] C[6143:0];
   reg [15:0] D[6143:0];
   reg [15:0] E[6143:0];
   reg [15:0] S[6143:0];
   reg [15:0] U[6143:0];   


initial begin
$readmemb("A_DOWN.mem",   A_DOWN );
$readmemb("A_UP.mem",      A_UP   );
$readmemb("A_LEFT.mem",   A_LEFT );
$readmemb("A_RIGHT.mem",  A_RIGHT);
$readmemb("B_DOWN.mem",   B_DOWN );
$readmemb("B_UP.mem",     B_UP   );
$readmemb("B_LEFT.mem",  B_LEFT );
$readmemb("B_RIGHT.mem", B_RIGHT);
$readmemb("C_DOWN.mem",  C_DOWN );
$readmemb("C_UP.mem",    C_UP   );
$readmemb("C_LEFT.mem",  C_LEFT );
$readmemb("C_RIGHT.mem", C_RIGHT);
$readmemb("D_DOWN.mem",  D_DOWN );
$readmemb("D_UP.mem",    D_UP   );
$readmemb("D_LEFT.mem",  D_LEFT );
$readmemb("D_RIGHT.mem", D_RIGHT);
$readmemb("E_DOWN.mem",  E_DOWN );
$readmemb("E_UP.mem",     E_UP   );
$readmemb("E_LEFT.mem",  E_LEFT );
$readmemb("E_RIGHT.mem", E_RIGHT);
$readmemb("S_DOWN.mem",   S_DOWN );
$readmemb("S_UP.mem",     S_UP   );
$readmemb("S_LEFT.mem",   S_LEFT );
$readmemb("S_RIGHT.mem",  S_RIGHT);
$readmemh("picA.mem",A);
$readmemh("picB.mem",B);
$readmemh("picC.mem",C);
$readmemh("picD.mem",D);
$readmemh("picE.mem",E);
$readmemh("picS.mem",S);
$readmemh("picU.mem",U);
end
    wire [1:0]num;
    wire [1:0]num_in;
 Random_Num_Gen rng( CLK3125,!sw,num);


             
 reg [2:0]mode=0;//0 U 1 S 2 E 3 D 4 C 5 B 6 A 
 reg isFinished=0;
 wire _sw;
 reg mode_indicater;
 reg [3:0]fake_mode;
Button db(sw,CLK3125,_sw);

  always @ (posedge CLK3125) begin 
   if (fake_mode!=mode)
   begin mode_indicater<=1;
   fake_mode<=mode;
   end
   else if (fake_mode==mode) mode_indicater<=0;
   end
   
   assign num_in=(_sw || mode_indicater)?num:num_in;
 
 
  always @ (posedge CLK3125) begin
  if(sw==0) begin isFinished=0;mode=0; end
  
  if (isFinished) begin
  case(mode)
  0:begin pixel_data=U[96*y+x]; seg=7'b1000001; end//U
  1:begin pixel_data=S[96*y+x]; seg=7'b0010010; end//S
  2:begin pixel_data=E[96*y+x]; seg=7'b0000110; end//E
  3:begin pixel_data=D[96*y+x]; seg=7'b0100001; end//D
  4:begin pixel_data=C[96*y+x]; seg=7'b1000110; end//C
  5:begin pixel_data=B[96*y+x]; seg=7'b0000011; end//B
  6:begin pixel_data=A[96*y+x]; seg=7'b0001000; end//A
  default:begin pixel_data=16'hFFFF; seg=7'b1111111; end
  endcase
  if(pbc&&isFinished==1) begin isFinished=0;mode=0; end
  end
  
  else begin
  seg=7'b1111111;
  if (mode==0) begin
  case(num_in)
  0:begin pixel_data<= S_DOWN[96*y+x]*16'hffff;if (pbd) mode<=mode+1; else if (pbu||pbl||pbr) isFinished=1; end
  1:begin pixel_data<=   S_UP[96*y+x]*16'hffff;if (pbu) mode<=mode+1; else if (pbd||pbl||pbr) isFinished=1; end
  2:begin pixel_data<= S_LEFT[96*y+x]*16'hffff;if (pbl) mode<=mode+1; else if (pbd||pbu||pbr) isFinished=1; end
  3:begin pixel_data<=S_RIGHT[96*y+x]*16'hffff;if (pbr) mode<=mode+1; else if (pbd||pbu||pbl) isFinished=1; end
  endcase
  end
  
  if (mode==1)begin
  case(num_in)
  0:begin pixel_data<=  E_DOWN[96*y+x]*16'hffff;if (pbd)  mode<=mode+1; else if (pbu||pbl||pbr) isFinished=1; end
  1:begin pixel_data<=  E_UP[96*y+x]*16'hffff;if (pbu)    mode<=mode+1; else if (pbd||pbl||pbr) isFinished=1; end
  2:begin pixel_data<=  E_LEFT[96*y+x]*16'hffff;if (pbl)  mode<=mode+1; else if (pbd||pbu||pbr) isFinished=1; end
  3:begin pixel_data<=  E_RIGHT[96*y+x]*16'hffff;if (pbr) mode<=mode+1; else if (pbd||pbu||pbl) isFinished=1; end
  endcase
  end
  
  if (mode==2)begin
    case(num_in)
    0:begin pixel_data<=  D_DOWN[96*y+x]*16'hffff;if (pbd)  mode<=mode+1; else if (pbu||pbl||pbr) isFinished=1; end
    1:begin pixel_data<=  D_UP[96*y+x]*16'hffff;if (pbu)    mode<=mode+1; else if (pbd||pbl||pbr) isFinished=1; end
    2:begin pixel_data<=  D_LEFT[96*y+x]*16'hffff;if (pbl)  mode<=mode+1; else if (pbd||pbu||pbr) isFinished=1; end
    3:begin pixel_data<=  D_RIGHT[96*y+x]*16'hffff;if (pbr) mode<=mode+1; else if (pbd||pbu||pbl) isFinished=1; end
    endcase
    end
    
    if (mode==3)begin
        case(num_in)
        0:begin pixel_data<=  C_DOWN[96*y+x]*16'hffff;if (pbd)  mode<=mode+1; else if (pbu||pbl||pbr) isFinished=1; end
        1:begin pixel_data<=  C_UP[96*y+x]*16'hffff;if (pbu)    mode<=mode+1; else if (pbd||pbl||pbr) isFinished=1; end
        2:begin pixel_data<=  C_LEFT[96*y+x]*16'hffff;if (pbl)  mode<=mode+1; else if (pbd||pbu||pbr) isFinished=1; end
        3:begin pixel_data<=  C_RIGHT[96*y+x]*16'hffff;if (pbr) mode<=mode+1; else if (pbd||pbu||pbl) isFinished=1; end
        endcase
        end
        
    if (mode==4)begin
        case(num_in)
        0:begin pixel_data<=  B_DOWN[96*y+x]*16'hffff;if (pbd)  mode<=mode+1; else if (pbu||pbl||pbr) isFinished=1; end
        1:begin pixel_data<=  B_UP[96*y+x]*16'hffff;if (pbu)    mode<=mode+1; else if (pbd||pbl||pbr) isFinished=1; end
        2:begin pixel_data<=  B_LEFT[96*y+x]*16'hffff;if (pbl)  mode<=mode+1; else if (pbd||pbu||pbr) isFinished=1; end
        3:begin pixel_data<=  B_RIGHT[96*y+x]*16'hffff;if (pbr) mode<=mode+1; else if (pbd||pbu||pbl) isFinished=1; end
        endcase
        end
  
    if (mode==5)begin                                                                                                 
      case(num_in)                                                                                                  
      0:begin pixel_data<=  A_DOWN[96*y+x]*16'hffff;if (pbd)  mode<=mode+1; else if (pbu||pbl||pbr) isFinished=1; end 
      1:begin pixel_data<=  A_UP[96*y+x]*16'hffff;if (pbu)    mode<=mode+1; else if (pbd||pbl||pbr) isFinished=1; end   
      2:begin pixel_data<=  A_LEFT[96*y+x]*16'hffff;if (pbl)  mode<=mode+1; else if (pbd||pbu||pbr) isFinished=1; end 
      3:begin pixel_data<=  A_RIGHT[96*y+x]*16'hffff;if (pbr) mode<=mode+1; else if (pbd||pbu||pbl) isFinished=1; end
      endcase                                                                                                       
      end                                                                                                           
      
    if (mode==6) isFinished<=1;  
      end
  end
  
  
  endmodule
