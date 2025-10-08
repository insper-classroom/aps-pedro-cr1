library ieee;
use ieee.std_logic_1164.all;

entity counterdown is
    port(
        clock : in  std_logic;
        q     : out std_logic_vector(2 downto 0)
    );
end entity;

architecture rtl of counterdown is
    signal q0, q1, q2    : std_logic := '0';
    signal nq0, nq1      : std_logic;
    signal nqb0, nqb1, nqb2 : std_logic; -- lixo para notq (se o TB exigir conexão)
begin
    -- complementos
    nq0 <= not q0;
    nq1 <= not q1;

    -- T0 = '1'  -> alterna a cada clock
    U0: entity work.flipflopt(rtl)
        port map(clock => clock, t => '1',              q => q0, notq => nqb0);

    -- T1 = ~Q0  -> alterna quando Q0 = 0
    U1: entity work.flipflopt(rtl)
        port map(clock => clock, t => nq0,              q => q1, notq => nqb1);

    -- T2 = ~Q0 & ~Q1 -> alterna quando Q0=0 e Q1=0
    U2: entity work.flipflopt(rtl)
        port map(clock => clock, t => (nq0 and nq1),    q => q2, notq => nqb2);

    -- ordem de saída [2..0]
    q <= q2 & q1 & q0;
end architecture;
