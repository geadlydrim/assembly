section .data
    clear_screen db 0x1B, '[', '2', 'J', 0   ; ANSI escape code to clear screen
    home_cursor  db 0x1B, '[', 'H', 0

    newline db 0xA, 0            ; Newline character

    column_10 db 0x1B, '[', '1', '0', 'G', 0   ; Move cursor to column 10
    column_55 db 0x1B, '[', '5', '5', 'G', 0   ; Move cursor to column 55
    column_65 db 0x1B, '[', '6', '5', 'G', 0   ; Move cursor to column 65
    column_72 db 0x1B, '[', '7', '2', 'G', 0   ; Move cursor to column 72
    column_77 db 0x1B, '[', '7', '7', 'G', 0   ; Move cursor to column 77
    column_90 db 0x1B, '[', '9', '0', 'G', 0   ; Move cursor to column 90
    column_122 db 0x1B, '[', '1', '2', '2', 'G', 0  ; Move cursor to column 122
    
    msg_term db "Term: ", 0
    msg_term_len equ $ - msg_term
    msg_school_year db "School Year: ", 0
    msg_school_year_len equ $ - msg_school_year
    msg_student_id db "Student ID: ", 0
    msg_student_id_len equ $ - msg_student_id
    msg_name db "Name: ", 0
    msg_name_len equ $ - msg_name
    msg_college db "College: ", 0
    msg_college_len equ $ - msg_college
    msg_program db "Program: ", 0
    msg_program_len equ $ - msg_program
    msg_year_level db "Year Level: ", 0
    msg_year_level_len equ $ - msg_year_level

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

    ; Course 2
    course2_code db "CCS0021L", 0
    course2_code_len equ $ - course2_code
    course2_title db "INFORMATION MANAGEMENT (LAB)", 0
    course2_title_len equ $ - course2_title
    course2_section db "TN211", 0
    course2_section_len equ $ - course2_section
    course2_units db "1", 0
    course2_units_len equ $ - course2_units
    course2_days db "T", 0
    course2_days_len equ $ - course2_days
    course2_time db "07:00:00-09:50:00", 0
    course2_time_len equ $ - course2_time
    course2_room db "ONLINE", 0
    course2_room_len equ $ - course2_room

    ; Course 3
    course3_code db "CS0001", 0
    course3_code_len equ $ - course3_code
    course3_title db "DISCRETE STRUCTURES 1", 0
    course3_title_len equ $ - course3_title
    course3_section db "TN211", 0
    course3_section_len equ $ - course3_section
    course3_units db "3", 0
    course3_units_len equ $ - course3_units
    course3_days db "M/TH", 0
    course3_days_len equ $ - course3_days
    course3_time db "13:10:00-15:00:00 / 13:10:00-15:00:00", 0
    course3_time_len equ $ - course3_time
    course3_room db "F404 / F404", 0
    course3_room_len equ $ - course3_room

    ; Course 4
    course4_code db "CS0003", 0
    course4_code_len equ $ - course4_code
    course4_title db "COMPUTER SYSTEMS & ARCHITECTURE", 0
    course4_title_len equ $ - course4_title
    course4_section db "TN211", 0
    course4_section_len equ $ - course4_section
    course4_units db "2", 0
    course4_units_len equ $ - course4_units
    course4_days db "F", 0
    course4_days_len equ $ - course4_days
    course4_time db "13:10:00-15:50:00", 0
    course4_time_len equ $ - course4_time
    course4_room db "ONLINE", 0
    course4_room_len equ $ - course4_room

    ; Course 5
    course5_code db "CS0003L", 0
    course5_code_len equ $ - course5_code
    course5_title db "COMPUTER SYSTEMS & ARCHITECTURE (LAB)", 0
    course5_title_len equ $ - course5_title
    course5_section db "TN211", 0
    course5_section_len equ $ - course5_section
    course5_units db "1", 0
    course5_units_len equ $ - course5_units
    course5_days db "S", 0
    course5_days_len equ $ - course5_days
    course5_time db "13:10:00-16:00:00", 0
    course5_time_len equ $ - course5_time
    course5_room db "E610", 0
    course5_room_len equ $ - course5_room

    ; Course 6
    course6_code db "CS0070", 0
    course6_code_len equ $ - course6_code
    course6_title db "OBJECT ORIENTED PROGRAMMING", 0
    course6_title_len equ $ - course6_title
    course6_section db "TN211", 0
    course6_section_len equ $ - course6_section
    course6_units db "2", 0
    course6_units_len equ $ - course6_units
    course6_days db "T", 0
    course6_days_len equ $ - course6_days
    course6_time db "16:00:00-18:40:00", 0
    course6_time_len equ $ - course6_time
    course6_room db "ONLINE", 0
    course6_room_len equ $ - course6_room

    ; Course 7
    course7_code db "CS0070L", 0
    course7_code_len equ $ - course7_code
    course7_title db "OBJECT ORIENTED PROGRAMMING-LAB", 0
    course7_title_len equ $ - course7_title
    course7_section db "TN211", 0
    course7_section_len equ $ - course7_section
    course7_units db "1", 0
    course7_units_len equ $ - course7_units
    course7_days db "TH", 0
    course7_days_len equ $ - course7_days
    course7_time db "16:00:00-18:50:00", 0
    course7_time_len equ $ - course7_time
    course7_room db "E608", 0
    course7_room_len equ $ - course7_room

    ; Course 8
    course8_code db "GED0021", 0
    course8_code_len equ $ - course8_code
    course8_title db "SPECIALIZED ENGLISH PROGRAM 2", 0
    course8_title_len equ $ - course8_title
    course8_section db "TN211", 0
    course8_section_len equ $ - course8_section
    course8_units db "3", 0
    course8_units_len equ $ - course8_units
    course8_days db "M/TH", 0
    course8_days_len equ $ - course8_days
    course8_time db "11:00:00-12:50:00 / 11:00:00-12:50:00", 0
    course8_time_len equ $ - course8_time
    course8_room db "F509 / F509", 0
    course8_room_len equ $ - course8_room

    ; Course 9
    course9_code db "GED0075", 0
    course9_code_len equ $ - course9_code
    course9_title db "LINEAR ALGEBRA", 0
    course9_title_len equ $ - course9_title
    course9_section db "TN211", 0
    course9_section_len equ $ - course9_section
    course9_units db "3", 0
    course9_units_len equ $ - course9_units
    course9_days db "F/T", 0
    course9_days_len equ $ - course9_days
    course9_time db "11:00:00-12:50:00 / 11:00:00-12:50:00", 0
    course9_time_len equ $ - course9_time
    course9_room db "ONLINE / ONLINE", 0
    course9_room_len equ $ - course9_room

    ; Course 10
    course10_code db "GED0081", 0
    course10_code_len equ $ - course10_code
    course10_title db "COLLEGE PHYSICS 1 LECTURE", 0
    course10_title_len equ $ - course10_title
    course10_section db "TN211", 0
    course10_section_len equ $ - course10_section
    course10_units db "2", 0
    course10_units_len equ $ - course10_units
    course10_days db "F", 0
    course10_days_len equ $ - course10_days
    course10_time db "16:00:00-18:40:00", 0
    course10_time_len equ $ - course10_time
    course10_room db "ONLINE", 0
    course10_room_len equ $ - course10_room

    ; Course 11
    course11_code db "GED0081L", 0
    course11_code_len equ $ - course11_code
    course11_title db "COLLEGE PHYSICS 1 LABORATORY", 0
    course11_title_len equ $ - course11_title
    course11_section db "TN211", 0
    course11_section_len equ $ - course11_section
    course11_units db "1", 0
    course11_units_len equ $ - course11_units
    course11_days db "M", 0
    course11_days_len equ $ - course11_days
    course11_time db "16:00:00-18:50:00", 0
    course11_time_len equ $ - course11_time
    course11_room db "F1009", 0
    course11_room_len equ $ - course11_room

    ; Tuition Fees
    tuition_fee db "Tuition Fee (21)", 0
    tuition_fee_len equ $ - tuition_fee

    miscellaneous_fee db "Miscellaneous Fee", 0
    miscellaneous_fee_len equ $ - miscellaneous_fee

    id_validation_fee db "ID Validation Fee", 0
    id_validation_fee_len equ $ - id_validation_fee

    ite_lab_fee_ccs0021 db "ITE Computer Laboratory Fee (CCS0021)", 0
    ite_lab_fee_ccs0021_len equ $ - ite_lab_fee_ccs0021

    ite_lab_fee_cs0070 db "ITE Computer Laboratory Fee (CS0070)", 0
    ite_lab_fee_cs0070_len equ $ - ite_lab_fee_cs0070

    ite_lab_fee_cs0003 db "ITE Computer Laboratory Fee (CS0003)", 0
    ite_lab_fee_cs0003_len equ $ - ite_lab_fee_cs0003

    science_lab_fee db "Science Lab Fee (GED0081)", 0
    science_lab_fee_len equ $ - science_lab_fee

    total_assessment db "TOTAL ASSESSMENT", 0
    total_assessment_len equ $ - total_assessment

    down_payment db "Down Payment (Upon Enrollment)", 0
    down_payment_len equ $ - down_payment

    midterm db "Midterm (Oct 14 - Oct 16, 2024)", 0
    midterm_len equ $ - midterm

    final db "Final (Nov 29 - Dec 04, 2024)", 0
    final_len equ $ - final

    installment_fee db "Add on: Installment Fee", 0
    installment_fee_len equ $ - installment_fee

    ; Amounts
    tuition_fee_amount db "43,218.00", 0
    tuition_fee_amount_len equ $ - tuition_fee_amount

    miscellaneous_fee_amount db "9,865.00", 0
    miscellaneous_fee_amount_len equ $ - miscellaneous_fee_amount

    id_validation_fee_amount db "78.00", 0
    id_validation_fee_amount_len equ $ - id_validation_fee_amount

    ite_lab_fee_ccs0021_amount db "3,914.00", 0
    ite_lab_fee_ccs0021_amount_len equ $ - ite_lab_fee_ccs0021_amount

    ite_lab_fee_cs0070_amount db "3,914.00", 0
    ite_lab_fee_cs0070_amount_len equ $ - ite_lab_fee_cs0070_amount

    ite_lab_fee_cs0003_amount db "3,914.00", 0
    ite_lab_fee_cs0003_amount_len equ $ - ite_lab_fee_cs0003_amount

    science_lab_fee_amount db "4,007.00", 0
    science_lab_fee_amount_len equ $ - science_lab_fee_amount

    total_assessment_amount db "68,910.00", 0
    total_assessment_amount_len equ $ - total_assessment_amount

    down_payment_amount db "27,564.00", 0
    down_payment_amount_len equ $ - down_payment_amount

    midterm_amount db "20,673.00", 0
    midterm_amount_len equ $ - midterm_amount

    final_amount db "20,673.00", 0
    final_amount_len equ $ - final_amount

    installment_fee_amount db "250.00", 0
    installment_fee_amount_len equ $ - installment_fee_amount

section .bss
    term: resb 128
    school_year: resb 128
    student_id: resb 128
    name: resb 128
    college: resb 128
    program: resb 128
    year_level: resb 128

    ansi_cursor_pos resb 128   ; Reserve space for the ASCII string (256 bytes)
    length_var resb 4
    buffer resb 128
    temp resb 128

section .text
    global _start

_start:
    mov ecx, msg_term
    mov edx, msg_term_len
    call print_string

    mov ecx, term
    mov edx, 128
    call read_input

    mov ecx, msg_school_year
    mov edx, msg_school_year_len
    call print_string

    mov ecx, school_year
    mov edx, 128
    call read_input

    mov ecx, msg_student_id
    mov edx, msg_student_id_len
    call print_string

    mov ecx, student_id
    mov edx, 128
    call read_input

    mov ecx, msg_name
    mov edx, msg_name_len
    call print_string

    mov ecx, name
    mov edx, 128
    call read_input

    mov ecx, msg_college
    mov edx, msg_college_len
    call print_string

    mov ecx, college
    mov edx, 128
    call read_input

    mov ecx, msg_program
    mov edx, msg_program_len
    call print_string

    mov ecx, program
    mov edx, 128
    call read_input

    mov ecx, msg_year_level
    mov edx, msg_year_level_len
    call print_string

    mov ecx, year_level
    mov edx, 128
    call read_input

    call cls
    call move_home_cursor

    ; Print Term
    mov ecx, msg_term
    mov edx, msg_term_len
    call print_string

    mov ecx, term
    mov edx, 128
    call print_string

    ; Print School Year
    mov ecx, msg_school_year
    mov edx, msg_school_year_len
    call print_string

    mov ecx, school_year
    mov edx, 128
    call print_string

    ; Print Student ID
    mov ecx, msg_student_id
    mov edx, msg_student_id_len
    call print_string

    mov ecx, student_id
    mov edx, 128
    call print_string

    ; Print Name
    mov ecx, msg_name
    mov edx, msg_name_len
    call print_string

    mov ecx, name
    mov edx, 128
    call print_string

    ; Print College
    mov ecx, msg_college
    mov edx, msg_college_len
    call print_string

    mov ecx, college
    mov edx, 128
    call print_string

    ; Print Program
    mov ecx, msg_program
    mov edx, msg_program_len
    call print_string

    mov ecx, program
    mov edx, 128
    call print_string

    ; Print Year Level
    mov ecx, msg_year_level
    mov edx, msg_year_level_len
    call print_string

    mov ecx, year_level
    mov edx, 128
    call print_string

    call print_newline
    
    ; Course 1 Code
    mov ecx, course1_code
    mov edx, course1_code_len
    call print_string
    call move_column_10

    ; Course 1 Title
    mov ecx, course1_title
    mov edx, course1_title_len
    call print_string
    call move_column_55

    ; Course 1 Section
    mov ecx, course1_section
    mov edx, course1_section_len
    call print_string
    call move_column_65

    ; Course 1 Units
    mov ecx, course1_units
    mov edx, course1_units_len
    call print_string
    call move_column_72

    ; Course 1 Days
    mov ecx, course1_days
    mov edx, course1_days_len
    call print_string
    call move_column_77

    ; Course 1 Time
    mov ecx, course1_time
    mov edx, course1_time_len
    call print_string
    call move_column_122

    ; Course 1 Room
    mov ecx, course1_room
    mov edx, course1_room_len
    call print_string

    call print_newline

    ; Course 2 Code
    mov ecx, course2_code
    mov edx, course2_code_len
    call print_string
    call move_column_10

    ; Course 2 Title
    mov ecx, course2_title
    mov edx, course2_title_len
    call print_string
    call move_column_55

    ; Course 2 Section
    mov ecx, course2_section
    mov edx, course2_section_len
    call print_string
    call move_column_65

    ; Course 2 Units
    mov ecx, course2_units
    mov edx, course2_units_len
    call print_string
    call move_column_72

    ; Course 2 Days
    mov ecx, course2_days
    mov edx, course2_days_len
    call print_string
    call move_column_77

    ; Course 2 Time
    mov ecx, course2_time
    mov edx, course2_time_len
    call print_string
    call move_column_122

    ; Course 2 Room
    mov ecx, course2_room
    mov edx, course2_room_len
    call print_string

    call print_newline

    ; Course 3 Code
    mov ecx, course3_code
    mov edx, course3_code_len
    call print_string
    call move_column_10

    ; Course 3 Title
    mov ecx, course3_title
    mov edx, course3_title_len
    call print_string
    call move_column_55

    ; Course 3 Section
    mov ecx, course3_section
    mov edx, course3_section_len
    call print_string
    call move_column_65

    ; Course 3 Units
    mov ecx, course3_units
    mov edx, course3_units_len
    call print_string
    call move_column_72

    ; Course 3 Days
    mov ecx, course3_days
    mov edx, course3_days_len
    call print_string
    call move_column_77

    ; Course 3 Time
    mov ecx, course3_time
    mov edx, course3_time_len
    call print_string
    call move_column_122

    ; Course 3 Room
    mov ecx, course3_room
    mov edx, course3_room_len
    call print_string

    call print_newline

    ; Repeat this block for Course 4 to Course 11
    ; Course 4
    mov ecx, course4_code
    mov edx, course4_code_len
    call print_string
    call move_column_10

    ; Course 4 Title
    mov ecx, course4_title
    mov edx, course4_title_len
    call print_string
    call move_column_55

    ; Course 4 Section
    mov ecx, course4_section
    mov edx, course4_section_len
    call print_string
    call move_column_65

    ; Course 4 Units
    mov ecx, course4_units
    mov edx, course4_units_len
    call print_string
    call move_column_72

    ; Course 4 Days
    mov ecx, course4_days
    mov edx, course4_days_len
    call print_string
    call move_column_77

    ; Course 4 Time
    mov ecx, course4_time
    mov edx, course4_time_len
    call print_string
    call move_column_122

    ; Course 4 Room
    mov ecx, course4_room
    mov edx, course4_room_len
    call print_string

    call print_newline

    ; Course 5
    mov ecx, course5_code
    mov edx, course5_code_len
    call print_string
    call move_column_10

    ; Course 5 Title
    mov ecx, course5_title
    mov edx, course5_title_len
    call print_string
    call move_column_55

    ; Course 5 Section
    mov ecx, course5_section
    mov edx, course5_section_len
    call print_string
    call move_column_65

    ; Course 5 Units
    mov ecx, course5_units
    mov edx, course5_units_len
    call print_string
    call move_column_72

    ; Course 5 Days
    mov ecx, course5_days
    mov edx, course5_days_len
    call print_string
    call move_column_77

    ; Course 5 Time
    mov ecx, course5_time
    mov edx, course5_time_len
    call print_string
    call move_column_122

    ; Course 5 Room
    mov ecx, course5_room
    mov edx, course5_room_len
    call print_string

    call print_newline

    ; Course 6
    mov ecx, course6_code
    mov edx, course6_code_len
    call print_string
    call move_column_10

    ; Course 6 Title
    mov ecx, course6_title
    mov edx, course6_title_len
    call print_string
    call move_column_55

    ; Course 6 Section
    mov ecx, course6_section
    mov edx, course6_section_len
    call print_string
    call move_column_65

    ; Course 6 Units
    mov ecx, course6_units
    mov edx, course6_units_len
    call print_string
    call move_column_72

    ; Course 6 Days
    mov ecx, course6_days
    mov edx, course6_days_len
    call print_string
    call move_column_77

    ; Course 6 Time
    mov ecx, course6_time
    mov edx, course6_time_len
    call print_string
    call move_column_122

    ; Course 6 Room
    mov ecx, course6_room
    mov edx, course6_room_len
    call print_string

    call print_newline

    ; Course 7
    mov ecx, course7_code
    mov edx, course7_code_len
    call print_string
    call move_column_10

    ; Course 7 Title
    mov ecx, course7_title
    mov edx, course7_title_len
    call print_string
    call move_column_55

    ; Course 7 Section
    mov ecx, course7_section
    mov edx, course7_section_len
    call print_string
    call move_column_65

    ; Course 7 Units
    mov ecx, course7_units
    mov edx, course7_units_len
    call print_string
    call move_column_72

    ; Course 7 Days
    mov ecx, course7_days
    mov edx, course7_days_len
    call print_string
    call move_column_77

    ; Course 7 Time
    mov ecx, course7_time
    mov edx, course7_time_len
    call print_string
    call move_column_122

    ; Course 7 Room
    mov ecx, course7_room
    mov edx, course7_room_len
    call print_string

    call print_newline

    ; Course 8
    mov ecx, course8_code
    mov edx, course8_code_len
    call print_string
    call move_column_10

    ; Course 8 Title
    mov ecx, course8_title
    mov edx, course8_title_len
    call print_string
    call move_column_55

    ; Course 8 Section
    mov ecx, course8_section
    mov edx, course8_section_len
    call print_string
    call move_column_65

    ; Course 8 Units
    mov ecx, course8_units
    mov edx, course8_units_len
    call print_string
    call move_column_72

    ; Course 8 Days
    mov ecx, course8_days
    mov edx, course8_days_len
    call print_string
    call move_column_77

    ; Course 8 Time
    mov ecx, course8_time
    mov edx, course8_time_len
    call print_string
    call move_column_122

    ; Course 8 Room
    mov ecx, course8_room
    mov edx, course8_room_len
    call print_string

    call print_newline
    ; Course 9
    mov ecx, course9_code
    mov edx, course9_code_len
    call print_string

    call move_column_10

    ; Course 9 Title
    mov ecx, course9_title
    mov edx, course9_title_len
    call print_string
    call move_column_55

    ; Course 9 Section
    mov ecx, course9_section
    mov edx, course9_section_len
    call print_string
    call move_column_65

    ; Course 9 Units
    mov ecx, course9_units
    mov edx, course9_units_len
    call print_string
    call move_column_72

    ; Course 9 Days
    mov ecx, course9_days
    mov edx, course9_days_len
    call print_string
    call move_column_77

    ; Course 9 Time
    mov ecx, course9_time
    mov edx, course9_time_len
    call print_string
    call move_column_122

    ; Course 9 Room
    mov ecx, course9_room
    mov edx, course9_room_len
    call print_string

    call print_newline

    ; Course 10
    mov ecx, course10_code
    mov edx, course10_code_len
    call print_string
    call move_column_10

    ; Course 10 Title
    mov ecx, course10_title
    mov edx, course10_title_len
    call print_string
    call move_column_55

    ; Course 10 Section
    mov ecx, course10_section
    mov edx, course10_section_len
    call print_string
    call move_column_65

    ; Course 10 Units
    mov ecx, course10_units
    mov edx, course10_units_len
    call print_string
    call move_column_72

    ; Course 10 Days
    mov ecx, course10_days
    mov edx, course10_days_len
    call print_string
    call move_column_77

    ; Course 10 Time
    mov ecx, course10_time
    mov edx, course10_time_len
    call print_string
    call move_column_122

    ; Course 10 Room
    mov ecx, course10_room
    mov edx, course10_room_len
    call print_string

    call print_newline

    ; Course 11
    mov ecx, course11_code
    mov edx, course11_code_len
    call print_string
    call move_column_10

    ; Course 11 Title
    mov ecx, course11_title
    mov edx, course11_title_len
    call print_string
    call move_column_55

    ; Course 11 Section
    mov ecx, course11_section
    mov edx, course11_section_len
    call print_string
    call move_column_65

    ; Course 11 Units
    mov ecx, course11_units
    mov edx, course11_units_len
    call print_string
    call move_column_72

    ; Course 11 Days
    mov ecx, course11_days
    mov edx, course11_days_len
    call print_string
    call move_column_77

    ; Course 11 Time
    mov ecx, course11_time
    mov edx, course11_time_len
    call print_string
    call move_column_122

    ; Course 11 Room
    mov ecx, course11_room
    mov edx, course11_room_len
    call print_string

    call print_newline
    call print_newline

    ; Tuition Fee
    mov ecx, tuition_fee
    mov edx, tuition_fee_len
    call print_string
    call move_column_90

    mov ecx, tuition_fee_amount
    mov edx, tuition_fee_amount_len
    call print_string

    call print_newline

    ; Miscellaneous Fee
    mov ecx, miscellaneous_fee
    mov edx, miscellaneous_fee_len
    call print_string
    call move_column_90

    mov ecx, miscellaneous_fee_amount
    mov edx, miscellaneous_fee_amount_len
    call print_string

    call print_newline

    ; ID Validation Fee
    mov ecx, id_validation_fee
    mov edx, id_validation_fee_len
    call print_string
    call move_column_90

    mov ecx, id_validation_fee_amount
    mov edx, id_validation_fee_amount_len
    call print_string

    call print_newline

    ; ITE Computer Laboratory Fee (CCS0021)
    mov ecx, ite_lab_fee_ccs0021
    mov edx, ite_lab_fee_ccs0021_len
    call print_string
    call move_column_90

    mov ecx, ite_lab_fee_ccs0021_amount
    mov edx, ite_lab_fee_ccs0021_amount_len
    call print_string

    call print_newline

    ; ITE Computer Laboratory Fee (CS0070)
    mov ecx, ite_lab_fee_cs0070
    mov edx, ite_lab_fee_cs0070_len
    call print_string
    call move_column_90

    mov ecx, ite_lab_fee_cs0070_amount
    mov edx, ite_lab_fee_cs0070_amount_len
    call print_string

    call print_newline

    ; ITE Computer Laboratory Fee (CS0003)
    mov ecx, ite_lab_fee_cs0003
    mov edx, ite_lab_fee_cs0003_len
    call print_string
    call move_column_90

    mov ecx, ite_lab_fee_cs0003_amount
    mov edx, ite_lab_fee_cs0003_amount_len
    call print_string

    call print_newline

    ; Science Lab Fee
    mov ecx, science_lab_fee
    mov edx, science_lab_fee_len
    call print_string
    call move_column_90

    mov ecx, science_lab_fee_amount
    mov edx, science_lab_fee_amount_len
    call print_string

    call print_newline

    ; Total Assessment
    mov ecx, total_assessment
    mov edx, total_assessment_len
    call print_string
    call move_column_90

    mov ecx, total_assessment_amount
    mov edx, total_assessment_amount_len
    call print_string

    call print_newline
    call print_newline
    call print_newline

    ; Down Payment
    mov ecx, down_payment
    mov edx, down_payment_len
    call print_string
    call move_column_90

    mov ecx, down_payment_amount
    mov edx, down_payment_amount_len
    call print_string

    call print_newline

    ; Midterm
    mov ecx, midterm
    mov edx, midterm_len
    call print_string
    call move_column_90

    mov ecx, midterm_amount
    mov edx, midterm_amount_len
    call print_string

    call print_newline

    ; Final
    mov ecx, final
    mov edx, final_len
    call print_string
    call move_column_90

    mov ecx, final_amount
    mov edx, final_amount_len
    call print_string

    call print_newline

    ; Installment Fee
    mov ecx, installment_fee
    mov edx, installment_fee_len
    call print_string
    call move_column_90

    mov ecx, installment_fee_amount
    mov edx, installment_fee_amount_len
    call print_string

    call print_newline

    call exit

print_string:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

read_input:
    mov eax, 3
    mov ebx, 0
    int 0x80
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

move_column_10:
    mov ecx, column_10
    mov edx, 6
    call print_string
    ret

move_column_55:
    mov ecx, column_55
    mov edx, 6
    call print_string
    ret

move_column_65:
    mov ecx, column_65
    mov edx, 6
    call print_string
    ret

move_column_72:
    mov ecx, column_72
    mov edx, 6
    call print_string
    ret

move_column_77:
    mov ecx, column_77
    mov edx, 6
    call print_string
    ret

move_column_90:
    mov ecx, column_90
    mov edx, 6
    call print_string
    ret

move_column_122:
    mov ecx, column_122
    mov edx, 6
    call print_string
    ret

exit:
    mov eax, 1
    int 0x80