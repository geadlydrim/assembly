section .bss
    char_count resb 128

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

; How to use:
; READ_INPUT variable_to_store_input, number of bytes of reserved in bss
; 
; READ_INPUT example_variable, 12