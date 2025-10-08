-- Elementos de Sistemas
-- by Luciano Soares
-- Register64.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register64 is
  port(
    clock:   in  STD_LOGIC;
    input:   in  STD_LOGIC_VECTOR(63 downto 0);
    load:    in  STD_LOGIC;
    output:  out STD_LOGIC_VECTOR(63 downto 0)
  );
end entity;

architecture arch of Register64 is

  component Register32 is
    port(
      clock:   in  STD_LOGIC;
      input:   in  STD_LOGIC_VECTOR(31 downto 0);
      load:    in  STD_LOGIC;
      output:  out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  signal out_hi : STD_LOGIC_VECTOR(31 downto 0);
  signal out_lo : STD_LOGIC_VECTOR(31 downto 0);

begin

  UHI: Register32
    port map(
      clock  => clock,
      input  => input(63 downto 32),
      load   => load,
      output => out_hi
    );

  ULO: Register32
    port map(
      clock  => clock,
      input  => input(31 downto 0),
      load   => load,
      output => out_lo
    );

  output <= out_hi & out_lo;

end architecture;

