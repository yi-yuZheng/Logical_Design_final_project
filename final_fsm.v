module fsm(clk, rst_n, in, state);

input clk, rst_n;
input [1:0] in;
output reg [1:0] state;

reg [1:0] nxt_state;

always@(posedge clk or negedge rst_n)
	if(~rst_n) state<=2'b00;   // (~rst_n || change) ???????????????????
	else state<= nxt_state;

always@*                 //if(change) nxt_state = 2'b00 else case().....
	case(state)
	2'b00:
		if(in == 2'b10) nxt_state=2'b01;
		else nxt_state=2'b00;
	2'b01:
		if(in == 2'b10) nxt_state=2'b10;
		else nxt_state=2'b01;
	2'b10:
		if(in == 2'b10) nxt_state=2'b11;
		else nxt_state=2'b10;
	2'b11:
		if(in == 2'b10) nxt_state=2'b00;
		else nxt_state=2'b11;
	default: nxt_state=2'b00;
	endcase

endmodule	
	