.386P
.model flat

extern _ExitProcess@4: near
extern WriteLine: near

.data

.code
ItoA PROC near
_ItoA:

	push 0
	call _ExitProcess@4

ItoA ENDP
END