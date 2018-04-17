; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01

; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros

leaw $INI, %A
jmp

RUM:
leaw $R0, %A
movw (%A), %R2
leaw $ENDE, %A
jmp

RDOIS:
leaw $R1, %A
movw (%A), %R2
leaw $ENDE, %A
jmp


INI:
leaw $R0, %A
movw (%A), %D
leaw $R1, %A

subw %D,(%A),%D

leaw $RUM, %A

jg %D

leaw $RDOIS, %A

jle %D

ENDE:
nop
