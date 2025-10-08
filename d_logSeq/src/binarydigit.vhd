-- Elementos de Sistemas
-- by Luciano Soares
-- BinaryDigit.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity BinaryDigit is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		load:    in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;

architecture arch of BinaryDigit is

	component FlipFlopD is
		port(
			clock:  in std_logic;
			d:      in std_logic;
			clear:  in std_logic;
			preset: in std_logic;
			q:     out std_logic
		);
	end component;

	component Mux2Way is
		port (
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC);
	end component;

	signal dffout,muxout: std_logic;

begin

    -- O Mux2Way decide o que o Flip-Flop vai armazenar no próximo clock.
    -- Se load=1, ele seleciona a entrada 'input' (pela porta 'b' do Mux).
    -- Se load=0, ele seleciona o valor que já está no Flip-Flop, 'dffout' (pela porta 'a' do Mux).
    U_MUX: Mux2Way
        port map(
            a   => dffout,
            b   => input,
            sel => load,
            q   => muxout
        );

    -- O FlipFlopD armazena o valor que o Mux decidiu.
    -- Ele recebe a decisão do Mux (muxout) na sua porta de dados 'd'.
    -- As portas 'clear' e 'preset' não são usadas, então as conectamos em '0'.
    U_FFD: FlipFlopD
        port map(
            clock  => clock,
            d      => muxout,
            clear  => '0',
            preset => '0',
            q      => dffout
        );

    -- A saída final do componente é a saída do Flip-Flop.
    output <= dffout;

end architecture;
