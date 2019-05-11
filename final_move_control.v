module move_control(clk, rst_n, memory, sel, color,
					x1, y1, x2, y2, x3, y3, x4, y4, 
					x1_out, y1_out, x2_out, y2_out, x3_out, y3_out, x4_out, y4_out,
					addr1_out, addr2_out, addr3_out, addr4_out,
					stop);
	
	input clk, rst_n;
	input [799:0] memory;
	input [1:0] sel;
	input [2:0] color;
	input [9:0] x1, y1, x2, y2, x3, y3, x4, y4;
	output reg [9:0] x1_out, y1_out, x2_out, y2_out, x3_out, y3_out, x4_out, y4_out;
	output reg [9:0] addr1_out, addr2_out, addr3_out, addr4_out;
	output reg stop;
	
	reg [9:0] temp_x1, temp_y1, temp_x2, temp_y2, temp_x3, temp_y3, temp_x4, temp_y4;
	
	wire [9:0] addr1, addr2, addr3, addr4;
	wire [9:0] temp_addr1, temp_addr2, temp_addr3, temp_addr4;
	wire [1:0] state;
	wire [9:0] x1_rot, x2_rot, x3_rot, x4_rot, y1_rot, y2_rot, y3_rot, y4_rot;
			
	integer i;
	
	fsm A0(clk, rst_n, sel, state);  // fsm --->  mem_addr_gen
	rotate A1(clk, rst_n, color, state, x1, x2, x3, x4, y1, y2, y3, y4, 
			  x1_rot, x2_rot, x3_rot, x4_rot, y1_rot, y2_rot, y3_rot, y4_rot);
		
	//control move
	always @*
	 begin 
		if(sel == 2'b10) //rotate	
		 begin
			temp_x1 = x1_rot;
			temp_x2 = x2_rot;
			temp_x3 = x3_rot;
			temp_x4 = x4_rot;
			temp_y1 = y1_rot;
			temp_y2 = y2_rot;
			temp_y3 = y3_rot;
			temp_y4 = y4_rot;
		 end
		else if(sel == 2'b01) //left
		 begin
			temp_x1 = x1 + 20;
			temp_x2 = x2 + 20;
			temp_x3 = x3 + 20;
			temp_x4 = x4 + 20;
		 end
		else if(sel == 2'b00) //right
		 begin
			temp_x1 = x1 - 20;
			temp_x2 = x2 - 20;
			temp_x3 = x3 - 20;
			temp_x4 = x4 - 20;
		 end
		else //2'b11 fall
		 begin
			temp_y1 = y1 - 20;
			temp_y2 = y2 - 20;
			temp_y3 = y3 - 20;
			temp_y4 = y4 - 20;
		 end
	 end
	
	// assign output address and coordinates
	memory_addr L0(x1, y1, addr1);
	memory_addr L1(x2, y2, addr2);
	memory_addr L2(x3, y3, addr3);
	memory_addr L3(x4, y4, addr4);
	
	memory_addr U0(temp_x1, temp_y1, temp_addr1);
	memory_addr U1(temp_x2, temp_y2, temp_addr2);
	memory_addr U2(temp_x3, temp_y3, temp_addr3);
	memory_addr U3(temp_x4, temp_y4, temp_addr4);
	
	always @*
	 begin
		if(temp_x1 >= 220 && temp_x1 <= 419 && temp_y1 >= 40 && temp_y1 <= 439
		&& temp_x2 >= 220 && temp_x2 <= 419 && temp_y2 >= 40 && temp_y2 <= 439
		&& temp_x3 >= 220 && temp_x3 <= 419 && temp_y3 >= 40 && temp_y3 <= 439
		&& temp_x4 >= 220 && temp_x4 <= 419	&& temp_y4 >= 40 && temp_y4 <= 439 
		&& memory[temp_addr1] == 0 && memory[temp_addr2] == 0 
		&& memory[temp_addr3] == 0 && memory[temp_addr4] == 0)
		 begin
			x1_out = temp_x1; x2_out = temp_x2; x3_out = temp_x3; x4_out = temp_x4;
			y1_out = temp_y1; y2_out = temp_y2; y3_out = temp_y3; y4_out = temp_y4;
			addr1_out = temp_addr1; addr2_out = temp_addr2; 
			addr3_out = temp_addr3; addr4_out = temp_addr4;
			stop = 1'b0;
		 end
		else
		 begin
		 	x1_out = x1; x2_out = x2; x3_out = x3; x4_out = x4;
			y1_out = y1; y2_out = y2; y3_out = y3; y4_out = y4;
			addr1_out = addr1; addr2_out = addr2; 
			addr3_out = addr3; addr4_out = addr4;
			stop = 1'b1;
		 end
	 end
	
endmodule