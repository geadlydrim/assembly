section .data
    newline db 0xa, 0
    clear_screen db 0x1B, '[', '2', 'J', 0
    home_cursor  db 0x1B, '[', 'H', 0
    error_msg db "Error: Non-decimal character encountered.", 0
    error_msg_len equ $ - error_msg
    error_operation db "Invalid operation entered.", 0
    error_operation_len equ $ - error_operation
    
    prompt_num1 db "Enter first number: ",0
    prompt_num1_len equ $ - prompt_num1
    prompt_num2 db "Enter second number: ", 0
    prompt_num2_len equ $ - prompt_num2
    prompt_operation db "Operations: ", 0xa, \
                        "[1] - Addition", 0xa, \
                        "[2] - Subtraction", 0xa, \
                        "[3] - Multiplication", 0xa, \
                        "[4] - Division", 0xa, \
                        "Enter option: ", 0
    prompt_operation_len equ $ - prompt_operation

section .bss
    buffer resb 128
    char_count resb 128
    operation resb 1
    num1 resb 128
    num2 resb 128
    result resb 128
    string_result resb 128
    temp resb 128

%macro PRINT 2
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, %1         ; string to print
    mov edx, %2         ; length of the string
    int 0x80
%endmacro

%macro NEWLINE 0
    PRINT newline, 1
%endmacro

%macro CLS 0
    PRINT clear_screen, 5
    PRINT home_cursor, 4
%endmacro

%macro CLEAR_BUFFER 0
    pusha
    xor eax, eax        ; Clear the EAX register (sets EAX to 0)
    mov edi, buffer  ; Address of the buffer to clear
    mov ecx, 128        ; Number of bytes to clear (for example, 128 bytes)
    rep stosb           ; Clear the buffer byte-by-byte
    popa
%endmacro

%macro READ_INPUT 2
    CLEAR_BUFFER
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 0x80

    mov [char_count], eax

    mov al, [ecx + eax - 1]
    cmp al, 0xa
    jne %%no_newline
    mov eax, [char_count]
    mov byte [ecx + eax - 1], 0x0
    dec eax
    mov [char_count], eax
%%no_newline:
%endmacro

%macro READ_INT 3
    READ_INPUT %1, %2

%%str_to_dec:
    mov ebx, [char_count]

%%next_digit:
    dec ebx

    mov al, [ecx]
    cmp al, 0
    je %%done

    sub al, '0'
    cmp al, 9
    ja %%error

    mov edx, 0
    cmp ebx, 0
    jg %%mul_ten

    call %%add_result
    jmp %%done

%%add_result:
    add [%3], al
    inc ecx
    ret

%%mul_ten:
    cmp edx, ebx
    je %%done_mul

    push ebx
    push edx
    mov ebx, 10
    mul ebx
    pop edx
    pop ebx

    inc edx
    jmp %%mul_ten

%%done_mul:
    call %%add_result
    jmp %%next_digit

%%error:
    PRINT error_msg, error_msg_len
%%done:
%endmacro

section .text
    global _start:

_start:

run:
    PRINT prompt_num1, prompt_num1_len
    READ_INT buffer, 128, num1
    PRINT prompt_num2, prompt_num2_len
    READ_INT buffer, 128, num2
    PRINT prompt_operation, prompt_operation_len
    READ_INT buffer, 128, operation

    call calculate
    call int_to_string

    call exit

calculate: 
    mov al, [operation]

    cmp al, 1
    je addition

    cmp al, 2
    je subtraction

    cmp al, 3
    je multiplication

    cmp al, 4
    je division

    jmp invalid_operation

addition:
    mov eax, [num1]
    add eax, [num2]
    mov [result], eax
    ret

subtraction:
    mov eax, [num1]
    sub eax, [num2]
    mov [result], eax
    ret
multiplication:
    mov eax, [num1]
    mov ebx, [num2]
    mul ebx
    mov [result], eax
    ret
division:
    mov eax, [num1]
    mov ebx, [num2]
    div ebx
    mov [result], eax
    ret
invalid_operation:
    PRINT error_operation, error_operation_len
    ret

int_to_string:
    mov esi, result
    mov edi, string_result
    mov ecx, 0
    mov ebx, 0

    CLEAR_BUFFER
    mov eax, [result]

    mov [buffer], eax
    push ebx
    mov ebx, 10
    div ebx
    pop ebx

    cmp al, 0
    je convert_digit

    inc ecx
    call add_remainder


convert_digit:
    add al, '0'
    mov byte [edi], al
    inc edi

add_remainder:

mul_ten:
    cmp ebx, 0
    je done_mul

    push eax
    push ebx

    mov eax, edx
    mov ebx, 10
    mul ebx
    mov edx, eax

    pop ebx
    pop eax

    dec ebx
    
    jmp mul_ten

done_mul:
    add [temp], edx
    inc ebx
    ret
exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80