; 0 - GT
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
jle
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