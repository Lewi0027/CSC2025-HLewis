.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

msg			dword	97
handle		dword	?
written		dword	?

.code
main PROC near
_main:

alphaloop:

	; handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		handle, eax

	; WriteConsole(handle, &msg[0], 13, &written, 0)
	push	0
	push	offset written
	push	4
	push	offset msg
	push	handle
	call	_WriteConsoleA@20

	add		msg, 1
	cmp		msg, 122
	jbe		alphaloop

	push	0
	call	_ExitProcess@4

main ENDP
END