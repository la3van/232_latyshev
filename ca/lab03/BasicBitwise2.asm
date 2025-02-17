.text
main:
 li a7, 5
 ecall
 add x1, a0, zero

 li a7, 5
 ecall
 add x2, a0, zero


 li t1, -1
 slli t1, t1, 2
 
 li a7, 1
 and a0, x1, t1
 ecall 
 
 li a7, 11
 li a0, '\n'
 ecall
 
 li t1, -1
 srli t1, t1, 30
 
 li a7, 1
 or a0, x1, t1
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall
 
 li t1, 1
 sll t1, t1, x2
 li a7, 1
 or a0, t1, x1
 ecall 
 
 li a7, 11
 li a0, '\n'
 ecall
 
 li t1, 1
 sll t1, t1, x2
 not t1, t1
 
 li a7, 1
 and a0, x1, t1
 ecall 
 
 li a7, 11
 li a0, '\n'
 ecall
 
 addi t0, x2, 3
 xor t1, x1, t0
 seqz t2, t1
 xori t2, t2, 1

 li a7, 1
 add a0, t2, zero
 ecall 
 
 li a7, 11
 li a0, '\n'
 ecall
 
 li a5 -5
 slt a1, a5, x1

 slti a2, x2, 5

 li a7, 1
 and a0, a1, a2
 ecall

 li a7, 11
 li a0, '\n'
 ecall
