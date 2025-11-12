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

; Adiciona RAM[1] ao acumulador RAM[3]
leaw $1, %A
movw (%A), %D
leaw $3, %A
addw (%A), %D, (%A)

; Decrementa o contador RAM[2]
leaw $2, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)

leaw $LOOP, %A
jmp            
nop

END:
; Copia o resultado de RAM[3] para RAM[0]
leaw $3, %A
movw (%A), %D
leaw $0, %A
movw %D, (%A)
