module clk_pwm(
			clk,rst_n,
			clk_pwm_out
			
			);
input clk;
input rst_n;
output clk_pwm_out;

reg clk_pwm_out;

wire clk;
wire rst_n;

reg[12:0] cnt;					
always@(posedge clk or negedge rst_n)
if(!rst_n)
	begin
		cnt<=13'd0;
		clk_pwm_out<=1'b0;
	end
else if(cnt==13'd500) 
	begin 
		cnt<=13'd0;
		clk_pwm_out<=~clk_pwm_out;
	end
else 
	cnt<=cnt+1'b1;
	

endmodule
