; Arquivo: palindromo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se uma palavra salva na memória
; é um palíndromo ou não. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.
; 
; A palavra possui tamanho fixo de 5 caracteres,
; começando no endereço 10 da RAM e terminando no
; endereço 14 da RAM. A palavra é codificado em
; ASCII.

; exemplo:
;  RAM[10] = a
;  RAM[11] = r
;  RAM[12] = a
;  RAM[13] = r
;  RAM[14] = a

; INICIALIZAÇÃO
leaw $0, %A
movw $1, (%A)           ; Assume que é palíndromo (RAM[0] = 1)

; CONFIGURAÇÃO DOS PONTEIROS
leaw $10, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)           ; RAM[1] = 10 (ponteiro esquerda)

leaw $14, %A
movw %A, %D
leaw $2, %A
movw %D, (%A)           ; RAM[2] = 14 (ponteiro direita)

; LOOP PRINCIPAL - COMPARA OS EXTREMOS
LOOP:
; Carrega caractere da ESQUERDA
leaw $1, %A
movw (%A), %A           ; %A = endereço esquerda
movw (%A), %D           ; %D = RAM[esquerda]

; Carrega caractere da DIREITA e compara
leaw $2, %A
movw (%A), %A           ; %A = endereço direita
subw %D, (%A), %D       ; %D = RAM[esquerda] - RAM[direita]

; Se diferentes, NÃO é palíndromo
leaw $NAO_PALINDROMO, %A
jne %D
nop

; ATUALIZA PONTEIROS
; Avança ponteiro ESQUERDA
leaw $1, %A
movw (%A), %D
incw %D
movw %D, (%A)

; Recua ponteiro DIREITA
leaw $2, %A
movw (%A), %D
decw %D
movw %D, (%A)

; VERIFICA SE TERMINOU
; Se esquerda >= direita, terminou
leaw $1, %A
movw (%A), %D           ; %D = esquerda
leaw $2, %A
subw %D, (%A), %D       ; %D = esquerda - direita
leaw $FIM, %A
jge %D                  ; Se esquerda >= direita, vai para FIM
nop

; Continua loop
leaw $LOOP, %A
jmp
nop

; NÃO É PALÍNDROMO
NAO_PALINDROMO:
leaw $0, %A
movw $0, (%A)           ; RAM[0] = 0

; FIM DO PROGRAMA
FIM: