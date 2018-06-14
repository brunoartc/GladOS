; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 15
; 2 - POP temp 1
; 3 - PUSH constant 0
; 4 - POP temp 0
; 5 - PUSH temp 1
; 6 - PUSH constant 1
; 9 - PUSH temp 1
; 10 - PUSH constant 5
; 12 - POP temp 1
; 13 - PUSH temp 0
; 14 - PUSH constant 1
; 15 - ADD
leaw $SP,%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
addw %S, %D, %S
leaw $SP,%A
leaw %S,(%A)
; 16 - POP temp 0
; End
