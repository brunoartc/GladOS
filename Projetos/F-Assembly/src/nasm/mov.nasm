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

;RAM[0]=RAM[1]
leaw $1, %A ; A=1
movw (%A),$S; S=RAM(%A)
leaw $0,%A ; A=0
movw %S, (%A) ; RAM(%A)=S

;RAM[1]=RAM[0]
leaw $1, %A ; A=0
movw (%A),$S; S=RAM(%A)
leaw $0,%A ; A=1
movw %S, (%A) ; RAM(%A)=S

;RAM[3]=1

leaw $3, %A ; A=3
leaw $1, (%A) ; RAM(%A)=1
