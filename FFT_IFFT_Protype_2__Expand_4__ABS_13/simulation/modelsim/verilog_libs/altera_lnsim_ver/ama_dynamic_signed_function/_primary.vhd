library verilog;
use verilog.vl_types.all;
entity ama_dynamic_signed_function is
    generic(
        port_sign       : string  := "PORT_CONNECTIVITY";
        width_data_in   : integer := 1
    );
    port(
        data_in         : in     vl_logic_vector;
        sign            : in     vl_logic;
        data_out        : out    vl_logic_vector
    );
end ama_dynamic_signed_function;
