module ADC_CLK_GEN(
					clk,
					ADC_CLK_out
				);
					
input clk;
output ADC_CLK_out;

wire clk;
reg point_out;

reg[7:0] cnt;					
always@(posedge clk )
if(cnt==8'd25) 
	begin 
		cnt<=8'd0;
		point_out<=~point_out;
	end
else 
	cnt<=cnt+1'b1;
	

endmodule