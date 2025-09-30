.data
prompt1: .asciiz "Nhap so nguyen a: "
prompt2: .asciiz "\nNhap so nguyen b: "
result_max: .asciiz "\nSo lon hon: "
result_add: .asciiz "\nTong 2 so: "
result_sub: .asciiz "\nHieu 2 so (a - b): "
result_mul: .asciiz "\nTich 2 so: "
result_div: .asciiz "\nThuong 2 so (a / b): "
result_error: .asciiz "\nKhong the chia cho 0!"
.text

main: 
	# nhap a 
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	# nhap b
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	# tim so lon hon
	li $v0, 4
	la $a0, result_max
	syscall
	
	bgt $s0, $s1, a_max
	
	move $a0, $s1
	j print_max
	
a_max:
	move $a0, $s0
	
print_max:
	li $v0, 1
	syscall
	

	# tinh tong
	li $v0, 4
	la $a0, result_add
	syscall
	
	add $t0, $s0, $s1
	move $a0, $t0
	li $v0, 1
	syscall

	# tinh hieu
	li $v0, 4
	la $a0, result_sub
	syscall
	
	sub $t1, $s0, $s1
	move $a0, $t1
	li $v0, 1
	syscall
	
	# tinh tich
	li $v0, 4
	la $a0, result_mul
	syscall
	
	mult $s0, $s1
	mflo $t2
	move $a0, $t2
	li $v0, 1
	syscall
	
	# tinh thuong
	li $v0, 4
	la $a0, result_div
	syscall
	
	beqz $s1, divide_by_zero
	
	div $s0, $s1
	mflo $t3
	move $a0, $t3
	li $v0, 1
	syscall	
	j exit_program
	

divide_by_zero:
	li $v0, 4
	la $a0, result_error
	syscall
	
exit_program:
	li $v0, 10
	syscall
	
	
