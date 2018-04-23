; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

leaw $R1, %A
movw (%A), %D   ; D=RAM(%A)
movw (%A), %S   ; S=RAM(%A)
decw %D
leaw $R1, %A
decw %D         ; diminui D em 1
addw (%A), %S, %S ; soma A com S e salva em R3
leaw $R4, %A ; recomeça o while
jg
nop

leaw $R0,%A
movw %S, (%A) ; R0=S
