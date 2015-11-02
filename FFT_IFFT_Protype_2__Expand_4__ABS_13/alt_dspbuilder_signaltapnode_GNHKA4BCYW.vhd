library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_signaltapnode_GNHKA4BCYW is
	generic		( 			ID : string := "2";
			WIDTH : natural := 8);

	port(
		i : in std_logic_vector(7 downto 0);
		o : out std_logic_vector(7 downto 0));		
end entity;

--- The DSPBuilder SignalTap Node
architecture rtl of alt_dspbuilder_signaltapnode_GNHKA4BCYW is

component alt_dspbuilder_signaltapbit
   port (data_in : in std_logic;
      data_out: out std_logic);
end component;

Begin



dspbsignaltap_ni7zl_2_b0 : alt_dspbuilder_signaltapbit
        port map (
                data_in  => i(0),
                data_out => o(0));

dspbsignaltap_ni7zl_2_b1 : alt_dspbuilder_signaltapbit
        port map (
                data_in  => i(1),
                data_out => o(1));

dspbsignaltap_ni7zl_2_b2 : alt_dspbuilder_signaltapbit
        port map (
                data_in  => i(2),
                data_out => o(2));

dspbsignaltap_ni7zl_2_b3 : alt_dspbuilder_signaltapbit
        port map (
                data_in  => i(3),
                data_out => o(3));

dspbsignaltap_ni7zl_2_b4 : alt_dspbuilder_signaltapbit
        port map (
                data_in  => i(4),
                data_out => o(4));

dspbsignaltap_ni7zl_2_b5 : alt_dspbuilder_signaltapbit
        port map (
                data_in  => i(5),
                data_out => o(5));

dspbsignaltap_ni7zl_2_b6 : alt_dspbuilder_signaltapbit
        port map (
                data_in  => i(6),
                data_out => o(6));

dspbsignaltap_ni7zl_2_b7 : alt_dspbuilder_signaltapbit
        port map (
                data_in  => i(7),
                data_out => o(7));

end architecture;