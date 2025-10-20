li $s2, 0
li $s0, 1
Loop:
	bgt $s0, $s1, LoopEnd
	
	add $s2, $s2, $s0
	
	addi $s0, $s0, 1
	j Loop

LoopEnd:
	li $v0, 10
	syscall