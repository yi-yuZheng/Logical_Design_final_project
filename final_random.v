module random(clk, rst, change, color);//change the color randomly
	input rst, clk, change;//posedge rst
	output [2:0] color;
	
	reg [7:0] random, random_nxt;
	wire clk1Hz;
	
	frequency_divider #(5000_0000) U0(~rst, clk, clk1Hz);
		
	always @(posedge clk1Hz or posedge rst)
		if(rst) random <= 3'b111;
		else random <= random_nxt;		
	
	always @* 
		if(change) random_nxt = {random[6:0], random[0]^random[5]^random[6]^random[7]}; 
		else random_nxt = random;
		
	assign color = {random[2], random[4], random[5]};
endmodule
	
	
	