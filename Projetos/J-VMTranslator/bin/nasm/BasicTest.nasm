; 0 - PUSH constant 10
leaw $SP, %A
leaw $10, %D
movw %D, (%A)
; 1 - PUSH local 0
; 2 - POP local 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $0, %A
leaw $D, %A
; 3 - PUSH constant 21
leaw $SP, %A
leaw $21, %D
movw %D, (%A)
; 4 - PUSH constant 22
leaw $SP, %A
leaw $22, %D
movw %D, (%A)
; 5 - POP argument 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $4, %A
leaw $D, %A
; 6 - POP argument 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $3, %A
leaw $D, %A
; 7 - PUSH constant 36
leaw $SP, %A
leaw $36, %D
movw %D, (%A)
; 8 - POP this 6
leaw $SP, %A
decw %A
movw (%A), %D
leaw $9, %A
leaw $D, %A
; 9 - PUSH constant 42
leaw $SP, %A
leaw $42, %D
movw %D, (%A)
; 10 - PUSH constant 45
leaw $SP, %A
leaw $45, %D
movw %D, (%A)
; 11 - POP that 5
leaw $SP, %A
decw %A
movw (%A), %D
leaw $9, %A
leaw $D, %A
; 12 - POP that 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $6, %A
leaw $D, %A
; 13 - PUSH constant 510
leaw $SP, %A
leaw $510, %D
movw %D, (%A)
; 14 - POP temp 6
leaw $SP, %A
decw %A
movw (%A), %D
leaw $11, %A
leaw $D, %A
; 15 - PUSH local 0
; 16 - PUSH that 5
; 17 - ADD
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
; 18 - PUSH argument 1
; 19 - SUB
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
; 20 - PUSH this 6
; 21 - PUSH this 6
; 22 - ADD
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
; 23 - SUB
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
; 24 - PUSH temp 6
; 25 - ADD
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
