.386P
.model flat

extern _GetStdHandle@4: near
extern _ExitProcess@4: near
extern _WriteConsoleA@20: near

.data

num1		byte	'Enter Number 1: ', 10
num2		byte	'Enter Number 2: ', 10
written		dword	?
handle		dword	?

.code
WriteLine PROC near
_WriteLine:

	push	ebp
	mov		ebp, esp
	mov		eax, [ebp+8]

	; If pushed number is 1 jump to "1: "
	; If pushed number is 2 jump to "2: "

	cmp		eax, 1
	je		_number1

	cmp		eax, 2
	je		_number2

	cmp		eax, 3
	je		_number3

_number1:
	; display "1: "

	; handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		handle, eax

	; WriteConsole(handle, &msg[0], 32, &written, 0)
	push	0
	push	offset written
	push	17
	push	offset num1
	push	handle
	call	_WriteConsoleA@20


	mov		esp, ebp
	pop		ebp
	ret 0

_number2:
	; display "2: "

	; handle = GetStdHandle(-11)
	push	-11
	call	_GetStdHandle@4
	mov		handle, eax

	; WriteConsole(handle, &msg[0], 32, &written, 0)
	push	0
	push	offset written
	push	17
	push	offset num2
	push	handle
	call	_WriteConsoleA@20

	mov		esp, ebp
	pop		ebp
	ret	4

_number3:

	mov		esp, ebp
	pop		ebp
	ret 4

	mov		ebx, offset msg
	mov		eax, 48
	sub		[ebx], eax
	mov		ecx, [ebx]

WriteLine ENDP
END