; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

leaw $LOOP, %A

LOOP:
    ; Soma 1 ao contador:
    leaw $2, %A

    ; D = RAM[2]
    movw (%A), %D
    incw %D
    movw %D, (%A)
    
    ; Realiza a soma:
    leaw $3, %A
    movw (%A), %D
    leaw $0, %A
    addw %D, (%A), %D
    leaw $3, %A
    movw %D, (%A)

    ; Checagem D = RAM[2]
    leaw $2, %A
    movw (%A), %D
    
    leaw $1, %A
    subw %D, (%A), %D
    
    leaw $END, %A
    je %D
    nop

    ; Repete o loop:
    leaw $LOOP, %A
    jmp
    nop


END:


