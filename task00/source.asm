%include "../rw32-2022.inc"

section .data

	pole_1 dw 1,2,3,-420,5,6,7,8
	pole_2 dd 1,2,3,0,5,6,7,8
section .text

CMAIN:
	; Task00 - Řekněme, že máme 2 pole
	; pole_1 dw ?,?,?,?,?,?,?,?
	; pole2_ dd ?,?,?,?,?,?,?,?

	; Je potřeba znaménkově sečíst čtvrtý a šestý prvek pole_1 a výsledek uložit na čtvrtou pozici pole_2
	; !!! Pozor na indexy, začínající od 0 !!!

	; Např. 
	; pole_1 dw 1,2,3,-420,5,6,7,8
	; pole_2 dd 1,2,3,0,5,6,7,8
	; Po úpravách očekáváme v pole_2 následující hodnoty: 1,2,3,-414,5,6,7,8


	mov ax, [pole_1+2*3]	; pole_1 ukazuje na začátek pole_1. Víme, že dw = 16bit --> každá hodnota v poli
				; je tedy ukládána 16bity(2 bajty), chceme-li získat index jinačího prvku,
				; než-li 1. musíme k pole_1 přičíst 'offset' ---> 2*N-1, kde N je index hledaného prvku,
				; počítaný od 0
	add ax, [pole_1+2*5]
	
	cwde			; Jelikož chceme 16bit výsledek uložit do 32bit místa v paměti, je potřeba
				; těchto 16 bitů znaménkově rozšířit na 32 bitů pomocí cwde 

	mov [pole_2+4*3], eax 	; Nyní pracujeme s 32bit hodnotami (4Bajty), proto je zde offset 4*N-1
				; Jelikož jsme převedli 16bit ax na 32 bit, pracujeme zde již s 32bit eax
	call WriteInt32
	call WriteNewLine
ret

