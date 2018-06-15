; 0 - PUSH constant 0
leaw $SP, %A
leaw $0, %D
movw %D, (%A)
; 1 - POP temp 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; 2 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
; 3 - POP temp 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $6, %A
leaw $D, %A
; 4 - PUSH temp 0
; 5 - PUSH constant 10
leaw $SP, %A
leaw $10, %D
movw %D, (%A)
; 6 - EQ
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jne
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 8 - PUSH temp 0
; 9 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
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
; 11 - POP temp 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; 12 - PUSH temp 1
; 13 - PUSH temp 1
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
; 15 - POP temp 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $6, %A
leaw $D, %A
; End
