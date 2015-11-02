-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_signaltapnode is
	generic (
		ID : string := "0";
		WIDTH : natural := 8
	);
	port (
		o : out std_logic_vector(WIDTH-1 downto 0);
		i : in std_logic_vector(WIDTH-1 downto 0) := (others=>'0')
	);
end entity alt_dspbuilder_signaltapnode;

architecture rtl of alt_dspbuilder_signaltapnode is

component alt_dspbuilder_signaltapnode_GNHKA4BCYW is
	generic (
		ID : string := "2";
		WIDTH : natural := 8
	);
	port (
		i : in std_logic_vector(8-1 downto 0) := (others=>'0');
		o : out std_logic_vector(8-1 downto 0)
	);
end component alt_dspbuilder_signaltapnode_GNHKA4BCYW;

begin

alt_dspbuilder_signaltapnode_GNHKA4BCYW_0: if ((ID = "2") and (WIDTH = 8)) generate
	inst_alt_dspbuilder_signaltapnode_GNHKA4BCYW_0: alt_dspbuilder_signaltapnode_GNHKA4BCYW
		generic map(ID => "2", WIDTH => 8)
		port map(i => i, o => o);
end generate;

assert not (((ID = "2") and (WIDTH = 8)))
	report "Please run generate again" severity error;

end architecture rtl;

