library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity barrelshifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of barrelshifter16 is
  	signal s1, s2, s3 : std_logic_vector(15 downto 0);
begin
  	s1 <= a(14 downto 0) & '0'        when dir='0' and size(0)='1' else
        '0' & a(15 downto 1)          when dir='1' and size(0)='1' else
        a;

  	s2 <= s1(13 downto 0) & "00"      when dir='0' and size(1)='1' else
        "00" & s1(15 downto 2)        when dir='1' and size(1)='1' else
        s1;

  	s3 <= s2(11 downto 0) & x"0"      when dir='0' and size(2)='1' else
        x"0" & s2(15 downto 4)        when dir='1' and size(2)='1' else
        s2;

  	q <= s3;
end architecture;

