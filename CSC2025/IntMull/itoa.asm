.386P
.model flat

.data

.code
ItoA PROC near
_ItoA:

	push	ebp
	mov		ebp, esp
	mov		eax, [ebp+12] ;int value
	
	mov		esi, [ebp+8] ;move charArray location to esi
	mov		ebx, 10
	mov		ecx, 0
	sub		esi, 1 ;see 21

_loopforsize: ;determine length of new decimal
	
	add		ecx, 1 ;amount of integers in decimal (1 over)
	div		ebx
	mov		edx, 0

	cmp		eax, 0
	jne		_loopforsize

	add		esi, ecx ;move esi to location of last decimal value in new int
	mov		eax, [ebp+12] ;grab int value again

_loop1:

	div		ebx
	add		dl, 48 ;add 48 to turn from int to alpha
	mov		[esi], dl ;move alpha to array
	sub		esi, 1 ;change array location for next iteration
	mov		edx, 0

	cmp		eax, 0
	jne		_loop1

	mov		esp, ebp
	pop		ebp
	ret		8

ItoA ENDP
END