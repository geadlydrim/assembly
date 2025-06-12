section .data
    prompt_num1 db "Enter first number: ", 0
    prompt_num1_len equ $-prompt_num1

    prompt_num2 db "Enter second number: ", 0
    prompt_num2_len equ $-prompt_num2

    msg_sum db "Sum: ",0
    msg_sum_len equ $-msg_sum

    msg_greater_10 db "The sum is greater than 10", 0
    msg_greater_10_len equ $- msg_greater_10

    msg_difference db "Difference: ",0
    msg_difference_len equ $-msg_difference

    msg_less_0 db "THe difference is less than 0", 0
    msg_less_0_len equ $- msg_less_0

section .bss
    num1 resb 128
    num2 resb 128
    buffer resb 128
    buffer2 resb 128
    result resb 128
    char_count resb 128
    bool_negative resb 1

section .text
    global _start

_start:
    mov ecx, prompt_num1
    mov edx, prompt_num1_len
    call print_string

    mov ecx, num1
    mov edx, 128
    call read_input

    mov ecx, prompt_num2
    mov edx, prompt_num2_len
    call print_string

    mov ecx, num2
    mov edx, 128
    call read_input

    mov eax, num1 ; 0x804a078
    call convert_to_decimal
    mov eax, [buffer]
    mov [num1], eax

    call clear_buffer

    mov eax, num2 ; 0x804a0f8
    call convert_to_decimal
    mov eax, [buffer]
    mov [num2], eax



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
    dec eax
    mov [char_count], eax

no_newline:
    ret

clear_buffer:
    push eax
    mov edi, buffer
    mov ecx, 128
    xor eax, eax
    rep stosb
    pop eax
    ret
    
convert_to_decimal:
    mov ecx, [char_count]
    mov edx, [char_count]

loop_string:
    push eax
    mov al, [eax]
    sub al, '0'

    cmp al, 45
    je negative_sign

    cmp ecx, 1
    jg non_ones_digit

    dec ecx
    dec edx
    call add_decimal

    cmp edx, 0
    jne loop_string
    pop eax
    cmp byte [bool_negative], 1
    je negate_decimal

    ret

negative_sign:
    mov byte [bool_negative], 1
    pop eax
    inc eax
    dec edx
    dec ecx
    jmp loop_string

negate_decimal:
    neg byte [buffer]
    ret

non_ones_digit:
    push ecx
    sub ecx, 1

multiply_loop:
    push edx
    mov dl, 10
    mul dl
    pop edx

    loop multiply_loop
    pop ecx
    call add_decimal
    pop eax
    inc eax
    dec ecx
    dec edx
    jmp loop_string

add_decimal:
    push ebx
    push ecx
    mov ebx, [buffer]
    movzx ecx, al
    add ebx, ecx
    mov [buffer], ebx
    pop ecx
    pop ebx
    ret

exit:
    mov eax, 1
    int 0x80