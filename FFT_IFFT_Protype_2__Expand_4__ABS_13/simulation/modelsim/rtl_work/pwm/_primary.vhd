library verilog;
use verilog.vl_types.all;
entity pwm is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        pwm_data        : in     vl_logic_vector(7 downto 0);
        led_out         : out    vl_logic
    );
end pwm;
