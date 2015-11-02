--------------------------------------------------------------------------------------------
-- DSP Builder (Version 7.1)
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


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY alt_dspbuilder_signaltapbit IS
	PORT
	(
		data_in		: IN STD_LOGIC ;
		data_out	: OUT STD_LOGIC 
	);
END alt_dspbuilder_signaltapbit;


ARCHITECTURE SYN OF alt_dspbuilder_signaltapbit IS

signal betw: STD_LOGIC;

BEGIN
	
	lcell_inst1: LCELL
			port map (a_in => data_in,
			 a_out => betw);

	lcell_inst: LCELL
			port map (a_in => betw,
			 a_out => data_out);

END SYN;
