leaw $RAM[0], %A
movw (%A), %D
leaw $RAM[1], %A
DIVS:
leaw $RAM[1], %A
subw %D,(%A),%D
incw %S
leaw $DIVS, %A
jle
movw %S, ($RAM[2])


























































































