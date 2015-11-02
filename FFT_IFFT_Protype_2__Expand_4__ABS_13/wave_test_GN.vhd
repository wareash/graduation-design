library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity wave_test_GN is  
	port(
		Input : in STD_LOGIC_VECTOR(7 downto 0);
		Output : out STD_LOGIC_VECTOR(7 downto 0);
		Clock : in STD_LOGIC;
		aclr : in STD_LOGIC); 
end entity;
architecture rtl of wave_test_GN is
signal Input_0_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- Input_0:output -> [ Shift_Taps:input]
signal Bus_Conversion_output_wire : STD_LOGIC_VECTOR(7 downto 0); -- Bus_Conversion:output -> [ SignalTap_II_Node2:i]
signal SignalTap_II_Node2_o_wire : STD_LOGIC_VECTOR(7 downto 0); -- SignalTap_II_Node2:o -> [ Output_0:input]
signal Shift_Taps_t0_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t0 -> [ wave_test_Subsystem_0:In1]
signal Shift_Taps_t1_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t1 -> [ wave_test_Subsystem_0:In2]
signal Shift_Taps_t2_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t2 -> [ wave_test_Subsystem_0:In3]
signal Shift_Taps_t3_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t3 -> [ wave_test_Subsystem_0:In4]
signal Shift_Taps_t4_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t4 -> [ wave_test_Subsystem_0:In5]
signal Shift_Taps_t5_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t5 -> [ wave_test_Subsystem_0:In6]
signal Shift_Taps_t6_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t6 -> [ wave_test_Subsystem_0:In7]
signal Shift_Taps_t7_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t7 -> [ wave_test_Subsystem_0:In8]
signal Shift_Taps_t8_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t8 -> [ wave_test_Subsystem_0:In9]
signal Shift_Taps_t9_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t9 -> [ wave_test_Subsystem_0:In10]
signal Shift_Taps_t10_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t10 -> [ wave_test_Subsystem_0:In11]
signal Shift_Taps_t11_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t11 -> [ wave_test_Subsystem_0:In12]
signal Shift_Taps_t12_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t12 -> [ wave_test_Subsystem_0:In13]
signal Shift_Taps_t13_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t13 -> [ wave_test_Subsystem_0:In14]
signal Shift_Taps_t14_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t14 -> [ wave_test_Subsystem_0:In15]
signal Shift_Taps_t15_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t15 -> [ wave_test_Subsystem_0:In16]
signal Shift_Taps_t16_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t16 -> [ wave_test_Subsystem_0:In17]
signal Shift_Taps_t17_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t17 -> [ wave_test_Subsystem_0:In18]
signal Shift_Taps_t18_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t18 -> [ wave_test_Subsystem_0:In19]
signal Shift_Taps_t19_wire : STD_LOGIC_VECTOR(7 downto 0); -- Shift_Taps:t19 -> [ wave_test_Subsystem_0:In20]
signal wave_test_Subsystem_0_Out1_wire : STD_LOGIC_VECTOR(36 downto 0); -- wave_test_Subsystem_0:Out1 -> [ cast20:input]
signal cast20_output_wire : STD_LOGIC_VECTOR(17 downto 0); -- cast20:output -> [ Bus_Conversion:input]
signal Clock_0_clock_output_clk : STD_LOGIC; -- Clock_0:clock_out -> [ Shift_Taps:clock, wave_test_Subsystem_0:Clock]
signal Clock_0_clock_output_reset : STD_LOGIC; -- Clock_0:aclr_out -> [ Shift_Taps:aclr, wave_test_Subsystem_0:aclr]
component alt_dspbuilder_clock_GNDZSP37O7
	 generic (
			DOMAIN : string := "default";
			RESET : string := "ACTIVE_LOW"); 
	port(
		clock : in STD_LOGIC;
		clock_out : out STD_LOGIC;
		aclr_out : out STD_LOGIC;
		aclr_n : in STD_LOGIC); 
end component;
component alt_dspbuilder_signaltapnode_GNHKA4BCYW
	 generic (
			WIDTH : natural := 8;
			ID : string := "2"); 
	port(
		o : out STD_LOGIC_VECTOR(7 downto 0);
		i : in STD_LOGIC_VECTOR(7 downto 0)); 
end component;
component alt_dspbuilder_shifttaps_GNLZ4R7UC4
	 generic (
			WIDTH : positive := 8;
			NOTAPS : positive := 20;
			TAPDISTANCE : natural := 1;
			USE_SHIFTOUT : string := "false";
			USE_DEDICATED_CIRCUITRY : string := "false";
			RAMTYPE : string := "AUTO"); 
	port(
		t3 : out STD_LOGIC_VECTOR(7 downto 0);
		t2 : out STD_LOGIC_VECTOR(7 downto 0);
		t1 : out STD_LOGIC_VECTOR(7 downto 0);
		t0 : out STD_LOGIC_VECTOR(7 downto 0);
		sclr : in STD_LOGIC;
		ena : in STD_LOGIC;
		t10 : out STD_LOGIC_VECTOR(7 downto 0);
		t11 : out STD_LOGIC_VECTOR(7 downto 0);
		clock : in STD_LOGIC;
		t12 : out STD_LOGIC_VECTOR(7 downto 0);
		t13 : out STD_LOGIC_VECTOR(7 downto 0);
		t14 : out STD_LOGIC_VECTOR(7 downto 0);
		t15 : out STD_LOGIC_VECTOR(7 downto 0);
		t16 : out STD_LOGIC_VECTOR(7 downto 0);
		t17 : out STD_LOGIC_VECTOR(7 downto 0);
		t18 : out STD_LOGIC_VECTOR(7 downto 0);
		t19 : out STD_LOGIC_VECTOR(7 downto 0);
		shiftout : out STD_LOGIC_VECTOR(7 downto 0);
		input : in STD_LOGIC_VECTOR(7 downto 0);
		t4 : out STD_LOGIC_VECTOR(7 downto 0);
		t5 : out STD_LOGIC_VECTOR(7 downto 0);
		t6 : out STD_LOGIC_VECTOR(7 downto 0);
		aclr : in STD_LOGIC;
		t7 : out STD_LOGIC_VECTOR(7 downto 0);
		t8 : out STD_LOGIC_VECTOR(7 downto 0);
		t9 : out STD_LOGIC_VECTOR(7 downto 0)); 
end component;
component alt_dspbuilder_port_GNQKRCEYRF
	 generic (
			EXPORT : string := "true";
			PIN : string := "";
			PORTTYPE : string := "Input";
			WIDTH : natural := 8;
			HDLTYPE : string := "STD_LOGIC_VECTOR"); 
	port(
		input : in STD_LOGIC_VECTOR(7 downto 0);
		output : out STD_LOGIC_VECTOR(7 downto 0)); 
end component;
component alt_dspbuilder_cast_GNVRAAIRT2
	 generic (
			width_inl : natural := 8;
			width_inr : natural := 10;
			width_outl : natural := 8;
			width_outr : natural := 0;
			saturate : natural := 0;
			round : natural := 0;
			inSigned : string := "true";
			outSigned : string := "true";
			inType : string := "STD_LOGIC_VECTOR";
			outType : string := "STD_LOGIC_VECTOR"); 
	port(
		input : in STD_LOGIC_VECTOR(17 downto 0);
		output : out STD_LOGIC_VECTOR(7 downto 0)); 
end component;
component wave_test_GN_wave_test_Subsystem
	  
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
end component;
component alt_dspbuilder_port_GNSF2ERWE6
	 generic (
			EXPORT : string := "true";
			PIN : string := "";
			PORTTYPE : string := "Output";
			WIDTH : natural := 8;
			HDLTYPE : string := "STD_LOGIC_VECTOR"); 
	port(
		input : in STD_LOGIC_VECTOR(7 downto 0);
		output : out STD_LOGIC_VECTOR(7 downto 0)); 
end component;
component alt_dspbuilder_cast_GNCE6X6QKU
	 generic (
			width_inl : natural := 37;
			width_inr : natural := 0;
			width_outl : natural := 18;
			width_outr : natural := 0;
			saturate : natural := 0;
			round : natural := 0;
			inSigned : string := "true";
			outSigned : string := "true";
			inType : string := "STD_LOGIC_VECTOR";
			outType : string := "STD_LOGIC_VECTOR"); 
	port(
		input : in STD_LOGIC_VECTOR(36 downto 0);
		output : out STD_LOGIC_VECTOR(17 downto 0)); 
end component;
Begin
	Clock_0 : 
		component alt_dspbuilder_clock_GNDZSP37O7
			port map(
				clock => Clock,
				clock_out => Clock_0_clock_output_clk,
				aclr_out => Clock_0_clock_output_reset,
				aclr_n => aclr);
	SignalTap_II_Node2 : 
		component alt_dspbuilder_signaltapnode_GNHKA4BCYW
			port map(
				o => SignalTap_II_Node2_o_wire,
				i => Bus_Conversion_output_wire);
	Shift_Taps : 
		component alt_dspbuilder_shifttaps_GNLZ4R7UC4
			port map(
				t3 => Shift_Taps_t3_wire,
				t2 => Shift_Taps_t2_wire,
				t1 => Shift_Taps_t1_wire,
				t0 => Shift_Taps_t0_wire,
				sclr => '0',
				ena => '1',
				t10 => Shift_Taps_t10_wire,
				t11 => Shift_Taps_t11_wire,
				clock => Clock_0_clock_output_clk,
				t12 => Shift_Taps_t12_wire,
				t13 => Shift_Taps_t13_wire,
				t14 => Shift_Taps_t14_wire,
				t15 => Shift_Taps_t15_wire,
				t16 => Shift_Taps_t16_wire,
				t17 => Shift_Taps_t17_wire,
				t18 => Shift_Taps_t18_wire,
				t19 => Shift_Taps_t19_wire,
				shiftout => open,
				input => Input_0_output_wire,
				t4 => Shift_Taps_t4_wire,
				t5 => Shift_Taps_t5_wire,
				t6 => Shift_Taps_t6_wire,
				aclr => Clock_0_clock_output_reset,
				t7 => Shift_Taps_t7_wire,
				t8 => Shift_Taps_t8_wire,
				t9 => Shift_Taps_t9_wire);
	Input_0 : 
		component alt_dspbuilder_port_GNQKRCEYRF
			port map(
				input => Input,
				output => Input_0_output_wire);
	Bus_Conversion : 
		component alt_dspbuilder_cast_GNVRAAIRT2
			port map(
				input => cast20_output_wire,
				output => Bus_Conversion_output_wire);
	wave_test_Subsystem_0 : 
		component wave_test_GN_wave_test_Subsystem
			port map(
				In9 => Shift_Taps_t8_wire,
				In19 => Shift_Taps_t18_wire,
				In18 => Shift_Taps_t17_wire,
				In7 => Shift_Taps_t6_wire,
				In17 => Shift_Taps_t16_wire,
				In16 => Shift_Taps_t15_wire,
				In8 => Shift_Taps_t7_wire,
				In5 => Shift_Taps_t4_wire,
				In15 => Shift_Taps_t14_wire,
				In14 => Shift_Taps_t13_wire,
				In6 => Shift_Taps_t5_wire,
				In13 => Shift_Taps_t12_wire,
				In12 => Shift_Taps_t11_wire,
				In20 => Shift_Taps_t19_wire,
				In11 => Shift_Taps_t10_wire,
				Clock => Clock_0_clock_output_clk,
				In10 => Shift_Taps_t9_wire,
				Out1 => wave_test_Subsystem_0_Out1_wire,
				In4 => Shift_Taps_t3_wire,
				In3 => Shift_Taps_t2_wire,
				In2 => Shift_Taps_t1_wire,
				In1 => Shift_Taps_t0_wire,
				aclr => Clock_0_clock_output_reset);
	Output_0 : 
		component alt_dspbuilder_port_GNSF2ERWE6
			port map(
				input => SignalTap_II_Node2_o_wire,
				output => Output);
	cast20 : 
		component alt_dspbuilder_cast_GNCE6X6QKU
			port map(
				input => wave_test_Subsystem_0_Out1_wire,
				output => cast20_output_wire);
end architecture;
