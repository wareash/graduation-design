--------------------------------------------------------------------------------------------
-- DSP Builder (Version 9.1)
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: © 2001 Altera Corporation. All rights reserved.  Your use of Altera 
-- Corporation's design tools, logic functions and other software and tools, and its 
-- AMPP partner logic functions, and any output files any of the foregoing 
-- (including device programming or simulation files), and any associated 
-- documentation or information are expressly subject to the terms and conditions 
-- of the Altera Program License Subscription Agreement, Altera MegaCore Function 
-- License Agreement, or other applicable license agreement, including, without 
-- limitation, that your use is for the sole purpose of programming logic devices 
-- manufactured by Altera and sold by Altera or its authorized distributors.  
-- Please refer to the applicable agreement for further details.
--------------------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

library LPM;
use LPM.LPM_COMPONENTS.all;

entity alt_dspbuilder_SShiftTap is
	generic (     
			width					: positive :=8;
			number_of_taps			: positive :=8;
			use_dedicated_circuitry : natural :=0;
			lpm_hint				: string :="NONE";
			tap_distance			: positive :=1
			);
	port 	( 
			data		: in std_logic_vector(width-1 downto 0);
			clock		: in std_logic;
            aclr        : in std_logic;
            user_aclr   : in std_logic;
			sclr		: in std_logic;
			ena			: in std_logic 	:='1';
			taps		: out std_logic_vector(width*number_of_taps-1 downto 0):=(others=>'0');
			shiftout	: out std_logic_vector(width-1 downto 0):=(others=>'0')
			);
end alt_dspbuilder_SShiftTap;

architecture a of alt_dspbuilder_SShiftTap is

type StdUArray is array ((number_of_taps * tap_distance)-1 downto 0) of std_logic_vector (width-1 downto 0);
signal contents : StdUArray;

signal sena	: std_logic;
signal aclr_i : std_logic;

begin

aclr_i <= aclr or user_aclr;
sena <= ena and not sclr;

gb:if use_dedicated_circuitry=0 generate 		
	pshift:process(clock,aclr_i)
	begin
        if aclr_i='1' then
            for i in 0 to (number_of_taps * tap_distance)-1 loop
			    contents(i) <= (others => '0');
			end loop;
		elsif clock'event and clock='1' then
			if (sclr='1') then
				for i in 0 to (number_of_taps * tap_distance)-1 loop
					contents(i) <= (others => '0');
				end loop;
			elsif (ena='1') then 
				contents(0) <= data;
				for i in 1 to (number_of_taps * tap_distance)-1 loop
					contents(i) <= contents(i-1);
				end loop;
			end if;			
		end if;
	end process pshift;
	
	shiftout <= contents(number_of_taps*tap_distance-1);
	
	geno:	for i in 0 to number_of_taps -1 generate
		taps (((i+1) * width) -1 downto (i* width) ) <= contents (i+((tap_distance-1)*(i+1))); 
	end generate geno; 
end generate gb;			

gdc:if use_dedicated_circuitry>0 generate 		

	u0 : altshift_taps generic map (
					width => width,
					number_of_taps => number_of_taps,
					lpm_hint       => lpm_hint,
					lpm_type       => "altshift_taps",
					tap_distance => tap_distance)
			port map (
					clken		=>	sena,
					clock		=>	clock,
					shiftin		=>	data,
					taps		=>	taps,
					shiftout		=>	shiftout);
end generate gdc;

end a;

