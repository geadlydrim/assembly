section .data
    newline db 0xa, 0
    clear_screen db 0x1B, '[', '2', 'J', 0
    home_cursor  db 0x1B, '[', 'H', 0
    prompt_month db "Enter month (1-12): ", 0
    prompt_month_len equ $ - prompt_month
    prompt_day db "Enter day (1-31): ", 0
    prompt_day_len equ $ - prompt_day
    error_msg db "Error: Non-decimal character encountered.", 0
    error_msg_len equ $ - error_msg
    msg_my_sign db "My sign is ", 0
    msg_my_sign_len equ $ - msg_my_sign
    msg_short_desc db "Short description for ", 0
    msg_short_desc_len equ $ - msg_short_desc

    zodiac_aries db "Aries", 0
    zodiac_taurus db "Taurus", 0
    zodiac_gemini db "Gemini", 0
    zodiac_cancer db "Cancer", 0
    zodiac_leo db "Leo", 0
    zodiac_virgo db "Virgo", 0
    zodiac_libra db "Libra", 0
    zodiac_scorpio db "Scorpio", 0
    zodiac_sagittarius db "Sagittarius", 0
    zodiac_capricorn db "Capricorn", 0
    zodiac_aquarius db "Aquarius", 0
    zodiac_pisces db "Pisces", 0

    zodiac_array dd zodiac_aries, zodiac_taurus, zodiac_gemini, zodiac_cancer, zodiac_leo, zodiac_virgo, zodiac_libra, zodiac_scorpio, zodiac_sagittarius, zodiac_capricorn, zodiac_aquarius, zodiac_pisces

    desc_aries db "No filter, easily bored, and will do anything on a dare.", 0
    desc_taurus db "Stubborn, loves comfort, and enjoys the finer things in life.", 0
    desc_gemini db "Social, adaptable, and always seeking new experiences.", 0
    desc_cancer db "Nurturing, emotional, and protective of loved ones.", 0
    desc_leo db "Confident, dramatic, and loves being the center of attention.", 0
    desc_virgo db "Detail-oriented, practical, and always striving for perfection.", 0
    desc_libra db "Diplomatic, charming, and values balance and harmony.", 0
    desc_scorpio db "Intense, mysterious, and fiercely loyal.", 0
    desc_sagittarius db "Adventurous, optimistic, and loves freedom and exploration.", 0
    desc_capricorn db "Ambitious, disciplined, and focused on long-term goals.", 0
    desc_aquarius db "Innovative, independent, and values individuality and progress.", 0
    desc_pisces db "Compassionate, imaginative, and often lost in their own world.", 0

    zodiac_desc_array dd desc_aries, desc_taurus, desc_gemini, desc_cancer, desc_leo, desc_virgo, desc_libra, desc_scorpio, desc_sagittarius, desc_capricorn, desc_aquarius, desc_pisces

    art_aries db "   .-.   .-.", 0xa, \
               "  (_  \\ /  _)", 0xa, \
               "       |", 0xa, \
               "       |", 0xa, 0

    art_taurus db "    .     .", 0xa, \
                "    '.___.'", 0xa, \
                "    .'   `.", 0xa, \
                "   :       :", 0xa, \
                "   :       :", 0xa, \
                "    `.___.'", 0xa, 0

    art_gemini db "    ._____.", 0xa, \
                "      | |", 0xa, \
                "      | |", 0xa, \
                "     _|_|_", 0xa, \
                "    '     '", 0xa, 0

    art_cancer db "      .--.", 0xa, \
                "     /   _`.", 0xa, \
                "    (_) ( )", 0xa, \
                "   '.    /", 0xa, \
                "     `--'", 0xa, 0

    art_leo db "      .--.", 0xa, \
             "     (    )", 0xa, \
             "    (_)  /", 0xa, \
             "        (_,", 0xa, 0

    art_virgo db "   _", 0xa, \
               "  ' `:--.--.", 0xa, \
               "     |  |  |_", 0xa, \
               "     |  |  | )", 0xa, \
               "     |  |  |/", 0xa, \
               "          (J", 0xa, 0

    art_libra db "        __", 0xa, \
               "   ___.'  '.___", 0xa, \
               "   ____________", 0xa, 0

    art_scorpius db "   _", 0xa, \
                 "  ' `:--.--.", 0xa, \
                 "     |  |  |", 0xa, \
                 "     |  |  |", 0xa, \
                 "     |  |  |  ..,", 0xa, \
                 "           `---':", 0xa, 0

    art_sagittarius db "          ...", 0xa, \
                    "          .':", 0xa, \
                    "        .'", 0xa, \
                    "    `..'", 0xa, \
                    "    .'`.", 0xa, 0

    art_capricorn db "            _", 0xa, \
                  "    \\      /_)", 0xa, \
                  "     \\    /`.", 0xa, \
                  "      \\  /   ", 0xa, \
                  "       \\/ __.'", 0xa, 0

    art_aquarius db " .-''-._.-''-._.-", 0xa, \
                 " .-''-._.-''-._.-", 0xa, 0

    art_pisces db "     `-.    .-'", 0xa, \
               "        :  :", 0xa, \
               "      --:--:--", 0xa, \
               "        :  :", 0xa, \
               "     .-'    `-.", 0xa, 0

    art_array dd art_aries, art_taurus, art_gemini, art_cancer, art_leo, art_virgo, art_libra, art_scorpius, art_sagittarius, art_capricorn, art_aquarius, art_pisces


section .bss
    buffer resb 128
    char_count resb 128
    month resb 128 
    day resb 128
    zodiac_string resb 128
    zodiac_string_len resb 128
    zodiac_desc resb 128
    zodiac_desc_len resb 128
    zodiac_art resb 128
    zodiac_art_len resb 128

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

%macro PRINT_SIGN 0
    PRINT msg_my_sign, msg_my_sign_len
    PRINT zodiac_string, [zodiac_string_len]
    NEWLINE
    PRINT msg_short_desc, msg_short_desc_len
    PRINT zodiac_string, [zodiac_string_len]
    NEWLINE
    PRINT zodiac_desc, [zodiac_desc_len]
    NEWLINE
    NEWLINE
    PRINT zodiac_art, [zodiac_art_len]
%endmacro

; index, array, destination, len variable
%macro SET_FROM_ARRAY 4
%%set_zodiac:
    mov al, %1

    dec al
    mov ebx, 4
    mul ebx
    mov esi, %2
    mov edi, %3
    add esi, eax
    xor ecx, ecx
    mov ecx, 0
    mov ebx, [esi]
%%copy_char:
    mov al, [ebx]
    cmp al, 0
    je %%done_copy

    mov byte [edi + ecx], al

    inc ecx
    inc ebx
    jmp %%copy_char

%%done_copy:
    mov [%4], ecx
%endmacro

section .text
    global _start

_start:
    CLS
    PRINT prompt_month, prompt_month_len
    READ_INT buffer, 128, month        ; last parameter will contain converted decimal from string input
    PRINT prompt_day, prompt_day_len
    READ_INT buffer, 128, day

    call check_month
    PRINT_SIGN

    call exit



check_month:
    mov al, [month]
    cmp al, 1
    je january
    cmp al, 2
    je february
    cmp al, 3
    je march
    cmp al, 4
    je april
    cmp al, 5
    je may
    cmp al, 6
    je june
    cmp al, 7
    je july
    cmp al, 8
    je august
    cmp al, 9
    je september
    cmp al, 10
    je october
    cmp al, 11
    je november
    cmp al, 12
    je december

january:
    mov al, [day]
    cmp al, 19
    jle capricorn
    jmp aquarius

february:
    mov al, [day]
    cmp al, 18
    jle aquarius
    jmp pisces

march:
    mov al, [day]
    cmp al, 20
    jle pisces
    jmp aries

april:
    mov al, [day]
    cmp al, 19
    jle aries
    jmp taurus

may:
    mov al, [day]
    cmp al, 20
    jle taurus
    jmp gemini

june:
    mov al, [day]
    cmp al, 20
    jle gemini
    jmp cancer

july:
    mov al, [day]
    cmp al, 22
    jle cancer
    jmp leo

august:
    mov al, [day]
    cmp al, 22
    jle leo
    jmp virgo

september:
    mov al, [day]
    cmp al, 22
    jle virgo
    jmp libra

october:
    mov al, [day]
    cmp al, 22
    jle libra
    jmp scorpio

november:
    mov al, [day]
    cmp al, 21
    jle scorpio
    jmp sagittarius

december:
    mov al, [day]
    cmp al, 21
    jle sagittarius
    jmp capricorn

capricorn:
    SET_FROM_ARRAY 10, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 10, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 10, art_array, zodiac_art, zodiac_art_len
    ret

aquarius:
    SET_FROM_ARRAY 11, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 11, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 11, art_array, zodiac_art, zodiac_art_len
    ret

pisces:
    SET_FROM_ARRAY 12, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 12, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 12, art_array, zodiac_art, zodiac_art_len
    ret

aries:
    SET_FROM_ARRAY 1, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 1, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 1, art_array, zodiac_art, zodiac_art_len
    ret

taurus:
    SET_FROM_ARRAY 2, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 2, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 2, art_array, zodiac_art, zodiac_art_len
    ret

gemini:
    SET_FROM_ARRAY 3, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 3, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 3, art_array, zodiac_art, zodiac_art_len
    ret

cancer:
    SET_FROM_ARRAY 4, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 4, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 4, art_array, zodiac_art, zodiac_art_len
    ret

leo:
    SET_FROM_ARRAY 5, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 5, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 65, art_array, zodiac_art, zodiac_art_len
    ret

virgo:
    SET_FROM_ARRAY 6, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 6, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 6, art_array, zodiac_art, zodiac_art_len
    ret

libra:
    SET_FROM_ARRAY 7, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 7, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 7, art_array, zodiac_art, zodiac_art_len
    ret

scorpio:
    SET_FROM_ARRAY 8, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 8, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 8, art_array, zodiac_art, zodiac_art_len
    ret

sagittarius:
    SET_FROM_ARRAY 9, zodiac_array, zodiac_string, zodiac_string_len
    SET_FROM_ARRAY 9, zodiac_desc_array, zodiac_desc, zodiac_desc_len
    SET_FROM_ARRAY 9, art_array, zodiac_art, zodiac_art_len
    ret


exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
