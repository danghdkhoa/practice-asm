.data
# Chu?i thông báo
prompt1: .asciiz "Nhap so nguyen thu nhat (a): "
prompt2: .asciiz "Nhap so nguyen thu hai (b): "
result_max: .asciiz "So lon hon la: "
result_sum: .asciiz "Tong (a + b) = "
result_diff: .asciiz "Hieu (a - b) = "
result_prod: .asciiz "Tich (a * b) = "
result_quot: .asciiz "Thuong (a / b) = "
result_rem: .asciiz "So du (a % b) = "
newline: .asciiz "\n"

.text
.globl main

main:
	# nhap so nguyen 1
    li $v0, 4            
    la $a0, prompt1       
    syscall                

    li $v0, 5              
    syscall               
    move $t0, $v0        

	# nhap so nguyen 2
    li $v0, 4              
    la $a0, prompt2       
    syscall                

    li $v0, 5            
    syscall                
    move $t1, $v0         


    li $v0, 4
    la $a0, newline
    syscall


    li $v0, 4
    la $a0, result_max
    syscall

    bgt $t0, $t1, a_is_greater 
    move $a0, $t1              
    j print_max              
a_is_greater:
    move $a0, $t0             
print_max:
    li $v0, 1              
    syscall               


    li $v0, 4
    la $a0, newline
    syscall

	# a + b
    add $t2, $t0, $t1  
    li $v0, 4
    la $a0, result_sum
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, newline
    syscall

 	# a - b 
    sub $t2, $t0, $t1      
    li $v0, 4
    la $a0, result_diff
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, newline
    syscall

 	# a * b
    mult $t0, $t1         
    mflo $t2              
    li $v0, 4
    la $a0, result_prod
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, newline
    syscall

	# a / b
    div $t0, $t1          
    
    li $v0, 4
    la $a0, result_quot
    syscall
    mflo $a0             
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall
    
	# a % b
    li $v0, 4
    la $a0, result_rem
    syscall
    mfhi $a0               
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10            
    syscall