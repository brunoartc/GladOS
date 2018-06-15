; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 14
leaw $SP, %A
leaw $14, %D
movw %D, (%A)
; 2 - PUSH constant 2
leaw $SP, %A
leaw $2, %D
movw %D, (%A)
; 3 - ADD
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
; 4 - PUSH constant 8
leaw $SP, %A
leaw $8, %D
movw %D, (%A)
; 5 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
; 6 - SUB
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
; 7 - POP temp 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $6, %A
leaw $D, %A
; 9 - PUSH constant 0
leaw $SP, %A
leaw $0, %D
movw %D, (%A)
; 10 - POP local 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $0, %A
leaw $D, %A
; 11 - PUSH argument 1
; 12 - POP local 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $1, %A
leaw $D, %A
; 13 - PUSH constant 0
leaw $SP, %A
leaw $0, %D
movw %D, (%A)
; 14 - PUSH local 1
; 15 - EQ
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
; 17 - PUSH local 0
; 18 - PUSH argument 0
; 19 - ADD
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
; 20 - POP local 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $0, %A
leaw $D, %A
; 21 - PUSH local 1
; 22 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
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
; 24 - POP local 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $1, %A
leaw $D, %A
; 26 - PUSH local 0
; End
