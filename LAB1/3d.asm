.data
nhap1: .asciiz "Nhap so nguyen 1: "
nhap2: .asciiz "\nNhap so nguyen 2: "
xuat1: .asciiz "\nTong 2 so nguyen: "
var1: .word 0
var2: .word 0
.text
.globl main
main: 
	li $v0, 4
	la $a0, nhap1
	syscall
	
	li $v0, 5
	syscall
	sw $v0, var1
	
	li $v0, 4
	la $a0, nhap2
	syscall
	
	li $v0, 5
	syscall
	sw $v0, var2
	
	lw $t1, var1
	lw $t2, var2
	
	li $v0, 4
	la $a0, xuat1
	syscall 
	
	add $a0, $t1, $t2
	
	li $v0, 1
	syscall 