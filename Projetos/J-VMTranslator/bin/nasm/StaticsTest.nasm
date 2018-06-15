; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH argument 0
; 2 - POP static 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $16, %A
leaw $D, %A
; 3 - PUSH argument 1
; 4 - POP static 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $17, %A
leaw $D, %A
; 5 - PUSH constant 0
leaw $SP, %A
leaw $0, %D
movw %D, (%A)
; 8 - PUSH static 0
; 9 - PUSH static 1
; 10 - SUB
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
; 13 - PUSH argument 0
; 14 - POP static 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $16, %A
leaw $D, %A
; 15 - PUSH argument 1
; 16 - POP static 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $17, %A
leaw $D, %A
; 17 - PUSH constant 0
leaw $SP, %A
leaw $0, %D
movw %D, (%A)
; 20 - PUSH static 0
; 21 - PUSH static 1
; 22 - SUB
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
; 25 - PUSH constant 6
leaw $SP, %A
leaw $6, %D
movw %D, (%A)
; 26 - PUSH constant 8
leaw $SP, %A
leaw $8, %D
movw %D, (%A)
; 28 - POP temp 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; 29 - PUSH constant 23
leaw $SP, %A
leaw $23, %D
movw %D, (%A)
; 30 - PUSH constant 15
leaw $SP, %A
leaw $15, %D
movw %D, (%A)
; 32 - POP temp 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; End
