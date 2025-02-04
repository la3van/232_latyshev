.text
main:
 li a7, 5
 ecall
 add t0, a0, zero
 
 mul t0, t0, t0
 slli x1, t0, 1
 #li a7, 1
 #add a0, x1, zero
 #ecall
 

 li a7, 5
 ecall
 add t1, a0, zero
 slli x2, t1, 1
 add x2, x2, t1
 #li a7, 1
 #add a0, x2, zero
 #ecall
 
 sub t2, x1, x2
 addi t2, t2, 4
 
 li a7, 1
 add a0, t2, zero
 ecall 
 