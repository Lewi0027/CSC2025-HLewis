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
n			byte	10; adjust as needed

.code
main PROC near
_main:
	mov		ah, previous
	mov		al, current
	mov		bh, next
	mov		bl, n

_loop:
	; next = current + previous
	add		ah, al
	mov		bh, ah

	; previous = current
	mov		ah, al

	; current = next
	mov		al, bh

	inc		i
	cmp		i, bl
	jle		_loop

	push 0
	call _ExitProcess@4

main ENDP
END