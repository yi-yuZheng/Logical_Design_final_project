module rotate(clk, rst_n, color, state, x1, x2, x3, x4, y1, y2, y3, y4, 
		x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt);

input clk, rst_n;
input [2:0] color;
input [1:0] state;
input [9:0] x1, x2, x3, x4, y1, y2, y3, y4;
output reg [9:0] x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt;

always@*
	case(color)
		3'b001://深�??
			case(state)
				2'b00 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
					  {x1, x2, x3, x4, y1, y2, y3, y4};
				2'b01 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
					  {x1+10'd59, x2+10'd19, x3, x4-10'd20, y1, y2-10'd19, y3, y4+10'd20};
				2'b10 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
					  {x1-10'd20, x2+10'd20, x3, x4-10'd19, y1+10'd39, y2+10'd19, y3, y4-10'd20};
				2'b11 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
					  {x1-10'd39, x2-10'd20, x3, x4+10'd19, y1+10'd39, y2+10'd20, y3, y4-10'd19};
				default:{x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};	  
			endcase	
		3'b010://淺�??
			case(state)
				2'b00 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
					  {x1, x2, x3, x4, y1, y2, y3, y4};
				2'b01 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
					  {x1+10'd19, x2, x3-10'd20, x4-10'd40, y1+10'd19, y2, y3+10'd20, y4+10'd40};
				2'b10 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
					  {x1-10'd19, x2, x3+10'd20, x4+10'd40, y1+10'd19, y2, y3-10'd20, y4-10'd40};
				2'b11 :  {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
					  {x1+10'd19, x2, x3-10'd20, x4-10'd40, y1+10'd19, y2, y3+10'd20, y4+10'd40};
				default:{x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};	  
			endcase
		
		3'b011://黃色
			case(state)
				2'b00 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};
				2'b01 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};
				2'b10 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};
				2'b11 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};
				default:{x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};	  
			endcase	
		3'b100://橘色
			case(state)
				2'b00 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};
				2'b01 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1-10'd39, x2-10'd20, x3, x4+10'd19, y1, y2-10'd19, y3, y4+10'd20};
				2'b10 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1+10'd39, x2, x3, x4, y1+10'd39, y2+10'd39, y3, y4-10'd39};
				2'b11 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1-10'd39, x2-10'd19, x3, x4+10'd20, y1, y2-10'd20, y3, y4+10'd19};
				default:{x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};	  
			endcase	
		3'b101://綠色
			case(state)
				2'b00 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};
				2'b01 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1+10'd20, x2, x3+10'd19, x4, y1+10'd19, y2+10'd39, y3-10'd19, y4};
				2'b10 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1-10'd20, x2, x3-10'd19, x4, y1-10'd19, y2-10'd20, y3+10'd19, y4};
				2'b11 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1+10'd20, x2, x3+10'd19, x4, y1+10'd19, y2+10'd39, y3-10'd19, y4};
				default:{x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};	  
			endcase	
		3'b110://紅色
			case(state)
				2'b00 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};
				2'b01 :	{x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1+10'd39, x2+10'd20, x3, x4-10'd20, y1-10'd19, y2, y3, y4};
				2'b10 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
					    {x1-10'd39, x2-10'd20, x3, x4+10'd20, y1+10'd19, y2, y3, y4};
				2'b11 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1+10'd39, x2+10'd20, x3, x4-10'd20, y1-10'd19, y2, y3, y4};
				default:{x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};	
			endcase
		3'b111://�?
			case(state)
				2'b00 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};
				2'b01 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1+10'd20, x2+10'd19, x3, x4-10'd20, y1+10'd19, y2-10'd19, y3, y4+10'd20};
				2'b10 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1-10'd20, x2+10'd20, x3, x4-10'd19, y1+10'd20, y2+10'd19, y3, y4-10'd20};
				2'b11 : {x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1-10'd19, x2-10'd20, x3, x4+10'd19, y1-10'd20, y2+10'd20, y3, y4-10'd19};
				default:{x1_nxt, x2_nxt, x3_nxt, x4_nxt, y1_nxt, y2_nxt, y3_nxt, y4_nxt}=
						{x1, x2, x3, x4, y1, y2, y3, y4};	  
			endcase	
	endcase
endmodule	