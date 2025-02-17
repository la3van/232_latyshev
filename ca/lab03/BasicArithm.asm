.text
main:
 li a7, 5
 ecall 
 add t0, a0, zero
 
 li a7, 5
 ecall 
 add t1, a0, zero
 
 addi a1, t0, 5
 addi a2, t1, -7
 
 li a7, 1
 sub a0, a1, a2
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall
 
 mul a1, t0, t0
 slli x1, a1, 1
 slli x2, t1, 1
 add x2, x2, t1
 sub x3, x1, x2
 addi x3, x3, 4
 
 li a7, 1
 add a0, x3, zero
 ecall 
 
 li a7, 11
 li a0, '\n'
 ecall
 
 addi x1, t0, 5
 div x1, x1, t1
 addi x2, zero, 10
 addi x3, t1, -1
 div x2, x2, x3
 
 li a7, 1
 add a0, x1, x2
 ecall 
 
 li a7, 11
 li a0, '\n'
 ecall
 
 div x1, t0, t1
 mul x1, x1, t1
 rem x2, t0, t1

 li a7, 1
 add a0, x1, x2
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall 
 
 li a7, 1
 slt a0, t0, t1
 xori a0, a0, 1
 ecall 
 
 li a7, 11
 li a0, '\n'
 ecall 