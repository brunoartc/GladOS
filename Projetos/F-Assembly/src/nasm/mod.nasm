; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide o número posicionado na RAM[1] pelo número posicionado no RAM[2] e armazena o resultado na RAM[0].

leaw $R1 , %A
movw (%A), %S


WHILE:

movw %S,%D

leaw $R2, %A
subw %S,(%A),%S

leaw $WHILE, %A

jge %S
nop

leaw $0,%A
movw %D,(%A)
