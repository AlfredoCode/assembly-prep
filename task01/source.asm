%include "../rw32-2022.inc"

section .data

section .text
CMAIN:
	; Task01 - Načtěte číslo do registru AX (UInt16)
	; Vypiště počet jedničkových bitů daného čísla

	; Např:
	; Zadané číslo: 11 (1011b)
	; Output: 3
	; Zadané číslo: 2 (0010)
	; Output: 1

	; Využijte instrukcí shr, adc, and

	mov ebx, 0

	call ReadUInt16 		; Vypíše se i návod, lze též využít call ReadUInt16_Silent
	call WriteNewLine
	call WriteBin16
	call WriteNewLine
	mov cl, 15
for:
	shr ax, 1		; Budeme shiftovat všechny bity o 1 doprava, ty se budou shiftovat do CF
	adc bl, 0		; Nyní využijeme instrukce adc, která k 0 přičte CF a výsledek uloží do BL
	sub cl, 1		; Jelikož potřebujeme instrukce výše zopakovat pro všech 16 bitů, potřebujeme
				; vytvořit cyklus, který se vykoná 16x (0 - 15), toho docílíme např. tím,
				; že si do registru cl uložíme číslo 15 a v cyklu postupně odečítáme 1
				; do té doby, dokud se nenaskytne CF --> Poté cyklus opouštíme
	jnc for 

	mov al, bl		; Jelikož chceme výsledný počet bitů s hodnotou 1 vypsat, přesuneme obsah BL do AL a vypíšeme
	call WriteInt8
	call WriteNewLine
ret
