; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

leaw $R1, %A
movw (%A),%S  ; S=R1
leaw $R0, %A
movw (%A),%D  ; D=R0


leaw $R0,%A
movw %S, (%A) ; R0=S
leaw $R1,%A
movw %D, (%A) ; R1=D


leaw $1, %A
movw %A, %S   ; S=1
leaw $R3,%A
movw %S, (%A) ; R3=S