; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

leaw %R1 , %A
movw (%A),%S

leaw %R0 ,% A
movw (%A),%D

leaw %ADD , %A

jg %S
nop

negw %S

ADD:


  leaw %R1, %A
  movw (%A), (%D)
