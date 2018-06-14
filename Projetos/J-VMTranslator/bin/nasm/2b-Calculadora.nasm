; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 14
; 2 - PUSH constant 2
; 3 - ADD
leaw $SP,%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
addw %S, %D, %S
leaw $SP,%A
leaw %S,(%A)
; 4 - PUSH constant 8
; 5 - PUSH constant 1
; 8 - POP temp 1
; 11 - PUSH constant 0
; 12 - POP local 0
; 13 - PUSH argument 1
; 14 - POP local 1
; 15 - PUSH constant 0
; 16 - PUSH local 1
; 19 - PUSH local 0
; 20 - PUSH argument 0
; 21 - ADD
leaw $SP,%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
addw %S, %D, %S
leaw $SP,%A
leaw %S,(%A)
; 22 - POP local 0
; 23 - PUSH local 1
; 24 - PUSH constant 1
; 26 - POP local 1
; 28 - PUSH local 0
; End
