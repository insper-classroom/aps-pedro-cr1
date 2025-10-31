; Arquivo: SWeLED2.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF
;
;                                ^            ^
;                                | TRUQUE!    | TRUQUE!

; inicializa acumulador em RAM[0] = 0
leaw $0, %A
movw $0, %D
movw %D, (%A)

; ----- SW[8] (bit 8 -> 256) -----
leaw $21185, %A
movw (%A), %D        ; D = switches
leaw $256, %A        ; máscara 256 em %A 
andw %A, %D, %D      ; D = D & 256  -> D = 256 ou 0
leaw $0, %A
movw (%A), %A        ; A = acumulador (RAM[0])
orw %D, %A, %D       ; D = acumulador | SW8bit
leaw $0, %A
movw %D, (%A)        ; RAM[0] = D

; ----- !SW[7] (bit 7 -> 128 quando SW7=0) -----
leaw $21185, %A
movw (%A), %D        ; D = switches
leaw $128, %A        ; máscara 128
andw %A, %D, %D      ; D = SW7bit (0 ou 128)
leaw $128, %A
subw %A, %D, %D      ; D = 128 - SW7bit -> 128 se SW7==0, 0 se SW7==128
leaw $0, %A
movw (%A), %A
orw %D, %A, %D
leaw $0, %A
movw %D, (%A)

; ----- ligar bits fixos ON: bit5 (32), bit4 (16), bit2 (4) -----
leaw $0, %A
movw (%A), %D        ; D = acumulador
leaw $32, %A
orw %A, %D, %D       ; D |= 32
leaw $16, %A
orw %A, %D, %D       ; D |= 16
leaw $4, %A
orw %A, %D, %D       ; D |= 4
leaw $0, %A
movw %D, (%A)

        ; ----- RAM[5][3] (bit3 -> 8) -----
leaw $5, %A
movw (%A), %D        ; D = RAM[5]
leaw $8, %A
andw %A, %D, %D      ; D = bit3 (0 ou 8)
leaw $0, %A
movw (%A), %A
orw %D, %A, %D
leaw $0, %A
movw %D, (%A)

; ----- SW[0] (bit0 -> precisa ir para bit1 (valor 2)) -----
leaw $21185, %A
movw (%A), %D        ; D = switches
leaw $1, %A
andw %A, %D, %D      ; D = SW0 (0 ou 1)

; guarda SW0 temporariamente em RAM[1]
leaw $1, %A
movw %D, (%A)        ; RAM[1] = SW0 (0 ou 1)

; dobra RAM[1] --> RAM[1] = 2 * SW0 (0 ou 2)
leaw $1, %A
addw (%A), %D, %D    ; D = SW0 + RAM[1] = SW0 + SW0 = 0 ou 2
leaw $1, %A
movw %D, (%A)        ; RAM[1] = 0 ou 2

; soma RAM[1] ao acumulador em RAM[0]
leaw $0, %A
movw (%A), %D        ; D = acumulador (RAM[0])
leaw $1, %A
addw (%A), %D, %D    ; D = acumulador + RAM[1]
leaw $0, %A
movw %D, (%A)        ; grava de volta em RAM[0]

; ----- escreve acumulador final em RAM[21184] (LEDs) -----
leaw $0, %A
movw (%A), %D        ; D = acumulador final
leaw $21184, %A
movw %D, (%A)        ; RAM[21184] = LEDs