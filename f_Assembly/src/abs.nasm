leaw $1, %A ; registrador a = 1 

movw (%A) , %D ;  d = ram[1]

leaw $END , %A ;  pular pra ca se a condicao for verdadeira

jge %D  ; conidcao d>=0 

nop

negw %D 

leaw $0, %A  ; registrador a = 0
movw %D, (%A)  ; ram[0] = d


END:
leaw $0, %A 
movw %D, (%A) 
