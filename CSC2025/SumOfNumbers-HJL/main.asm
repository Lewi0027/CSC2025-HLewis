.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data
sum		dword	0

.code
main PROC near
_main:

	mov		ebx, 1
_loop:
	add		sum, ebx
	inc		ebx
	cmp		ebx, 10
	jle		_loop
	
	push 0
	call _ExitProcess@4

main ENDP
END