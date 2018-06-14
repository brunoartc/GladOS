; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 5
; 2 - PUSH constant 9
; 3 - ADD
leaw $SP,%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
addw %S, %D, %S
leaw $SP,%A
leaw %S,(%A)
; 4 - POP temp 0
; End
