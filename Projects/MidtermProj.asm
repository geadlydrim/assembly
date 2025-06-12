section .data
    clear_screen db 0x1B, '[', '2', 'J', 0   ; ANSI escape code to clear screen
    home_cursor  db 0x1B, '[', 'H', 0
    newline db 0xA, 0            ; Newline character
    equal_signs times 20 db "="
    equal_signs_len equ $-equal_signs
    border db '||', 0

    msg_about_me db "About Me", 0 ; title
    msg_about_me_len equ $-msg_about_me

    msg_name_label db "Name: ", 0
    msg_name_label_len equ $-msg_name_label

    msg_email_label db "Email: ", 0
    msg_email_label_len equ $-msg_email_label

    msg_blog_label db "Blog/Website: ", 0
    msg_blog_label_len equ $-msg_blog_label

    msg_photo_label db "[PHOTO]", 0
    msg_photo_label_len equ $-msg_photo_label

    msg_my_firsts db "My Firsts", 0 ; title
    msg_my_firsts_len equ $-msg_my_firsts

    msg_first_achievement db "First big achievement: ", 0
    msg_first_achievement_len equ $-msg_first_achievement

    msg_first_risk db "First risk I ever took: ", 0
    msg_first_risk_len equ $-msg_first_risk

    msg_first_happy db "First time I felt completely happy: ", 0
    msg_first_happy_len equ $-msg_first_happy

    msg_my_faves db "My Faves", 0
    msg_my_faves_len equ $-msg_my_faves

    msg_colors_label db "Colors: ", 0
    msg_colors_label_len equ $-msg_colors_label

    msg_perfume_label db "Perfume: ", 0
    msg_perfume_label_len equ $-msg_perfume_label

    msg_music_label db "Music: ", 0
    msg_music_label_len equ $-msg_music_label

    msg_singer_label db "Singer(s): ", 0
    msg_singer_label_len equ $-msg_singer_label

    msg_song_label db "Song: ", 0
    msg_song_label_len equ $-msg_song_label

    msg_food_label db "Food: ", 0
    msg_food_label_len equ $-msg_food_label

    msg_weekend_activity db "Weekend Activity: ", 0
    msg_weekend_activity_len equ $-msg_weekend_activity

    msg_hobbies db "Hobbies", 0 ; title
    msg_hobbies_len equ $-msg_hobbies

    msg_tv_show_label db "TV Show: ", 0
    msg_tv_show_label_len equ $-msg_tv_show_label

    msg_movie_label db "Movie: ", 0
    msg_movie_label_len equ $-msg_movie_label

    msg_book_label db "Book: ", 0
    msg_book_label_len equ $-msg_book_label

    msg_celeb_label db "Celeb: ", 0
    msg_celeb_label_len equ $-msg_celeb_label

    msg_role_model_label db "Role model: ", 0
    msg_role_model_len equ $-msg_role_model_label

    msg_ambition db "Ambition", 0 ; title
    msg_ambition_len equ $-msg_ambition

    msg_ambition_label db "Ambition: ", 0
    msg_ambition_label_len equ $-msg_ambition_label

    msg_motto db "Motto", 0 ; title
    msg_motto_len equ $-msg_motto

    msg_motto_label db "Motto: ", 0
    msg_motto_label_len equ $-msg_motto_label

    about_me_line1 db ' _____ _           _      _____     ', 0xA
    about_me_line1_len equ $ - about_me_line1

    about_me_line2 db '|  _  | |_ ___ _ _| |_   |     |___ ', 0xA
    about_me_line2_len equ $ - about_me_line2

    about_me_line3 db '|     | . | . | | |  _|  | | | | -_|', 0xA
    about_me_line3_len equ $ - about_me_line3

    about_me_line4 db '|__|__|___|___|___|_|    |_|_|_|___|', 0xA
    about_me_line4_len equ $ - about_me_line4

    my_firsts_line1 db ' _____        _____ _         _       ', 0xA
    my_firsts_line1_len equ $ - my_firsts_line1

    my_firsts_line2 db '|     |_ _   |   __|_|___ ___| |_ ___ ', 0xA
    my_firsts_line2_len equ $ - my_firsts_line2

    my_firsts_line3 db '| | | | | |  |   __| |  _|_ -|  _|_ -|', 0xA
    my_firsts_line3_len equ $ - my_firsts_line3

    my_firsts_line4 db '|_|_|_|_  |  |__|  |_|_| |___|_| |___|', 0xA
    my_firsts_line4_len equ $ - my_firsts_line4

    my_firsts_line5 db '      |___|                           ', 0xA
    my_firsts_line5_len equ $ - my_firsts_line5

    my_faves_line1 db ' _____        _____                 ', 0xA
    my_faves_line1_len equ $ - my_faves_line1

    my_faves_line2 db '|     |_ _   |   __|___ _ _ ___ ___ ', 0xA
    my_faves_line2_len equ $ - my_faves_line2

    my_faves_line3 db "| | | | | |  |   __| .'| | | -_|_ -|", 0xA
    my_faves_line3_len equ $ - my_faves_line3

    my_faves_line4 db '|_|_|_|_  |  |__|  |__,|\_/|___|___|', 0xA
    my_faves_line4_len equ $ - my_faves_line4

    my_faves_line5 db '      |___|                          ', 0xA
    my_faves_line5_len equ $ - my_faves_line5

    hobbies_line1 db ' _____     _   _   _         ', 0xA
    hobbies_line1_len equ $ - hobbies_line1

    hobbies_line2 db '|  |  |___| |_| |_|_|___ ___ ', 0xA
    hobbies_line2_len equ $ - hobbies_line2

    hobbies_line3 db '|     | . | . | . | | -_|_ -|', 0xA
    hobbies_line3_len equ $ - hobbies_line3

    hobbies_line4 db '|__|__|___|___|___|_|___|___|', 0xA
    hobbies_line4_len equ $ - hobbies_line4


    ansi_code db 12 dup(0)  ; Reserve space for 12 characters in the BSS section.


section .bss
; about
    name_input resb 128          ; Reserve 128 bytes for Name input
    email_input resb 128         ; Reserve 128 bytes for Email input
    blog_input resb 128          ; Reserve 128 bytes for Blog/Website input
    photo_input resb 128         ; Reserve 128 bytes for Photo input
; my firsts
    first_achievement_input resb 128  ; Reserve 128 bytes for First big achievement input
    first_risk_input resb 128          ; Reserve 128 bytes for First risk input
    first_happy_input resb 128         ; Reserve 128 bytes for First time happy input
;my faves
    colors_input resb 128          ; Reserve 128 bytes for Colors input
    perfume_input resb 128         ; Reserve 128 bytes for Perfume input
    music_input resb 128           ; Reserve 128 bytes for Music input
    singer_input resb 128          ; Reserve 128 bytes for Singer input
    song_input resb 128            ; Reserve 128 bytes for Song input
    food_input resb 128            ; Reserve 128 bytes for Food input
    activity_input resb 128        ; Reserve 128 bytes for Weekend activity input
; hobbies
    tv_show_input resb 128         ; Reserve 128 bytes for TV Show input
    movie_input resb 128           ; Reserve 128 bytes for Movie input
    book_input resb 128            ; Reserve 128 bytes for Book input
    celeb_input resb 128           ; Reserve 128 bytes for Celeb input
    role_model_input resb 128      ; Reserve 128 bytes for Role model input
;ambition
    ambition_input resb 128        ; Reserve 128 bytes for Ambition input
;motto
    motto_input resb 128           ; Reserve 128 bytes for Motto input

    buffer resb 128
    char_count resb 128
    ansi_len resb 1   ; To keep track of string length (position to append next character).

section .text
    global _start

_start:
    ; Print title "About Me"
    mov ecx, msg_about_me
    mov edx, msg_about_me_len
    call print_string        ; Print the string
    call print_newline

    ; Print and read input for "Name: "
    mov ecx, msg_name_label
    mov edx, msg_name_label_len
    call print_string

    mov ecx, name_input
    mov edx, 128
    call read_input

    ; Print and read input for "Email: "
    mov ecx, msg_email_label
    mov edx, msg_email_label_len
    call print_string

    mov ecx, email_input
    mov edx, 128
    call read_input

    ; Print and read input for "Blog/Website: "
    mov ecx, msg_blog_label
    mov edx, msg_blog_label_len
    call print_string

    mov ecx, blog_input
    mov edx, 128
    call read_input

    ; Print and read input for "[PHOTO]"
    mov ecx, msg_photo_label
    mov edx, msg_photo_label_len
    call print_string

    mov ecx, photo_input
    mov edx, 128
    call read_input

    ; Print title "My Firsts"
    mov ecx, msg_my_firsts
    mov edx, msg_my_firsts_len
    call print_string
    call print_newline

    ; Print and read input for "First big achievement: "
    mov ecx, msg_first_achievement
    mov edx, msg_first_achievement_len
    call print_string

    mov ecx, first_achievement_input
    mov edx, 128
    call read_input

    ; Print and read input for "First risk I ever took: "
    mov ecx, msg_first_risk
    mov edx, msg_first_risk_len
    call print_string

    mov ecx, first_risk_input
    mov edx, 128
    call read_input

    ; Print and read input for "First time I felt completely happy: "
    mov ecx, msg_first_happy
    mov edx, msg_first_happy_len
    call print_string

    mov ecx, first_happy_input
    mov edx, 128
    call read_input

    ; Print title "My Faves"
    mov ecx, msg_my_faves
    mov edx, msg_my_faves_len
    call print_string
    call print_newline

    ; Print and read input for "Colors: "
    mov ecx, msg_colors_label
    mov edx, msg_colors_label_len
    call print_string

    mov ecx, colors_input
    mov edx, 128
    call read_input

    ; Print and read input for "Perfume: "
    mov ecx, msg_perfume_label
    mov edx, msg_perfume_label_len
    call print_string

    mov ecx, perfume_input
    mov edx, 128
    call read_input

    ; Print and read input for "Music: "
    mov ecx, msg_music_label
    mov edx, msg_music_label_len
    call print_string

    mov ecx, music_input
    mov edx, 128
    call read_input

    ; Print and read input for "Singer(s): "
    mov ecx, msg_singer_label
    mov edx, msg_singer_label_len
    call print_string

    mov ecx, singer_input
    mov edx, 128
    call read_input

    ; Print and read input for "Song: "
    mov ecx, msg_song_label
    mov edx, msg_song_label_len
    call print_string

    mov ecx, song_input
    mov edx, 128
    call read_input

    ; Print and read input for "Food: "
    mov ecx, msg_food_label
    mov edx, msg_food_label_len
    call print_string

    mov ecx, food_input
    mov edx, 128
    call read_input

    ; Print title "Weekend Activity"
    mov ecx, msg_weekend_activity
    mov edx, msg_weekend_activity_len
    call print_string

    mov ecx, activity_input
    mov edx, 128
    call read_input
    
    ; Print and read input for "TV Show: "
    mov ecx, msg_tv_show_label
    mov edx, msg_tv_show_label_len
    call print_string

    mov ecx, tv_show_input
    mov edx, 128
    call read_input

    ; Print and read input for "Movie: "
    mov ecx, msg_movie_label
    mov edx, msg_movie_label_len
    call print_string

    mov ecx, movie_input
    mov edx, 128
    call read_input

    ; Print and read input for "Book: "
    mov ecx, msg_book_label
    mov edx, msg_book_label_len
    call print_string

    mov ecx, book_input
    mov edx, 128
    call read_input

    ; Print and read input for "Celeb: "
    mov ecx, msg_celeb_label
    mov edx, msg_celeb_label_len
    call print_string

    mov ecx, celeb_input
    mov edx, 128
    call read_input

    ; Print and read input for "Role model: "
    mov ecx, msg_role_model_label
    mov edx, msg_role_model_len
    call print_string

    mov ecx, role_model_input
    mov edx, 128
    call read_input

    ; Print and read input for "Ambition: "
    mov ecx, msg_ambition_label
    mov edx, msg_ambition_label_len
    call print_string

    mov ecx, ambition_input
    mov edx, 128
    call read_input

    ; Print and read input for "Motto: "
    mov ecx, msg_motto_label
    mov edx, msg_motto_label_len
    call print_string

    mov ecx, motto_input
    mov edx, 128
    call read_input

    call cls
    call move_home_cursor

;===================================================================================================
    ; Print "About Me" title
    mov eax, 1                 ; Set eax to 1 for first line title
    mov ebx, 97                ; Set ebx to 97 for title alignment
    sub ebx, about_me_line1_len ; Adjust ebx based on string length
    call format_ansi
    call print_ansi

    mov ecx, about_me_line1     ; Set ecx to point to the first line
    mov edx, about_me_line1_len ; Set edx to the length of the first line
    call print_string

    mov eax, 2                 ; Increment eax for second line title
    mov ebx, 97                ; Set ebx to 97 for title alignment
    sub ebx, about_me_line2_len ; Adjust ebx based on string length
    call format_ansi
    call print_ansi

    mov ecx, about_me_line2     ; Set ecx to point to the second line
    mov edx, about_me_line2_len ; Set edx to the length of the second line
    call print_string

    mov eax, 3                 ; Increment eax for third line title
    mov ebx, 97                ; Set ebx to 97 for title alignment
    sub ebx, about_me_line3_len ; Adjust ebx based on string length
    call format_ansi
    call print_ansi

    mov ecx, about_me_line3     ; Set ecx to point to the third line
    mov edx, about_me_line3_len ; Set edx to the length of the third line
    call print_string

    mov eax, 4                 ; Increment eax for fourth line title
    mov ebx, 97                ; Set ebx to 97 for title alignment
    sub ebx, about_me_line4_len ; Adjust ebx based on string length
    call format_ansi
    call print_ansi

    mov ecx, about_me_line4     ; Set ecx to point to the fourth line
    mov edx, about_me_line4_len ; Set edx to the length of the fourth line
    call print_string


    ; Print "Name: " field
    mov eax, 2             ; Increment eax for each label
    mov ebx, 5             ; Set ebx to 5 for field alignment
    call format_ansi
    call print_ansi

    mov ecx, msg_name_label
    mov edx, msg_name_label_len
    call print_string

    mov ecx, name_input
    mov edx, 128
    call print_string

    ; Print "Email: " field
    mov eax, 3
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_email_label
    mov edx, msg_email_label_len
    call print_string

    mov ecx, email_input
    mov edx, 128
    call print_string

    ; Print "Blog/Website: " field
    mov eax, 4
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_blog_label
    mov edx, msg_blog_label_len
    call print_string

    mov ecx, blog_input
    mov edx, 128
    call print_string

    ; Print "[PHOTO]" field
    mov eax, 5
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_photo_label
    mov edx, msg_photo_label_len
    call print_string

    mov ecx, photo_input
    mov edx, 128
    call print_string

    ; Print "My Firsts" title
    mov eax, 6
    mov ebx, 97
    sub ebx, my_firsts_line1_len
    call format_ansi
    call print_ansi

    mov ecx, my_firsts_line1
    mov edx, my_firsts_line1_len
    call print_string

    mov eax, 7
    mov ebx, 97
    sub ebx, my_firsts_line2_len
    call format_ansi
    call print_ansi

    mov ecx, my_firsts_line2
    mov edx, my_firsts_line2_len
    call print_string

    mov eax, 8
    mov ebx, 97
    sub ebx, my_firsts_line3_len
    call format_ansi
    call print_ansi

    mov ecx, my_firsts_line3
    mov edx, my_firsts_line3_len
    call print_string

    mov eax, 9
    mov ebx, 97
    sub ebx, my_firsts_line4_len
    call format_ansi
    call print_ansi

    mov ecx, my_firsts_line4
    mov edx, my_firsts_line4_len
    call print_string

    mov eax, 10
    mov ebx, 97
    sub ebx, my_firsts_line5_len
    call format_ansi
    call print_ansi

    mov ecx, my_firsts_line5
    mov edx, my_firsts_line5_len
    call print_string


    ; Print "First big achievement: " field
    mov eax, 7
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_first_achievement
    mov edx, msg_first_achievement_len
    call print_string

    mov ecx, first_achievement_input
    mov edx, 128
    call print_string

    ; Print "First risk I ever took: " field
    mov eax, 8
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_first_risk
    mov edx, msg_first_risk_len
    call print_string

    mov ecx, first_risk_input
    mov edx, 128
    call print_string

    ; Print "First time I felt completely happy: " field
    mov eax, 9
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_first_happy
    mov edx, msg_first_happy_len
    call print_string

    mov ecx, first_happy_input
    mov edx, 128
    call print_string

    ; Print "My Faves" title
    mov eax, 10
    mov ebx, 97
    sub ebx, my_faves_line1_len
    call format_ansi
    call print_ansi

    mov ecx, my_faves_line1
    mov edx, my_faves_line1_len
    call print_string

    mov eax, 11
    mov ebx, 97
    sub ebx, my_faves_line2_len
    call format_ansi
    call print_ansi

    mov ecx, my_faves_line2
    mov edx, my_faves_line2_len
    call print_string

    mov eax, 12
    mov ebx, 97
    sub ebx, my_faves_line3_len
    call format_ansi
    call print_ansi

    mov ecx, my_faves_line3
    mov edx, my_faves_line3_len
    call print_string

    mov eax, 13
    mov ebx, 97
    sub ebx, my_faves_line4_len
    call format_ansi
    call print_ansi

    mov ecx, my_faves_line4
    mov edx, my_faves_line4_len
    call print_string

    mov eax, 14
    mov ebx, 97
    sub ebx, my_faves_line5_len
    call format_ansi
    call print_ansi

    mov ecx, my_faves_line5
    mov edx, my_faves_line5_len
    call print_string

    ; Print "Colors: " field
    mov eax, 11
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_colors_label
    mov edx, msg_colors_label_len
    call print_string

    mov ecx, colors_input
    mov edx, 128
    call print_string

    ; Print "Perfume: " field
    mov eax, 12
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_perfume_label
    mov edx, msg_perfume_label_len
    call print_string

    mov ecx, perfume_input
    mov edx, 128
    call print_string

    ; Print "Music: " field
    mov eax, 13
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_music_label
    mov edx, msg_music_label_len
    call print_string

    mov ecx, music_input
    mov edx, 128
    call print_string

    ; Print "Singer(s): " field
    mov eax, 14
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_singer_label
    mov edx, msg_singer_label_len
    call print_string

    mov ecx, singer_input
    mov edx, 128
    call print_string

    ; Print "Song: " field
    mov eax, 15
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_song_label
    mov edx, msg_song_label_len
    call print_string

    mov ecx, song_input
    mov edx, 128
    call print_string

    ; Print "Food: " field
    mov eax, 16
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_food_label
    mov edx, msg_food_label_len
    call print_string

    mov ecx, food_input
    mov edx, 128
    call print_string

    ; Print "Weekend activity: " field
    mov eax, 17
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_weekend_activity
    mov edx, msg_weekend_activity_len
    call print_string

    mov ecx, activity_input
    mov edx, 128
    call print_string

    ; Print "Hobbies: " field
    mov eax, 19
    mov ebx, 97
    sub ebx, hobbies_line1_len
    call format_ansi
    call print_ansi

    mov ecx, hobbies_line1
    mov edx, hobbies_line1_len
    call print_string

    mov eax, 20
    mov ebx, 97
    sub ebx, hobbies_line2_len
    call format_ansi
    call print_ansi

    mov ecx, hobbies_line2
    mov edx, hobbies_line2_len
    call print_string

    mov eax, 21
    mov ebx, 97
    sub ebx, hobbies_line3_len
    call format_ansi
    call print_ansi

    mov ecx, hobbies_line3
    mov edx, hobbies_line3_len
    call print_string

    mov eax, 22
    mov ebx, 97
    sub ebx, hobbies_line4_len
    call format_ansi
    call print_ansi

    mov ecx, hobbies_line4
    mov edx, hobbies_line4_len
    call print_string

    ; Print "TV Show: " field
    mov eax, 21
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_tv_show_label
    mov edx, msg_tv_show_label_len
    call print_string

    mov ecx, tv_show_input
    mov edx, 128
    call print_string

    ; Print "Movie: " field
    mov eax, 22
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_movie_label
    mov edx, msg_movie_label_len
    call print_string

    mov ecx, movie_input
    mov edx, 128
    call print_string

    ; Print "Book: " field
    mov eax, 23
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_book_label
    mov edx, msg_book_label_len
    call print_string

    mov ecx, book_input
    mov edx, 128
    call print_string

    ; Print "Celeb: " field
    mov eax, 24
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_celeb_label
    mov edx, msg_celeb_label_len
    call print_string

    mov ecx, celeb_input
    mov edx, 128
    call print_string

    ; Print "Role model: " field
    mov eax, 25
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_role_model_label
    mov edx, msg_role_model_len
    call print_string

    mov ecx, role_model_input
    mov edx, 128
    call print_string

    ; Print "Ambition: " field
    mov eax, 26
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_ambition_label
    mov edx, msg_ambition_label_len
    call print_string

    mov ecx, ambition_input
    mov edx, 128
    call print_string

    ; Print "Motto: " field
    mov eax, 27
    mov ebx, 5
    call format_ansi
    call print_ansi

    mov ecx, msg_motto_label
    mov edx, msg_motto_label_len
    call print_string

    mov ecx, motto_input
    mov edx, 128
    call print_string

    call print_border

    ; Exit the program
    call exit

print_string:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

print_border:
    mov eax, 1
    mov ebx, 1
    call print_loop
    ret

print_loop:
    push eax
    push ebx
    call format_ansi
    call print_ansi

    mov ecx, border
    mov edx, 2
    call print_string
    pop ebx
    pop eax

    mov ebx, 99
    push eax
    push ebx
    call format_ansi
    call print_ansi

    mov ecx, border
    mov edx, 2
    call print_string
    pop ebx
    pop eax

    inc eax
    mov ebx, 1
    cmp eax, 31
    jne print_loop

    ret

read_input:
    mov eax, 3
    mov ebx, 0
    int 0x80

    mov [char_count], eax

    mov al, [ecx + eax - 1]   ; Load the last byte from the buffer
    cmp al, 0xa               ; Compare with newline (ASCII 10)
    jne no_newline           ; If it's not a newline, skip
    mov eax, [char_count]
    mov byte [ecx + eax - 1], 0x0  ; Replace newline with null terminator

no_newline:
    ret

print_newline:
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    call print_string
    ret

cls:
    mov ecx, clear_screen   ; clear screen escape sequence
    mov edx, 5              ; length of the escape code
    call print_string
    ret

move_home_cursor:
    mov ecx, home_cursor    ; move cursor to home position escape sequence
    mov edx, 4              ; length of the escape code
    call print_string
    ret

format_ansi:
    push eax
    mov edi, ansi_code
    mov ecx, 12
    xor eax, eax

    rep stosb
    pop eax
    
    mov byte [ansi_code], 0x1B
    mov byte [ansi_code + 1], 0x5B
    mov byte [ansi_len], 2

    push eax
    call append_decimal_to_string
    pop eax

    push eax
    mov ecx, [ansi_len]
    mov byte [ansi_code + ecx], 0x3B ; append semi-colon ';'
    inc ecx
    mov [ansi_len], ecx
    pop eax

    push eax
    mov eax, ebx
    call append_decimal_to_string
    pop eax

    mov ecx, [ansi_len]
    mov byte [ansi_code + ecx], 0x48 ; append semi-colon 'H'
    inc ecx
    mov byte [ansi_code + ecx], 0
    mov [ansi_len], ecx

    ret

; 0x804a000 0x804a00c

; Function to convert decimal number in EAX to string and append to `ansi_code` in BSS
append_decimal_to_string:
    
    ; Load the length of the current string in ECX
    mov ecx, [ansi_len]

    ; Check if it's a two-digit number
    cmp eax, 9
    jg  two_digit_number    ; If greater than 9, it's a two-digit number


    add al, '0'
    ; Single-digit number
    mov [ansi_code + ecx], al  ; Append the ASCII character to `ansi_code`
    inc ecx                 ; Increment string length
    mov [ansi_len], ecx          ; Update length
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
    mov [ansi_code + ecx], al  ; Append tens ASCII character to `ansi_code`
    inc ecx                 ; Increment string length

    ; Convert the ones place to ASCII
    mov eax, edx
    add eax, '0'
    mov [ansi_code + ecx], al  ; Append ones ASCII character to `ansi_code`
    inc ecx                 ; Increment string length

    mov [ansi_len], ecx          ; Update length
    ret

print_ansi:
    mov ecx, ansi_code
    mov edx, [ansi_len]
    call print_string
    ret

exit:
    mov eax, 1
    int 0x80