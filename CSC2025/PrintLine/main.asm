.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

msg			byte	32 DUP (0)
othermsg	byte	'hello', 0
handlei		dword	?
handleo		dword	?
written		dword	?

.code
main PROC near
_main:

	mov		edx, offset othermsg
	mov		ebx, -1

loop1:
	mov		al, [edx]
	add		edx, 1
	add		ebx, 1
	cmp		al, 0
	jnz		loop1

	call	_PrintLine

	push	0
	call	_ExitProcess@4

main ENDP

_PrintLine PROC
	
	push	ebp
	mov		ebp, esp
	sub		esp, 20

	; handle = GetStdHandle(-10)
	; push	-10
	; call	_GetStdHandle@4
	; mov		handlei, eax

	; ReadConsole(handle, &msg[0], 32, &written, 0)
	; push	0
	; push	offset written
	; push	ebx
	; push	offset othermsg
	; push	handlei
	; call	_ReadConsoleA@20

	; handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		handleo, eax

	; WriteConsole(handle, &msg[0], 32, &written, 0)
	push	0
	push	offset written
	push	ebx
	push	offset othermsg
	push	handleo
	call	_WriteConsoleA@20

	mov		esp, ebp
	pop		ebp

	ret		4

_PrintLine ENDP
END