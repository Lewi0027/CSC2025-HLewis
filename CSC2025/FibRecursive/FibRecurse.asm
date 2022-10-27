.386P
.model flat

extern _ExitProcess@4: near

.data

.code
FibRecurse PROC near
_FibRecurse:
	
	push	ebp
	mov		ebp, esp
	mov		ecx, [ebp+8]

	sub		esp, 8
	mov		[ebp-4], ecx


	cmp		ecx, 2
	ja		_nonbasecase

	mov		eax, 1
	mov		esp, ebp
	pop		ebp
	ret		4

_nonbasecase:
	
	dec		ecx
	push	ecx
	call	FibRecurse

	mov		edx, eax
	mov		[ebp-8], edx
	mov		ecx, [ebp-4]
	sub		ecx, 2
	push	ecx
	call	FibRecurse

	mov		ebx, eax
	mov		edx, [ebp-8]
	add		ebx, edx
	mov		eax, ebx

	mov		esp, ebp
	pop		ebp
	ret		4

FibRecurse ENDP
END