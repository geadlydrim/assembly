section .bss
    buffer resb 256         ; Reserve 256 bytes for the line buffer
    string_array resd 100    ; Reserve space for 100 pointers (array of strings)
    string_count resd 1      ; Stores the count of strings in the array

section .text
    global _start

_start:
    ; Simulate opening a file and reading
    mov eax, 5               ; sys_open
    mov ebx, file_name       ; Pointer to filename
    mov ecx, 0               ; Read-only mode
    int 0x80
    
    test eax, eax
    js error                 ; Check if file opened successfully

    mov esi, eax             ; Store file descriptor in ESI

    ; Call read_line function
    call read_line

    ; Exit program
    mov eax, 1               ; sys_exit
    xor ebx, ebx
    int 0x80

read_line:
    mov eax, 3               ; sys_read
    mov ebx, esi             ; File descriptor
    mov ecx, buffer          ; Destination buffer
    mov edx, 256             ; Max bytes to read
    int 0x80
    
    test eax, eax            ; Check if read was successful
    jle .done                ; Exit if EOF or error

    ; Add buffer to the string array
    mov ecx, string_count
    mov ecx, [ecx]           ; Get current string count
    mov edx, string_array
    add edx, ecx             ; Point to next entry in string_array
    mov [edx * 4 + string_array], buffer

    ; Increment string count
    inc dword [string_count]

.done:
    ret

error:
    mov eax, 1               ; sys_exit
    mov ebx, -1
    int 0x80

section .data
    file_name db "example.txt", 0 ; Null-terminated file name
