-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

--altera translate_off
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity wave_test is
	port (
		Clock : in std_logic := '0';
		Input : in std_logic_vector(8-1 downto 0) := (others=>'0');
		Output : out std_logic_vector(8-1 downto 0);
		aclr : in std_logic := '0'
	);
end entity wave_test;

architecture rtl of wave_test is

component wave_test_GN is
	port (
		Clock : in std_logic := '0';
		Input : in std_logic_vector(8-1 downto 0) := (others=>'0');
		Output : out std_logic_vector(8-1 downto 0);
		aclr : in std_logic := '0'
	);
end component wave_test_GN;

begin

wave_test_GN_0: if true generate
	inst_wave_test_GN_0: wave_test_GN
		port map(Clock => Clock, Input => Input, Output => Output, aclr => aclr);
end generate;

end architecture rtl;

--altera translate_on
