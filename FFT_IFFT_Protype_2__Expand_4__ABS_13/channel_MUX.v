module channel_MUX(
						data_in_a,data_in_b,
						channel_change,
						data_out
						);
input [7:0]data_in_a;
input [7:0]data_in_b;
input channel_change;

output [7:0]data_out;

wire [7:0]data_out;

assign data_out=(channel_change)?  (data_in_a): (data_in_b);


endmodule

