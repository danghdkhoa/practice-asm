.data
string1: .asciiz "Chao ban! Bal la sinh vien nam thu may?"
string2: .asciiz "\nHihi, minh la sinh vien nam thu 1 ^-^"
.text

main:
	li $v0, 4
	la $a0, string1
	syscall
	
	la $a0, string2
	syscall	