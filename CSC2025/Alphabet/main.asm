.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

msg			dword	?, 1
handle		dword	?
written		dword	?

.code
main PROC near
_main:
	
	mov		ebx, 97

_loop:

	mov		msg, ebx

	; handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		handle, eax

	; WriteConsole(handle, &msg[0], 13, &written, 0)
	push	0
	push	offset written
	push	1
	push	offset msg
	push	handle
	call	_WriteConsoleA@20

	inc		ebx
	cmp		ebx, 122
	jle		_loop

	push 0
	call _ExitProcess@4

main ENDP
END