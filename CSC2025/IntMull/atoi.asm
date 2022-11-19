.386P
.model flat

.data

.code
AtoI PROC near
_AtoI:

	push	ebp
	mov		ebp, esp
	mov		ecx, [ebp+8]

	mov		eax, 0
	mov		edx, 10

	mov		bl, [ecx] ;move first alpha (byte) to bl
	sub		bl, 48 ;change alpha to int
	mov		al, bl

_loopme:
	
	add		ecx, 1 ;move forward in input
	mov		bl, [ecx] ;grab next potential alpha

	cmp		bl, 13 ;see if address points to end of input
	je		_end

	sub		bl, 48

	mov		edx, 10 ;multiply by 10 and add new int
	mul		edx
	add		al, bl
	
	cmp		edx, edx ;auto-loop
	je		_loopme

_end:

	mov		esp, ebp
	pop		ebp
	ret		4

AtoI ENDP
END