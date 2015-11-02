module test_point(
					clk,
					point_out
				);
					
input clk;
output point_out;

wire clk;
reg point_out;

reg[3:0] cnt;					
always@(posedge clk )
if(cnt==4'd7) 
	begin 
		cnt<=4'd0;
		point_out<=~point_out;
	end
else 
	cnt<=cnt+1'b1;
	

endmodule
	