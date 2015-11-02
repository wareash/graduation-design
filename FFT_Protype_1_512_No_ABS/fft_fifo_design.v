`timescale 1ns / 1ps
module fft_fifo_design(
							clk,reset_n,
							sink_valid,
							sink_real,sink_imag,
							source_real,source_imag,
						   fft_in_cnt,fft_out_cnt
);

input clk;
input reset_n;

input sink_valid;
input [7:0]sink_real;
input [7:0]sink_imag;

output [7:0]source_real;
output [7:0]source_imag;

output [8:0] fft_in_cnt;
output [8:0] fft_out_cnt;

//fft input pout
wire sink_valid;
wire sink_sop;
wire sink_eop;

//fft output port
wire source_valid;


//FFT数据流输入计数器逻辑  0~511  512个数字循环计数
reg[8:0]fft_in_cnt;
always @ (posedge clk  )
  begin
     if ((reset_n == 1'b0) || (sink_valid==1'b0))
			fft_in_cnt <= 9'd0;
     else
	      fft_in_cnt <= fft_in_cnt+1'b1;
   end



//输出FFT帧的开始产生逻辑 sop
reg sink_sop_r; 
always @ (posedge clk  )
  begin
     if ((reset_n == 1'b0)||(sink_valid==1'b0) )
        sink_sop_r<= 1'b1;
     else if (fft_in_cnt==9'd511)  //1023
           sink_sop_r <= 1'b1;
     else 
           sink_sop_r <= 1'b0;
   end
assign sink_sop = sink_sop_r;

//输出FFT帧的结束产生逻辑  eop
reg sink_eop_r; 
always @ (posedge clk or negedge reset_n)
  begin
     if (reset_n == 1'b0)
		  sink_eop_r<= 1'b0;
     else if (fft_in_cnt==9'd510)  //1022
           sink_eop_r <= 1'b1;
     else
           sink_eop_r <= 1'b0;
   end
assign sink_eop = sink_eop_r;

//FFT数据流输出计数器逻辑  0~511  512个数字循环计数
reg[8:0]fft_out_cnt;
always @ (posedge clk )
  begin
     if ((reset_n == 1'b0)||(source_valid==1'b0))
			fft_out_cnt <= 9'd0;
     else
	      fft_out_cnt <= fft_out_cnt+1'b1;
   end



fft_control  fft_control(

					.clk(clk),
					.reset_n(reset_n),
					
					.sink_real(sink_real),
					.sink_imag(sink_imag),                   //Important III
					.sink_valid(sink_valid),                 //Important III
					.sink_sop(sink_sop),
					.sink_eop(sink_eop),                     //Important II    
					
					.source_real(source_real),
					.source_imag(source_imag),               //Important III
					.source_valid(source_valid),                         //Important III
					.source_sop(),
					.source_eop(),               				  //Important I
					.source_exp(),
					.sink_ready(),
					.source_error()                          //Important 0
					);






endmodule

