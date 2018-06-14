; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 7
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
; 4 - PUSH constant 3
; 8 - PUSH constant 0
; 9 - POP local 0
; 10 - PUSH argument 1
; 11 - POP local 1
; 12 - PUSH constant 0
; 13 - PUSH local 1
; 16 - PUSH local 0
; 17 - PUSH argument 0
; 18 - ADD
leaw $SP,%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
addw %S, %D, %S
leaw $SP,%A
leaw %S,(%A)
; 19 - POP local 0
; 20 - PUSH local 1
; 21 - PUSH constant 1
; 23 - POP local 1
; 25 - PUSH local 0
; End
