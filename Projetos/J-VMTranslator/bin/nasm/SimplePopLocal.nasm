; 0 - POP local 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $0, %A
leaw $D, %A
; 1 - POP local 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $1, %A
leaw $D, %A
; 2 - POP local 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $2, %A
leaw $D, %A
; End
