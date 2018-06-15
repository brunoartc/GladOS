; 0 - POP pointer 0
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
leaw $THIS,%A
movw %S,(%A)
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
; 1 - POP pointer 1
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
leaw $THAT,%A
movw %S,(%A)
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
; End
