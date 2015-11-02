library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_multiply_add_GNKCGS47P2 is
	generic		( 			family : string := "Cyclone II";
			direction : string := "AddAdd";
			data3b_const : string := "0000000001001011";
			data2b_const : string := "0000000000111111";
			representation : string := "SIGNED";
			dataWidth : integer := 16;
			data4b_const : string := "0000000001010101";
			number_multipliers : integer := 4;
			pipeline_register : string := "InputsMultiplierandAdder";
			use_dedicated_circuitry : integer := 1;
			data1b_const : string := "0000000000110010";
			use_b_consts : natural := 1);

	port(
		clock : in std_logic;
		aclr : in std_logic;
		data1a : in std_logic_vector(15 downto 0);
		data2a : in std_logic_vector(15 downto 0);
		data3a : in std_logic_vector(15 downto 0);
		data4a : in std_logic_vector(15 downto 0);
		result : out std_logic_vector(33 downto 0);
		user_aclr : in std_logic;
		ena : in std_logic);		
end entity;

architecture rtl of alt_dspbuilder_multiply_add_GNKCGS47P2 is 

Begin



MultiplyAddi : alt_dspbuilder_AltMultConst generic map (
				CA			=>	"0000000000110010",
				CB			=>	"0000000000111111",
				CC			=>	"0000000001001011",
				CD			=>	"0000000001010101",
				width_a			=>	16,
				width_r			=>	34,
				RegStruct		=>	InputsMultiplierandAdder)
		port map (
				datain		=>  data1a ,
				datbin		=>  data2a ,
				datcin		=>  data3a ,
				datdin		=>  data4a ,											
				dataout		=>	result(33  downto 0),
				clock		=>	clock,
				ena			=>	ena,
				aclr		=>	aclr,
				user_aclr	=>	user_aclr
				);



end architecture;		