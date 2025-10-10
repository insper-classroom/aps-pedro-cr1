-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is
    signal r : std_logic := '0';  -- estado interno

    -- Converte qualquer coisa diferente de '1' para '0'
    function to01(a: std_logic) return std_logic is
    begin
        if a = '1' then return '1'; else return '0'; end if;
    end function;
begin
    q    <= r;
    notq <= not r;

    process(clock)
        variable jv, kv : std_logic;
    begin
        if rising_edge(clock) then
            jv := to01(J);
            kv := to01(K);
            -- Próximo estado do JK: q+ = J·/q + /K·q
            r <= (jv and (not r)) or ((not kv) and r);
        end if;
    end process;
end architecture;