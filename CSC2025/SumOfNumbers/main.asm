.386P
.model flat
extern _ExitProcess@4: near

.data


.code
main PROC near
_main:

	; add all values from 0-10
	mov		eax, 1
	mov		ebx, 2
	add		ebx, eax
	
	push 0
	call _ExitProcess@4

main ENDP
END