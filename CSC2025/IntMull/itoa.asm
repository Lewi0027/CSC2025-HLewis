.386P
.model flat

.data

.code
ItoA PROC near
_ItoA:

	push	ebp
	mov		ebp, esp
	mov		ecx, [ebp+8]
	
	mov		bl,	cl
	cmp		bl, 0
	je		_zero

	mov		[eax], bl
	cmp		eax, eax
	je		_notzero

_zero:
	add		ecx, 1
	mov		bl, cl

	cmp		bl, 0
	je		_zero

	mov		[eax], bl
	cmp		eax, eax
	je		_notzero

_notzero:
	

_end:
	mov		esp, ebp
	pop		ebp
	ret		4

ItoA ENDP
END