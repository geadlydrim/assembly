;display using HEX values

section .data
    msg db 0x48, 0x20, 0x41, 0x20, 0x44, 0x20, 0x4A, 0x20, 0x49
    len equ $ - msg

section .text
    global _start

_start:
    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80