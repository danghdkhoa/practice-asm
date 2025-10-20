beq $s0, $s1, LABEL
	
sub $s2, $t0, $t1
	
j EXIT 	
	
LABEL: 
	add $s2, $t0, $t1

EXIT: 	
	li $v0, 10
	syscall