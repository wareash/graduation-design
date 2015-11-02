library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_shifttaps_GNLZ4R7UC4 is
	generic		( 			NOTAPS : positive := 20;
			USE_SHIFTOUT : string := "false";
			USE_DEDICATED_CIRCUITRY : string := "false";
			RAMTYPE : string := "AUTO";
			TAPDISTANCE : natural := 1;
			WIDTH : positive := 8);

	port(
		clock : in std_logic;
		aclr : in std_logic;
		input : in std_logic_vector(7 downto 0);
		shiftout : out std_logic_vector(7 downto 0);
		sclr : in std_logic;
		ena : in std_logic;
		t0 : out std_logic_vector(7 downto 0);
		t1 : out std_logic_vector(7 downto 0);
		t2 : out std_logic_vector(7 downto 0);
		t3 : out std_logic_vector(7 downto 0);
		t4 : out std_logic_vector(7 downto 0);
		t5 : out std_logic_vector(7 downto 0);
		t6 : out std_logic_vector(7 downto 0);
		t7 : out std_logic_vector(7 downto 0);
		t8 : out std_logic_vector(7 downto 0);
		t9 : out std_logic_vector(7 downto 0);
		t10 : out std_logic_vector(7 downto 0);
		t11 : out std_logic_vector(7 downto 0);
		t12 : out std_logic_vector(7 downto 0);
		t13 : out std_logic_vector(7 downto 0);
		t14 : out std_logic_vector(7 downto 0);
		t15 : out std_logic_vector(7 downto 0);
		t16 : out std_logic_vector(7 downto 0);
		t17 : out std_logic_vector(7 downto 0);
		t18 : out std_logic_vector(7 downto 0);
		t19 : out std_logic_vector(7 downto 0));		
end entity;

architecture rtl of alt_dspbuilder_shifttaps_GNLZ4R7UC4 is 
signal sclr_load		: STD_LOGIC;
signal reset			: STD_LOGIC; 

Begin

-- Reset is a combination of system reset and the user exposed sclr reset
reset <= aclr or sclr;

-- Note: 
-- 1) The single hardware port "taps" is split into NOTAPS 
--    separate ports "t0", "t1", ... , "t{NOTAPS-1}"
-- 2) alt_dspbuilder_SShiftTap implements an altshift_taps if use_dedicated_circuitry
--    is on. altshift_taps does not have a reset port however and instead 
--    alt_dspbuilder_SShiftTap wires the reset such that it acts like a (not)enable.

-- Tap Delay Line - Simulink Block "ShiftTaps"
ShiftTapsi : alt_dspbuilder_SShiftTap	generic map (
				width			=>	8,
				use_dedicated_circuitry	=>	0,
				lpm_hint		=>	"None",
				number_of_taps	=>	20,
				tap_distance	=>	1)
		port map (data			=>	input,
				taps(7 downto 0) => t0,
				taps(15 downto 8) => t1,
				taps(23 downto 16) => t2,
				taps(31 downto 24) => t3,
				taps(39 downto 32) => t4,
				taps(47 downto 40) => t5,
				taps(55 downto 48) => t6,
				taps(63 downto 56) => t7,
				taps(71 downto 64) => t8,
				taps(79 downto 72) => t9,
				taps(87 downto 80) => t10,
				taps(95 downto 88) => t11,
				taps(103 downto 96) => t12,
				taps(111 downto 104) => t13,
				taps(119 downto 112) => t14,
				taps(127 downto 120) => t15,
				taps(135 downto 128) => t16,
				taps(143 downto 136) => t17,
				taps(151 downto 144) => t18,
				taps(159 downto 152) => t19,
				ena				=>	ena,
				clock			=>	clock,
				sclr			=>	sclr,
				aclr			=>  aclr,
				user_aclr		=> '0'
				
	);

end architecture;