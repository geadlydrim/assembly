section .data
    newline db 0xa, 0
    clear_screen db 0x1B, '[', '2', 'J', 0
    home_cursor  db 0x1B, '[', 'H', 0
    error_msg db "Error: Non-decimal character encountered.", 0
    error_msg_len equ $ - error_msg
    error_operation db "Invalid operation entered.", 0
    error_operation_len equ $ - error_operation
    msg_output db "Output written to file", 0
    msg_output_len equ $ - msg_output
    msg_bye db "Bye. Thank you for using Georgette Calculator", 0
    msg_bye_len equ $ - msg_bye

    filename db "output.txt", 0      ; Null-terminated file name
    
    prompt_num1 db "Enter first number: ",0
    prompt_num1_len equ $ - prompt_num1
    prompt_num2 db "Enter second number: ", 0
    prompt_num2_len equ $ - prompt_num2
    prompt_operation db "+--------Georgette Calculator--------+", 0xa, \
                        "[A] - Addition", 0xa, \
                        "[B] - Subtraction", 0xa, \
                        "[C] - Multiplication", 0xa, \
                        "[D] - Division", 0xa, \
                        "+------------------------------------+", 0Xa , \
                        "Enter option: ", 0
    prompt_operation_len equ $ - prompt_operation
    prompt_try_again db "Try again (Y/n): "
    prompt_try_again_len equ $ - prompt_try_again

section .bss
    buffer resb 128
    char_count resb 128
    operation resb 2
    num1 resb 128
    num2 resb 128
    result resb 128
    string_result resb 128
    temp resb 128
    file_descriptor resd 1
    length resb 128
    try resb 128

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

%macro GET_LENGTH 2
    pusha

    mov ecx, %1
    mov edx, 0

%%loop:
    mov al, [ecx]
    cmp al, 0
    je %%done

    inc edx
    inc ecx
    jmp %%loop

%%done:
    mov [%2], edx
    popa
%endmacro

%macro RESET 0
    push eax
    mov eax, 0
    mov [num1], eax
    mov [num2], eax
    mov [result], eax
%endmacro

section .text
    global _start:

_start:

run:
    CLS
    RESET
    PRINT prompt_num1, prompt_num1_len
    READ_INT buffer, 128, num1
    PRINT prompt_num2, prompt_num2_len
    READ_INT buffer, 128, num2
    PRINT prompt_operation, prompt_operation_len
    READ_INPUT operation, 2

    call calculate
    call int_to_string
    call write_file
    NEWLINE

try_again:
    PRINT prompt_try_again, prompt_try_again_len
    READ_INPUT try, 128
    mov eax, [try]

    cmp al, 0x59
    je run
    cmp al, 0x79
    je run

    cmp al, 0x4e
    je exit
    cmp al, 0x6e
    je exit

    call exit

calculate: 
    mov al, [operation]

    cmp al, 0x41
    je addition

    cmp al, 0x42
    je subtraction

    cmp al, 0x43
    je multiplication

    cmp al, 0x44
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
digit_loop:
    push ebx
    mov ebx, 10
    xor edx, edx
    div ebx
    pop ebx

    cmp al, 0
    je convert_digit

    inc ecx
    call add_remainder
    jmp digit_loop

convert_digit:

    mov eax, edx
    xor edx, edx
    add al, '0'
    mov byte [edi], al

    cmp ecx, 0
    je done_convert

    inc edi
    CLEAR_BUFFER
    xor eax, eax
    mov eax, [temp]
    mov [buffer], eax
    xor ecx, ecx
    mov [temp], ecx
    jmp digit_loop

done_convert:
    ret
add_remainder:
    mov ebx, ecx
    dec ebx
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

write_file:
    GET_LENGTH string_result, length
    mov al, [length]
    cmp al, 0
    je done_write

    mov eax, 5          ; sys_open
    mov ebx, filename   ; Filename
    mov ecx, 0x241      ; Flags: O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0x1b6      ; Mode: 0666 in octal (rw-rw-rw-)
    int 0x80
    mov [file_descriptor], eax

    mov eax, 4
    mov ebx, [file_descriptor]
    mov ecx, string_result
    mov edx, [length]
    int 0x80

    mov eax, 6
    mov ebx, [file_descriptor]
    int 0x80
    PRINT msg_output, msg_output_len

done_write:
    ret
exit:
    PRINT msg_bye, msg_bye_len
    mov eax, 1
    xor ebx, ebx
    int 0x80