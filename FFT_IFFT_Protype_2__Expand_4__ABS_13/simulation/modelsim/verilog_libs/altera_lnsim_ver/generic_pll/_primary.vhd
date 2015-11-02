library verilog;
use verilog.vl_types.all;
entity generic_pll is
    generic(
        lpm_type        : string  := "generic_pll";
        duty_cycle      : integer := 50;
        output_clock_frequency: string  := "0 ps";
        phase_shift     : string  := "0 ps";
        reference_clock_frequency: string  := "0 ps";
        sim_additional_refclk_cycles_to_lock: integer := 0;
        fractional_vco_multiplier: string  := "false";
        use_khz         : integer := 1
    );
    port(
        refclk          : in     vl_logic;
        rst             : in     vl_logic;
        fbclk           : in     vl_logic;
        writerefclkdata : in     vl_logic_vector(63 downto 0);
        writeoutclkdata : in     vl_logic_vector(63 downto 0);
        writephaseshiftdata: in     vl_logic_vector(63 downto 0);
        writedutycycledata: in     vl_logic_vector(63 downto 0);
        outclk          : out    vl_logic;
        locked          : out    vl_logic;
        fboutclk        : out    vl_logic;
        readrefclkdata  : out    vl_logic_vector(63 downto 0);
        readoutclkdata  : out    vl_logic_vector(63 downto 0);
        readphaseshiftdata: out    vl_logic_vector(63 downto 0);
        readdutycycledata: out    vl_logic_vector(63 downto 0)
    );
end generic_pll;
