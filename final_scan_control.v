module scan_control(pic, pic_x, pic_y);
	input [3:0] pic;
	output reg [9:0] pic_x, pic_y;
	
	always @*
		case (pic)
			4'b0001 : {pic_x, pic_y} = {10'd0, 10'd0};  //tetris 1
			4'b0010 : {pic_x, pic_y} = {10'd0, 10'd30};  //tetris 2
			4'b0011 : {pic_x, pic_y} = {10'd0, 10'd60};  //tetris 3
			4'b0100 : {pic_x, pic_y} = {10'd0, 10'd90};  //tetris 4
			4'b0101 : {pic_x, pic_y} = {10'd0, 10'd120};  //tetris 5
			4'b0110 : {pic_x, pic_y} = {10'd0, 10'd150};  //tetris 6
			4'b0111 : {pic_x, pic_y} = {10'd0, 10'd180};  //tetris 7
			4'b1001 : {pic_x, pic_y} = {10'd290, 10'd0}; //Game Over
			4'b1010 : {pic_x, pic_y} = {10'd290, 10'd50}; //Instruction
			4'b1011 : {pic_x, pic_y} = {10'd290, 10'd190}; //Sponge Bob
			default : {pic_x, pic_y} = {10'd0, 10'd320};  //4'b0000 white
		endcase
endmodule
