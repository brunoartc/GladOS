leaw $R0, %A
movw (%A), %S   ; S=RAM(%A)
leaw $R1, %A
movw (%A), %D   ; D=RAM(%A)
WHILE:          ; while D not 0
leaw $END, %A
jle %D          ; termina o while se D=0
nop
leaw $R0, %A
movw (%A), %S   ; S=RAM(%A)
leaw $R3, %A
addw (%A), %S, %S ; soma A com S e salva em R3
leaw $R3,%A
movw %S, (%A) ; R0=S
decw %D         ; diminui D em 1
leaw $WHILE, %A ; recomeça o while
jmp
nop
END:
nop
