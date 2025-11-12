; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

; Inicializa quociente = 0
leaw $2, %A
movw $0, (%A)

; Carrega R0 (dividendo) em R3
leaw $0, %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)

; Carrega R1 (divisor) em R4
leaw $1, %A
movw (%A), %D
leaw $4, %A
movw %D, (%A)

LOOP:
; Verifica se R3 (dividendo atual) >= R4 (divisor)
leaw $3, %A
movw (%A), %D
leaw $4, %A
subw %D, (%A), %D

; Se R3 - R4 < 0, vai para FIM
leaw $FIM, %A
jl %D
nop

; Subtrai divisor do dividendo: R3 = R3 - R4
leaw $3, %A
movw (%A), %D
leaw $4, %A
subw %D, (%A), %D
leaw $3, %A
movw %D, (%A)

; Incrementa quociente: R2 = R2 + 1
leaw $2, %A
movw (%A), %D
incw %D
movw %D, (%A)

; Volta para LOOP
leaw $LOOP, %A
jmp
nop

FIM: