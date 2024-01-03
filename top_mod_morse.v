module top_mod_morse(
        input rst,
		  input vga_rst,
        input clk,
		  input clk_50m,
        input data_in,
        input send_data,
		  input inp,             //when pushed high, output displays on 7segment  
        output [4:0] out,
		  output [3:0] count,	  //[4:0] out_morse,
		  output handshake_sig,
		  output divcntr,
		  output [6:0] led,
		  output [6:0] seg_out_1, 
		  output [6:0] seg_out_2,
		  input high,
		  
		 
		output vga_blank,					   //VGA BLANK
					vga_c_sync,					//	VGA COMPOSITE SYNC
					vga_h_sync,					//	VGA H_SYNC
					vga_v_sync,					//	VGA V_SYNC
								// VGA Data Enable
		output [7:0]	vga_red,				//	VGA Red[9:0]
					vga_green,	 				//	VGA Green[9:0]
					vga_blue   				//	VGA Blue[9:0]
					//vga_color_data	
    );
    
   // wire [3:0] count;
	
	wire vga_data_enable;
    wire count_reset_sig;
    wire [4:0] out_morse;
	 wire onn;
	 wire display_vga;
	 
    data_decoder uui_2(
    .rst(rst),
    .send_data(send_data),
    .count(count),
    .data_out(out),
    .out_morse(out_morse),
    .count_reset_sig(count_reset_sig)
        );
    
    data_in uui_1(
        .rst(rst),
        .clk(clk),
        .data_in(data_in),
        .count_reset_sig(count_reset_sig),
        .out(out),
        .count_out(count),
		  .handshake_sig(handshake_sig)
            );  
    
   sevenseg uui_3(
		.rst(rst),
      .morse_in(out_morse), 
      .inp(inp),
		.led(led)
          );    
		 
   bcd_7_seg uui_4(
	.x(out_morse[3:0]),
	.a(seg_out_1));
		  
	bcd_7_seg uui_5(
	.x({3'b000,out_morse[4]}),
	.a(seg_out_2));		  
		  
	display_project uui_6(
	.clk(clk_50m),
	.reset(vga_rst),
	.display_vga(out_morse),
	.onn(high),
	.end_of_active_frame(end_of_active_frame),
	.end_of_frame(end_of_frame),
	.divcntr(divcntr),
	.vga_blank(vga_blank),					
	.vga_c_sync(vga_c_sync),					
	.vga_h_sync(vga_h_sync),					
	.vga_v_sync(vga_v_sync),				
	//.vga_data_enable(vga_data_enable),			
	.vga_red(vga_red),						
	.vga_green(vga_green),	 				
	.vga_blue(vga_blue)   			
	//.vga_color_data(vga_color_data
	);
		  
endmodule
