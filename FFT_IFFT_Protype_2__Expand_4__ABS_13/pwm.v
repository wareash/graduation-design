module pwm(
				clk,rst_n,
				pwm_data,
				led_out
				);
				
input clk;
input rst_n;
input [7:0]pwm_data;
output led_out;

wire clk;
wire clk_pwm_out;
wire rst_n;
wire[7:0] pwm_data;

reg led_out;
				
//parameter duty = 8'd10;


reg [7:0]cnt_r;
wire[7:0]cnt;
always@(posedge clk_pwm_out or negedge rst_n)
begin
if(!rst_n)
	begin
		cnt_r<=8'd0;
	end
else
		cnt_r<=cnt_r+1'b1;
end

assign cnt=cnt_r;


always@(posedge clk )
begin
if(cnt<=pwm_data)
	begin
		led_out<=1'b1;
	end
else
		led_out<=1'b0;
end



clk_pwm  clk_pwm
			(
				.clk(clk),
				.rst_n(rst_n),
				.clk_pwm_out(clk_pwm_out)
			);
//
//
//always@(posedge clk or negedge rst_n)
//begin	
//	case(j)
//		03: 
//				begin
//					temp_hi=set_hi;
//					temp_lo=set_lo;
//					pwm_state=0;
//					j=0;
//				end	
//		
//	endcase	
//end

endmodule
