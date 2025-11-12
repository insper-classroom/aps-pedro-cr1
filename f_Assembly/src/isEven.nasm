; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

; Carrega RAM[5] em D
leaw $5, %A
movw (%A), %D

; Faz AND com 1 para verificar o bit menos significativo
leaw $1, %A
andw %D, %A, %D

; Se resultado != 0 (ímpar), vai para IMPAR
leaw $IMPAR, %A
jne %D
nop

; Se par, salva 1 em RAM[0]
leaw $1, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $FIM, %A
jmp
nop

IMPAR:
; Se ímpar, salva 0 em RAM[0]
leaw $0, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

FIM: