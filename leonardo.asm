#Dominic Meconi
#22 Feb 2019
.data 
buffer: .space 20
str1: .asciiz "Please enter a nonnegative integer: "
str2: .asciiz "Try again."
nline: .asciiz "\n"
.text 

main:
	li 	$v0, 4	#says this will be a string type
	
	#States string "Enter a nonnegative number: "
	la	$t4, str1
	move	$a0, $t4
	syscall 
	
	la $v0, 5			#userinput for int
	syscall 
	move  $t3,$v0			#moves in register to be checked in check:
	
	 
	check: slti $t1,$t3,0
	beq $t1,$0, endChecker 		#terminates loop by branching out
	
	li 	$v0, 4			#says this will be a string type
	
	#States string "Try again."
	la	$t4, str2	
	move	$a0, $t4
	syscall 
	
	#states a string that creates a new line
	la	$t4, nline
	move	$a0, $t4
	syscall 
	
	#States string "Enter a nonnegative number: "
	la	$t4, str1
	move	$a0, $t4
	syscall 
	
	la $v0, 5			#userinput for int
	syscall 
	move  $t3,$v0			#moves in register to be checked in check:
	
	j 	check			#makes it loop
	
	endChecker:
	li	$t4, 1			#creates var a
	li	$t5, 1			#creates var b
	li	$t6, 0			#creates var c allows for swap
	
	
	#if statement to check to see if one or 0 if = to 0 jump to equals 0 if equals to one continue
	slti $t1,$t3,1
	beq $t0, $t1, equals1		#it equals one go to one case but needs to be check before loop
	j equals0			#it equals zero jump to the zero case
	
	
	#print intial 1 or 2
	equals1:			#if user input one go here
	li	$v0, 1 			#sets type of syscall
	move 	$a0, $t4		#moves to $a0 register to be printed
	syscall 
	
	#makes space
	li $a0, 32	#makes it assic
	li $v0, 11 # syscall number for printing character
	syscall 
	
	equals0:			#if it user input 0 go here
	li	$v0, 1 	
	move 	$a0, $t5		#moves to $a0 register to be printed
	syscall 
	
	#makes a space
	li $a0, 32	#makes it assic
	li $v0, 11 # syscall number for printing character
	syscall #works
	
	
	
	#if statement to see if = to one
	slti $t1,$t3,2 			#checks to see if it is <= to 1 if so do x condition
	subi $t3,$t3, 1			#accounts for 1 being printed before it branches
	beq $t0, $t1, lStart
	j lEnd
	
	
	lStart: slt	$t1,$t0,$t3	 #creates a condition to continue under $t0 < register statement
	beq	$t1, $0, lEnd		 #Ends loop and goes to lEnd at hardware 0
	
	li	$v0, 1 			#makes it output numbers
	
	add	$t6, $t4, $t5		#adds a + b in c
	addi	$t6,$t6,1		# adds one to c
	
	#lists the output from a + b
	move 	$a0, $t6		#moves to $a0 register to be printed
	syscall 
	
	#progresses the number chain for adding
	move	$t4,$t5			#sets b value in a
	move	$t5,$t6			#sets c value in b
	
	addi	$t0,$t0,1		#adds to t0 to make it closer to the limit of the if statement
	#makes a space
	li $a0, 32	#makes it assic
	li $v0, 11 # syscall number for printing character
	syscall 
	
	j	lStart #redoes a loop
lEnd:	

	li	$v0, 10		# exit cleanly
	syscall
