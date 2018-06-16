; Inicialização para VM
leaw $Main.main, %A
jmp
nop
leaw $123,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
incw %A
movw %A,%D
leaw %SP,%A
movw %D,(%A)
leaw $23,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
incw %A
movw %A,%D
leaw %SP,%A
movw %D,(%A)
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
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
leaw $5,%A
movw %A,%D
leaw $0,%A
addw %A,%D,%A
movw %S,(%A)
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
; End
