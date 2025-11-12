; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

; fatorial(n) = n * (n-1) * (n-2) * ... * 1
; resultado = 1
; contador = n
; ENQUANTO contador > 1:
;   resultado = resultado * contador
;   contador = contador - 1


;incializa resultado = 1
leaw $1, %A
movw $1, (%A)

;incializa contador n no R0
leaw $0, %A
movw (%A), %D
;guarda contador n no R2
leaw $2, %A
movw %D, (%A)

LOOP:
leaw $2, %A
movw (%A), %D
leaw $FIM, %A
subw %D, $1, %D
jle %D
nop

;LOOP DA MULTIPLICACAO:
;MULT:
; Inicializa acumulador = 0
; PARA i = contador ATÉ 1:
;   acumulador = acumulador + resultado
; resultado = acumulador

MULT:
movw $0, %A
movw %A, %D
leaw $3, %A
movw %D, (%A)       ; guarda acumulador na memoria 3, acumulador = 0

leaw $2, %A
movw (%A), %D
leaw $4, %A
movw %D, (%A)       ;coloca contador na memoria 4

MULT_LOOP:
leaw $3, %A
movw (%A), %D 
leaw $1, %A
addw (%A), %D, %D

leaw $3, %A
movw %D, (%A) 

leaw $4, %A
movw (%A), %D
decw %D
movw %D, (%A)

leaw $MULT_LOOP, %A
jg %D
nop

leaw $3, %A     ; le o contador final
movw (%A), %D
leaw $1, %A
movw %D, (%A) ; guarda o novo resultado

leaw $2, %A
movw (%A), %D
decw %D
movw %D, (%A)

leaw $LOOP, %A
jmp      ;sempre volta para o loop
nop

FIM: