module memory_addr(h_cnt, v_cnt, addr);
	input [9:0] h_cnt, v_cnt;
	output reg [9:0] addr;
	
	always @*
	   addr = (h_cnt/20 - 11 + (v_cnt/20 - 2)*10 )*4;	
endmodule	