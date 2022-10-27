.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

n		dword	10

.code
main PROC near
_main:

	mov		eax, n
	mov		ebx, 1; current
	mov		ecx, 1; previous

Fibloop:
	
	add		ecx, ebx
	mov		edx, ecx

	mov		ecx, ebx

	mov		ebx, edx

	dec		eax
	cmp		eax, 2
	ja		Fibloop

	mov		eax, edx

	push	0
	call	_ExitProcess@4

main ENDP
END