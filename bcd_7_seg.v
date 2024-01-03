module bcd_7_seg(input [3:0]x, output reg [0:6]a);

 always @(x)

	case(x)
		0:a=7'b1000000;
		1:a=7'b1001111;
		2:a=7'b0100100;
		3:a=7'b0110000;
		4:a=7'b0011001;
		5:a=7'b0010010;
		6:a=7'b0000010;
		7:a=7'b1111000;
		8:a=7'b0000000;
		9:a=7'b0010000;
		default:a=7'b1111111;
	 endcase
endmodule

