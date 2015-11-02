module clk_gen(
			clk,rst_n,
			clk_48K
			
			);
input clk;
input rst_n;
output clk_48K;

reg clk_48K;

wire clk;
wire rst_n;

reg[12:0] cnt;					
always@(posedge clk or negedge rst_n)
if(!rst_n)
	begin
		cnt<=13'd0;
		clk_48K<=1'b0;
	end
else if(cnt==13'd500) 
	begin 
		cnt<=13'd0;
		clk_48K<=~clk_48K;
	end
else 
	cnt<=cnt+1'b1;
	

endmodule
