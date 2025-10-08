-- Elementos de Sistemas
-- by Luciano Soares
-- FlipFlopD.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopD is
	port(
		clock:  in std_logic;
		d:      in std_logic;
		clear:  in std_logic;
		preset: in std_logic;
		q:      out std_logic := '0'
	);
end entity;

architecture arch of FlipFlopD is
    signal q_int : std_logic := '0';

begin
    process(clock, clear, preset)
    begin
        if (clear = '1') then
            q_int <= '0';                      
        elsif (preset = '1') then
            q_int <= '1';                       
        elsif (rising_edge(clock)) then
            q_int <= d;                         
        end if;
    end process;

    q <= q_int;                               
end architecture;
