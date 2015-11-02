library verilog;
use verilog.vl_types.all;
entity ama_register_function is
    generic(
        width_data_in   : integer := 1;
        width_data_out  : integer := 1;
        register_clock  : string  := "UNREGISTERED";
        register_aclr   : string  := "UNUSED"
    );
    port(
        clock           : in     vl_logic_vector(3 downto 0);
        aclr            : in     vl_logic_vector(3 downto 0);
        ena             : in     vl_logic_vector(3 downto 0);
        data_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector
    );
end ama_register_function;
