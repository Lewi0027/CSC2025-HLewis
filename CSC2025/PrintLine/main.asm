.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

msg	byte	'Outputme', 0
handle		dword	?
written		dword	?

.code
main PROC near
_main:

	push	offset msg
	call	_PrintLine

	push	0
	call	_ExitProcess@4

main ENDP

_PrintLine PROC
	
	push	ebp
	mov		ebp, esp

	mov		edx, [ebp+8]
	mov		ebx, 0
	mov		eax, 0

	loop1:
	mov		al, [edx]
	add		edx, 1
	add		ebx, 1
	cmp		al, 0
	jnz		loop1

	mov		edx, [ebp+8]

	; handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		handle, eax

	; WriteConsole(handle, &msg[0], 32, &written, 0)
	push	0
	push	offset written
	push	ebx
	push	edx
	push	handle
	call	_WriteConsoleA@20

	mov		esp, ebp
	pop		ebp
	ret		4

_PrintLine ENDP
END