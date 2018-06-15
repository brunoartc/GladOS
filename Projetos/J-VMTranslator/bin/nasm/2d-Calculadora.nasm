; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 3
leaw $SP, %A
leaw $3, %D
movw %D, (%A)
; 2 - PUSH constant 3
leaw $SP, %A
leaw $3, %D
movw %D, (%A)
; 4 - POP temp 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $7, %A
leaw $D, %A
; 6 - PUSH constant 0
leaw $SP, %A
leaw $0, %D
movw %D, (%A)
; 7 - POP local 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $0, %A
leaw $D, %A
; 8 - PUSH argument 1
; 9 - POP local 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $1, %A
leaw $D, %A
; 10 - PUSH constant 0
leaw $SP, %A
leaw $0, %D
movw %D, (%A)
; 11 - PUSH local 1
; 12 - EQ
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
; 14 - PUSH local 0
; 15 - PUSH argument 0
; 16 - ADD
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
; 17 - POP local 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $0, %A
leaw $D, %A
; 18 - PUSH local 1
; 19 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
; 20 - SUB
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
; 21 - POP local 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $1, %A
leaw $D, %A
; 23 - PUSH local 0
; 26 - PUSH argument 0
; 27 - POP local 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $0, %A
leaw $D, %A
; 28 - PUSH argument 1
; 29 - POP local 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $1, %A
leaw $D, %A
; 30 - PUSH argument 0
; 31 - POP local 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $2, %A
leaw $D, %A
; 32 - PUSH local 1
; 33 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
; 34 - EQ
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
; 36 - PUSH local 0
; 37 - PUSH local 2
; 38 - POP local 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $2, %A
leaw $D, %A
; 39 - PUSH local 1
; 40 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
; 41 - SUB
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
; 42 - POP local 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $1, %A
leaw $D, %A
; 44 - PUSH local 2
; End
