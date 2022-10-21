.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

.code
main PROC near
_main:
	mov		ecx, 8
	mov		eax, 1
	mov		ebx, 1
	mov		esi, 0

loop1:
	; next = current + previous
	add		eax, ebx
	mov		esi, eax

	; previous = current
	mov		eax, ebx

	; current = next
	mov		ebx, esi

	loop	loop1

	push 0
	call _ExitProcess@4

main ENDP
END