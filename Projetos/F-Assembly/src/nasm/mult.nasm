; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

leaw $0, %A
mowv (%A), %S   ; S=RAM(%A)
leaw $1, %A
mowv (%A), %D   ; D=RAM(%A)

WHILE:          ; while D not 0
leaw $END, %A
je %D           ; termina o while se D=0
nop

leaw $3, %A
leaw (%A), %A
addw %A, %S, R3 ; soma A com S e salva em R3
decw %D         ; diminui D em 1
leaw $WHILE, %A ; recomeça o while
jmp
nop

END:
