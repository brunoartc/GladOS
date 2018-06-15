; 0 - POP temp 7
leaw $SP, %A
decw %A
movw (%A), %D
leaw $12, %A
leaw $D, %A
; 1 - POP temp 6
leaw $SP, %A
decw %A
movw (%A), %D
leaw $11, %A
leaw $D, %A
; 2 - POP temp 5
leaw $SP, %A
decw %A
movw (%A), %D
leaw $10, %A
leaw $D, %A
; 3 - POP temp 4
leaw $SP, %A
decw %A
movw (%A), %D
leaw $9, %A
leaw $D, %A
; 4 - POP temp 3
leaw $SP, %A
decw %A
movw (%A), %D
leaw $8, %A
leaw $D, %A
; 5 - POP temp 2
leaw $SP, %A
decw %A
movw (%A), %D
leaw $7, %A
leaw $D, %A
; 6 - POP temp 1
leaw $SP, %A
decw %A
movw (%A), %D
leaw $6, %A
leaw $D, %A
; 7 - POP temp 0
leaw $SP, %A
decw %A
movw (%A), %D
leaw $5, %A
leaw $D, %A
; End
