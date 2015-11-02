library verilog;
use verilog.vl_types.all;
entity clk_gen_sample_rate is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_samp_rat    : out    vl_logic
    );
end clk_gen_sample_rate;
