    ; Arquivo: mult_SW.nasm
    ; Curso: Elementos de Sistemas
    ; Criado por: Renan Trevisoli
    ; Data: 16/04/25
    ;
    ; Realiza a multiplicação SW(9 downto 5)*SW(4 downto 0)
    ; e mostra o resultado nos LEDs
    ; exemplo: "0101100110" => 0d11*0d6 => 0d66 => "0001000010"

    ; 1. Pega SW(4-0) - multiplicador
    leaw $21185, %A
    movw (%A), %D
    leaw $31, %A
    andw %A, %D, %D
    leaw $0, %A
    movw %D, (%A)      ; RAM[0] = multiplicador

    ; 2. Pega SW(9-5) - método direto
    leaw $21185, %A
    movw (%A), %D      ; D = SW completo

    ; Extrai bits 9-5 manualmente
    leaw $0, %A
    movw %A, %D        ; D = 0 (resultado temporário)
    leaw $4, %A
    movw %D, (%A)      ; RAM[4] = resultado temporário

    ; Bit 9 (512) - adiciona 16 se setado
    leaw $21185, %A
    movw (%A), %D
    leaw $512, %A
    andw %A, %D, %D
    leaw $SKIP9, %A
    je %D
    nop
    leaw $4, %A
    movw (%A), %D
    leaw $16, %A
    addw %A, %D, %D
    leaw $4, %A
    movw %D, (%A)
    SKIP9:

    ; Bit 8 (256) - adiciona 8 se setado
    leaw $21185, %A
    movw (%A), %D
    leaw $256, %A
    andw %A, %D, %D
    leaw $SKIP8, %A
    je %D
    nop
    leaw $4, %A
    movw (%A), %D
    leaw $8, %A
    addw %A, %D, %D
    leaw $4, %A
    movw %D, (%A)
    SKIP8:

    ; Bit 7 (128) - adiciona 4 se setado
    leaw $21185, %A
    movw (%A), %D
    leaw $128, %A
    andw %A, %D, %D
    leaw $SKIP7, %A
    je %D
    nop
    leaw $4, %A
    movw (%A), %D
    leaw $4, %A
    addw %A, %D, %D
    leaw $4, %A
    movw %D, (%A)
    SKIP7:

    ; Bit 6 (64) - adiciona 2 se setado
    leaw $21185, %A
    movw (%A), %D
    leaw $64, %A
    andw %A, %D, %D
    leaw $SKIP6, %A
    je %D
    nop
    leaw $4, %A
    movw (%A), %D
    leaw $2, %A
    addw %A, %D, %D
    leaw $4, %A
    movw %D, (%A)
    SKIP6:

    ; Bit 5 (32) - adiciona 1 se setado
    leaw $21185, %A
    movw (%A), %D
    leaw $32, %A
    andw %A, %D, %D
    leaw $SKIP5, %A
    je %D
    nop
    leaw $4, %A
    movw (%A), %D
    leaw $1, %A
    addw %A, %D, %D
    leaw $4, %A
    movw %D, (%A)
    SKIP5:

    ; Agora RAM[4] contém SW(9-5)
    leaw $4, %A
    movw (%A), %D
    leaw $1, %A
    movw %D, (%A)      ; RAM[1] = multiplicando

    ; 3. Inicializa resultado = 0
    leaw $0, %A
    movw %A, %D
    leaw $2, %A
    movw %D, (%A)      ; RAM[2] = resultado

    ; 4. Loop de multiplicação
    LOOP:
    leaw $0, %A
    movw (%A), %D
    leaw $END, %A
    je %D
    nop

    leaw $1, %A
    movw (%A), %D
    leaw $2, %A
    addw (%A), %D, %D
    movw %D, (%A)

    leaw $0, %A
    movw (%A), %D
    decw %D
    movw %D, (%A)

    leaw $LOOP, %A
    jmp
    nop

    END:
    leaw $2, %A
    movw (%A), %D
    leaw $21184, %A
    movw %D, (%A)