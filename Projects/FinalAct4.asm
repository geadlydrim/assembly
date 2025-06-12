section  .data
    fileName db "receipt.txt", 0
    clear_screen db 0x1B, '[', '2', 'J', 0
    home_cursor  db 0x1B, '[', 'H', 0

    menu db 27, '[1;1H'
        db "+------------------ MENU ------------------+", 0
        db 27, '[2;1H'
        db "| A. Rice : Plain Rice          Php. 5.00  |", 0
        db 27, '[3;1H'
        db "| B. Rice : Java Rice           Php. 10.00 |", 0
        db 27, '[4;1H'
        db "| C. Ulam 1: (Fish)             Php. 35.00 |", 0
        db 27, '[5;1H'
        db "| D. Ulam 2: (Pork)             Php. 50.00 |", 0
        db 27, '[6;1H'
        db "| E. Ulam 3: (Vegetable)        Php. 20.00 |", 0
        db 27, '[7;1H'
        db "| F. Dessert: Saging con yelo   Php. 60.00 |", 0
        db 27, '[8;1H'
        db "+------------------------------------------+", 0
        db 27, '[10;1H'
    menu_len equ $ - menu
    prompt_input db "Enter your order (Letter): ", 0
    prompt_input_len equ $ - prompt_input
    
    plainrice db 27, '[11;1H'
                         db "You ordered Plain Rice: Php 5.00", 0
    plainrice_len equ $ - plainrice
    orderplainrice db "Plain Rice: Php 5.00", 0xa, 0 
    orderplainrice_len equ $ - orderplainrice
    
    javarice db 27, '[11;1H'
                         db "You ordered Java Rice: Php 10.00", 0
    javarice_len equ $ - javarice
    orderjavarice db "Java Rice: Php 10.00", 0xa, 0
    orderjavarice_len equ $ - orderjavarice
    
    fish db 27, '[11;1H'
                         db "You ordered Fish: Php 35.00", 0
    fish_len equ $ - fish
    orderfish db "Fish: Php 35.00", 0xa, 0
    orderfish_len equ $ - orderfish
    
    pork db 27, '[11;1H'
                         db "You ordered Pork: Php 50.00", 0
    pork_len equ $ - pork
    orderpork db "Pork: Php 50.00", 0xa, 0 
    orderpork_len equ $ - orderpork
    
    vegetable db 27, '[11;1H'
                         db "You ordered Vegetable: Php 20.00", 0
    vegetable_len equ $ - vegetable
    ordervegetable db "Vegetable: Php 20.00", 0xa, 0
    ordervegetable_len equ $ - ordervegetable
    
    scy db 27, '[11;1H'
             db "You ordered Saging Con Yelo: Php 60.00", 0
    scy_len equ $ - scy
    orderscy db "Saging Con Yelo: Php 60.00", 0xa, 0
    orderscy_len equ $ - orderscy
    
    prompt_try_again db 27, '[12;1H'
                     db "Do you want to try again? [Y/N]: ",0
    prompt_try_again_len equ $ - prompt_try_again
    
section .bss
    choice resb 2
    char_count resb 128
    try resb 2
    fileHandle resd 1

%macro PRINT 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro CLS 0
    PRINT clear_screen, 5
    PRINT home_cursor, 4
%endmacro

%macro READ_INPUT 2
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

%macro WRITE_FILE 2
    mov eax, 4
    mov ebx, [fileHandle]
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro CLOSE_FILE 0
    mov eax, 6                  
    mov ebx, [fileHandle]
    int 0x80
%endmacro

section .text
    global _start
    
_start:
    mov eax, 5                 
    mov ebx, fileName
    mov ecx, 0x442             
    mov edx, 0x1A4             
    int 0x80
    mov [fileHandle], eax     

order_loop: 
    CLS
    PRINT menu, menu_len
    call get_choice 
    call prompt_loop 
    CLOSE_FILE
    
    call exit      
    
get_choice:
    PRINT prompt_input, prompt_input_len
    READ_INPUT choice, 2
    
    cmp byte [choice], 'A'
    je A
    cmp byte [choice], 'B'
    je B
    cmp byte [choice], 'C'
    je C
    cmp byte [choice], 'D'
    je D
    cmp byte [choice], 'E'
    je E
    cmp byte [choice], 'F'
    je F

    jmp get_choice ; Jump back only if invalid choice
    
A:
    PRINT plainrice, plainrice_len
    WRITE_FILE orderplainrice, orderplainrice_len
    ret
B:
    PRINT javarice, javarice_len
    WRITE_FILE orderjavarice, orderjavarice_len
    ret
C:
    PRINT fish, fish_len
    WRITE_FILE orderfish, orderfish_len
    ret
D:
    PRINT pork, pork_len
    WRITE_FILE orderpork, orderpork_len
    ret
E:
    PRINT vegetable, vegetable_len
    WRITE_FILE ordervegetable, ordervegetable_len
    ret
F:
    PRINT scy, scy_len
    WRITE_FILE orderscy, orderscy_len
    ret
    
prompt_loop:
    PRINT prompt_try_again, prompt_try_again_len
    READ_INPUT try, 2
    
    cmp byte [try], 'Y'
    je order_loop 
    cmp byte [try], 'y'
    je order_loop 
    cmp byte [try], 'N'
    je no
    cmp byte [try], 'n'
    je no
    jmp prompt_loop
    
no:
    CLOSE_FILE
    jmp exit
    
exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
