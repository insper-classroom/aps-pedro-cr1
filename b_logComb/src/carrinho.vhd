library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carrinho is
	port ( 
		    x1: in  STD_LOGIC;
			x2: in  STD_LOGIC;
            x3: in  STD_LOGIC;
            x4: in  STD_LOGIC;
			y1: out STD_LOGIC_VECTOR(1 downto 0);
            y2: out STD_LOGIC_VECTOR(1 downto 0));
end entity;

architecture arch of carrinho is

begin
  y1 <= "10" when (x3 = '0' and x4 = '0' and (x1 = '1' or x2 = '0')) else
        "01" when (x1 = '0' and x2 = '0' and x3 = '1')               else
        "00";

  y2 <= "10" when (x3 = '0' and x4 = '0' and (x2 = '1' or x1 = '0')) else
        "01" when (x1 = '0' and x2 = '0' and x4 = '1')               else
        "00";
        
end architecture;