leaw $R1, %A
movw (%A), %S
leaw $R0, %A
movw (%A), %D
decw %D
leaw $R1, %A
movw (%A), %A
addw %A, %S, %S
decw %D
leaw $5, %A
jg
nop
leaw $R2, %A
movw %S, (%A)