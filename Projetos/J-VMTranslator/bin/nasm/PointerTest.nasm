; 0 - PUSH constant 3030
leaw $SP, %A
leaw $3030, %D
movw %D, (%A)
; 1 - POP pointer 0
; 2 - PUSH constant 3040
leaw $SP, %A
leaw $3040, %D
movw %D, (%A)
; 3 - POP pointer 1
; 4 - PUSH constant 32
leaw $SP, %A
leaw $32, %D
movw %D, (%A)
; 5 - POP this 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; 6 - PUSH constant 46
leaw $SP, %A
leaw $46, %D
movw %D, (%A)
; 7 - POP that 6
leaw $SP, %A
decw %A
movw (%A), %D
leaw $10, %A
leaw $D, %A
; 8 - PUSH pointer 0
; 9 - PUSH pointer 1
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
; 11 - PUSH this 2
; 12 - SUB
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
; 13 - PUSH that 6
; 14 - ADD
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
