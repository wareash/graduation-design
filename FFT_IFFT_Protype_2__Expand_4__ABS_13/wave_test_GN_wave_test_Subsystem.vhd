library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity wave_test_GN_wave_test_Subsystem is  
	port(
		In9 : in STD_LOGIC_VECTOR(7 downto 0);
		In19 : in STD_LOGIC_VECTOR(7 downto 0);
		In18 : in STD_LOGIC_VECTOR(7 downto 0);
		In7 : in STD_LOGIC_VECTOR(7 downto 0);
		In17 : in STD_LOGIC_VECTOR(7 downto 0);
		In16 : in STD_LOGIC_VECTOR(7 downto 0);
		In8 : in STD_LOGIC_VECTOR(7 downto 0);
		In5 : in STD_LOGIC_VECTOR(7 downto 0);
		In15 : in STD_LOGIC_VECTOR(7 downto 0);
		In14 : in STD_LOGIC_VECTOR(7 downto 0);
		In6 : in STD_LOGIC_VECTOR(7 downto 0);
		In13 : in STD_LOGIC_VECTOR(7 downto 0);
		In12 : in STD_LOGIC_VECTOR(7 downto 0);
		In20 : in STD_LOGIC_VECTOR(7 downto 0);
		In11 : in STD_LOGIC_VECTOR(7 downto 0);
		Clock : in STD_LOGIC;
		In10 : in STD_LOGIC_VECTOR(7 downto 0);
		Out1 : out STD_LOGIC_VECTOR(36 downto 0);
		In4 : in STD_LOGIC_VECTOR(7 downto 0);
		In3 : in STD_LOGIC_VECTOR(7 downto 0);
		In2 : in STD_LOGIC_VECTOR(7 downto 0);
		In1 : in STD_LOGIC_VECTOR(7 downto 0);
		aclr : in STD_LOGIC); 
end entity;
architecture rtl of wave_test_GN_wave_test_Subsystem is
signal Multiply_Add_result_wire : STD_LOGIC_VECTOR(33 downto 0); -- Multiply_Add:result -> [ Parallel_Adder_Subtractor:data0]
signal Multiply_Add1_result_wire : STD_LOGIC_VECTOR(33 downto 0); -- Multiply_Add1:result -> [ Parallel_Adder_Subtractor:data1]
signal Multiply_Add2_result_wire : STD_LOGIC_VECTOR(33 downto 0); -- Multiply_Add2:result -> [ Parallel_Adder_Subtractor:data2]
signal Multiply_Add3_result_wire : STD_LOGIC_VECTOR(33 downto 0); -- Multiply_Add3:result -> [ Parallel_Adder_Subtractor:data3]
signal Multiply_Add4_result_wire : STD_LOGIC_VECTOR(33 downto 0); -- Multiply_Add4:result -> [ Parallel_Adder_Subtractor:data4]
signal Parallel_Adder_Subtractor_result_wire : STD_LOGIC_VECTOR(36 downto 0); -- Parallel_Adder_Subtractor:result -> [ Out1_0:input]
signal In1_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In1_0:output -> [ cast0:input]
signal cast0_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast0:output -> [ Multiply_Add:data1a]
signal In2_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In2_0:output -> [ cast1:input]
signal cast1_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast1:output -> [ Multiply_Add:data2a]
signal In3_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In3_0:output -> [ cast2:input]
signal cast2_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast2:output -> [ Multiply_Add:data3a]
signal In4_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In4_0:output -> [ cast3:input]
signal cast3_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast3:output -> [ Multiply_Add:data4a]
signal In5_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In5_0:output -> [ cast4:input]
signal cast4_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast4:output -> [ Multiply_Add1:data1a]
signal In6_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In6_0:output -> [ cast5:input]
signal cast5_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast5:output -> [ Multiply_Add1:data2a]
signal In7_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In7_0:output -> [ cast6:input]
signal cast6_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast6:output -> [ Multiply_Add1:data3a]
signal In8_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In8_0:output -> [ cast7:input]
signal cast7_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast7:output -> [ Multiply_Add1:data4a]
signal In9_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In9_0:output -> [ cast8:input]
signal cast8_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast8:output -> [ Multiply_Add2:data1a]
signal In10_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In10_0:output -> [ cast9:input]
signal cast9_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast9:output -> [ Multiply_Add2:data2a]
signal In11_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In11_0:output -> [ cast10:input]
signal cast10_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast10:output -> [ Multiply_Add2:data3a]
signal In12_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In12_0:output -> [ cast11:input]
signal cast11_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast11:output -> [ Multiply_Add2:data4a]
signal In13_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In13_0:output -> [ cast12:input]
signal cast12_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast12:output -> [ Multiply_Add3:data1a]
signal In14_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In14_0:output -> [ cast13:input]
signal cast13_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast13:output -> [ Multiply_Add3:data2a]
signal In15_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In15_0:output -> [ cast14:input]
signal cast14_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast14:output -> [ Multiply_Add3:data3a]
signal In16_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In16_0:output -> [ cast15:input]
signal cast15_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast15:output -> [ Multiply_Add3:data4a]
signal In17_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In17_0:output -> [ cast16:input]
signal cast16_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast16:output -> [ Multiply_Add4:data1a]
signal In18_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In18_0:output -> [ cast17:input]
signal cast17_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast17:output -> [ Multiply_Add4:data2a]
signal In19_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In19_0:output -> [ cast18:input]
signal cast18_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast18:output -> [ Multiply_Add4:data3a]
signal In20_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- In20_0:output -> [ cast19:input]
signal cast19_output_wire : STD_LOGIC_VECTOR(15 downto 0); -- cast19:output -> [ Multiply_Add4:data4a]
signal Clock_0_clock_output_clk : STD_LOGIC; -- Clock_0:clock_out -> [ Multiply_Add2:clock, Multiply_Add3:clock, Multiply_Add4:clock, Multiply_Add:clock, Multiply_Add1:clock, Parallel_Adder_Subtractor:clock]
signal Clock_0_clock_output_reset : STD_LOGIC; -- Clock_0:aclr_out -> [ Multiply_Add2:aclr, Multiply_Add3:aclr, Multiply_Add4:aclr, Multiply_Add:aclr, Multiply_Add1:aclr, Parallel_Adder_Subtractor:aclr]
component alt_dspbuilder_clock_GNU4YM7HGX
	 generic (
			DOMAIN : string := "default";
			RESET : string := "ACTIVE_HIGH"); 
	port(
		clock : in STD_LOGIC;
		clock_out : out STD_LOGIC;
		aclr_out : out STD_LOGIC;
		aclr : in STD_LOGIC); 
end component;
component alt_dspbuilder_port_GNKA4WYH6P
	 generic (
			EXPORT : string := "false";
			PIN : string := "";
			PORTTYPE : string := "Input";
			WIDTH : natural := 8;
			HDLTYPE : string := "STD_LOGIC_VECTOR"); 
	port(
		input : in STD_LOGIC_VECTOR(7 downto 0);
		output : out STD_LOGIC_VECTOR(7 downto 0)); 
end component;
component alt_dspbuilder_port_GNIBSH2SLZ
	 generic (
			EXPORT : string := "false";
			PIN : string := "";
			PORTTYPE : string := "Output";
			WIDTH : natural := 37;
			HDLTYPE : string := "STD_LOGIC_VECTOR"); 
	port(
		input : in STD_LOGIC_VECTOR(36 downto 0);
		output : out STD_LOGIC_VECTOR(36 downto 0)); 
end component;
component alt_dspbuilder_multiply_add_GNEK5HTIJV
	 generic (
			use_dedicated_circuitry : integer := 1;
			pipeline_register : string := "InputsMultiplierandAdder";
			direction : string := "AddAdd";
			representation : string := "SIGNED";
			dataWidth : integer := 16;
			number_multipliers : integer := 4;
			use_b_consts : natural := 1;
			data1b_const : string := "0000000001011101";
			data2b_const : string := "0000000001100001";
			data3b_const : string := "0000000001100001";
			data4b_const : string := "0000000001011101";
			family : string := "Cyclone II"); 
	port(
		user_aclr : in STD_LOGIC;
		result : out STD_LOGIC_VECTOR(33 downto 0);
		data1a : in STD_LOGIC_VECTOR(15 downto 0);
		data4a : in STD_LOGIC_VECTOR(15 downto 0);
		clock : in STD_LOGIC;
		aclr : in STD_LOGIC;
		ena : in STD_LOGIC;
		data3a : in STD_LOGIC_VECTOR(15 downto 0);
		data2a : in STD_LOGIC_VECTOR(15 downto 0)); 
end component;
component alt_dspbuilder_multiply_add_GNCEWIYG43
	 generic (
			use_dedicated_circuitry : integer := 1;
			pipeline_register : string := "InputsMultiplierandAdder";
			direction : string := "AddAdd";
			representation : string := "SIGNED";
			dataWidth : integer := 16;
			number_multipliers : integer := 4;
			use_b_consts : natural := 1;
			data1b_const : string := "0000000001010101";
			data2b_const : string := "0000000001001011";
			data3b_const : string := "0000000000111111";
			data4b_const : string := "0000000000110010";
			family : string := "Cyclone II"); 
	port(
		user_aclr : in STD_LOGIC;
		result : out STD_LOGIC_VECTOR(33 downto 0);
		data1a : in STD_LOGIC_VECTOR(15 downto 0);
		data4a : in STD_LOGIC_VECTOR(15 downto 0);
		clock : in STD_LOGIC;
		aclr : in STD_LOGIC;
		ena : in STD_LOGIC;
		data3a : in STD_LOGIC_VECTOR(15 downto 0);
		data2a : in STD_LOGIC_VECTOR(15 downto 0)); 
end component;
component alt_dspbuilder_multiply_add_GNQU5CJA2Z
	 generic (
			use_dedicated_circuitry : integer := 1;
			pipeline_register : string := "InputsMultiplierandAdder";
			direction : string := "AddAdd";
			representation : string := "SIGNED";
			dataWidth : integer := 16;
			number_multipliers : integer := 4;
			use_b_consts : natural := 1;
			data1b_const : string := "0000000000100101";
			data2b_const : string := "0000000000011011";
			data3b_const : string := "0000000000011000";
			data4b_const : string := "1111111111111010";
			family : string := "Cyclone II"); 
	port(
		user_aclr : in STD_LOGIC;
		result : out STD_LOGIC_VECTOR(33 downto 0);
		data1a : in STD_LOGIC_VECTOR(15 downto 0);
		data4a : in STD_LOGIC_VECTOR(15 downto 0);
		clock : in STD_LOGIC;
		aclr : in STD_LOGIC;
		ena : in STD_LOGIC;
		data3a : in STD_LOGIC_VECTOR(15 downto 0);
		data2a : in STD_LOGIC_VECTOR(15 downto 0)); 
end component;
component alt_dspbuilder_multiply_add_GNQLBNWQEF
	 generic (
			use_dedicated_circuitry : integer := 1;
			pipeline_register : string := "InputsMultiplierandAdder";
			direction : string := "AddAdd";
			representation : string := "SIGNED";
			dataWidth : integer := 16;
			number_multipliers : integer := 4;
			use_b_consts : natural := 1;
			data1b_const : string := "1111111111111010";
			data2b_const : string := "0000000000011000";
			data3b_const : string := "0000000000011011";
			data4b_const : string := "0000000000010111";
			family : string := "Cyclone II"); 
	port(
		user_aclr : in STD_LOGIC;
		result : out STD_LOGIC_VECTOR(33 downto 0);
		data1a : in STD_LOGIC_VECTOR(15 downto 0);
		data4a : in STD_LOGIC_VECTOR(15 downto 0);
		clock : in STD_LOGIC;
		aclr : in STD_LOGIC;
		ena : in STD_LOGIC;
		data3a : in STD_LOGIC_VECTOR(15 downto 0);
		data2a : in STD_LOGIC_VECTOR(15 downto 0)); 
end component;
component alt_dspbuilder_multiply_add_GNKCGS47P2
	 generic (
			use_dedicated_circuitry : integer := 1;
			pipeline_register : string := "InputsMultiplierandAdder";
			direction : string := "AddAdd";
			representation : string := "SIGNED";
			dataWidth : integer := 16;
			number_multipliers : integer := 4;
			use_b_consts : natural := 1;
			data1b_const : string := "0000000000110010";
			data2b_const : string := "0000000000111111";
			data3b_const : string := "0000000001001011";
			data4b_const : string := "0000000001010101";
			family : string := "Cyclone II"); 
	port(
		user_aclr : in STD_LOGIC;
		result : out STD_LOGIC_VECTOR(33 downto 0);
		data1a : in STD_LOGIC_VECTOR(15 downto 0);
		data4a : in STD_LOGIC_VECTOR(15 downto 0);
		clock : in STD_LOGIC;
		aclr : in STD_LOGIC;
		ena : in STD_LOGIC;
		data3a : in STD_LOGIC_VECTOR(15 downto 0);
		data2a : in STD_LOGIC_VECTOR(15 downto 0)); 
end component;
component alt_dspbuilder_parallel_adder_GNL6TIQJ2F
	 generic (
			pipeline : natural := 1;
			MaskValue : string := "1";
			direction : string := "+";
			dataWidth : positive := 34;
			number_inputs : positive := 5); 
	port(
		user_aclr : in STD_LOGIC;
		result : out STD_LOGIC_VECTOR(36 downto 0);
		data0 : in STD_LOGIC_VECTOR(33 downto 0);
		data1 : in STD_LOGIC_VECTOR(33 downto 0);
		clock : in STD_LOGIC;
		data4 : in STD_LOGIC_VECTOR(33 downto 0);
		data2 : in STD_LOGIC_VECTOR(33 downto 0);
		data3 : in STD_LOGIC_VECTOR(33 downto 0);
		aclr : in STD_LOGIC;
		ena : in STD_LOGIC); 
end component;
component alt_dspbuilder_cast_GNH6PSUMCS
	 generic (
			width_inl : natural := 8;
			width_inr : natural := 0;
			width_outl : natural := 16;
			width_outr : natural := 0;
			saturate : natural := 0;
			round : natural := 0;
			inSigned : string := "false";
			outSigned : string := "true";
			inType : string := "STD_LOGIC_VECTOR";
			outType : string := "STD_LOGIC_VECTOR"); 
	port(
		input : in STD_LOGIC_VECTOR(7 downto 0);
		output : out STD_LOGIC_VECTOR(15 downto 0)); 
end component;
Begin
	Clock_0 : 
		component alt_dspbuilder_clock_GNU4YM7HGX
			port map(
				clock => Clock,
				clock_out => Clock_0_clock_output_clk,
				aclr_out => Clock_0_clock_output_reset,
				aclr => aclr);
	In9_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In9,
				output => In9_0_output_wire);
	In7_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In7,
				output => In7_0_output_wire);
	In8_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In8,
				output => In8_0_output_wire);
	In5_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In5,
				output => In5_0_output_wire);
	In6_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In6,
				output => In6_0_output_wire);
	In20_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In20,
				output => In20_0_output_wire);
	Out1_0 : 
		component alt_dspbuilder_port_GNIBSH2SLZ
			port map(
				input => Parallel_Adder_Subtractor_result_wire,
				output => Out1);
	In4_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In4,
				output => In4_0_output_wire);
	In3_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In3,
				output => In3_0_output_wire);
	In2_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In2,
				output => In2_0_output_wire);
	In1_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In1,
				output => In1_0_output_wire);
	Multiply_Add2 : 
		component alt_dspbuilder_multiply_add_GNEK5HTIJV
			port map(
				user_aclr => '0',
				result => Multiply_Add2_result_wire,
				data1a => cast8_output_wire,
				data4a => cast11_output_wire,
				clock => Clock_0_clock_output_clk,
				aclr => Clock_0_clock_output_reset,
				ena => '1',
				data3a => cast10_output_wire,
				data2a => cast9_output_wire);
	Multiply_Add3 : 
		component alt_dspbuilder_multiply_add_GNCEWIYG43
			port map(
				user_aclr => '0',
				result => Multiply_Add3_result_wire,
				data1a => cast12_output_wire,
				data4a => cast15_output_wire,
				clock => Clock_0_clock_output_clk,
				aclr => Clock_0_clock_output_reset,
				ena => '1',
				data3a => cast14_output_wire,
				data2a => cast13_output_wire);
	In19_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In19,
				output => In19_0_output_wire);
	Multiply_Add4 : 
		component alt_dspbuilder_multiply_add_GNQU5CJA2Z
			port map(
				user_aclr => '0',
				result => Multiply_Add4_result_wire,
				data1a => cast16_output_wire,
				data4a => cast19_output_wire,
				clock => Clock_0_clock_output_clk,
				aclr => Clock_0_clock_output_reset,
				ena => '1',
				data3a => cast18_output_wire,
				data2a => cast17_output_wire);
	In18_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In18,
				output => In18_0_output_wire);
	In17_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In17,
				output => In17_0_output_wire);
	In16_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In16,
				output => In16_0_output_wire);
	In15_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In15,
				output => In15_0_output_wire);
	In14_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In14,
				output => In14_0_output_wire);
	Multiply_Add : 
		component alt_dspbuilder_multiply_add_GNQLBNWQEF
			port map(
				user_aclr => '0',
				result => Multiply_Add_result_wire,
				data1a => cast0_output_wire,
				data4a => cast3_output_wire,
				clock => Clock_0_clock_output_clk,
				aclr => Clock_0_clock_output_reset,
				ena => '1',
				data3a => cast2_output_wire,
				data2a => cast1_output_wire);
	Multiply_Add1 : 
		component alt_dspbuilder_multiply_add_GNKCGS47P2
			port map(
				user_aclr => '0',
				result => Multiply_Add1_result_wire,
				data1a => cast4_output_wire,
				data4a => cast7_output_wire,
				clock => Clock_0_clock_output_clk,
				aclr => Clock_0_clock_output_reset,
				ena => '1',
				data3a => cast6_output_wire,
				data2a => cast5_output_wire);
	In13_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In13,
				output => In13_0_output_wire);
	In12_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In12,
				output => In12_0_output_wire);
	In11_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In11,
				output => In11_0_output_wire);
	In10_0 : 
		component alt_dspbuilder_port_GNKA4WYH6P
			port map(
				input => In10,
				output => In10_0_output_wire);
	Parallel_Adder_Subtractor : 
		component alt_dspbuilder_parallel_adder_GNL6TIQJ2F
			port map(
				user_aclr => '0',
				result => Parallel_Adder_Subtractor_result_wire,
				data0 => Multiply_Add_result_wire,
				data1 => Multiply_Add1_result_wire,
				clock => Clock_0_clock_output_clk,
				data4 => Multiply_Add4_result_wire,
				data2 => Multiply_Add2_result_wire,
				data3 => Multiply_Add3_result_wire,
				aclr => Clock_0_clock_output_reset,
				ena => '1');
	cast0 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In1_0_output_wire,
				output => cast0_output_wire);
	cast1 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In2_0_output_wire,
				output => cast1_output_wire);
	cast2 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In3_0_output_wire,
				output => cast2_output_wire);
	cast3 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In4_0_output_wire,
				output => cast3_output_wire);
	cast4 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In5_0_output_wire,
				output => cast4_output_wire);
	cast5 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In6_0_output_wire,
				output => cast5_output_wire);
	cast6 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In7_0_output_wire,
				output => cast6_output_wire);
	cast7 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In8_0_output_wire,
				output => cast7_output_wire);
	cast8 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In9_0_output_wire,
				output => cast8_output_wire);
	cast9 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In10_0_output_wire,
				output => cast9_output_wire);
	cast10 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In11_0_output_wire,
				output => cast10_output_wire);
	cast11 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In12_0_output_wire,
				output => cast11_output_wire);
	cast12 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In13_0_output_wire,
				output => cast12_output_wire);
	cast13 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In14_0_output_wire,
				output => cast13_output_wire);
	cast14 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In15_0_output_wire,
				output => cast14_output_wire);
	cast15 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In16_0_output_wire,
				output => cast15_output_wire);
	cast16 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In17_0_output_wire,
				output => cast16_output_wire);
	cast17 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In18_0_output_wire,
				output => cast17_output_wire);
	cast18 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In19_0_output_wire,
				output => cast18_output_wire);
	cast19 : 
		component alt_dspbuilder_cast_GNH6PSUMCS
			port map(
				input => In20_0_output_wire,
				output => cast19_output_wire);
end architecture;
