section .data
    result db 12 dup (0)  ; Reserve space for 12 characters in the BSS section.

section .bss
    len resb 1   ; To keep track of string length (position to append next character).

section .text
    global _start

_start:
    ; Example: put 9 in EAX
    mov eax, 9        ; Store decimal number in EAX
    mov ebx, 12
    call format_ansi
    
    ; Exit syscall
    mov eax, 1        ; sys_exit
    xor ebx, ebx      ; status 0
    int 0x80

format_ansi:
    push eax
    mov edi, result
    mov ecx, 12
    xor eax, eax

    rep stosb
    pop eax
    
    mov byte [result], 0x1B
    mov byte [result + 1], 0x5B
    mov byte [len], 2

    push eax
    call append_decimal_to_string
    pop eax

    push eax
    mov ecx, [len]
    mov byte [result + ecx], 0x3B ; append semi-colon ';'
    inc ecx
    mov [len], ecx
    pop eax

    push eax
    mov eax, ebx
    call append_decimal_to_string
    pop eax

    mov ecx, [len]
    mov byte [result + ecx], 0x48 ; append semi-colon 'H'
    inc ecx
    mov byte [result + ecx], 0
    mov [len], ecx

    ret

; 0x804a000 0x804a00c

; Function to convert decimal number in EAX to string and append to `result` in BSS
append_decimal_to_string:
    
    ; Load the length of the current string in ECX
    mov ecx, [len]

    ; Check if it's a two-digit number
    cmp eax, 9
    jg  two_digit_number    ; If greater than 9, it's a two-digit number

    ; Single-digit number
    add eax, '0'            ; Convert to ASCII
    mov [result + ecx], al  ; Append the ASCII character to `result`
    inc ecx                 ; Increment string length
    mov [len], ecx          ; Update length
    ret

two_digit_number:
    ; Divide number by 10 to get the tens and ones place
    push ebx
    mov ebx, 10
    xor edx, edx            ; Clear EDX before division
    div ebx                 ; EAX / EBX -> EAX = quotient (tens), EDX = remainder (ones)
    pop ebx
    ; EAX now holds the tens place, EDX holds the ones place

    ; Convert the tens place to ASCII
    add eax, '0'
    mov [result + ecx], al  ; Append tens ASCII character to `result`
    inc ecx                 ; Increment string length

    ; Convert the ones place to ASCII
    mov eax, edx
    add eax, '0'
    mov [result + ecx], al  ; Append ones ASCII character to `result`
    inc ecx                 ; Increment string length

    mov [len], ecx          ; Update length
    ret
