; 0 - PUSH constant 5
leaw $SP, %A
leaw $5, %D
movw %D, (%A)
; 1 - PUSH constant 9
leaw $SP, %A
leaw $9, %D
movw %D, (%A)
; End
