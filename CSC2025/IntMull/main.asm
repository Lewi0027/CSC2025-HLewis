.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern WriteLine: near
extern ReadLine: near

.data

.code
main PROC near
_main:

	mov		eax, 1
	push	eax

	call	WriteLine

	mov		eax, 2
	push	eax

	call	WriteLine

	mov		eax, 3
	push	eax

	call	WriteLine

	push	0
	call	_ExitProcess@4

main ENDP
END