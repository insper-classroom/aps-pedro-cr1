-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- Modificação:
--   - Rafael Corsi : nova versão: adicionado reg S
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e
                                                                     -- ng (se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- instrução  e ALU para reg. A
		muxALUI_D                   : out STD_LOGIC;                 -- instrução  e ALU para reg. D
        
        muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre
                                                                     -- reg. A e Mem. RAM para ALU
                                                                     -- A  e Mem. RAM para ALU
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadM, loadPC : out STD_LOGIC :='0'               -- sinais de load do reg. A,
                                                                     -- reg. D, Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is
    signal jump_condition   : STD_LOGIC;
begin

    -- 1. Sinais de Carga (LOAD) -- CORRIGIDO
    loadA <= (not instruction(17)) or (instruction(17) and (not instruction(16)) and instruction(3));
    loadD <= instruction(17) and (instruction(4) or instruction(16));
    loadM <= instruction(17) and (not instruction(16)) and instruction(5);

    -- 2. Seletores de MUX -- CORRIGIDO
    muxALUI_D <= instruction(17) and instruction(16);
    muxALUI_A <= not instruction(17);           -- Inverte saída do bit principal
    muxAM <= instruction(17) and (not instruction(16)) and instruction(13);        -- Bit 'a'/'r0': 0=A, 1=M

    -- 3. Sinais de controle da ULA (Cópia direta dos bits c5-c0)
    zx <= instruction(16) or (instruction(17) and (not instruction(16)) and instruction(12));
    nx <= instruction(17) and (not instruction(16)) and instruction(11);
    zy <= instruction(16) or (instruction(17) and (not instruction(16)) and instruction(10));
    ny <= instruction(17) and (not instruction(16)) and instruction(9);
    f  <= instruction(16) or (instruction(17) and (not instruction(16)) and instruction(8));
    no <= instruction(17) and (not instruction(16)) and instruction(7);
    -- 4. Lógica de Salto (JUMP)
    process(instruction, zr, ng)
    begin
        -- O case statement já está ótimo!
        case instruction(2 downto 0) is
            when "001" => jump_condition <= not zr and not ng;  -- JGT
            when "010" => jump_condition <= zr;                -- JEQ
            when "011" => jump_condition <= not ng;            -- JGE
            when "100" => jump_condition <= ng;                -- JLT
            when "101" => jump_condition <= not zr;            -- JNE
            when "110" => jump_condition <= zr or ng;          -- JLE
            when "111" => jump_condition <= '1';               -- JMP
            when others => jump_condition <= '0';              -- No jump
        end case;
    end process;

    -- O PC carrega se for uma Instrução-C E a condição de salto for verdadeira
    loadPC <= instruction(17) and (not instruction(16)) and jump_condition;

end architecture;
