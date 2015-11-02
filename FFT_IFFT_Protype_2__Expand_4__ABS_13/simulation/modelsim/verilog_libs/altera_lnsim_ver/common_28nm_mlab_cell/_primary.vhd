library verilog;
use verilog.vl_types.all;
entity common_28nm_mlab_cell is
    generic(
        logical_ram_name: string  := "lutram";
        logical_ram_depth: integer := 0;
        logical_ram_width: integer := 0;
        first_address   : integer := 0;
        last_address    : integer := 0;
        first_bit_number: integer := 0;
        mixed_port_feed_through_mode: string  := "new";
        init_file       : string  := "NONE";
        data_width      : integer := 20;
        address_width   : integer := 6;
        byte_enable_mask_width: integer := 1;
        byte_size       : integer := 1;
        port_b_data_out_clock: string  := "none";
        port_b_data_out_clear: string  := "none";
        lpm_type        : string  := "common_28nm_mlab_cell";
        lpm_hint        : string  := "true";
        mem_init0       : string  := "";
        MEM_INIT_STRING_LENGTH: integer := 160;
        num_cols        : integer := 1
    );
    port(
        portadatain     : in     vl_logic_vector;
        portaaddr       : in     vl_logic_vector;
        portabyteenamasks: in     vl_logic_vector;
        portbaddr       : in     vl_logic_vector;
        clk0            : in     vl_logic;
        clk1            : in     vl_logic;
        ena0            : in     vl_logic;
        ena1            : in     vl_logic;
        ena2            : in     vl_logic;
        clr             : in     vl_logic;
        devclrn         : in     vl_logic;
        devpor          : in     vl_logic;
        portbdataout    : out    vl_logic_vector
    );
end common_28nm_mlab_cell;
