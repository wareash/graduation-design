module code_change(
						data_in,data_out
						);
						
input [7:0]data_in;

output [7:0]data_out;



assign	data_out={data_in[4:0],3'b0};
					
endmodule
