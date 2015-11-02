library verilog;
use verilog.vl_types.all;
entity ama_signed_extension_function is
    generic(
        representation  : string  := "UNSIGNED";
        width_data_in   : integer := 1
    );
    port(
        data_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector
    );
end ama_signed_extension_function;
