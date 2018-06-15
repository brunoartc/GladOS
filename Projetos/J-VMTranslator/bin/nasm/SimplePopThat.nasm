; 0 - POP that 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $4, %A
leaw $D, %A
; 1 - POP that 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; 2 - POP that 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $6, %A
leaw $D, %A
; End
