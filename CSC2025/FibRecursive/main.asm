.386P
.model flat

extern _ExitProcess@4: near
extern FibRecurse: near

.data

n		dword	10 ; iterations

.code
main PROC near
_main:

	mov		ecx, n ; iterations
	push	ecx
	call	FibRecurse

	push 0
	call _ExitProcess@4

main ENDP
END