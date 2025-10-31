; Code starts here

leaw $1, %A 

movw (%A),%D

leaw $0 , %A

subw %D ,(%A) , %D

leaw $2 , %A

movw %D , (%A)
