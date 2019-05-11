module frequency_divider(rst_n, clk, A);
    parameter n = 5000_0000;
	
    input rst_n, clk;
    output A;
	
    reg A, DA; //the output of frequency_divider
	reg [26:0] count, Dcount; //the counter, mind that 2^27 = 1_3421_7728
    
	always @(posedge clk or negedge rst_n)
        if(~rst_n) {A, count} <= {1'b0, 27'd0};
		else {A, count} <= {DA, Dcount};   
    
    always @*
		if(count == n) {DA, Dcount} = {~A, 27'd0};
		else {DA, Dcount} = {A,  count + 27'd1};
		
endmodule
