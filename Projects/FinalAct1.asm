section .data

    newline db 0xa, 0
    clear_screen db 0x1B, '[', '2', 'J', 0   ; ANSI escape code to clear screen
    home_cursor  db 0x1B, '[', 'H', 0
    prompt_name db "What is your name? ", 0
    prompt_name_len equ $ - prompt_name

    prompt_age db "How old are you? ", 0
    prompt_age_len equ $ - prompt_age

    prompt_gender db "What is your gender? ", 0
    prompt_gender_len equ $ - prompt_gender

    msg_name db "Hello ", 0
    msg_name_len equ $ - msg_name

    msg_age_1 db "You are ", 0
    msg_age_1_len equ $ - msg_age_1

    msg_age_2 db " years old", 0
    msg_age_2_len equ $ - msg_age_2

    msg_hello db "Hello", 0
    msg_hello_len equ $ - msg_hello

    msg_world db "World", 0
    msg_world_len equ $ - msg_world

    msg_invalid db "INVALID GENDER", 0
    msg_invalid_len equ $ - msg_invalid


section .bss
    buffer resb 128
    char_count resb 128
    name resb 128
    age resb 128
    gender resb 1

%macro PRINT 2
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, %1         ; string to print
    mov edx, %2         ; length of the string
    int 0x80
%endmacro

; This macro reads user input and also removes the trailing newline character when user presses enter
%macro READ_INPUT 2
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 0x80

    mov [char_count], eax

    mov al, [ecx + eax - 1]   ; Load the last byte from the buffer
    cmp al, 0xa               ; Compare with newline (ASCII 10)
    jne %%no_newline            ; If it's not a newline, skip
    mov eax, [char_count]
    mov byte [ecx + eax - 1], 0x0  ; Replace newline with null terminator

%%no_newline:
%endmacro

%macro NEWLINE 0
    PRINT newline, 1
%endmacro

%macro CLS 0
    PRINT clear_screen, 5
    PRINT home_cursor, 4
%endmacro

section .text
    global _start

_start:
    CLS

    PRINT prompt_name, prompt_name_len
    READ_INPUT name, 128

    PRINT prompt_age, prompt_age_len
    READ_INPUT age, 128

    PRINT prompt_gender, prompt_gender_len
    READ_INPUT gender, 128

    PRINT msg_name, msg_name_len
    PRINT name, 128
    NEWLINE

    PRINT msg_age_1, msg_age_1_len
    PRINT age, 128
    PRINT msg_age_2, msg_age_2_len
    NEWLINE

    call hello_world
    NEWLINE

    call exit

hello_world:
    mov al, [gender]

    cmp al, 0x4d    ; for case 'M'
    je is_male
    cmp al, 0x6d    ; for case 'm'
    je is_male
    
    cmp al, 0x46    ; for case 'F'
    je is_female
    cmp al, 0x66    ; for case'f'
    je is_female

    jmp invalid_gender  ; for invalid case

is_male:
    PRINT msg_hello, msg_hello_len
    ret

is_female:
    PRINT msg_world, msg_world_len
    ret

invalid_gender:
    PRINT msg_invalid, msg_invalid_len
    ret

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80