.text
main:
 li a7, 5
 ecall
 add t1, a0, zero
 
  li s1, 0
  li s2, 0
  j process
 
process:
 beq s2, t1, end
 
 li a7, 5
 ecall
 add x2, a0, zero
 
 li t4, 2
 rem x1, s2, t4
 addi s2, s2, 1
 
 beqz x1, add_sum
 
 sub s1, s1, x2
 j process

add_sum:	
 add s1, s1, x2
 j process
 
end:
 li a7, 1
 add a0, s1, zero
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall