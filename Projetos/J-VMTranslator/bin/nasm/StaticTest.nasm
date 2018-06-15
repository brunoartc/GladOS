; 0 - PUSH constant 111
leaw $SP, %A
leaw $111, %D
movw %D, (%A)
; 1 - PUSH constant 333
leaw $SP, %A
leaw $333, %D
movw %D, (%A)
; 2 - PUSH constant 888
leaw $SP, %A
leaw $888, %D
movw %D, (%A)
; 3 - POP static 8
leaw $SP, %A
decw %A
movw (%A), %D
leaw $24, %A
leaw $D, %A
; 4 - POP static 3
leaw $SP, %A
decw %A
movw (%A), %D
leaw $19, %A
leaw $D, %A
; 5 - POP static 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $17, %A
leaw $D, %A
; 6 - PUSH static 3
; 7 - PUSH static 1
; 8 - SUB
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 9 - PUSH static 8
; 10 - ADD
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
addw %A, %S, %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; End
