.text
main:
 li a7, 5
 ecall
 add t0, a0, zero

 li a7, 5
 ecall
 add t1, a0, zero
 
 srli x1, t0, 2
 addi x2, t1, -1
 slli x2, x2, 3
 
 li a7, 1
 add a0, x1, x2
 ecall 
 
 li a7, 11
 li a0, '\n'
 ecall
 
 li a7, 1
 sll t2, t0, t1
 addi a0, t2, -10
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall
 
 sra t2, t0, t1
 
 li a7, 1
 addi a0, t2, 10
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall
 
 slli x1, t0, 2
 sub x1, x1, t1
 addi x1, x1, 5
 srai x1, x1, 1
 
 li a7, 1
 add a0, x1, zero
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall
 
 slli x1, t0, 1
 add x3, x1, x1
 add x3, x3, x1
 
 slli x2, t1, 1
 add x2, x2, t1
 
 li a7, 1
 sub a0, x3, x2
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall
 