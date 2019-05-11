module top(clk, rst, PS2_CLK, PS2_DATA, vgaRed, vgaGreen, vgaBlue, hsync, vsync, LED, D_ssd);

	input clk, rst;
	inout PS2_CLK, PS2_DATA;
	output [3:0] vgaRed, vgaGreen, vgaBlue;
	output hsync, vsync;
	output [3:0] LED;
	output [7:0] D_ssd;

	wire [11:0] data;
	wire clk_25MHz;
	wire [16:0] pixel_addr;
	wire [11:0] pixel;
	wire valid;
	wire [9:0] h_cnt, v_cnt;  //480
	wire [1:0] sel;
	wire [15:0] dis_score;

	assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;

	keyboard_control M1(clk, ~rst, sel, PS2_CLK, PS2_DATA);           			//control directoin
	mem_addr_gen U1(clk, rst, sel, h_cnt, v_cnt, pixel_addr, dis_score);
	display U0(~rst, clk, dis_score, LED, D_ssd);
	
	// Frequency Divider
	clock_divisor clk_wiz_0_inst(
	  .clk(clk),
	  .clk1(clk_25MHz),
	  .clk22()
	);

	// Use reduced 320x240 address to output the saved picture from RAM 
	blk_mem_gen_0 blk_mem_gen_0_inst(
	  .clka(clk_25MHz),
	  .wea(0),
	  .addra(pixel_addr),
	  .dina(data[11:0]),
	  .douta(pixel)
	); 

	// Render the picture by VGA controller
	vga_controller   vga_inst(
	  .pclk(clk_25MHz),
	  .reset(rst),
	  .hsync(hsync),
	  .vsync(vsync),
	  .valid(valid),
	  .h_cnt(h_cnt),
	  .v_cnt(v_cnt)
	);
      
endmodule
