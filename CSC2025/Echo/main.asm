.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

msg			byte	0 DUP (32)
handlei		dword	?
handleo		dword	?
written		dword	?

.code
main PROC near
_main:
	
	; handle = GetStdHandle(-10)
	push	-10
	call	_GetStdHandle@4
	mov		handlei, eax

	; ReadConsole(handle, &msg[0], 13, &written, 0)
	push	0
	push	offset written
	push	32
	push	offset msg
	push	handlei
	call	_ReadConsoleA@20

	; handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		handleo, eax

	; WriteConsole(handle, &msg[0], 13, &written, 0)
	push	0
	push	offset written
	push	32
	push	offset msg
	push	handleo
	call	_WriteConsoleA@20

	push	0
	call	_ExitProcess@4

main ENDP
END