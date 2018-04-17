leaw $R0, %A
movw (%A), %D
leaw $R1, %A
DIVS:
leaw $R1, %A
subw %D,(%A),%D
incw %S
leaw $DIVS, %A
jle
movw %S, ($R2)


























































































