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
; 4 - PUSH constant 123
; 5 - PUSH constant 1
; 8 - POP temp 0
; End
