.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern WriteLine: near
extern ReadLine: near
extern ItoA: near
extern AtoI: near

.data

num1		byte	'Enter Number 1: ', 0
num2		byte	'Enter Number 2: ', 0
num3		byte	'The multiplication result is: ', 0
charArray	byte	32 DUP (0)

.code
main PROC near
_main:

	push	ebp
	mov		ebp, esp
	sub		esp, 4 ;making room for temporary int

	push	offset num1
	call	WriteLine

	call	ReadLine

	push	eax
	call	AtoI

	mov		[ebp-4], eax ;saving eax

	push	offset num2
	call	WriteLine

	call	ReadLine

	push	eax
	call	AtoI
	
	mov		edx, [ebp-4]
	mul		edx

	push	eax
	push	offset charArray
	call	ItoA

	mov		[ebp-4], eax ;saving location

	push	offset num3
	call	WriteLine

	push	[ebp-4]
	call	WriteLine

	mov		esp, ebp
	pop		ebp

	push	0
	call	_ExitProcess@4

main ENDP
END