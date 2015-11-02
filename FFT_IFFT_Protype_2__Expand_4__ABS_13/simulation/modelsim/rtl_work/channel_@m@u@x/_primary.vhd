library verilog;
use verilog.vl_types.all;
entity channel_MUX is
    port(
        data_in_a       : in     vl_logic_vector(7 downto 0);
        data_in_b       : in     vl_logic_vector(7 downto 0);
        channel_change  : in     vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0)
    );
end channel_MUX;
