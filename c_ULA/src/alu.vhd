-- Elementos de Sistemas
-- by Luciano Soares
-- ALU.vhd

-- Unidade Lógica Aritmética (ULA)
-- Recebe dois valores de 16bits e

-- calcula uma das seguintes funções:
-- X+y, x-y, y-x, 0, 1, -1, x, y, -x, -y,
-- X+1, y+1, x-1, y-1, x&y, x|y

-- De acordo com os 6 bits de entrada denotados:
-- zx, nx, zy, ny, f, no.

-- Também calcula duas saídas de 1 bit:
-- Se a saída == 0, zr é definida como 1, senão 0;
-- Se a saída <0, ng é definida como 1, senão 0.

-- a ULA opera sobre os valores, da seguinte forma:
-- se (zx == 1) então x = 0
-- se (nx == 1) então x =! X

-- se (zy == 1) então y = 0
-- se (ny == 1) então y =! Y

-- se (f == 1) então saída = x + y
-- se (f == 0) então saída = x & y

-- se (no == 1) então saída = !saída
-- se (out == 0) então zr = 1
-- se (out <0) então ng = 1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
	port (
			x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
			zx:    in STD_LOGIC;                     -- zera a entrada x
			nx:    in STD_LOGIC;                     -- inverte a entrada x
			zy:    in STD_LOGIC;                     -- zera a entrada y
			ny:    in STD_LOGIC;                     -- inverte a entrada y
			f:     in STD_LOGIC;                     -- se 0 calcula x & y, senão x + y
			no:    in STD_LOGIC;                     -- inverte o valor da saída
			sh_en: in STD_LOGIC;                     -- habilita shift
			sh_dir:in STD_LOGIC;                     -- direção do shift (0=left, 1=right)
			sh_size: in STD_LOGIC_VECTOR(2 downto 0);-- tamanho do shift (0–7)
			zr:    out STD_LOGIC;                    -- setado se saída igual a zero
			ng:    out STD_LOGIC;                    -- setado se saída é negativa
			saida: out STD_LOGIC_VECTOR(15 downto 0);-- saída de dados da ALU
			carry: out STD_LOGIC                     -- carry/overflow
	);
end entity;

architecture rtl of alu is

	-- Componentes
	component zerador16 is
		port(z: in STD_LOGIC; a: in STD_LOGIC_VECTOR(15 downto 0); y: out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component inversor16 is
		port(z: in STD_LOGIC; a: in STD_LOGIC_VECTOR(15 downto 0); y: out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component Add16 is
		port(a,b: in STD_LOGIC_VECTOR(15 downto 0); q: out STD_LOGIC_VECTOR(15 downto 0); cout: out STD_LOGIC);
	end component;

	component And16 is
		port(a,b: in STD_LOGIC_VECTOR(15 downto 0); q: out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component comparador16 is
		port(a: in STD_LOGIC_VECTOR(15 downto 0); zr: out STD_LOGIC; ng: out STD_LOGIC);
	end component;

	component Mux16 is
		port(a,b: in STD_LOGIC_VECTOR(15 downto 0); sel: in STD_LOGIC; q: out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component barrelshifter16 is
		port(a: in STD_LOGIC_VECTOR(15 downto 0); dir: in STD_LOGIC; size: in STD_LOGIC_VECTOR(2 downto 0); q: out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	-- Sinais auxiliares
	SIGNAL zxout,zyout,nxout,nyout,andout,adderout,muxout,precomp,shiftout: std_logic_vector(15 downto 0);

begin
	-- Bloco Zerador pra X e Y:
	zx1: zerador16 port map(z => zx, a => x, y => zxout);
	zy1: zerador16 port map(z => zy, a => y, y => zyout);
		
	-- Bloco Inversor pra X e Y:
	ix1: inversor16 port map(z => nx, a => zxout , y => nxout);
	iy1: inversor16 port map(z => ny, a => zyout , y => nyout);
		
	-- Bloco Add e carry:
	add1: Add16 port map(a => nxout, b => nyout, q => adderout, cout => carry);
		
	-- Bloco And:
	and1: And16 port map(a => nxout, b => nyout, q => andout);
		
	-- Bloco Mux de and e add:
	mux1: Mux16 port map(a => andout, b => adderout, sel => f, q => muxout);
		
	-- Bloco Inversor final:
	no1: inversor16 port map(z => no, a => muxout, y => precomp);
		
	-- Bloco Comparador:
	comp1: comparador16 port map(a => precomp, zr => zr, ng => ng);

	-- Bloco BarrelShifter:
	bs1: barrelshifter16 port map(a => precomp, dir => sh_dir, size => sh_size, q => shiftout);
		
	-- Seleção final:
	saida <= shiftout when sh_en = '1' else precomp;

end architecture;