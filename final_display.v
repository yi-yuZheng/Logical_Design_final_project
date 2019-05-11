module display(rst_n, clk, in, LED, D_ssd);
    input rst_n, clk;
	input [15:0] in; 
	output reg [7:0] D_ssd; //7 segment display
	output reg [3:0] LED; //the output of scan control
	
	reg [1:0] A, DA; //select the number to be displayed
	reg [3:0] dis_num; //the number selected to be displayed
	wire dis_clk; //the frequency of display
	
	frequency_divider #(5000) U0(rst_n, clk, dis_clk);
	
	always @(posedge dis_clk or negedge rst_n)
        if(~rst_n) A <= 2'd0;
		else A <= DA;
		
    always@*
	begin
		DA = A + 1'd1;
		
		case(A)
			3'b00: {dis_num, LED} = {in[3:0], 4'b1110};
			3'b01: {dis_num, LED} = {in[7:4], 4'b1101};
			3'b10: {dis_num, LED} = {in[11:8], 4'b1011};
			3'b11: {dis_num, LED} = {in[15:12], 4'b0111};			
			default: {dis_num, LED} = {in[11:8], 4'b1011};
		endcase
		
		case (dis_num)
			4'd0: D_ssd = 8'b00000011;
			4'd1: D_ssd = 8'b10011111;
			4'd2: D_ssd = 8'b00100101;
			4'd3: D_ssd = 8'b00001101;
			4'd4: D_ssd = 8'b10011001;
			4'd5: D_ssd = 8'b01001001;
			4'd6: D_ssd = 8'b01000001;
			4'd7: D_ssd = 8'b00011111;
			4'd8: D_ssd = 8'b00000001;
			4'd9: D_ssd = 8'b00001001;
			default: D_ssd = 8'b01110001;
		endcase
	end
    
endmodule