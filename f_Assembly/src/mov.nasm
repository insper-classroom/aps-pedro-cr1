; Code starts here
leaw $0,%A ;  registardor a = 0

movw (%A),%D ; registrador d = ram[0]

leaw $5 ,%A   ;  registrador a = 5

movw %D , (%A) ; ram[0] = ram[5]

leaw $1 ,%A  ; registrador a = 1 

movw (%A) , %D ; registrador d = ram[1] 

leaw $0 ,%A ; registrador a = 0 

movw %D , (%A); ram[0]= ram[1]

leaw $5 ,%A   ;  registrador a = 5

movw  (%A) , %D ; registrador d = ram[5]

leaw $1 ,%A ; registrador a = 1 

movw %D , (%A) ;ram[1]= ram[5]

movw $1 , %D ; registrador d = 1

leaw $3 , %A ; registrador a = 3

movw %D , (%A) ; ram[3] =1
