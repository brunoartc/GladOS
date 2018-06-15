; 0 - POP this 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $3, %A
leaw $D, %A
; 1 - POP this 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $4, %A
leaw $D, %A
; 2 - POP this 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; End
