; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; Adicione o valor de RAM[1] com RAM[0] gravando em RAM[2].


leaw $0, %A      ; %A = 0
movw (%A), %D    ; %D = RAM[0]
leaw $1, %A      ; %A = 1
addw %D, (%A), %D ; %D = %D + RAM[1]
leaw $2, %A      ; %A = 2
movw %D, (%A)    ; RAM[2] = %D