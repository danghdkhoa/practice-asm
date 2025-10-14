.data
nhap: .asciiz "Nhap: "
xuat: .asciiz "\nXuat: "
string1: .space 100
.text

.globl main

main:
	li $v0, 4
	la $a0, nhap
	syscall
	
	li $v0, 8
	la $a0, string1
	li $a1, 100
	syscall
	
	li $v0, 4
	la $a0, xuat
	syscall
	
	li $v0, 4
	la $a0, string1
	syscall