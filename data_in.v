module data_in(
input rst,
input clk,
input data_in,
input count_reset_sig,
output reg [4:0] out,
output reg [3:0] count_out,
output reg handshake_sig
//output reg clk_div	// ADD THIS TO TOP MOD PORT
	 
    );
reg [36:0] count; 	
 

    always@(posedge clk)
    begin
        if(!rst)
            begin
                out = 5'b00000;       
                count_out = 4'b1111;     
            end
            begin
                if(count_reset_sig)  
                    begin
                        count_out = 4'hf;
								handshake_sig = 1'b1;
                    end
                else
                    begin
								if(handshake_sig)
									begin
										out = 5'b00000;
										handshake_sig = 1'b0;
									end
                        out = {out[3:0], data_in};
                        count_out = count_out + 1; 
                        								
                    end
            end
    end
endmodule


/* 
always @ (posedge clk) 
	begin
		counter = counter+1;
			if (counter == 50000000)
				begin
					counter <=0;
				end
			clock_1sec = (counter ==50000000)?1:0;
if (x > 25000000 && counter < 50000000)
 data_in = 0;
 Ov = 0;
if (counter > 50000000)
 data_in = 1;
 Ov = 1;
 out = {out[3:0], data_in};
 out > 1 == 1 (dash)
 out < 1 == 0 (dot) */
 
	
/*	always@(posedge clk)
	begin
		if(!rst)
			begin
				count = 36'h0;
			end
		else
			begin
				if(count < 25000000)
					begin
						clk_div = 1'b0;
						count = count +1;
					end
				else if(25000000 <= count < 50000000)
					begin
						clk_div = 1'b1;
						count = count + 1;
					end
				else 
					begin
						count = 36'h0;
						clk_div = 1'b0;
					end
					
			end
	end
    */