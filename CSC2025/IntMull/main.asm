.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern WriteLine: near
extern ReadLine: near
extern ItoA: near
extern AtoI: near

.data

charArray	byte 11 DUP (13)

.code
main PROC near
_main:

	push	ebp
	mov		ebp, esp

	mov		eax, 1

	mov		[ebp-4], eax
	call	WriteLine

	call	ReadLine

	push	eax
	call	AtoI
	mov		[ebp-4], eax ; push int value

	mov		eax, 2
	mov		[ebp-8], eax ; push selection 2 for WriteLine

	sub		esp, 8
	mov		ebp, esp

	call	WriteLine

	mov		esp, ebp

	call	ReadLine

	push	eax
	call	AtoI
	pop		edx
	mul		edx

	push	eax
	mov		eax, offset charArray
	call	ItoA
	mov		[ebp-4], eax ;push location of charArray

	mov		eax, 3
	mov		[ebp-8], eax ;push selection 3 for WriteLine

	sub		esp, 12
	mov		ebp, esp

	call	WriteLine

	mov		esp, ebp
	pop		ebp

	push	0
	call	_ExitProcess@4

main ENDP
END