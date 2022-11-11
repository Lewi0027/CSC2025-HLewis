.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern WriteLine: near
extern ReadLine: near
extern ItoA: near
extern AtoI: near

.data

charArray	byte	32 DUP (0)

.code
main PROC near
_main:

	mov		eax, 1
	push	eax

	call	WriteLine
	call	ReadLine

	mov		eax, 4
	call	WriteLine

	; call	AtoI
	; call	ItoA

	mov		eax, 2
	push	eax

	call	WriteLine
	call	ReadLine

	mov		eax, 4
	call	WriteLine

	; call	AtoI
	; call	ItoA

	mov		eax, 3
	push	eax

	call	WriteLine

	push	0
	call	_ExitProcess@4

main ENDP
END