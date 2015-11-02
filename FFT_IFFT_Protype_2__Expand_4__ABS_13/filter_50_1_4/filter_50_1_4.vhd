-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity filter_50_1_4 is
	port (
		Clock : in std_logic;
		Input : in std_logic_vector(8-1 downto 0);
		Output : out std_logic_vector(8-1 downto 0);
		aclr : in std_logic
	);
end entity filter_50_1_4;

architecture rtl of filter_50_1_4 is

component filter_50_1_4_GN is
	port (
		Clock : in std_logic;
		Input : in std_logic_vector(8-1 downto 0);
		Output : out std_logic_vector(8-1 downto 0);
		aclr : in std_logic
	);
end component filter_50_1_4_GN;

begin

filter_50_1_4_GN_0: if true generate
	inst_filter_50_1_4_GN_0: filter_50_1_4_GN
		port map(Clock => Clock, Input => Input, Output => Output, aclr => aclr);
end generate;

end architecture rtl;

