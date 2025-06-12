section .data
    msg db 'I',0xA,'wrote',0xA,'a poem',0xA,'in the shape',0xA,'of a Christmas',0xA,'tree but then forgot',0xA,'to water it and only a few',0xA,'days',0xA,'later',0xA,'there',0xA, 0
    newline db 0xA
    padding db 40
    current_addr dd 0
    initial_addr dd 0
    test_msg dd 'test',0xA
    buffer db 0
    whitespace db ' ', 0    

    msg2 db 'I LoVe AsSeMbLy PrOgRaMmIngG :)', 0xa, 'Student Number: ', 0
    student_number db 0x32, 0x30, 0x32, 0x33, 0x31, 0x32, 0x30, 0x30, 0x38, 0xA
    first_name db 0x4B, 0x45, 0x41, 0x4E, 0x55, 0xA
    middle_name db 0x44, 0x45, 0x4C, 0x4F, 0x53, 0x20, 0x53, 0x41, 0x4E, 0x54, 0x4F, 0x53, 0xA
    last_name db 0x41, 0x47, 0x55, 0x53, 0x54, 0x49, 0x4E, 0xA

section .bss
    char_count resb 3

section .text
    global _start

_start:
    mov esi, msg
    mov [initial_addr], esi
    xor ecx, ecx        ; Character count

.char_counter:
    lodsb               ; Load byte at DS:ESI into AL and increment ESI
    cmp al, 0xA         ; Check if it is a newline (0xA)
    je .newline_found
    cmp al, 0           ; Check if it is the null terminator
    je .done

    inc ecx             ; Increment character count
    jmp .char_counter

.newline_found:
    mov [current_addr], esi
    mov [char_count], ecx
    mov al, [padding]
    add al, '0'
    mov [buffer], al

    
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, whitespace ; pointer to char_count
    mov edx, 20          ; length of the string to print (2 bytes)
    int 0x80

    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, test_msg ; pointer to char_count
    mov edx, 5          ; length of the string to print (2 bytes)
    int 0x80

    ; Reset character count for next segment
    xor ecx, ecx

    jmp .char_counter

.done:
    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; return 0 status
    int 0x80

%if 0
.print_student_info:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 48
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, student_number
    mov edx, 10
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, first_name
    mov edx, 6
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, middle_name
    mov edx, 13
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, last_name
    mov edx, 8
    int 0x80

    mov eax, 1
    int 0x80
%endif