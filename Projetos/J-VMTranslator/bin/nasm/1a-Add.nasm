; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 123
leaw $SP, %A
leaw $123, %D
movw %D, (%A)
; 2 - PUSH constant 23
leaw $SP, %A
leaw $23, %D
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
; 4 - POP temp 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; End
