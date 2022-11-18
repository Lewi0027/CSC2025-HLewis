.386P
.model flat

.data

charArray	byte 6 DUP (13)

.code
ItoA PROC near
_ItoA:

	push	ebp
	mov		ebp, esp
	mov		ecx, [ebp+8] ;int value in hex
	
	mov		esi, eax ;move charArray location to edx
	mov		eax, ecx ;move int value to eax

	mov		ebx, 10
	mov		ecx, 1000000000
	mov		edi, 1

_loopme:

	div		ecx
	
	cmp		eax, 0
	jne		_numstart

	add		esi, 1 ;move one further through charArray
	add		edi, 1 ;int to know depth into charArray

	mov		[ebp-4], edx ;move remainder to stack to retain

	mov		eax, ecx ;divide ecx by 10
	mov		edx, 0
	div		ebx
	mov		ecx, eax

	mov		eax, [ebp-4] ;recover remainder as whole number

	cmp		eax, eax
	je		_loopme

_numstart:

	mov		[esi], al ;move int value to charArray

	add		esi, 1 ;move one further through charArray
	add		edi, 1 ;int to know depth into charArray

	mov		[ebp-4], edx ;move remainder to stack to retain

	mov		eax, ecx ;divide ecx by 10
	mov		edx, 0
	div		ebx
	mov		ecx, eax

	mov		eax, [ebp-4] ;recover remainder as whole number

	cmp		ecx, 0
	je		_lessthanten

	div		ecx

	cmp		edi, 10
	jne		_numstart

	mov		[esi], al ;move int value to charArray

_lessthanten:

	mov		ebx, 13
	mov		ecx, 48
	sub		esi, edi

_thirteen:
	
	add		esi, 1
	cmp		[esi], bl
	je		_thirteen

_turntoalpha:

	add		[esi], cl
	add		esi, 1

	cmp		[esi], bl
	jne		_turntoalpha

_end:

	sub		esi, 10
	mov		eax, esi

	mov		esp, ebp
	pop		ebp
	ret		4

ItoA ENDP
END