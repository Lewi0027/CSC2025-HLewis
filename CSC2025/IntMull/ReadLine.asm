.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _ReadConsoleA@20: near

.data

handle		dword	?
input		dword	?
msg			byte 32 DUP (0)

.code
ReadLine PROC near
_ReadLine:

	push	ebp
	mov		ebp, esp
	
	; handle = GetStdHandle(-10)
	push	-10
	call	_GetStdHandle@4
	mov		handle, eax

	; ReadConsole(handle, &msg[0], 13, &written, 0)
	push	0
	push	offset input
	push	32
	push	offset msg
	push	handle
	call	_ReadConsoleA@20

	mov		eax, offset msg ;location of input

	mov		esp, ebp
	pop		ebp
	ret		0

ReadLine ENDP
END