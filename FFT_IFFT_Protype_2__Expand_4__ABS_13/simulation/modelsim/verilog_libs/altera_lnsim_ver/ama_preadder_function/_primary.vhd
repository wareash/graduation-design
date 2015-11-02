library verilog;
use verilog.vl_types.all;
entity ama_preadder_function is
    generic(
        preadder_mode   : string  := "SIMPLE";
        width_in_a      : integer := 1;
        width_in_b      : integer := 1;
        width_in_c      : integer := 1;
        width_in_coef   : integer := 1;
        width_result_a  : integer := 1;
        width_result_b  : integer := 1;
        preadder_direction_0: string  := "ADD";
        preadder_direction_1: string  := "ADD";
        preadder_direction_2: string  := "ADD";
        preadder_direction_3: string  := "ADD";
        representation_preadder_adder: string  := "UNSIGNED"
    );
    port(
        dataa_in_0      : in     vl_logic_vector;
        dataa_in_1      : in     vl_logic_vector;
        dataa_in_2      : in     vl_logic_vector;
        dataa_in_3      : in     vl_logic_vector;
        datab_in_0      : in     vl_logic_vector;
        datab_in_1      : in     vl_logic_vector;
        datab_in_2      : in     vl_logic_vector;
        datab_in_3      : in     vl_logic_vector;
        datac_in_0      : in     vl_logic_vector;
        datac_in_1      : in     vl_logic_vector;
        datac_in_2      : in     vl_logic_vector;
        datac_in_3      : in     vl_logic_vector;
        coef0           : in     vl_logic_vector;
        coef1           : in     vl_logic_vector;
        coef2           : in     vl_logic_vector;
        coef3           : in     vl_logic_vector;
        result_a0       : out    vl_logic_vector;
        result_a1       : out    vl_logic_vector;
        result_a2       : out    vl_logic_vector;
        result_a3       : out    vl_logic_vector;
        result_b0       : out    vl_logic_vector;
        result_b1       : out    vl_logic_vector;
        result_b2       : out    vl_logic_vector;
        result_b3       : out    vl_logic_vector
    );
end ama_preadder_function;
