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
	sub		esi, 1

_loopforsize: ;determine length of new decimal
	
	add		ecx, 1
	div		ebx
	mov		edx, 0

	cmp		eax, 0
	jne		_loopforsize

	add		esi, ecx ;move esi to location of last decimal value in new int
	mov		eax, [ebp+12] ;grab int value again

_loop1:

	div		ebx
	mov		cl, dl
	add		ecx, 48
	mov		[esi], cl
	sub		esi, 1
	mov		edx, 0

	cmp		eax, 0
	jne		_loop1

_end:
	add		esi, 1
	mov		eax, esi
	mov		esp, ebp
	pop		ebp
	ret		4

ItoA ENDP
END