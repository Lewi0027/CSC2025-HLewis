.386P
.model flat

.data

; charArray	byte 6 DUP (13)

.code
AtoI PROC near
_AtoI:

	push	ebp
	mov		ebp, esp
	mov		ecx, [ebp+8]

	mov		eax, 0

	mov		bl, [ecx]
	sub		bl, 48
	mov		al, bl

_loopme:
	
	add		ecx, 1
	mov		bl, [ecx]

	cmp		bl, 13
	je		_end

	sub		bl, 48

	mov		edx, 10
	mul		edx
	add		al, bl
	
	cmp		edx, edx
	je		_loopme

_end:

	mov		esp, ebp
	pop		ebp
	ret		4

AtoI ENDP
END