.data
prompt:      .asciiz "Nhap ky tu (chi mot ky tu): "
prev_label:  .asciiz "Ky tu truoc: "
next_label:  .asciiz "Ky tu sau: "
type_label:  .asciiz "Loai ky tu: "

type_digit:  .asciiz "So"
type_lower:  .asciiz "Chu thuong"
type_upper:  .asciiz "Chu hoa"
invalid:     .asciiz "invalid type"
newline:     .asciiz "\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, prompt
    syscall

    li   $v0, 12
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, newline
    syscall
    
    li   $v0, 4
    la   $a0, prev_label
    syscall

    addi $t1, $t0, -1

    li $t3, '0'
    li $t4, '9'
    blt $t1, $t3, check_prev_upper
    bgt $t1, $t4, check_prev_upper
    j print_prev_valid
check_prev_upper:
    li $t3, 'A'
    li $t4, 'Z'
    blt $t1, $t3, check_prev_lower
    bgt $t1, $t4, check_prev_lower
    j print_prev_valid
check_prev_lower:
    li $t3, 'a'
    li $t4, 'z'
    blt $t1, $t3, print_prev_is_invalid 
    bgt $t1, $t4, print_prev_is_invalid 
    j print_prev_valid

print_prev_valid:
    li   $v0, 11
    move $a0, $t1
    syscall
    j after_prev_check

print_prev_is_invalid:
    la $a0, invalid
    li $v0, 4
    syscall
    j after_prev_check

after_prev_check:
    li $v0, 4
    la $a0, newline
    syscall
    
    la $a0, next_label
    syscall

    addi $t2, $t0, 1
    
    li $t3, '0'
    li $t4, '9'
    blt $t2, $t3, check_next_upper
    bgt $t2, $t4, check_next_upper
    j print_next_valid
check_next_upper:
    li $t3, 'A'
    li $t4, 'Z'
    blt $t2, $t3, check_next_lower
    bgt $t2, $t4, check_next_lower
    j print_next_valid
check_next_lower:
    li $t3, 'a'
    li $t4, 'z'
    blt $t2, $t3, print_next_is_invalid
    bgt $t2, $t4, print_next_is_invalid 
    j print_next_valid

print_next_valid:
    li   $v0, 11
    move $a0, $t2
    syscall
    j after_next_check

print_next_is_invalid:
    la $a0, invalid
    li $v0, 4
    syscall
    j after_next_check 

after_next_check:
    li $v0, 4
    la $a0, newline
    syscall
    
    la $a0, type_label
    syscall

    li $t3, '0'
    li $t4, '9'
    blt $t0, $t3, check_input_upper
    bgt $t0, $t4, check_input_upper
    la $a0, type_digit
    j print_type
check_input_upper:
    li $t3, 'A'
    li $t4, 'Z'
    blt $t0, $t3, check_input_lower
    bgt $t0, $t4, check_input_lower
    la $a0, type_upper
    j print_type
check_input_lower:
    li $t3, 'a'
    li $t4, 'z'
    blt $t0, $t3, print_invalid_type
    bgt $t0, $t4, print_invalid_type
    la $a0, type_lower
    j print_type

print_invalid_type:
    la $a0, invalid
    j print_type

print_type:
    li $v0, 4
    syscall
    
    li   $v0, 10
    syscall
