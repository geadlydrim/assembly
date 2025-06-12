section .data
    ; Course 1
    course1_code db "CCS0021", 0
    course1_code_len equ $ - course1_code

    course1_title db "INFORMATION MANAGEMENT (LEC)", 0
    course1_title_len equ $ - course1_title

    course1_section db "TN211", 0
    course1_section_len equ $ - course1_section

    course1_units db "2", 0
    course1_units_len equ $ - course1_units

    course1_days db "F", 0
    course1_days_len equ $ - course1_days

    course1_time db "07:00:00-09:40:00", 0
    course1_time_len equ $ - course1_time

    course1_room db "ONLINE", 0
    course1_room_len equ $ - course1_room

    ; Create an array of pointers to the course attributes
    course1 dd course1_code, course1_title, course1_section, course1_units, course1_days, course1_time, course1_room

section .bss
    buffer resb 128  ; Reserve 128 bytes for a buffer

section .text
    global _start

_start:
    ; Set EBX to point to the course attributes
    mov ebx, course1

    ; Iterate over course attributes
    mov ecx, 7                ; Number of course attributes
print_loop:
    mov eax, [ebx]            ; Load the address of the current string
    call print_string          ; Print the string
    add ebx, 4                ; Move to the next pointer (4 bytes per pointer)
    loop print_loop           ; Decrement ECX and repeat if not zero

    ; Exit the program
    call exit

exit:
    mov eax, 1                ; syscall number for sys_exit
    xor ebx, ebx              ; return 0 status
    int 0x80

print_string:
    mov edx, [eax + 1]        ; Get the length of the string (first byte after the address)
    mov eax, 4                ; syscall number for sys_write
    mov ebx, 1                ; file descriptor (stdout)
    mov ecx, eax              ; address of the string
    int 0x80                  ; call kernel
    ret
