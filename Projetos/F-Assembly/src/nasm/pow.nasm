leaw $R1, %A
movw (%A), %S
movw (%A), %D
decw %D
leaw $R1, %A
movw (%A), %A
addw %A, %S, %S
decw %D
leaw $4, %A
jg
nop
leaw $R0, %A
movw %S, (%A)