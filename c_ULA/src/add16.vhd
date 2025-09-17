-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0);
		cout: out STD_LOGIC
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
    );
  end component;
  
  signal carry : STD_LOGIC_VECTOR(15 downto 0);

begin
  -- Implementação vem aqui!
  FA0 : FullAdder port map(a => a(0), b=> b(0), c => '0', soma => q(0), vaium => carry(0));   -- bit 0
  
  gen_adders : for i in 1 to 14 generate
    FA : FullAdder port map(a => a(i), b=> b(i), c => carry(i-1), soma => q(i), vaium => carry(i));   -- bit de 1 até 15
  end generate;
  
  FA15 : FullAdder port map(a => a(15), b=> b(15), c => carry(14), soma => q(15), vaium => carry(15));   -- bit 15 
  
  cout <= ( carry(14) xor carry(15) );
  
end architecture;