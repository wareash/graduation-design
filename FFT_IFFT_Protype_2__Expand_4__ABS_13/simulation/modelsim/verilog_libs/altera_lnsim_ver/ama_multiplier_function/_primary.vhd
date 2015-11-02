library verilog;
use verilog.vl_types.all;
entity ama_multiplier_function is
    generic(
        width_data_in_a : integer := 1;
        width_data_in_b : integer := 1;
        width_data_out  : integer := 1;
        number_of_multipliers: integer := 1;
        multiplier_input_representation_a: string  := "UNSIGNED";
        multiplier_input_representation_b: string  := "UNSIGNED";
        multiplier_register0: string  := "UNREGISTERED";
        multiplier_register1: string  := "UNREGISTERED";
        multiplier_register2: string  := "UNREGISTERED";
        multiplier_register3: string  := "UNREGISTERED";
        multiplier_aclr0: string  := "UNUSED";
        multiplier_aclr1: string  := "UNUSED";
        multiplier_aclr2: string  := "UNUSED";
        multiplier_aclr3: string  := "UNUSED"
    );
    port(
        clock           : in     vl_logic_vector(3 downto 0);
        aclr            : in     vl_logic_vector(3 downto 0);
        ena             : in     vl_logic_vector(3 downto 0);
        data_in_a0      : in     vl_logic_vector;
        data_in_a1      : in     vl_logic_vector;
        data_in_a2      : in     vl_logic_vector;
        data_in_a3      : in     vl_logic_vector;
        data_in_b0      : in     vl_logic_vector;
        data_in_b1      : in     vl_logic_vector;
        data_in_b2      : in     vl_logic_vector;
        data_in_b3      : in     vl_logic_vector;
        data_out_0      : out    vl_logic_vector;
        data_out_1      : out    vl_logic_vector;
        data_out_2      : out    vl_logic_vector;
        data_out_3      : out    vl_logic_vector
    );
end ama_multiplier_function;
