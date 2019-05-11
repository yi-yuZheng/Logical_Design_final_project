module new_tetris_gen(color, x1, x2, x3, x4, y1, y2, y3, y4);

input [2:0] color;//001-111
output reg [9:0] x1,x2,x3,x4,y1,y2,y3,y4;	
	
	always@*
		if(color==3'b001)//深�??
			{x1,y1,x2,y2,x3,y3,x4,y4}=
			{10'd280,10'd40,10'd280,10'd60,10'd300,10'd60,10'd320,10'd60};
		else if(color==3'b010)//淺�??
			{x1,y1,x2,y2,x3,y3,x4,y4}=
			{10'd280,10'd40,10'd300,10'd40,10'd320,10'd40,10'd340,10'd40};
		else if(color==3'b011)//黃色
			{x1,y1,x2,y2,x3,y3,x4,y4}=
			{10'd300,10'd40,10'd320,10'd40,10'd300,10'd60,10'd320,10'd60};
		else if(color==3'b100)//橘色
			{x1,y1,x2,y2,x3,y3,x4,y4}=
			{10'd300,10'd40,10'd320,10'd40,10'd340,10'd40,10'd300,10'd60};
		else if(color==3'b101)//綠色
			{x1,y1,x2,y2,x3,y3,x4,y4}=
			{10'd300,10'd40,10'd320,10'd40,10'd280,10'd60,10'd300,10'd60};
		else if(color==3'b110)//紅色
			{x1,y1,x2,y2,x3,y3,x4,y4}=
			{10'd300,10'd40,10'd320,10'd40,10'd320,10'd60,10'd340,10'd60};
		else if(color==3'b111)//紫色
			{x1,y1,x2,y2,x3,y3,x4,y4}=
			{10'd320,10'd40,10'd300,10'd60,10'd320,10'd60,10'd340,10'd60};
		else 
			{x1,y1,x2,y2,x3,y3,x4,y4}=
			{10'd280,10'd40,10'd300,10'd40,10'd320,10'd40,10'd340,10'd40};
	endmodule		