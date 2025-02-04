.text
main:
 li a7, 5
 ecall
 add t0, a0, zero
 
 slli t0, t0, 2
 #li a7, 1
 #add a0, x1, zero
 #ecall
 

 li a7, 5
 ecall
 add t1, a0, zero
 
 sub t0, t0, t1
 addi t0, t0, 5
 srai t0, t0, 1
 
 #li a7, 1
 #add a0, t0, zero
 #ecall
 
 li a7, 1
 add a0, t0, zero
 ecall 
 
