; 0 - PUSH constant 5
leaw $SP, %A
leaw $5, %D
movw %D, (%A)
; 1 - PUSH constant 9
leaw $SP, %A
leaw $9, %D
movw %D, (%A)
; 2 - ADD
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
