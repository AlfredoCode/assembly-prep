%include "../rw32-2022.inc"

section .data


section .text
CMAIN:
	; Task03 - Máme zadáno číslo v registru EAX, musíme otočit pořadí bajtů AA, BB, CC, DD v registru EAX
	; Např.
	; EAX: 0xDDCCBBAA
	; Output: 0xAABBCCDD
	; Lze využít instrukce rol, ror, xchg

	mov eax, 0xDDCCBBAA
	call WriteHex32
	call WriteNewLine

	xchg al, ah		; Pomocí XCHG prohodíme obsah registrů AL a AH ---> EAX: DDCCAABB
	rol eax, 16		; Abych dostali na MSB AA, je potřeba rotovat celým registrem o 16 bitů (2 Bajty)
				; Tím nám vznikne EAX: AABBDDCC
	xchg al, ah		; A již zbývá pouze znovu prohodit obsah registrů AL a AH ---> EAX: AABBCCDD
	call WriteHex32
	call WriteNewLine

ret
