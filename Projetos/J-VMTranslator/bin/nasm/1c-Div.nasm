; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 15
leaw $SP, %A
leaw $15, %D
movw %D, (%A)
; 2 - POP temp 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $6, %A
leaw $D, %A
; 3 - PUSH constant 0
leaw $SP, %A
leaw $0, %D
movw %D, (%A)
; 4 - POP temp 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; 5 - PUSH temp 1
; 6 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
; 7 - LTy pral leaw de nani stk pointer
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
jge
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
; 9 - PUSH temp 1
; 10 - PUSH constant 5
leaw $SP, %A
leaw $5, %D
movw %D, (%A)
; 11 - SUB
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
; 12 - POP temp 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $6, %A
leaw $D, %A
; 13 - PUSH temp 0
; 14 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
; 15 - ADD
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
; 16 - POP temp 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; End
