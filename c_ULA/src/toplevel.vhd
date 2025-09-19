-- Toplevel pro conceito B+:

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

entity TopLevel is
  port(
    SW      : in  std_logic_vector(9 downto 0);   
    LEDR    : out std_logic_vector(9 downto 0);     
    HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0)  
  );
end entity;

architecture rtl of TopLevel is

  -- sinais internos
  signal x, y   : std_logic_vector(15 downto 0) := x"0003";
  signal saida  : std_logic_vector(15 downto 0);

  -- sinais internos para os displays
  signal HEX0_sig, HEX1_sig, HEX2_sig, HEX3_sig : std_logic_vector(6 downto 0);

  component alu is
    port (
      x,y     : in  STD_LOGIC_VECTOR(15 downto 0);
      zx,nx,zy,ny,f,no : in STD_LOGIC;
      sh_en   : in  STD_LOGIC;
      sh_dir  : in  STD_LOGIC;
      sh_size : in  STD_LOGIC_VECTOR(2 downto 0);
      zr,ng   : out STD_LOGIC;
      saida   : out STD_LOGIC_VECTOR(15 downto 0);
      carry   : out STD_LOGIC
    );
  end component;

  component sevenseg is
    port (
      bcd  : in  STD_LOGIC_VECTOR(3 downto 0);
      leds : out STD_LOGIC_VECTOR(6 downto 0)
    );
  end component;

begin

  alu1 : alu
    port map(
      x => x, 
      y => y,
      zx => SW(0), 
      zy => SW(1), 
      nx => SW(2), 
      ny => SW(3),
      f  => SW(4), 
      no => SW(5),
      sh_en   => SW(6),                 -- habilita shift
      sh_dir  => SW(7),                 -- direção: 0=left, 1=right
      sh_size => '0' & SW(9 downto 8), -- usa SW(9..8) como tamanho (0–3)
      ng => LEDR(0), 
      zr => LEDR(1), 
      carry => LEDR(2),
      saida => saida
    );

  HEX0A: sevenseg port map(bcd => saida(3 downto 0),   leds => HEX0_sig);
  HEX1B: sevenseg port map(bcd => saida(7 downto 4),   leds => HEX1_sig);
  HEX2C: sevenseg port map(bcd => saida(11 downto 8),  leds => HEX2_sig);
  HEX3D: sevenseg port map(bcd => saida(15 downto 12), leds => HEX3_sig);

  HEX0 <= HEX0_sig;
  HEX1 <= HEX1_sig;
  HEX2 <= HEX2_sig;
  HEX3 <= HEX3_sig;

  -- Saida q fiz no do overflow:
  LEDR(9 downto 3) <= saida(6 downto 0);

end rtl;


