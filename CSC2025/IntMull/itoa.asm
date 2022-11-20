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

	add		esi, 31
	mov		edx, 0
	mov		[esi], dl

_loop1:
	
	dec		esi
	mov		edx, 0
	div		ebx
	add		dl, 48
	mov		[esi], dl

	cmp		eax, 0
	jg		_loop1

	mov		eax, esi ;returning charArray location

	mov		esp, ebp
	pop		ebp
	ret		8

ItoA ENDP
END