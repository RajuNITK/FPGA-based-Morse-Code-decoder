module sevenseg (
input rst,
input [4:0] morse_in,
input  inp,
output reg [6:0] led
);

    parameter A_m = 0;
    parameter B_m = 1;
    parameter C_m = 2;
    parameter D_m = 3;
    parameter E_m = 4;
    parameter F_m = 5;
    parameter G_m = 6;
    parameter H_m = 7;
    parameter I_m = 8;
    parameter J_m = 9;
    parameter K_m = 10;
    parameter L_m = 11;
    parameter M_m = 12;
    parameter N_m = 13;
    parameter O_m = 14;
    parameter P_m = 15;
    parameter Q_m = 16;
    parameter R_m = 17;
    parameter S_m = 18;
    parameter T_m = 19;
    parameter U_m = 20;
    parameter V_m = 21;
    parameter W_m = 22;
    parameter X_m = 23;
    parameter Y_m = 24;
    parameter Z_m = 25;

always @(*)
if(!rst)
	begin
		led = 7'b0000000;
	end
else
 begin
  if(inp)
		begin
			case(morse_in)
				A_m:led=7'b0001000;   
				B_m:led=7'b0000011;  
				C_m:led=7'b1000110;          
				D_m:led=7'b0100001; 
				E_m:led=7'b0000110; 
				F_m:led=7'b0001110;  
				G_m:led=7'b1000010; 
				H_m:led=7'b0001011; 
				I_m:led=7'b1001111; 
				J_m:led=7'b1100001; 
				K_m:led=7'b0001001;
				L_m:led=7'b1000111;
				M_m:led=7'b1101010;
				N_m:led=7'b0101011;
				O_m:led=7'b1000000;
				P_m:led=7'b0001100;
				Q_m:led=7'b0011000;
				R_m:led=7'b0001000; 
				S_m:led=7'b0010010; 	
				T_m:led=7'b0000111;  
				U_m:led=7'b1000001;
				V_m:led=7'b1100011;
				W_m:led=7'b1010101;
				X_m:led=7'b0001001;
				Y_m:led=7'b0010001;
				Z_m:led=7'b0100100;
				default:led=7'b1111111;	
			endcase
		end
 end
endmodule


