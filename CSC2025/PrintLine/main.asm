.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

msg			byte	32 DUP (0)
handlei		dword	?
handleo		dword	?
written		dword	?

.code
main PROC near
_main:

	call	_PrintLine

	push	0
	call	_ExitProcess@4

main ENDP

_PrintLine PROC
	; handle = GetStdHandle(-10)
	push	-10
	call	_GetStdHandle@4
	mov		handlei, eax

	; ReadConsole(handle, &msg[0], 32, &written, 0)
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

	; WriteConsole(handle, &msg[0], 32, &written, 0)
	push	0
	push	offset written
	push	32
	push	offset msg
	push	handleo
	call	_WriteConsoleA@20

	ret		20

_PrintLine ENDP
END