module test_point(
					clk,
					point_out
				);
					
input clk;
output point_out;

wire clk;
reg point_out;

reg[9:0] cnt;					
always@(posedge clk )
if(cnt==10'd125) 
	begin 
		cnt<=10'd0;
		point_out<=~point_out;
	end
else 
	cnt<=cnt+1'b1;
	

endmodule
	