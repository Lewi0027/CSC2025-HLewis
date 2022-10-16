.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

previous	byte	1
current		byte	1
next		byte	0
i			byte	3

.code
main PROC near
_main:

	mov		ecx, 8		; adjust as needed
	mov		ah, previous
	mov		al, current
	mov		bh, next

loop1:
	; next = current + previous
	add		ah, al
	mov		bh, ah

	; previous = current
	mov		ah, al

	; current = next
	mov		al, bh

	loop	loop1

	push 0
	call _ExitProcess@4

main ENDP
END