module clk_gen_sample_rate(
			clk,rst_n,
			clk_samp_rat
			
			);
input clk;
input rst_n;
output clk_samp_rat;

reg clk_samp_rat;

wire clk;
wire rst_n;

reg[12:0] cnt;					
always@(posedge clk or negedge rst_n)
if(!rst_n)
	begin
		cnt<=13'd0;
		clk_samp_rat<=1'b0;
	end
else if(cnt==13'd2500) 
	begin 
		cnt<=13'd0;
		clk_samp_rat<=~clk_samp_rat;
	end
else 
	cnt<=cnt+1'b1;
	

endmodule
