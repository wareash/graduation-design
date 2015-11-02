library verilog;
use verilog.vl_types.all;
entity ama_accumulator_function is
    generic(
        width_result    : integer := 1;
        accumulator     : string  := "NO";
        accum_direction : string  := "ADD";
        loadconst_value : integer := 0;
        accum_sload_register: string  := "UNREGISTERED";
        accum_sload_aclr: string  := "NONE";
        double_accum    : string  := "NO";
        output_register : string  := "UNREGISTERED";
        output_aclr     : string  := "NONE"
    );
    port(
        clock           : in     vl_logic_vector(3 downto 0);
        aclr            : in     vl_logic_vector(3 downto 0);
        ena             : in     vl_logic_vector(3 downto 0);
        accum_sload     : in     vl_logic;
        data_result     : in     vl_logic_vector;
        prev_result     : in     vl_logic_vector;
        result          : out    vl_logic_vector
    );
end ama_accumulator_function;
