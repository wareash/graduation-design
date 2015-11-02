-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_clock is
	generic (
		RESET : string := "ACTIVE_HIGH";
		DOMAIN : string := "default"
	);
	port (
		clock_out : out std_logic;
		clock : in std_logic;
		aclr_out : out std_logic;
		aclr : in std_logic;
		aclr_n : in std_logic
	);
end entity alt_dspbuilder_clock;

architecture rtl of alt_dspbuilder_clock is

component alt_dspbuilder_clock_GNQFU4PUDH is
	generic (
		RESET : string := "ACTIVE_HIGH";
		DOMAIN : string := "default"
	);
	port (
		aclr : in std_logic;
		aclr_out : out std_logic;
		clock : in std_logic;
		clock_out : out std_logic
	);
end component alt_dspbuilder_clock_GNQFU4PUDH;

begin

alt_dspbuilder_clock_GNQFU4PUDH_0: if ((RESET = "ACTIVE_HIGH") and (DOMAIN = "default")) generate
	inst_alt_dspbuilder_clock_GNQFU4PUDH_0: alt_dspbuilder_clock_GNQFU4PUDH
		generic map(RESET => "ACTIVE_HIGH", DOMAIN => "default")
		port map(aclr => aclr, aclr_out => aclr_out, clock => clock, clock_out => clock_out);
end generate;

assert not (((RESET = "ACTIVE_HIGH") and (DOMAIN = "default")))
	report "Please run generate again" severity error;

end architecture rtl;

