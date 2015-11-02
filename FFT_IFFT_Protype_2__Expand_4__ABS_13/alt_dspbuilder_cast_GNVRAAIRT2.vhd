library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_cast_GNVRAAIRT2 is
	generic		( 			width_inl : natural := 8;
			round : natural := 0;
			outType : string := "STD_LOGIC_VECTOR";
			width_outr : natural := 0;
			outSigned : string := "true";
			inSigned : string := "true";
			saturate : natural := 0;
			inType : string := "STD_LOGIC_VECTOR";
			width_inr : natural := 10;
			width_outl : natural := 8);

	port(
		input : in std_logic_vector(17 downto 0);
		output : out std_logic_vector(7 downto 0));		
end entity;



architecture rtl of alt_dspbuilder_cast_GNVRAAIRT2 is 
Begin

-- Output - I/O assignment from Simulink Block  "Output"
Outputi : alt_dspbuilder_SBF generic map(
				width_inl=> 8 ,
				width_inr=> 10,
				width_outl=> 8,
				width_outr=> 0,
				lpm_signed=>  BusIsSigned ,
				round=> 0,
				satur=> 0)
		port map (
								xin(17 downto 0)  => input,
																yout => output				
				);
				
end architecture;