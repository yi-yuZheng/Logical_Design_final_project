module keyboard_control(clk, rst_n, dir, PS2_CLK, PS2_DATA);

	input clk,rst_n;
	inout PS2_DATA,PS2_CLK;
	output reg [1:0] dir;
	wire [511:0] key_down;
	wire [8:0] last_change;

	KeyboardDecoder U0(
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(~rst_n),
		.clk(clk)
	);
	
	always@*
		if(key_down[last_change]==1)
		 begin
			case(last_change[7:0])
				8'h74: dir=2'b00;//¥k
				8'h6B: dir=2'b01;//¥ª
				8'h75: dir=2'b10;//¤W
				default: dir=2'b11;//¤U
			endcase
		 end
		else
			dir=2'b00;
endmodule	