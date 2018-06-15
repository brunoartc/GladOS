; 0 - PUSH constant 17
leaw $SP, %A
leaw $17, %D
movw %D, (%A)
; 1 - PUSH constant 17
leaw $SP, %A
leaw $17, %D
movw %D, (%A)
; 2 - EQ
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jne
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 3 - PUSH constant 17
leaw $SP, %A
leaw $17, %D
movw %D, (%A)
; 4 - PUSH constant 16
leaw $SP, %A
leaw $16, %D
movw %D, (%A)
; 5 - EQ
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jne
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 6 - PUSH constant 16
leaw $SP, %A
leaw $16, %D
movw %D, (%A)
; 7 - PUSH constant 17
leaw $SP, %A
leaw $17, %D
movw %D, (%A)
; 8 - EQ
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jne
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 9 - PUSH constant 892
leaw $SP, %A
leaw $892, %D
movw %D, (%A)
; 10 - PUSH constant 891
leaw $SP, %A
leaw $891, %D
movw %D, (%A)
; 11 - LTy pral leaw de nani stk pointer
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jge
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 12 - PUSH constant 891
leaw $SP, %A
leaw $891, %D
movw %D, (%A)
; 13 - PUSH constant 892
leaw $SP, %A
leaw $892, %D
movw %D, (%A)
; 14 - LTy pral leaw de nani stk pointer
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jge
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 15 - PUSH constant 891
leaw $SP, %A
leaw $891, %D
movw %D, (%A)
; 16 - PUSH constant 891
leaw $SP, %A
leaw $891, %D
movw %D, (%A)
; 17 - LTy pral leaw de nani stk pointer
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jge
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 18 - PUSH constant 32767
leaw $SP, %A
leaw $32767, %D
movw %D, (%A)
; 19 - PUSH constant 32766
leaw $SP, %A
leaw $32766, %D
movw %D, (%A)
; 20 - GT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jle
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 21 - PUSH constant 32766
leaw $SP, %A
leaw $32766, %D
movw %D, (%A)
; 22 - PUSH constant 32767
leaw $SP, %A
leaw $32767, %D
movw %D, (%A)
; 23 - GT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jle
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 24 - PUSH constant 32766
leaw $SP, %A
leaw $32766, %D
movw %D, (%A)
; 25 - PUSH constant 32766
leaw $SP, %A
leaw $32766, %D
movw %D, (%A)
; 26 - GT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %D
leaw $0, %A
movw %A, %S
leaw $14, %A
jle
nop
decw %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 27 - PUSH constant 57
leaw $SP, %A
leaw $57, %D
movw %D, (%A)
; 28 - PUSH constant 31
leaw $SP, %A
leaw $31, %D
movw %D, (%A)
; 29 - PUSH constant 53
leaw $SP, %A
leaw $53, %D
movw %D, (%A)
; 30 - ADD
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
addw %A, %S, %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 31 - PUSH constant 112
leaw $SP, %A
leaw $112, %D
movw %D, (%A)
; 32 - SUB
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
subw %A, %S, %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 33 - NEG
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%D
negw %D
movw %D,(%A)
; 34 - AND
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
andw %A, %S, %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; 35 - PUSH constant 82
leaw $SP, %A
leaw $82, %D
movw %D, (%A)
; 36 - OR
leaw $SP, %A
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%D
movw %D,%A
orw %A, %S, %S
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%D
decw %A
movw %S,(%A)
leaw $SP,%A
movw %D,(%A)
; End
