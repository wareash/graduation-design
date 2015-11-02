library verilog;
use verilog.vl_types.all;
entity test_point is
    port(
        clk             : in     vl_logic;
        point_out       : out    vl_logic
    );
end test_point;
