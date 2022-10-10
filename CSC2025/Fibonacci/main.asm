.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

current		dword	1

.code
main PROC near
_main:
	
	mov		eax, current
	
_loop:
	
	inc		current
	add		eax, current
	cmp		current, 10
	jle		_loop

	push 0
	call _ExitProcess@4

main ENDP
END