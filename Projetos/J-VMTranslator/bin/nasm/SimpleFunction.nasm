; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 1
leaw $SP, %A
leaw $1, %D
movw %D, (%A)
; 2 - PUSH constant 2
leaw $SP, %A
leaw $2, %D
movw %D, (%A)
; 6 - PUSH argument 0
; 7 - PUSH argument 1
; 8 - ADD
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
; End
