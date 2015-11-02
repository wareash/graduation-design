-- filter_50_1_4_GN_filter_50_1_4_Subsystem.vhd

-- Generated using ACDS version 11.1 173 at 2014.05.16.13:43:04

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity filter_50_1_4_GN_filter_50_1_4_Subsystem is
	port (
		In15  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In15.wire
		In7   : in  std_logic_vector(7 downto 0)  := (others => '0'); --   In7.wire
		In16  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In16.wire
		In5   : in  std_logic_vector(7 downto 0)  := (others => '0'); --   In5.wire
		In4   : in  std_logic_vector(7 downto 0)  := (others => '0'); --   In4.wire
		In13  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In13.wire
		Clock : in  std_logic                     := '0';             -- Clock.clk
		aclr  : in  std_logic                     := '0';             --      .reset
		In2   : in  std_logic_vector(7 downto 0)  := (others => '0'); --   In2.wire
		In11  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In11.wire
		In14  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In14.wire
		In17  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In17.wire
		In12  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In12.wire
		In1   : in  std_logic_vector(7 downto 0)  := (others => '0'); --   In1.wire
		In9   : in  std_logic_vector(7 downto 0)  := (others => '0'); --   In9.wire
		In20  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In20.wire
		In3   : in  std_logic_vector(7 downto 0)  := (others => '0'); --   In3.wire
		In18  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In18.wire
		In8   : in  std_logic_vector(7 downto 0)  := (others => '0'); --   In8.wire
		In10  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In10.wire
		In6   : in  std_logic_vector(7 downto 0)  := (others => '0'); --   In6.wire
		In19  : in  std_logic_vector(7 downto 0)  := (others => '0'); --  In19.wire
		Out1  : out std_logic_vector(36 downto 0)                     --  Out1.wire
	);
end entity filter_50_1_4_GN_filter_50_1_4_Subsystem;

architecture rtl of filter_50_1_4_GN_filter_50_1_4_Subsystem is
	component alt_dspbuilder_clock_GNQFU4PUDH is
		port (
			aclr      : in  std_logic := 'X'; -- reset
			aclr_n    : in  std_logic := 'X'; -- reset_n
			aclr_out  : out std_logic;        -- reset
			clock     : in  std_logic := 'X'; -- clk
			clock_out : out std_logic         -- clk
		);
	end component alt_dspbuilder_clock_GNQFU4PUDH;

	component alt_dspbuilder_port_GNA5S4SQDN is
		port (
			input  : in  std_logic_vector(7 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(7 downto 0)                     -- wire
		);
	end component alt_dspbuilder_port_GNA5S4SQDN;

	component alt_dspbuilder_port_GNHZMN3TC3 is
		port (
			input  : in  std_logic_vector(36 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(36 downto 0)                     -- wire
		);
	end component alt_dspbuilder_port_GNHZMN3TC3;

	component alt_dspbuilder_multiply_add_GNEK5HTIJV is
		generic (
			use_dedicated_circuitry : integer := 0;
			pipeline_register       : string  := "NoRegister";
			direction               : string  := "AddAdd";
			representation          : string  := "SIGNED";
			dataWidth               : integer := 8;
			number_multipliers      : integer := 2;
			use_b_consts            : natural := 0;
			data1b_const            : string  := "00000000";
			data2b_const            : string  := "00000000";
			data3b_const            : string  := "00000000";
			data4b_const            : string  := "00000000";
			family                  : string  := "Stratix"
		);
		port (
			clock     : in  std_logic                     := 'X';             -- clk
			aclr      : in  std_logic                     := 'X';             -- reset
			data1a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data2a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data3a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data4a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			result    : out std_logic_vector(33 downto 0);                    -- wire
			user_aclr : in  std_logic                     := 'X';             -- wire
			ena       : in  std_logic                     := 'X'              -- wire
		);
	end component alt_dspbuilder_multiply_add_GNEK5HTIJV;

	component alt_dspbuilder_gnd_GN is
		port (
			output : out std_logic   -- wire
		);
	end component alt_dspbuilder_gnd_GN;

	component alt_dspbuilder_vcc_GN is
		port (
			output : out std_logic   -- wire
		);
	end component alt_dspbuilder_vcc_GN;

	component alt_dspbuilder_multiply_add_GNCEWIYG43 is
		generic (
			use_dedicated_circuitry : integer := 0;
			pipeline_register       : string  := "NoRegister";
			direction               : string  := "AddAdd";
			representation          : string  := "SIGNED";
			dataWidth               : integer := 8;
			number_multipliers      : integer := 2;
			use_b_consts            : natural := 0;
			data1b_const            : string  := "00000000";
			data2b_const            : string  := "00000000";
			data3b_const            : string  := "00000000";
			data4b_const            : string  := "00000000";
			family                  : string  := "Stratix"
		);
		port (
			clock     : in  std_logic                     := 'X';             -- clk
			aclr      : in  std_logic                     := 'X';             -- reset
			data1a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data2a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data3a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data4a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			result    : out std_logic_vector(33 downto 0);                    -- wire
			user_aclr : in  std_logic                     := 'X';             -- wire
			ena       : in  std_logic                     := 'X'              -- wire
		);
	end component alt_dspbuilder_multiply_add_GNCEWIYG43;

	component alt_dspbuilder_multiply_add_GNQU5CJA2Z is
		generic (
			use_dedicated_circuitry : integer := 0;
			pipeline_register       : string  := "NoRegister";
			direction               : string  := "AddAdd";
			representation          : string  := "SIGNED";
			dataWidth               : integer := 8;
			number_multipliers      : integer := 2;
			use_b_consts            : natural := 0;
			data1b_const            : string  := "00000000";
			data2b_const            : string  := "00000000";
			data3b_const            : string  := "00000000";
			data4b_const            : string  := "00000000";
			family                  : string  := "Stratix"
		);
		port (
			clock     : in  std_logic                     := 'X';             -- clk
			aclr      : in  std_logic                     := 'X';             -- reset
			data1a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data2a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data3a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data4a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			result    : out std_logic_vector(33 downto 0);                    -- wire
			user_aclr : in  std_logic                     := 'X';             -- wire
			ena       : in  std_logic                     := 'X'              -- wire
		);
	end component alt_dspbuilder_multiply_add_GNQU5CJA2Z;

	component alt_dspbuilder_multiply_add_GNQLBNWQEF is
		generic (
			use_dedicated_circuitry : integer := 0;
			pipeline_register       : string  := "NoRegister";
			direction               : string  := "AddAdd";
			representation          : string  := "SIGNED";
			dataWidth               : integer := 8;
			number_multipliers      : integer := 2;
			use_b_consts            : natural := 0;
			data1b_const            : string  := "00000000";
			data2b_const            : string  := "00000000";
			data3b_const            : string  := "00000000";
			data4b_const            : string  := "00000000";
			family                  : string  := "Stratix"
		);
		port (
			clock     : in  std_logic                     := 'X';             -- clk
			aclr      : in  std_logic                     := 'X';             -- reset
			data1a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data2a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data3a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data4a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			result    : out std_logic_vector(33 downto 0);                    -- wire
			user_aclr : in  std_logic                     := 'X';             -- wire
			ena       : in  std_logic                     := 'X'              -- wire
		);
	end component alt_dspbuilder_multiply_add_GNQLBNWQEF;

	component alt_dspbuilder_multiply_add_GNKCGS47P2 is
		generic (
			use_dedicated_circuitry : integer := 0;
			pipeline_register       : string  := "NoRegister";
			direction               : string  := "AddAdd";
			representation          : string  := "SIGNED";
			dataWidth               : integer := 8;
			number_multipliers      : integer := 2;
			use_b_consts            : natural := 0;
			data1b_const            : string  := "00000000";
			data2b_const            : string  := "00000000";
			data3b_const            : string  := "00000000";
			data4b_const            : string  := "00000000";
			family                  : string  := "Stratix"
		);
		port (
			clock     : in  std_logic                     := 'X';             -- clk
			aclr      : in  std_logic                     := 'X';             -- reset
			data1a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data2a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data3a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			data4a    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- wire
			result    : out std_logic_vector(33 downto 0);                    -- wire
			user_aclr : in  std_logic                     := 'X';             -- wire
			ena       : in  std_logic                     := 'X'              -- wire
		);
	end component alt_dspbuilder_multiply_add_GNKCGS47P2;

	component alt_dspbuilder_parallel_adder_GNL6TIQJ2F is
		generic (
			pipeline      : natural  := 0;
			MaskValue     : string   := "1";
			direction     : string   := "+";
			dataWidth     : positive := 8;
			number_inputs : positive := 2
		);
		port (
			clock     : in  std_logic                     := 'X';             -- clk
			aclr      : in  std_logic                     := 'X';             -- reset
			result    : out std_logic_vector(36 downto 0);                    -- wire
			user_aclr : in  std_logic                     := 'X';             -- wire
			ena       : in  std_logic                     := 'X';             -- wire
			data0     : in  std_logic_vector(33 downto 0) := (others => 'X'); -- wire
			data1     : in  std_logic_vector(33 downto 0) := (others => 'X'); -- wire
			data2     : in  std_logic_vector(33 downto 0) := (others => 'X'); -- wire
			data3     : in  std_logic_vector(33 downto 0) := (others => 'X'); -- wire
			data4     : in  std_logic_vector(33 downto 0) := (others => 'X')  -- wire
		);
	end component alt_dspbuilder_parallel_adder_GNL6TIQJ2F;

	component alt_dspbuilder_cast_GNT75CKW5G is
		generic (
			saturate : natural := 0;
			round    : natural := 0
		);
		port (
			input  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- wire
			output : out std_logic_vector(15 downto 0)                     -- wire
		);
	end component alt_dspbuilder_cast_GNT75CKW5G;

	signal multiply_add2user_aclrgnd_output_wire             : std_logic;                     -- Multiply_Add2user_aclrGND:output -> Multiply_Add2:user_aclr
	signal multiply_add2enavcc_output_wire                   : std_logic;                     -- Multiply_Add2enaVCC:output -> Multiply_Add2:ena
	signal multiply_add3user_aclrgnd_output_wire             : std_logic;                     -- Multiply_Add3user_aclrGND:output -> Multiply_Add3:user_aclr
	signal multiply_add3enavcc_output_wire                   : std_logic;                     -- Multiply_Add3enaVCC:output -> Multiply_Add3:ena
	signal multiply_add4user_aclrgnd_output_wire             : std_logic;                     -- Multiply_Add4user_aclrGND:output -> Multiply_Add4:user_aclr
	signal multiply_add4enavcc_output_wire                   : std_logic;                     -- Multiply_Add4enaVCC:output -> Multiply_Add4:ena
	signal multiply_adduser_aclrgnd_output_wire              : std_logic;                     -- Multiply_Adduser_aclrGND:output -> Multiply_Add:user_aclr
	signal multiply_addenavcc_output_wire                    : std_logic;                     -- Multiply_AddenaVCC:output -> Multiply_Add:ena
	signal multiply_add1user_aclrgnd_output_wire             : std_logic;                     -- Multiply_Add1user_aclrGND:output -> Multiply_Add1:user_aclr
	signal multiply_add1enavcc_output_wire                   : std_logic;                     -- Multiply_Add1enaVCC:output -> Multiply_Add1:ena
	signal parallel_adder_subtractoruser_aclrgnd_output_wire : std_logic;                     -- Parallel_Adder_Subtractoruser_aclrGND:output -> Parallel_Adder_Subtractor:user_aclr
	signal parallel_adder_subtractorenavcc_output_wire       : std_logic;                     -- Parallel_Adder_SubtractorenaVCC:output -> Parallel_Adder_Subtractor:ena
	signal multiply_add_result_wire                          : std_logic_vector(33 downto 0); -- Multiply_Add:result -> Parallel_Adder_Subtractor:data0
	signal multiply_add1_result_wire                         : std_logic_vector(33 downto 0); -- Multiply_Add1:result -> Parallel_Adder_Subtractor:data1
	signal multiply_add2_result_wire                         : std_logic_vector(33 downto 0); -- Multiply_Add2:result -> Parallel_Adder_Subtractor:data2
	signal multiply_add3_result_wire                         : std_logic_vector(33 downto 0); -- Multiply_Add3:result -> Parallel_Adder_Subtractor:data3
	signal multiply_add4_result_wire                         : std_logic_vector(33 downto 0); -- Multiply_Add4:result -> Parallel_Adder_Subtractor:data4
	signal parallel_adder_subtractor_result_wire             : std_logic_vector(36 downto 0); -- Parallel_Adder_Subtractor:result -> Out1_0:input
	signal in1_0_output_wire                                 : std_logic_vector(7 downto 0);  -- In1_0:output -> cast0:input
	signal cast0_output_wire                                 : std_logic_vector(15 downto 0); -- cast0:output -> Multiply_Add:data1a
	signal in2_0_output_wire                                 : std_logic_vector(7 downto 0);  -- In2_0:output -> cast1:input
	signal cast1_output_wire                                 : std_logic_vector(15 downto 0); -- cast1:output -> Multiply_Add:data2a
	signal in3_0_output_wire                                 : std_logic_vector(7 downto 0);  -- In3_0:output -> cast2:input
	signal cast2_output_wire                                 : std_logic_vector(15 downto 0); -- cast2:output -> Multiply_Add:data3a
	signal in4_0_output_wire                                 : std_logic_vector(7 downto 0);  -- In4_0:output -> cast3:input
	signal cast3_output_wire                                 : std_logic_vector(15 downto 0); -- cast3:output -> Multiply_Add:data4a
	signal in5_0_output_wire                                 : std_logic_vector(7 downto 0);  -- In5_0:output -> cast4:input
	signal cast4_output_wire                                 : std_logic_vector(15 downto 0); -- cast4:output -> Multiply_Add1:data1a
	signal in6_0_output_wire                                 : std_logic_vector(7 downto 0);  -- In6_0:output -> cast5:input
	signal cast5_output_wire                                 : std_logic_vector(15 downto 0); -- cast5:output -> Multiply_Add1:data2a
	signal in7_0_output_wire                                 : std_logic_vector(7 downto 0);  -- In7_0:output -> cast6:input
	signal cast6_output_wire                                 : std_logic_vector(15 downto 0); -- cast6:output -> Multiply_Add1:data3a
	signal in8_0_output_wire                                 : std_logic_vector(7 downto 0);  -- In8_0:output -> cast7:input
	signal cast7_output_wire                                 : std_logic_vector(15 downto 0); -- cast7:output -> Multiply_Add1:data4a
	signal in9_0_output_wire                                 : std_logic_vector(7 downto 0);  -- In9_0:output -> cast8:input
	signal cast8_output_wire                                 : std_logic_vector(15 downto 0); -- cast8:output -> Multiply_Add2:data1a
	signal in10_0_output_wire                                : std_logic_vector(7 downto 0);  -- In10_0:output -> cast9:input
	signal cast9_output_wire                                 : std_logic_vector(15 downto 0); -- cast9:output -> Multiply_Add2:data2a
	signal in11_0_output_wire                                : std_logic_vector(7 downto 0);  -- In11_0:output -> cast10:input
	signal cast10_output_wire                                : std_logic_vector(15 downto 0); -- cast10:output -> Multiply_Add2:data3a
	signal in12_0_output_wire                                : std_logic_vector(7 downto 0);  -- In12_0:output -> cast11:input
	signal cast11_output_wire                                : std_logic_vector(15 downto 0); -- cast11:output -> Multiply_Add2:data4a
	signal in13_0_output_wire                                : std_logic_vector(7 downto 0);  -- In13_0:output -> cast12:input
	signal cast12_output_wire                                : std_logic_vector(15 downto 0); -- cast12:output -> Multiply_Add3:data1a
	signal in14_0_output_wire                                : std_logic_vector(7 downto 0);  -- In14_0:output -> cast13:input
	signal cast13_output_wire                                : std_logic_vector(15 downto 0); -- cast13:output -> Multiply_Add3:data2a
	signal in15_0_output_wire                                : std_logic_vector(7 downto 0);  -- In15_0:output -> cast14:input
	signal cast14_output_wire                                : std_logic_vector(15 downto 0); -- cast14:output -> Multiply_Add3:data3a
	signal in16_0_output_wire                                : std_logic_vector(7 downto 0);  -- In16_0:output -> cast15:input
	signal cast15_output_wire                                : std_logic_vector(15 downto 0); -- cast15:output -> Multiply_Add3:data4a
	signal in17_0_output_wire                                : std_logic_vector(7 downto 0);  -- In17_0:output -> cast16:input
	signal cast16_output_wire                                : std_logic_vector(15 downto 0); -- cast16:output -> Multiply_Add4:data1a
	signal in18_0_output_wire                                : std_logic_vector(7 downto 0);  -- In18_0:output -> cast17:input
	signal cast17_output_wire                                : std_logic_vector(15 downto 0); -- cast17:output -> Multiply_Add4:data2a
	signal in19_0_output_wire                                : std_logic_vector(7 downto 0);  -- In19_0:output -> cast18:input
	signal cast18_output_wire                                : std_logic_vector(15 downto 0); -- cast18:output -> Multiply_Add4:data3a
	signal in20_0_output_wire                                : std_logic_vector(7 downto 0);  -- In20_0:output -> cast19:input
	signal cast19_output_wire                                : std_logic_vector(15 downto 0); -- cast19:output -> Multiply_Add4:data4a
	signal clock_0_clock_output_reset                        : std_logic;                     -- Clock_0:aclr_out -> [Multiply_Add1:aclr, Multiply_Add2:aclr, Multiply_Add3:aclr, Multiply_Add4:aclr, Multiply_Add:aclr, Parallel_Adder_Subtractor:aclr]
	signal clock_0_clock_output_clk                          : std_logic;                     -- Clock_0:clock_out -> [Multiply_Add1:clock, Multiply_Add2:clock, Multiply_Add3:clock, Multiply_Add4:clock, Multiply_Add:clock, Parallel_Adder_Subtractor:clock]

begin

	clock_0 : component alt_dspbuilder_clock_GNQFU4PUDH
		port map (
			clock_out => clock_0_clock_output_clk,   -- clock_output.clk
			aclr_out  => clock_0_clock_output_reset, --             .reset
			clock     => Clock,                      --        clock.clk
			aclr      => aclr                        --             .reset
		);

	in9_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In9,               --  input.wire
			output => in9_0_output_wire  -- output.wire
		);

	in7_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In7,               --  input.wire
			output => in7_0_output_wire  -- output.wire
		);

	in8_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In8,               --  input.wire
			output => in8_0_output_wire  -- output.wire
		);

	in5_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In5,               --  input.wire
			output => in5_0_output_wire  -- output.wire
		);

	in6_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In6,               --  input.wire
			output => in6_0_output_wire  -- output.wire
		);

	in20_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In20,               --  input.wire
			output => in20_0_output_wire  -- output.wire
		);

	out1_0 : component alt_dspbuilder_port_GNHZMN3TC3
		port map (
			input  => parallel_adder_subtractor_result_wire, --  input.wire
			output => Out1                                   -- output.wire
		);

	in4_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In4,               --  input.wire
			output => in4_0_output_wire  -- output.wire
		);

	in3_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In3,               --  input.wire
			output => in3_0_output_wire  -- output.wire
		);

	in2_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In2,               --  input.wire
			output => in2_0_output_wire  -- output.wire
		);

	in1_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In1,               --  input.wire
			output => in1_0_output_wire  -- output.wire
		);

	multiply_add2 : component alt_dspbuilder_multiply_add_GNEK5HTIJV
		generic map (
			use_dedicated_circuitry => 1,
			pipeline_register       => "InputsMultiplierandAdder",
			direction               => "AddAdd",
			representation          => "SIGNED",
			dataWidth               => 16,
			number_multipliers      => 4,
			use_b_consts            => 1,
			data1b_const            => "0000000001011101",
			data2b_const            => "0000000001100001",
			data3b_const            => "0000000001100001",
			data4b_const            => "0000000001011101",
			family                  => "Cyclone II"
		)
		port map (
			clock     => clock_0_clock_output_clk,              -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,            --           .reset
			data1a    => cast8_output_wire,                     --     data1a.wire
			data2a    => cast9_output_wire,                     --     data2a.wire
			data3a    => cast10_output_wire,                    --     data3a.wire
			data4a    => cast11_output_wire,                    --     data4a.wire
			result    => multiply_add2_result_wire,             --     result.wire
			user_aclr => multiply_add2user_aclrgnd_output_wire, --  user_aclr.wire
			ena       => multiply_add2enavcc_output_wire        --        ena.wire
		);

	multiply_add2user_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => multiply_add2user_aclrgnd_output_wire  -- output.wire
		);

	multiply_add2enavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => multiply_add2enavcc_output_wire  -- output.wire
		);

	multiply_add3 : component alt_dspbuilder_multiply_add_GNCEWIYG43
		generic map (
			use_dedicated_circuitry => 1,
			pipeline_register       => "InputsMultiplierandAdder",
			direction               => "AddAdd",
			representation          => "SIGNED",
			dataWidth               => 16,
			number_multipliers      => 4,
			use_b_consts            => 1,
			data1b_const            => "0000000001010101",
			data2b_const            => "0000000001001011",
			data3b_const            => "0000000000111111",
			data4b_const            => "0000000000110010",
			family                  => "Cyclone II"
		)
		port map (
			clock     => clock_0_clock_output_clk,              -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,            --           .reset
			data1a    => cast12_output_wire,                    --     data1a.wire
			data2a    => cast13_output_wire,                    --     data2a.wire
			data3a    => cast14_output_wire,                    --     data3a.wire
			data4a    => cast15_output_wire,                    --     data4a.wire
			result    => multiply_add3_result_wire,             --     result.wire
			user_aclr => multiply_add3user_aclrgnd_output_wire, --  user_aclr.wire
			ena       => multiply_add3enavcc_output_wire        --        ena.wire
		);

	multiply_add3user_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => multiply_add3user_aclrgnd_output_wire  -- output.wire
		);

	multiply_add3enavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => multiply_add3enavcc_output_wire  -- output.wire
		);

	in19_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In19,               --  input.wire
			output => in19_0_output_wire  -- output.wire
		);

	multiply_add4 : component alt_dspbuilder_multiply_add_GNQU5CJA2Z
		generic map (
			use_dedicated_circuitry => 1,
			pipeline_register       => "InputsMultiplierandAdder",
			direction               => "AddAdd",
			representation          => "SIGNED",
			dataWidth               => 16,
			number_multipliers      => 4,
			use_b_consts            => 1,
			data1b_const            => "0000000000100101",
			data2b_const            => "0000000000011011",
			data3b_const            => "0000000000011000",
			data4b_const            => "1111111111111010",
			family                  => "Cyclone II"
		)
		port map (
			clock     => clock_0_clock_output_clk,              -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,            --           .reset
			data1a    => cast16_output_wire,                    --     data1a.wire
			data2a    => cast17_output_wire,                    --     data2a.wire
			data3a    => cast18_output_wire,                    --     data3a.wire
			data4a    => cast19_output_wire,                    --     data4a.wire
			result    => multiply_add4_result_wire,             --     result.wire
			user_aclr => multiply_add4user_aclrgnd_output_wire, --  user_aclr.wire
			ena       => multiply_add4enavcc_output_wire        --        ena.wire
		);

	multiply_add4user_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => multiply_add4user_aclrgnd_output_wire  -- output.wire
		);

	multiply_add4enavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => multiply_add4enavcc_output_wire  -- output.wire
		);

	in18_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In18,               --  input.wire
			output => in18_0_output_wire  -- output.wire
		);

	in17_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In17,               --  input.wire
			output => in17_0_output_wire  -- output.wire
		);

	in16_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In16,               --  input.wire
			output => in16_0_output_wire  -- output.wire
		);

	in15_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In15,               --  input.wire
			output => in15_0_output_wire  -- output.wire
		);

	in14_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In14,               --  input.wire
			output => in14_0_output_wire  -- output.wire
		);

	multiply_add : component alt_dspbuilder_multiply_add_GNQLBNWQEF
		generic map (
			use_dedicated_circuitry => 1,
			pipeline_register       => "InputsMultiplierandAdder",
			direction               => "AddAdd",
			representation          => "SIGNED",
			dataWidth               => 16,
			number_multipliers      => 4,
			use_b_consts            => 1,
			data1b_const            => "1111111111111010",
			data2b_const            => "0000000000011000",
			data3b_const            => "0000000000011011",
			data4b_const            => "0000000000010111",
			family                  => "Cyclone II"
		)
		port map (
			clock     => clock_0_clock_output_clk,             -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,           --           .reset
			data1a    => cast0_output_wire,                    --     data1a.wire
			data2a    => cast1_output_wire,                    --     data2a.wire
			data3a    => cast2_output_wire,                    --     data3a.wire
			data4a    => cast3_output_wire,                    --     data4a.wire
			result    => multiply_add_result_wire,             --     result.wire
			user_aclr => multiply_adduser_aclrgnd_output_wire, --  user_aclr.wire
			ena       => multiply_addenavcc_output_wire        --        ena.wire
		);

	multiply_adduser_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => multiply_adduser_aclrgnd_output_wire  -- output.wire
		);

	multiply_addenavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => multiply_addenavcc_output_wire  -- output.wire
		);

	multiply_add1 : component alt_dspbuilder_multiply_add_GNKCGS47P2
		generic map (
			use_dedicated_circuitry => 1,
			pipeline_register       => "InputsMultiplierandAdder",
			direction               => "AddAdd",
			representation          => "SIGNED",
			dataWidth               => 16,
			number_multipliers      => 4,
			use_b_consts            => 1,
			data1b_const            => "0000000000110010",
			data2b_const            => "0000000000111111",
			data3b_const            => "0000000001001011",
			data4b_const            => "0000000001010101",
			family                  => "Cyclone II"
		)
		port map (
			clock     => clock_0_clock_output_clk,              -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,            --           .reset
			data1a    => cast4_output_wire,                     --     data1a.wire
			data2a    => cast5_output_wire,                     --     data2a.wire
			data3a    => cast6_output_wire,                     --     data3a.wire
			data4a    => cast7_output_wire,                     --     data4a.wire
			result    => multiply_add1_result_wire,             --     result.wire
			user_aclr => multiply_add1user_aclrgnd_output_wire, --  user_aclr.wire
			ena       => multiply_add1enavcc_output_wire        --        ena.wire
		);

	multiply_add1user_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => multiply_add1user_aclrgnd_output_wire  -- output.wire
		);

	multiply_add1enavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => multiply_add1enavcc_output_wire  -- output.wire
		);

	in13_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In13,               --  input.wire
			output => in13_0_output_wire  -- output.wire
		);

	in12_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In12,               --  input.wire
			output => in12_0_output_wire  -- output.wire
		);

	in11_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In11,               --  input.wire
			output => in11_0_output_wire  -- output.wire
		);

	in10_0 : component alt_dspbuilder_port_GNA5S4SQDN
		port map (
			input  => In10,               --  input.wire
			output => in10_0_output_wire  -- output.wire
		);

	parallel_adder_subtractor : component alt_dspbuilder_parallel_adder_GNL6TIQJ2F
		generic map (
			pipeline      => 1,
			MaskValue     => "1",
			direction     => "+",
			dataWidth     => 34,
			number_inputs => 5
		)
		port map (
			clock     => clock_0_clock_output_clk,                          -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,                        --           .reset
			result    => parallel_adder_subtractor_result_wire,             --     result.wire
			user_aclr => parallel_adder_subtractoruser_aclrgnd_output_wire, --  user_aclr.wire
			ena       => parallel_adder_subtractorenavcc_output_wire,       --        ena.wire
			data0     => multiply_add_result_wire,                          --      data0.wire
			data1     => multiply_add1_result_wire,                         --      data1.wire
			data2     => multiply_add2_result_wire,                         --      data2.wire
			data3     => multiply_add3_result_wire,                         --      data3.wire
			data4     => multiply_add4_result_wire                          --      data4.wire
		);

	parallel_adder_subtractoruser_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => parallel_adder_subtractoruser_aclrgnd_output_wire  -- output.wire
		);

	parallel_adder_subtractorenavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => parallel_adder_subtractorenavcc_output_wire  -- output.wire
		);

	cast0 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in1_0_output_wire, --  input.wire
			output => cast0_output_wire  -- output.wire
		);

	cast1 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in2_0_output_wire, --  input.wire
			output => cast1_output_wire  -- output.wire
		);

	cast2 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in3_0_output_wire, --  input.wire
			output => cast2_output_wire  -- output.wire
		);

	cast3 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in4_0_output_wire, --  input.wire
			output => cast3_output_wire  -- output.wire
		);

	cast4 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in5_0_output_wire, --  input.wire
			output => cast4_output_wire  -- output.wire
		);

	cast5 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in6_0_output_wire, --  input.wire
			output => cast5_output_wire  -- output.wire
		);

	cast6 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in7_0_output_wire, --  input.wire
			output => cast6_output_wire  -- output.wire
		);

	cast7 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in8_0_output_wire, --  input.wire
			output => cast7_output_wire  -- output.wire
		);

	cast8 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in9_0_output_wire, --  input.wire
			output => cast8_output_wire  -- output.wire
		);

	cast9 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in10_0_output_wire, --  input.wire
			output => cast9_output_wire   -- output.wire
		);

	cast10 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in11_0_output_wire, --  input.wire
			output => cast10_output_wire  -- output.wire
		);

	cast11 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in12_0_output_wire, --  input.wire
			output => cast11_output_wire  -- output.wire
		);

	cast12 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in13_0_output_wire, --  input.wire
			output => cast12_output_wire  -- output.wire
		);

	cast13 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in14_0_output_wire, --  input.wire
			output => cast13_output_wire  -- output.wire
		);

	cast14 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in15_0_output_wire, --  input.wire
			output => cast14_output_wire  -- output.wire
		);

	cast15 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in16_0_output_wire, --  input.wire
			output => cast15_output_wire  -- output.wire
		);

	cast16 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in17_0_output_wire, --  input.wire
			output => cast16_output_wire  -- output.wire
		);

	cast17 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in18_0_output_wire, --  input.wire
			output => cast17_output_wire  -- output.wire
		);

	cast18 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in19_0_output_wire, --  input.wire
			output => cast18_output_wire  -- output.wire
		);

	cast19 : component alt_dspbuilder_cast_GNT75CKW5G
		generic map (
			saturate => 0,
			round    => 0
		)
		port map (
			input  => in20_0_output_wire, --  input.wire
			output => cast19_output_wire  -- output.wire
		);

end architecture rtl; -- of filter_50_1_4_GN_filter_50_1_4_Subsystem