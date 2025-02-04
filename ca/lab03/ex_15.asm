.text
main:
 li a7, 5
 ecall
 add x1, a0, zero

 li a7, 5
 ecall
 addi x2, a0, 3

 xor t0, x1, x2
 
 slti t1, t0, 1
 slti t2, t0, 0
 xori t2, t2, 1

 li a7, 1
 and a0, t1, t2
 ecall 