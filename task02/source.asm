%include "../rw32-2022.inc"

section .data

section .text

CMAIN:
	; Task02 - Máme zadané číslo v registru AL, je potřeba otočit pořadí jednotlivých bitů
	; Např.
	; AL: 01110011b
	; Output: 11001110b
	; Pokud bude AL: 7
	; Output: 224

	mov eax, 0		; Nejdříve vynulujeme registry, kdyby v nich byl nějaký bordel
	mov ebx, 0
	mov al, 01110011b
	call WriteBin8
	call WriteNewLine
	mov cl, 7		; Slouží nám jakožto pomocná proměnná pro ukončení cyklu
cycle:
	shr al, 1		; Shiftujeme doprava do CF, následně zprava do leva rotujeme (přidáváme bity)
				; do registru bl
	rcl bl, 1
	sub cl, 1
	jnc cycle

	mov al, bl		; Chceme-li hodnotu vypsat, je potřeba obsah BL pomocí instrukce mov nahrát do AL
	call WriteBin8
	call WriteNewLine


				; Zde je kód pro decimální čísla, princip je stejný
	mov al, 7
	call WriteUInt8
	call WriteNewLine
	mov cl, 7
cycle2:
	shr al, 1
	rcl bl, 1
	sub cl, 1
	jnc cycle2

	mov al, bl
	call WriteUInt8
	call WriteNewLine

ret
