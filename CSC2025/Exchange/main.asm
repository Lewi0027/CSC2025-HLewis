.386P
.model flat
extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near
extern _ReadConsoleA@20: near

.data

number1		byte	10
number2		byte	20
number3		byte	30
number4		byte	40

.code
main PROC near
_main:

	mov		ah, number1
	mov		al, number4
	mov		number4, ah
	mov		number1, al
	mov		ah, number3
	mov		al, number2
	mov		number3, al
	mov		number2, ah
	
	push 0
	call _ExitProcess@4

main ENDP
END