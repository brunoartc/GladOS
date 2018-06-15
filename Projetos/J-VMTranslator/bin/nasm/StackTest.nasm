; 0 - PUSH constant 17
leaw $SP,%A
movw (%A),%A
incw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
leaw $17,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
decw %A
movw %D,(%A)
; 1 - PUSH constant 17
leaw $SP,%A
movw (%A),%A
incw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
leaw $17,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
decw %A
movw %D,(%A)
; 2 - PUSH constant 17
leaw $SP,%A
movw (%A),%A
incw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
leaw $17,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
decw %A
movw %D,(%A)
; 3 - PUSH constant 16
leaw $SP,%A
movw (%A),%A
incw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
leaw $16,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
decw %A
movw %D,(%A)
; 4 - EQ
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jne
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; End
