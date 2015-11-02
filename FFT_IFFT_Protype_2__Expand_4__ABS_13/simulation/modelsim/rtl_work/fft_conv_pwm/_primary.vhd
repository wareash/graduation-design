library verilog;
use verilog.vl_types.all;
entity fft_conv_pwm is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        write_ram_add   : in     vl_logic_vector(9 downto 0);
        write_ram_data  : in     vl_logic_vector(7 downto 0);
        ledr17          : out    vl_logic;
        ledr16          : out    vl_logic;
        ledr15          : out    vl_logic;
        ledr14          : out    vl_logic;
        ledr13          : out    vl_logic;
        ledr12          : out    vl_logic;
        ledr11          : out    vl_logic;
        ledr10          : out    vl_logic;
        ledr9           : out    vl_logic;
        ledr8           : out    vl_logic;
        ledr7           : out    vl_logic;
        ledr6           : out    vl_logic;
        ledr5           : out    vl_logic;
        ledr4           : out    vl_logic;
        ledr3           : out    vl_logic;
        ledr2           : out    vl_logic;
        ledr1           : out    vl_logic;
        ledr0           : out    vl_logic
    );
end fft_conv_pwm;
