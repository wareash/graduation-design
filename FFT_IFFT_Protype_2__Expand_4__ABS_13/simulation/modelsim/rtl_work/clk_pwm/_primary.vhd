library verilog;
use verilog.vl_types.all;
entity clk_pwm is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_pwm_out     : out    vl_logic
    );
end clk_pwm;
