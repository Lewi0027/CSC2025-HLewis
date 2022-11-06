.386P
.model flat

extern _ExitProcess@4: near
extern WriteLine: near

.data

.code
ReadLine PROC near
_ReadLine:

	push 0
	call _ExitProcess@4

ReadLine ENDP
END