library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenseg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenseg is
begin


end architecture;
