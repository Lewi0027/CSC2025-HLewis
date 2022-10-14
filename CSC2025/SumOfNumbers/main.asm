.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data


.code
main PROC near
_main:

	mov		bl, 0
	mov		al, 0

	loop1:
	add		al, bl
	inc		bl
	cmp		bl, 10
	jle		loop1

	push 0
	call _ExitProcess@4

main ENDP
END