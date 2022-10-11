.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

num1	byte	10
num2	byte	20
num3	byte	30
num4	byte	40

.code
main PROC near
_main:

	mov		al, num1
	mov		ah, num4
	mov		num1, ah
	mov		num4, al
	mov		al, num3
	mov		ah, num2
	mov		num3, ah
	mov		num2, al
	
	push 0
	call _ExitProcess@4

main ENDP
END