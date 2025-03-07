.text
.globl main

main:
  li a7,5
  ecall
  mv s0,a0
  slli t1,s0,2
  sub sp,sp,t1
  li t3,0
read_loop:
  bge t3,s0,call_sort
  li a7,5
  ecall
  slli t1,t3,2
  add t2,sp,t1
  sw a0,0(t2)
  addi t3,t3,1
  j read_loop

call_sort:
  mv a0,sp
  slli t1,s0,2
  add a1,sp,t1
  addi a1,a1,-4
  jal bubble_sort

  li t3,0
print_loop:
  bge t3,s0,done_print
  slli t1,t3,2
  add t2,sp,t1
  lw a0,0(t2)
  li a7,1
  ecall
  mv t4,s0
  addi t4,t4,-1
  beq t3,t4,no_space
  li a7,11
  li a0,32
  ecall
no_space:
  addi t3,t3,1
  j print_loop

done_print:
  li a7,11
  li a0,10
  ecall
  li a7,10
  ecall

bubble_sort:
  sub s3,a1,a0
  srli s3,s3,2
  addi s3,s3,1
  li t3,0
outer:
  bge t3,s3,bs_end
  li t4,0
  sub s5,s3,t3
  addi s5,s5,-1
inner:
  bge t4,s5,next_outer
  slli s6,t4,2
  add s7,a0,s6
  lw t5,0(s7)
  addi s6,s6,4
  add s7,a0,s6
  lw t6,0(s7)
  ble t5,t6,no_swap
  slli s6,t4,2
  add s7,a0,s6
  sw t6,0(s7)
  addi s6,s6,4
  add s7,a0,s6
  sw t5,0(s7)
no_swap:
  addi t4,t4,1
  j inner
next_outer:
  addi t3,t3,1
  j outer
bs_end:
  jr ra