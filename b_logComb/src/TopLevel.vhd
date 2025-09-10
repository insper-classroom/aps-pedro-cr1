--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		CLOCK_50 : in  std_logic;
		SW       : in  std_logic_vector(9 downto 0);
		LEDR     : out std_logic_vector(9 downto 0);
		HEX0     : out std_logic_vector(6 downto 0);
		HEX1     : out std_logic_vector(6 downto 0);
		HEX2     : out std_logic_vector(6 downto 0);
		HEX3     : out std_logic_vector(6 downto 0);
		HEX4     : out std_logic_vector(6 downto 0);
		HEX5     : out std_logic_vector(6 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

component sevenseg is
		port (
			bcd : in  std_logic_vector(3 downto 0);
			leds: out std_logic_vector(6 downto 0)
			);
			
end component;

--------------
-- signals
--------------
 signal X: std_logic_vector(3 downto 0);
 

---------------
-- implementacao
---------------
begin
	X <= "00" & SW(9 downto 8);
	u1: sevenseg port map(bcd=> SW(3 downto 0), leds=> HEX0);
	u2: sevenseg port map(bcd=> SW(7 downto 4),leds =>HEX1);
	u3: sevenseg port map(bcd=> X,leds =>HEX2);
	HEX3 <= "1111111";
	HEX4 <= "1111111";
	HEX5 <= "1111111";
 
end rtl;

