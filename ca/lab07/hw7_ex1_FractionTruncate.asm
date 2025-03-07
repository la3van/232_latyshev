.text
.globl main

main:
	li a7, 5
	ecall
	mv t1, a0
	
	li a7, 5
	ecall
	mv t2, a0
	
	li a7, 5
	ecall
	mv t3, a0
	
	fcvt.d.w fa0, t1
	fcvt.d.w fa1, t2
	fdiv.d fa0, fa0, fa1
	
	mv a0, t3
	jal rounding
	
	li a7, 3
	ecall
	
	li a7, 11
	li a0, 10
	ecall
	
	li a7, 10
	ecall

rounding:
	mv t4, a0
	li t5, 1

st_10_cicle:
	beqz t4, st_10_ready
	li t6, 10
	mul t5, t5, t6
	addi t4, t4, -1
	j st_10_cicle

st_10_ready:
	fcvt.d.w fa1, t5
	fmul.d fa0, fa0, fa1
	fcvt.w.d t6, fa0, rne
	fcvt.d.w fa0, t6
	fdiv.d fa0, fa0, fa1
	jr ra