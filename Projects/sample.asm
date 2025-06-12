;declare variables
section	.data

msg	db	'Enter your name: ', 0	;our dear string
;msg - var, db- data byte, 'Hello World' - text, 0xa (Hex LF/line feed \n)
len	equ	$ - msg			;length of our dear string
;len - var, equ - preprocessor directive

greet db 'Welcome, '
greetlen equ $ - greet

section .bss
	input resb 50 ;Reserve 50 bytes for storing input

;executable commands
section	.text
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
	mov	edx, len    ;message length
	mov	ecx, msg    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel

	mov edx, 50
	mov ecx, input
	mov ebx, 0
	mov eax, 3
	int 0x80

	mov edx, greetlen
	mov ecx, greet
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov edx, 50
	mov ecx, input
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80


