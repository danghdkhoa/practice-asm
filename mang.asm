.data
    msg_n:      .asciiz "Nhap so phan tu: "
    msg_in:     .asciiz "Nhap phan tu: "
    msg_max:    .asciiz "\nMax = "
    msg_min:    .asciiz "\nMin = "
    msg_sum:    .asciiz "\nTong = "
    msg_index:  .asciiz "\nNhap chi so: "
    msg_val:    .asciiz "Gia tri = "

    array:      .space 400       

.text
.globl main
main:
    # Nhap n
    li $v0, 4
    la $a0, msg_n
    syscall

    li $v0, 5
    syscall
    move $t0, $v0         


    la $t1, array          
    move $t2, $zero        
nhap_loop:
    beq $t2, $t0, xuly
    li $v0, 4
    la $a0, msg_in
    syscall
    li $v0, 5
    syscall
    sw $v0, 0($t1)
    addi $t1, $t1, 4
    addi $t2, $t2, 1
    j nhap_loop


xuly:
    la $t1, array
    lw $t3, 0($t1)       # max
    lw $t4, 0($t1)       # min
    move $t5, $zero      # sum
    move $t2, $zero      # i = 0
xuly_loop:
    beq $t2, $t0, in_ketqua
    lw $t6, 0($t1)


    bgt $t6, $t3, capnhat_max
    j kiemtra_min
capnhat_max:
    move $t3, $t6

kiemtra_min:
    blt $t6, $t4, capnhat_min
    j cong_sum
capnhat_min:
    move $t4, $t6

cong_sum:
    add $t5, $t5, $t6

    addi $t1, $t1, 4
    addi $t2, $t2, 1
    j xuly_loop


in_ketqua:
    li $v0, 4
    la $a0, msg_max
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, msg_min
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, msg_sum
    syscall
    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 4
    la $a0, msg_index
    syscall
    li $v0, 5
    syscall
    move $t7, $v0     

    la $t1, array
    mul $t7, $t7, 4
    add $t1, $t1, $t7
    lw $t8, 0($t1)

    li $v0, 4
    la $a0, msg_val
    syscall
    li $v0, 1
    move $a0, $t8
    syscall

    li $v0, 10
    syscall