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
	mov		ecx, 1; current
	mov		ebx, 0; previous
	mov		edx, 1; next

Fibloop:
	
	add		ebx, ecx
	mov		edx, ebx

	mov		ebx, ecx

	mov		ecx, edx

	dec		eax
	cmp		eax, 1
	ja		Fibloop
	
	mov		eax, ecx

	push	0
	call	_ExitProcess@4

main ENDP
END