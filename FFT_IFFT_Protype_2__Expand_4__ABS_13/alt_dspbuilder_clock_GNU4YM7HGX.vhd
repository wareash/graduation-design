library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_clock_GNU4YM7HGX is
	generic		( 			RESET : string := "ACTIVE_HIGH";
			DOMAIN : string := "default");

	port(
		clock_out : out std_logic;
		aclr_out : out std_logic;
		clock : in std_logic;
		aclr : in std_logic);		
end entity;



architecture rtl of alt_dspbuilder_clock_GNU4YM7HGX is 
Begin

-- Straight Bypass Clock 
clock_out		<=	clock;

-- reset logic
aclr_out		<=	aclr;




end architecture;