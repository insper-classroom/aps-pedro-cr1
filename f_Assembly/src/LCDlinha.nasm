; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD

; Configuração inicial
leaw $20, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)       ; R0 = 32 (contador de pixels horizontal)

leaw $1, %A
movw $1, (%A)       ; R1 = 1 (valor para setar pixels)

leaw $17584, %A
movw %A, %D
leaw $2, %A
movw %D, (%A)       ; R2 = 16384 (endereço base do LCD)

LINHA_LOOP:
; Desenha 32 palavras de 16 bits (512 pixels)
leaw $0, %A
movw (%A), %D
leaw $FIM, %A
je %D               ; Se contador = 0, termina
nop

; Escreve 0xFFFF (linha sólida) na posição atual do LCD
leaw $65535, %A     ; 0xFFFF = todos pixels ligados
movw %A, %D
leaw $2, %A
movw (%A), %A       ; Carrega endereço do LCD em A
movw %D, (%A)       ; Escreve 0xFFFF na memória de vídeo

; Incrementa endereço do LCD
leaw $2, %A
movw (%A), %D
incw %D
movw %D, (%A)

; Decrementa contador
leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)

; Volta para o loop
leaw $LINHA_LOOP, %A
jmp
nop

FIM:
; Loop infinito para terminar
leaw $FIM, %A
jmp
nop