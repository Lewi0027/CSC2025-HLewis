.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near

.data

written		dword	?
handle		dword	?

.code
WriteLine PROC near
_WriteLine:

	push	ebp
	mov		ebp, esp
	mov		ecx, [ebp+8]
	mov		edx, ecx
	mov		esi, 0

loop1:
	mov		bl, [edx]
	add		edx, 1
	add		esi, 1
	cmp		bl, 0
	jnz		loop1

	; handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		handle, eax

	; WriteConsole(handle, &msg[0], 32, &written, 0)
	push	0
	push	offset written
	push	esi
	push	ecx
	push	handle
	call	_WriteConsoleA@20

	mov		eax, written

	mov		esp, ebp
	pop		ebp
	ret		4

WriteLine ENDP
END