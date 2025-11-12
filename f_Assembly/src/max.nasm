; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01
;
; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros

; Copia R0 para R2 (valor provisório)
leaw $0, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)

; Compara R1 com R2 (que tem valor de R0)
leaw $1, %A
movw (%A), %D
leaw $2, %A
subw %D, (%A), %D

; Se R1 <= R2, vai para FIM (R2 já tem o maior valor)
leaw $FIM, %A
jle %D
nop

; Se R1 > R2, copia R1 para R2
leaw $1, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)

FIM: