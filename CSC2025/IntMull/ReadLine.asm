.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _ReadConsoleA@20: near
extern WriteLine: near

.data

handle		dword	?
input		dword	?
msg			dword	?

.code
ReadLine PROC near
_ReadLine:

	; handle = GetStdHandle(-10)
	push	-10
	call	_GetStdHandle@4
	mov		handle, eax

	; ReadConsole(handle, &msg[0], 13, &written, 0)
	push	0
	push	offset input
	push	5
	push	offset msg
	push	handle
	call	_ReadConsoleA@20

	mov		eax, offset msg

	push 0
	call _ExitProcess@4

ReadLine ENDP
END