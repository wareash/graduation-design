library verilog;
use verilog.vl_types.all;
entity cycloneii_crcblock is
    generic(
        oscillator_divider: integer := 1;
        lpm_type        : string  := "cycloneii_crcblock"
    );
    port(
        clk             : in     vl_logic;
        shiftnld        : in     vl_logic;
        ldsrc           : in     vl_logic;
        crcerror        : out    vl_logic;
        regout          : out    vl_logic
    );
end cycloneii_crcblock;
