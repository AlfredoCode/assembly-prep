%include "../rw32-2022.inc"


section .data
	a db 4
	b db 26
	c dw 2
	d dd 5
section .text

CMAIN:
	xor eax, eax
	mov al, [a]
	call WriteInt8
	call WriteNewLine


	add al, [b]
	call WriteInt8
	call WriteNewLine

	cbw

	call WriteInt16
	call WriteNewLine

	imul word[c]

	call WriteInt16
	call WriteNewLine

	sub ax, 42
	call WriteInt16
	call WriteNewLine

	cwde
	cdq

	idiv dword [d]
	call WriteInt32
	call WriteNewLine


ret
