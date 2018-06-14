; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 3
; 2 - PUSH constant 3
; 4 - POP temp 2
; 7 - PUSH constant 0
; 8 - POP local 0
; 9 - PUSH argument 1
; 10 - POP local 1
; 11 - PUSH constant 0
; 12 - PUSH local 1
; 15 - PUSH local 0
; 16 - PUSH argument 0
; 17 - ADD
; 18 - POP local 0
; 19 - PUSH local 1
; 20 - PUSH constant 1
; 22 - POP local 1
; 24 - PUSH local 0
; 27 - PUSH argument 0
; 28 - POP local 0
; 29 - PUSH argument 1
; 30 - POP local 1
; 31 - PUSH argument 0
; 32 - POP local 2
; 33 - PUSH local 1
; 34 - PUSH constant 1
; 37 - PUSH local 0
; 38 - PUSH local 2
; 40 - POP local 2
; 41 - PUSH local 1
; 42 - PUSH constant 1
; 44 - POP local 1
; 46 - PUSH local 2
; End
