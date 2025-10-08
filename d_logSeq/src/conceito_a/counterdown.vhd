-- Elementos de Sistemas
-- CounterDown.vhd
library ieee;
use ieee.std_logic_1164.all;

entity CounterDown is
    port(
        clock : in  std_logic;
        q     : out std_logic_vector(2 downto 0)
    );
end entity;

architecture arch of CounterDown is
    component FlipFlopT is
        port(
            clock : in  std_logic;
            t     : in  std_logic;
            q     : out std_logic;
            notq  : out std_logic
        );
    end component;

    signal q0, q1, q2 : std_logic := '0';
    signal nq0, nq1   : std_logic;
    signal t0, t1, t2 : std_logic;
begin
    -- Complementos
    nq0 <= not q0;
    nq1 <= not q1;

    -- Entradas T
    t0 <= '1';             -- alterna a cada clock
    t1 <= nq0;             -- alterna quando Q0 = 0
    t2 <= nq0 and nq1;     -- alterna quando Q0=0 e Q1=0

    -- Flip-flops
    U0: FlipFlopT port map(clock => clock, t => t0, q => q0, notq => nq0);
    U1: FlipFlopT port map(clock => clock, t => t1, q => q1, notq => nq1);
    U2: FlipFlopT port map(clock => clock, t => t2, q => q2, notq => open);

    q <= q2 & q1 & q0;
end architecture;
