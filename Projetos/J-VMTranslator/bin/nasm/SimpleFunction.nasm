; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 1
leaw $SP,%A
movw (%A),%A
incw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
leaw $1,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
decw %A
movw %D,(%A)
; 2 - PUSH constant 2
leaw $SP,%A
movw (%A),%A
incw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
leaw $2,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
decw %A
movw %D,(%A)
; 6 - PUSH argument 0
leaw $ARG,%A
movw (%A),%A
movw %A,%D
leaw $0,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%A
incw %A
movw %A,%S
leaw $SP,%A
movw %S,(%A)
; 7 - PUSH argument 1
leaw $ARG,%A
movw (%A),%A
movw %A,%D
leaw $1,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%A
incw %A
movw %A,%S
leaw $SP,%A
movw %S,(%A)
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
