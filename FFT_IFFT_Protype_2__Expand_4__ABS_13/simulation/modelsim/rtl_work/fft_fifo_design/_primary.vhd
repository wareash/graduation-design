library verilog;
use verilog.vl_types.all;
entity fft_fifo_design is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        sink_valid      : in     vl_logic;
        sink_real       : in     vl_logic_vector(7 downto 0);
        sink_imag       : in     vl_logic_vector(7 downto 0);
        source_real     : out    vl_logic_vector(7 downto 0);
        source_imag     : out    vl_logic_vector(7 downto 0);
        fft_in_cnt      : out    vl_logic_vector(9 downto 0);
        fft_out_cnt     : out    vl_logic_vector(9 downto 0)
    );
end fft_fifo_design;
