module sub_tetris(clk, rst_n, stop, sub_line_total, sub_line, mem, mem_sub, score_add);
	input clk, rst_n;
	input stop;
	input sub_line_total;
	input [19:0] sub_line;
	input [799:0] mem;  
	output reg [799:0] mem_sub;	
	output reg [13:0] score_add;
	
	always @(posedge clk or negedge rst_n)	
	 begin
		if((~rst_n) || stop) //QQQQQQQQQQQQQQQQQQQQQ stop always 1
		 begin
			mem_sub <= mem;
		    score_add <= score_add;   
 		 end
		else if(sub_line_total)
		 begin
			if(sub_line[0])
			 begin
					mem_sub[39:0]<=40'd0;
					mem_sub[79:40]<=mem_sub[79:40];
					mem_sub[119:80]<=mem_sub[119:80];
					mem_sub[159:120]<=mem_sub[159:120];
					mem_sub[199:160]<=mem_sub[199:160];
					mem_sub[239:200]<=mem_sub[239:200];
					mem_sub[279:240]<=mem_sub[279:240];
					mem_sub[319:280]<=mem_sub[319:280];
					mem_sub[359:320]<=mem_sub[359:320];
					mem_sub[399:360]<=mem_sub[399:360];
					mem_sub[439:400]<=mem_sub[439:400];
					mem_sub[479:440]<=mem_sub[479:440];
					mem_sub[519:480]<=mem_sub[519:480];
					mem_sub[559:520]<=mem_sub[559:520];
					mem_sub[599:560]<=mem_sub[599:560];
					mem_sub[639:600]<=mem_sub[639:600];
					mem_sub[679:640]<=mem_sub[679:640];
					mem_sub[719:680]<=mem_sub[719:680];
					mem_sub[759:720]<=mem_sub[759:720];
					mem_sub[799:760]<=mem_sub[799:760];
					
				    score_add <= score_add + 1'b1;    end
			else if(sub_line[1])
			 begin
					mem_sub[39:0]<=40'd0;
					mem_sub[79:40]<=mem_sub[39:0];
					mem_sub[119:80]<=mem_sub[119:80];
					mem_sub[159:120]<=mem_sub[159:120];
					mem_sub[199:160]<=mem_sub[199:160];
					mem_sub[239:200]<=mem_sub[239:200];
					mem_sub[279:240]<=mem_sub[279:240];
					mem_sub[319:280]<=mem_sub[319:280];
					mem_sub[359:320]<=mem_sub[359:320];
					mem_sub[399:360]<=mem_sub[399:360];
					mem_sub[439:400]<=mem_sub[439:400];
					mem_sub[479:440]<=mem_sub[479:440];
					mem_sub[519:480]<=mem_sub[519:480];
					mem_sub[559:520]<=mem_sub[559:520];
					mem_sub[599:560]<=mem_sub[599:560];
					mem_sub[639:600]<=mem_sub[639:600];
					mem_sub[679:640]<=mem_sub[679:640];
					mem_sub[719:680]<=mem_sub[719:680];
					mem_sub[759:720]<=mem_sub[759:720];
					mem_sub[799:760]<=mem_sub[799:760];
					
				    score_add <= score_add + 1'b1;    end	
			else if(sub_line[2])
			 begin
					mem_sub[39:0]<=40'd0;
					mem_sub[79:40]<=mem_sub[39:0];
					mem_sub[119:80]<=mem_sub[79:40];
					mem_sub[159:120]<=mem_sub[159:120];
					mem_sub[199:160]<=mem_sub[199:160];
					mem_sub[239:200]<=mem_sub[239:200];
					mem_sub[279:240]<=mem_sub[279:240];
					mem_sub[319:280]<=mem_sub[319:280];
					mem_sub[359:320]<=mem_sub[359:320];
					mem_sub[399:360]<=mem_sub[399:360];
					mem_sub[439:400]<=mem_sub[439:400];
					mem_sub[479:440]<=mem_sub[479:440];
					mem_sub[519:480]<=mem_sub[519:480];
					mem_sub[559:520]<=mem_sub[559:520];
					mem_sub[599:560]<=mem_sub[599:560];
					mem_sub[639:600]<=mem_sub[639:600];
					mem_sub[679:640]<=mem_sub[679:640];
					mem_sub[719:680]<=mem_sub[719:680];
					mem_sub[759:720]<=mem_sub[759:720];
					mem_sub[799:760]<=mem_sub[799:760];
					
				    score_add <= score_add + 1'b1;    end	
			else if(sub_line[3])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[199:160];
				mem_sub[239:200]<=mem_sub[239:200];
				mem_sub[279:240]<=mem_sub[279:240];
				mem_sub[319:280]<=mem_sub[319:280];
				mem_sub[359:320]<=mem_sub[359:320];
				mem_sub[399:360]<=mem_sub[399:360];
				mem_sub[439:400]<=mem_sub[439:400];
				mem_sub[479:440]<=mem_sub[479:440];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[4])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[239:200];
				mem_sub[279:240]<=mem_sub[279:240];
				mem_sub[319:280]<=mem_sub[319:280];
				mem_sub[359:320]<=mem_sub[359:320];
				mem_sub[399:360]<=mem_sub[399:360];
				mem_sub[439:400]<=mem_sub[439:400];
				mem_sub[479:440]<=mem_sub[479:440];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[5])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[279:240];
				mem_sub[319:280]<=mem_sub[319:280];
				mem_sub[359:320]<=mem_sub[359:320];
				mem_sub[399:360]<=mem_sub[399:360];
				mem_sub[439:400]<=mem_sub[439:400];
				mem_sub[479:440]<=mem_sub[479:440];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[6])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[319:280];
				mem_sub[359:320]<=mem_sub[359:320];
				mem_sub[399:360]<=mem_sub[399:360];
				mem_sub[439:400]<=mem_sub[439:400];
				mem_sub[479:440]<=mem_sub[479:440];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[7])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[359:320];
				mem_sub[399:360]<=mem_sub[399:360];
				mem_sub[439:400]<=mem_sub[439:400];
				mem_sub[479:440]<=mem_sub[479:440];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
			    score_add <= score_add + 1'b1;    end
				
			else if(sub_line[8])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[399:360];
				mem_sub[439:400]<=mem_sub[439:400];
				mem_sub[479:440]<=mem_sub[479:440];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end	
			else if(sub_line[9])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[439:400];
				mem_sub[479:440]<=mem_sub[479:440];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[10])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[479:440];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[11])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[439:400];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[12])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[439:400];
				mem_sub[519:480]<=mem_sub[479:440];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end	
			else if(sub_line[13])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[439:400];
				mem_sub[519:480]<=mem_sub[479:440];
				mem_sub[559:520]<=mem_sub[519:480];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[14])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[439:400];
				mem_sub[519:480]<=mem_sub[479:440];
				mem_sub[559:520]<=mem_sub[519:480];
				mem_sub[599:560]<=mem_sub[559:520];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end	
			else if(sub_line[15])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[439:400];
				mem_sub[519:480]<=mem_sub[479:440];
				mem_sub[559:520]<=mem_sub[519:480];
				mem_sub[599:560]<=mem_sub[559:520];
				mem_sub[639:600]<=mem_sub[599:560];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[16])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[439:400];
				mem_sub[519:480]<=mem_sub[479:440];
				mem_sub[559:520]<=mem_sub[519:480];
				mem_sub[599:560]<=mem_sub[559:520];
				mem_sub[639:600]<=mem_sub[599:560];
				mem_sub[679:640]<=mem_sub[639:600];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[17])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[439:400];
				mem_sub[519:480]<=mem_sub[479:440];
				mem_sub[559:520]<=mem_sub[519:480];
				mem_sub[599:560]<=mem_sub[559:520];
				mem_sub[639:600]<=mem_sub[599:560];
				mem_sub[679:640]<=mem_sub[639:600];
				mem_sub[719:680]<=mem_sub[679:640];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end
			else if(sub_line[18])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[439:400];
				mem_sub[519:480]<=mem_sub[479:440];
				mem_sub[559:520]<=mem_sub[519:480];
				mem_sub[599:560]<=mem_sub[559:520];
				mem_sub[639:600]<=mem_sub[599:560];
				mem_sub[679:640]<=mem_sub[639:600];
				mem_sub[719:680]<=mem_sub[679:640];
				mem_sub[759:720]<=mem_sub[719:680];
				mem_sub[799:760]<=mem_sub[799:760];
				
			    score_add <= score_add + 1'b1;    end	
			else if(sub_line[19])
			 begin
				mem_sub[39:0]<=40'd0;
				mem_sub[79:40]<=mem_sub[39:0];
				mem_sub[119:80]<=mem_sub[79:40];
				mem_sub[159:120]<=mem_sub[119:80];
				mem_sub[199:160]<=mem_sub[159:120];
				mem_sub[239:200]<=mem_sub[199:160];
				mem_sub[279:240]<=mem_sub[239:200];
				mem_sub[319:280]<=mem_sub[279:240];
				mem_sub[359:320]<=mem_sub[319:280];
				mem_sub[399:360]<=mem_sub[359:320];
				mem_sub[439:400]<=mem_sub[399:360];
				mem_sub[479:440]<=mem_sub[439:400];
				mem_sub[519:480]<=mem_sub[479:440];
				mem_sub[559:520]<=mem_sub[519:480];
				mem_sub[599:560]<=mem_sub[559:520];
				mem_sub[639:600]<=mem_sub[599:560];
				mem_sub[679:640]<=mem_sub[639:600];
				mem_sub[719:680]<=mem_sub[679:640];
				mem_sub[759:720]<=mem_sub[719:680];
				mem_sub[799:760]<=mem_sub[759:720];
				
			    score_add <= score_add + 1'b1;    end
			else
			 begin
				mem_sub[39:0]<=mem_sub[39:0];
				mem_sub[79:40]<=mem_sub[79:40];
				mem_sub[119:80]<=mem_sub[119:80];
				mem_sub[159:120]<=mem_sub[159:120];
				mem_sub[199:160]<=mem_sub[199:160];
				mem_sub[239:200]<=mem_sub[239:200];
				mem_sub[279:240]<=mem_sub[279:240];
				mem_sub[319:280]<=mem_sub[319:280];
				mem_sub[359:320]<=mem_sub[359:320];
				mem_sub[399:360]<=mem_sub[399:360];
				mem_sub[439:400]<=mem_sub[439:400];
				mem_sub[479:440]<=mem_sub[479:440];
				mem_sub[519:480]<=mem_sub[519:480];
				mem_sub[559:520]<=mem_sub[559:520];
				mem_sub[599:560]<=mem_sub[599:560];
				mem_sub[639:600]<=mem_sub[639:600];
				mem_sub[679:640]<=mem_sub[679:640];
				mem_sub[719:680]<=mem_sub[719:680];
				mem_sub[759:720]<=mem_sub[759:720];
				mem_sub[799:760]<=mem_sub[799:760];
			    score_add <= score_add;    end
		 end
	 end
	
endmodule