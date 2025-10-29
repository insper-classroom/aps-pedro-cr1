; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


leaw $1, %A
movw (%A), %D

leaw $2, %A
movw %D, (%A)

leaw $3, %A
movw $0, (%A)

LOOP:
leaw $2, %A
movw (%A), %D

leaw $END, %A
je %D
nop

leaw $1, %A
movw (%A), %D
leaw $3, %A
addw (%A), %D, (%A)

leaw $2, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)

leaw $LOOP, %A
jmp
nop

END:
leaw $3, %A
movw (%A), %D
leaw $0, %A
movw %D, (%A)