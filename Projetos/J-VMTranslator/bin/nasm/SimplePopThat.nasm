; 0 - POP that 0
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
leaw $THAT,%A
movw (%A),%A
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
; 1 - POP that 1
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
leaw $THAT,%A
movw (%A),%A
movw %A,%D
leaw $1,%A
addw %A,%D,%A
movw %S,(%A)
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
; 2 - POP that 2
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
leaw $THAT,%A
movw (%A),%A
movw %A,%D
leaw $2,%A
addw %A,%D,%A
movw %S,(%A)
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
; End