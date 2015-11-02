library verilog;
use verilog.vl_types.all;
entity FFT_DATA_RAM is
    port(
        data            : in     vl_logic_vector(7 downto 0);
        inclock         : in     vl_logic;
        outclock        : in     vl_logic;
        rdaddress       : in     vl_logic_vector(9 downto 0);
        wraddress       : in     vl_logic_vector(9 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end FFT_DATA_RAM;
