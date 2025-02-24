.text
main:
 li a7, 5
 ecall
 add t1, a0, zero
 
  bltz t1, make_pos
  j process
 
make_pos:
 neg t1, t1
 j process

process:
 li x1, 0

calc:	
 beqz t1, end
 
 li s0, 10
 rem s1, t1, s0
 div t1, t1, s0
 
 add x1, x1, s1
 j calc
 
end:
 li a7, 1
 add a0, x1, zero
 ecall
 
 li a7, 11
 li a0, '\n'
 ecall