 module fft_conv_pwm
						(
						clk,rst_n,fliter_sel,
						write_ram_add,write_ram_data,
						ledr17,ledr16,ledr15,ledr14,ledr13,ledr12,ledr11,ledr10,ledr9,ledr8,ledr7,ledr6,ledr5,ledr4,ledr3,ledr2,ledr1,ledr0
						);
input clk;
input rst_n;
input fliter_sel;

input [9:0]write_ram_add;
input [7:0]write_ram_data;

output ledr17,ledr16,ledr15,ledr14,ledr13,ledr12,ledr11,ledr10,ledr9,ledr8,ledr7,ledr6,ledr5,ledr4,ledr3,ledr2,ledr1,ledr0;

wire clk;
wire rst_n;
wire [9:0]write_ram_add;
wire [7:0]write_ram_data;

wire ledr17,ledr16,ledr15,ledr14,ledr13,ledr12,ledr11,ledr10,ledr9,ledr8,ledr7,ledr6,ledr5,ledr4,ledr3,ledr2,ledr1,ledr0;

wire clk_read_ram;
wire [9:0]read_ram_add;
wire wren_req;
wire [7:0]read_data;

parameter pwm_date = 8'd0;  //

FFT_DATA_RAM	FFT_DATA_RAM_inst (
	.data ( write_ram_data ),
	.inclock ( clk ),
	.outclock ( clk_read_ram ),
	.rdaddress ( read_ram_add ),
	.wraddress ( write_ram_add ),
	.wren ( wren_req ),
	.q ( read_data )
	);
assign wren_req = 1'b1;
assign clk_read_ram= clk;

reg[9:0] read_cnt;					
always@(posedge clk or negedge rst_n)
if(!rst_n)
	begin
		read_cnt<=9'd0;
	end
else  
		read_cnt<=read_cnt+1'b1;
assign read_ram_add=read_cnt;


reg[7:0] pwm_data;					
always@(posedge clk or negedge rst_n)
if(!rst_n)
	begin
		pwm_data<=8'd0;
	end
else  
		pwm_data<=read_data;


		
reg[7:0]	ledr17_reg,ledr16_reg,ledr15_reg,ledr14_reg,ledr13_reg,ledr12_reg,ledr11_reg,ledr10_reg;
reg[7:0] ledr9_reg,ledr8_reg,ledr7_reg,ledr6_reg,ledr5_reg,ledr4_reg,ledr3_reg,ledr2_reg,ledr1_reg,ledr0_reg;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
				ledr17_reg<=8'd0;ledr16_reg<=8'd0;ledr15_reg<=8'd0;ledr14_reg<=8'd0;ledr13_reg<=8'd0;ledr12_reg<=8'd0;
				ledr11_reg<=8'd0;ledr10_reg<=8'd0;ledr9_reg<=8'd0; ledr8_reg<=8'd0; ledr7_reg<=8'd0; ledr6_reg<=8'd0; 
				ledr5_reg<=8'd0; ledr4_reg<=8'd0; ledr3_reg<=8'd0; ledr2_reg<=8'd0; ledr1_reg<=8'd0; ledr0_reg<=8'd0;
		end
	else if(fliter_sel)
		begin	
			case(read_cnt)
				10'd10 : ledr17_reg <= pwm_data;
				10'd30 : ledr16_reg <= pwm_data;		
				10'd40 : ledr15_reg <= pwm_data;							
				10'd50 : ledr14_reg <= pwm_data;				
				10'd60 : ledr13_reg <= pwm_data;		
				10'd70 : ledr12_reg <= pwm_data;		
				10'd80 : ledr11_reg <= pwm_data;		
				10'd90 : ledr10_reg <= pwm_data;		
				10'd100: ledr9_reg  <= pwm_data;		
				10'd200: ledr8_reg  <= pwm_data;		
				10'd300: ledr7_reg  <= pwm_date;		
				10'd400: ledr6_reg  <= pwm_data;		
				10'd500: ledr5_reg  <= pwm_date;		
				10'd600: ledr4_reg  <= pwm_data;		
				10'd700: ledr3_reg  <= pwm_date;		
				10'd800: ledr2_reg  <= pwm_date;		
				10'd900: ledr1_reg  <= pwm_date;		
				10'd1023: ledr0_reg  <= pwm_date;
			endcase	
		end
	else
		begin	
			case(read_cnt)
				10'd10 : ledr17_reg <= pwm_data;
				10'd30 : ledr16_reg <= pwm_data;		
				10'd40 : ledr15_reg <= pwm_data;							
				10'd50 : ledr14_reg <= pwm_data;				
				10'd60 : ledr13_reg <= pwm_date;		
				10'd70 : ledr12_reg <= pwm_data;		
				10'd80 : ledr11_reg <= pwm_date;		
				10'd90 : ledr10_reg <= pwm_data;		
				10'd100: ledr9_reg  <= pwm_date;		
				10'd200: ledr8_reg  <= pwm_date;		
				10'd300: ledr7_reg  <= pwm_date;		
				10'd400: ledr6_reg  <= pwm_date;		
				10'd500: ledr5_reg  <= pwm_date;		
				10'd600: ledr4_reg  <= pwm_date;		
				10'd700: ledr3_reg  <= pwm_date;		
				10'd800: ledr2_reg  <= pwm_date;		
				10'd900: ledr1_reg  <= pwm_date;		
				10'd1023: ledr0_reg  <= pwm_date;
			endcase	
		end
end


 pwm  led17(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr17_reg),
				.led_out(ledr17)
				);

 pwm  led16(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr16_reg),
				.led_out(ledr16)
				);

 pwm  led15(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr15_reg),
				.led_out(ledr15)
				); 

pwm  led14(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr14_reg),
				.led_out(ledr14)
				);			
		

pwm  led13(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr13_reg),
				.led_out(ledr13)
				);			
		
pwm  led12(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr12_reg),
				.led_out(ledr12)
				);			
		
pwm  led11(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr11_reg),
				.led_out(ledr11)
				);			
		
pwm  led10(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr10_reg),
				.led_out(ledr10)
				);			
		
pwm  led9(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr9_reg),
				.led_out(ledr9)
				);			
		
pwm  led8(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr8_reg),
				.led_out(ledr8)
				);			
		
pwm  led7(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr7_reg),
				.led_out(ledr7)
				);			
		
pwm  led6(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr6_reg),
				.led_out(ledr6)
				);			
		
pwm  led5(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr5_reg),
				.led_out(ledr5)
				);			
		
pwm  led4(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr4_reg),
				.led_out(ledr4)
				);			
		
pwm  led3(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr3_reg),
				.led_out(ledr3)
				);			
		
pwm  led2(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr2_reg),
				.led_out(ledr2)
				);			
			
		
pwm  led1(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr1_reg),
				.led_out(ledr1)
				);			
pwm  led0(
				.clk(clk),
				.rst_n(rst_n),
				.pwm_data(ledr0_reg),
				.led_out(ledr0)
				);	


	
endmodule
