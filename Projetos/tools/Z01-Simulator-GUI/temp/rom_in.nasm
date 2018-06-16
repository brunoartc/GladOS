leaw $R0, %A
movw (%A), %D
decw %D
leaw $R1, %A
movw %D, (%A) ; Finish Memory Setup
leaw $R0, %A
movw (%A), %S
leaw $R1, %A
movw (%A), %D
decw %D
leaw $R0, %A ; Jump here to multiply
movw (%A), %A
addw %A, %S, %S
decw %D
leaw $10, %A
jg
nop
leaw $R0, %A
movw %S, (%A)
leaw $R1, %A
movw (%A), %D
decw %D
decw %D
leaw $29
je
nop
incw %D
leaw $R1, %A
movw %D, (%A)
leaw $5, %A
jg
nop
leaw $R0, %A
movw (%A), %D
leaw $39, %A
jne
nop
leaw $1,%A
movw %A, %D
leaw R1, %A
movw %D, (%A)








































































































































































































