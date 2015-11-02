library verilog;
use verilog.vl_types.all;
entity ama_systolic_adder_function is
    generic(
        width_data_in   : integer := 1;
        width_chainin   : integer := 1;
        width_data_out  : integer := 1;
        number_of_adder_input: integer := 1;
        systolic_delay1 : string  := "UNREGISTERED";
        systolic_aclr1  : string  := "UNUSED";
        systolic_delay3 : string  := "UNREGISTERED";
        systolic_aclr3  : string  := "UNUSED";
        adder1_direction: string  := "UNUSED";
        adder3_direction: string  := "UNUSED";
        port_addnsub1   : string  := "PORT_CONNECTIVITY";
        addnsub_multiplier_register1: string  := "CLOCK0";
        addnsub_multiplier_aclr1: string  := "ACLR3";
        port_addnsub3   : string  := "PORT_CONNECTIVITY";
        addnsub_multiplier_register3: string  := "CLOCK0";
        addnsub_multiplier_aclr3: string  := "ACLR3"
    );
    port(
        data_in_0       : in     vl_logic_vector;
        data_in_1       : in     vl_logic_vector;
        data_in_2       : in     vl_logic_vector;
        data_in_3       : in     vl_logic_vector;
        chainin         : in     vl_logic_vector;
        clock           : in     vl_logic_vector(3 downto 0);
        aclr            : in     vl_logic_vector(3 downto 0);
        ena             : in     vl_logic_vector(3 downto 0);
        data_out        : out    vl_logic_vector;
        addnsub1        : in     vl_logic;
        addnsub3        : in     vl_logic
    );
end ama_systolic_adder_function;
