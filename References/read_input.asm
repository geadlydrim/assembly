section .data

section .bss
    buffer resb 128
    char_count resb 128

section .text
    global _start

_start:
    mov ecx, buffer
    mov edx, 128
    call read_input

    call print_string
    call print_string

    call exit

print_string:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

read_input:
    mov eax, 3
    mov ebx, 0
    int 0x80

    mov [char_count], eax

    mov al, [ecx + eax - 1]   ; Load the last byte from the buffer
    cmp al, 0xa               ; Compare with newline (ASCII 10)
    jne no_newline           ; If it's not a newline, skip
    mov eax, [char_count]
    mov byte [ecx + eax - 1], 0x0  ; Replace newline with null terminator

no_newline:
    ret

exit:
    mov eax, 1
    int 0x80