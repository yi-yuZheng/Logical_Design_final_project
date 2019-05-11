module mem_addr_gen(clk, rst, sel, h_cnt, v_cnt, pixel_addr, dis_score);
	input clk, rst;
	input [1:0] sel;
	input [9:0] h_cnt, v_cnt;
	output [16:0] pixel_addr;
	output reg [15:0] dis_score;
	
	reg clk_move;
    reg change, change_nxt;
	wire [2:0] color;
	wire [9:0] a1, a2, a3, a4, b1, b2, b3, b4;
	
	wire [13:0] score_add;
	reg [13:0] score, score_nxt; //generate
	wire clk1Hz;
	reg sub_line_total;
	reg [19:0] sub_line; //generate
	reg [799:0] mem, mem_nxt;
	wire [799:0] mem_sub;
	reg [9:0] x1, y1, x2, y2, x3, y3, x4, y4;
	wire [9:0] x1_out, y1_out, x2_out, y2_out, x3_out, y3_out, x4_out, y4_out;
	wire [9:0] addr1, addr2, addr3, addr4;
	wire stop;
		
	reg gameover; 
	
	wire [9:0] pic_x, pic_y;
	reg [9:0] scan_x, scan_y;
	reg [3:0] pic;
	wire [9:0] addr;
 	
	integer j;
	
	//-------------score-----------------------------------------------
	always @(posedge clk or posedge rst)
		if(rst) score <=  14'd0;
		else score <= score_nxt;
	
	always @*
		score_nxt = score + score_add;
	
	always @*
	 begin
		dis_score[15:12] = score / 10'd1000;
		dis_score[11:8] = (score - (score / 10'd1000) * 10'd1000) / 7'd100;
		dis_score[7:4] = (score - (score / 7'd100) * 7'd100) / 4'd10;
		dis_score[3:0] = score % 4'd10;
	 end
	
	//-------------generate new tetris---------------------------------------

	random F1(clk, rst, change, color);
	new_tetris_gen F2(color, a1, a2, a3, a4, b1, b2, b3, b4);
		

	always @(posedge clk_move or posedge rst) //###############
		if(rst) change <= 1'b0;
		else change <= change_nxt;
	
	always @*
		if(stop) change_nxt = 1'b1;
		else change_nxt = 1'b0;

	//-------------the coordinates of the falling tetris----------------------- 

	frequency_divider #(5000_0000) M2(~rst, clk, clk1Hz);						//1 Hz clk
	sub_tetris M3(clk, ~rst, stop, sub_line_total, sub_line, mem, mem_sub, score_add);	//subtracted memory
	move_control M4(clk, ~rst, mem, sel, color,									//move or not
					x1, y1, x2, y2, x3, y3, x4, y4, 
					x1_out, y1_out, x2_out, y2_out, x3_out, y3_out, x4_out, y4_out,
					addr1, addr2, addr3, addr4,
					stop);
 	
	always @*
		if(sel == 2'b11) clk_move = clk1Hz; //fall down     always enter the condition??????????
		else 		     clk_move = clk; 	//left right rotate
	
	always @(posedge clk_move or posedge rst)
		if(rst) 
		 begin
			x1 <= a1; x2 <= a2; x3 <= a3; x4 <= a4;
			y1 <= b1; y2 <= b2; y3 <= b3; y4 <= b4;
		 end
		else 
		 begin
			x1 <= x1_out; x2 <= x2_out; x3 <= x3_out; x4 <= x4_out;
			y1 <= y1_out; y2 <= y2_out; y3 <= y3_out; y4 <= y4_out;
		 end

  
	//------------------refresh the memory--------------------------------------------------

	//combine memory and stopped tetris
	always @(posedge clk or posedge rst)
		if(rst) mem <= 800'd0;
		else mem <= mem_nxt;
		
	always @*
	 begin
		if(sub_line_total) //stop
			for(j = 0; j < 800; j = j + 1)
				if(j == addr1) 		   	mem_nxt[j] = 1; 
				else if(j == addr1 + 1) mem_nxt[j] = color[2]; 
				else if(j == addr1 + 2) mem_nxt[j] = color[1]; 
				else if(j == addr1 + 3) mem_nxt[j] = color[0];
				else if(j == addr2    ) mem_nxt[j] = 1; 
				else if(j == addr2 + 1) mem_nxt[j] = color[2]; 
				else if(j == addr2 + 2) mem_nxt[j] = color[1]; 
				else if(j == addr2 + 3) mem_nxt[j] = color[0];
				else if(j == addr3    ) mem_nxt[j] = 1; 
				else if(j == addr3 + 1) mem_nxt[j] = color[2]; 
				else if(j == addr3 + 2) mem_nxt[j] = color[1]; 
				else if(j == addr3 + 3) mem_nxt[j] = color[0];	
				else if(j == addr4    ) mem_nxt[j] = 1; 
				else if(j == addr4 + 1) mem_nxt[j] = color[2]; 
				else if(j == addr4 + 2) mem_nxt[j] = color[1]; 
				else if(j == addr4 + 3) mem_nxt[j] = color[0];	
				else 					mem_nxt[j] = mem[j];		
		else
			mem_nxt = mem_sub; //moving
	 end
	
	// subtract the tetris and calculate the score
	integer i;
		
	always @*
		for(i = 0; i < 800; i = i + 40)
			sub_line[(i/40)] = & ( mem[( i + 39) - : 39] | {10{4'b1110}} ); // 20th	
				
	always @*
		sub_line_total = | sub_line; //stop
		
	//gameover
	always @* 
		gameover = | mem[39:0];
	
	//------------------scan the tetris and the pictures------------------------------------

	scan_control S0(pic, pic_x, pic_y); //find the position of the pic
	memory_addr S1(h_cnt, v_cnt, addr);
	
	assign pixel_addr = ((scan_x>>1) + 320*(scan_y>>1)) % 76800;  //640*480 --> 320*240
	
	always @*
		//game over
		if(gameover == 1 && h_cnt >= 220 && h_cnt <= 419 && v_cnt >= 140 && v_cnt <= 180)
		 begin 
			pic = 4'b1001;
			scan_x = h_cnt - (220 - pic_x);
			scan_y = v_cnt - (140 - pic_y);
		 end
		
		//game instruction
		/*else if(gamestart == 1 && h_cnt >= 220 && h_cnt <= 419 && v_cnt >= 90 && v_cnt <= 230)
		 begin 
			pic = 4'b1010;
			scan_x = h_cnt - (220 - pic_x);
			scan_y = v_cnt - (90 - pic_y);
		 end*/
		
		//falling tetris
		else if(mem[addr1] == 1 && h_cnt >= 220 && h_cnt <= 419 && v_cnt >= 40 && v_cnt <= 439)
		 begin
			pic = {1'b0, mem[addr1+1], mem[addr1+2], mem[addr1+3]};
			scan_x = h_cnt - (x1 - pic_x);
			scan_y = v_cnt - (y1 - pic_y);
		 end
		else if(mem[addr2] == 1 && h_cnt >= 220 && h_cnt <= 419 && v_cnt >= 40 && v_cnt <= 439)
		 begin
			pic = {1'b0, mem[addr2+1], mem[addr2+2], mem[addr2+3]};
			scan_x = h_cnt - (x2 - pic_x);
			scan_y = v_cnt - (y2 - pic_y);
		 end
		else if(mem[addr3] == 1 && h_cnt >= 220 && h_cnt <= 419 && v_cnt >= 40 && v_cnt <= 439)
		 begin
			pic = {1'b0, mem[addr3+1], mem[addr3+2], mem[addr3+3]};
			scan_x = h_cnt - (x3 - pic_x);
			scan_y = v_cnt - (y3 - pic_y);
		 end
		else if(mem[addr4] == 1 && h_cnt >= 220 && h_cnt <= 419 && v_cnt >= 40 && v_cnt <= 439)
		 begin
			pic = {1'b0, mem[addr4+1], mem[addr4+2], mem[addr4+3]};
			scan_x = h_cnt - (x4 - pic_x);
			scan_y = v_cnt - (y4 - pic_y);
		 end
		
		//static tetris
		else if(mem[addr] == 1 && h_cnt >= 220 && h_cnt <= 419 && v_cnt >= 40 && v_cnt <= 439)
		 begin
			pic = {1'b0, mem[addr+1], mem[addr+2], mem[addr+3]};
			scan_x = h_cnt - (h_cnt/20*20 - pic_x);
			scan_y = h_cnt - (h_cnt/20*20 - pic_y);
		 end
		
		//sponge
		else if(h_cnt >= 450 && h_cnt <= 620 && v_cnt >= 250 && v_cnt <= 420)
		 begin
			pic = 4'b1011; 
			scan_x = h_cnt - (450 - pic_x);
			scan_y = v_cnt - (250 - pic_y);
		 end
			
		//white
		else
		 begin
			pic = 4'd0;
			scan_x = 10'd0;
			scan_y = 10'd320;
		 end

	
endmodule
/*generate
		genvar i;
		for(i = 0; i < 800; i = i + 40)
		 begin : iloop
			always @*
				if( ( mem[( i + 39) : i] | {10{4'b1110}} ) == {40{1'b1}})
				 begin
					sub_line[(i/40)] = 1'b1; // 20th
					score_nxt = score + 1'b1;
				 end
				else
				 begin
					sub_line[(i/40)] = 1'b0;
					score_nxt = score;
				 end
		 end
	endgenerate
*/
/*
		else if(x1 <= h_cnt && h_cnt <= x1 + 19 && y1 <= v_cnt && v_cnt <= y1 + 19) //x1 or x1_out????
		 begin
			pic = {1'b0, mem[addr1+1], mem[addr1+2], mem[addr1+3]};
			scan_x = h_cnt - (x1 - pic_x);
			scan_y = v_cnt - (y1 - pic_y);
		 end
		else if(x2 <= h_cnt && h_cnt <= x2 + 19 && y2 <= v_cnt && v_cnt <= y2 + 19)
		 begin
			pic = {1'b0, mem[addr2+1], mem[addr2+2], mem[addr2+3]};
			scan_x = h_cnt - (x2 - pic_x);
			scan_y = v_cnt - (y2 - pic_y);
		 end
		else if(x3 <= h_cnt && h_cnt <= x3 + 19 && y3 <= v_cnt && v_cnt <= y3 + 19)
		 begin
			pic = {1'b0, mem[addr3+1], mem[addr3+2], mem[addr3+3]};
			scan_x = h_cnt - (x3 - pic_x);
			scan_y = v_cnt - (y3 - pic_y);
		 end
		else if(x4 <= h_cnt && h_cnt <= x4 + 19 && y4 <= v_cnt && v_cnt <= y4 + 19)
		 begin
			pic = {1'b0, mem[addr4+1], mem[addr4+2], mem[addr4+3]};
			scan_x = h_cnt - (x4 - pic_x);
			scan_y = v_cnt - (y4 - pic_y);
		 end
*/