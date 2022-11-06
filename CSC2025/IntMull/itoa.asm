.386P
.model flat

extern WriteLine: near

.data

.code
main PROC near
_main:

	push 0
	call _ExitProcess@4

main ENDP
END