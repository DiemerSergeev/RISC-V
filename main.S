.data
N:
.word 3
M:
.word 2
matrix:
.word -3, 2, -1
.word -8, 5, -6
result:
.word 0

.text

main:
la a2, N #load address
la a3, M #load address
la a4, matrix #load address
la a5, result #load address
call process
la a2, M
la a3, result
call print
call exit


print:
lw t1, 0(a2)
addi t2, x0, 0

print_cycle:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall
ret

exit:
addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N temporary register
lw t2, 0(a3) # M
addi t4, x0, 0 # row pointer add constant

init:
addi t5, x0, 0 # result to save
addi t3, x0, 0 # row element number

Sum_neg:
add t5, t5, t6 # add number to result

cycle:
lw t6, 0(a4) # load value from matrix
addi a4, a4, 4 # increment array pointer
blt t6, x0, Sum_neg # if t6 number from matrix less 0 then Sum_neg
addi t3, t3, 1 #row number increment after sum
blt t3, t1, cycle # if row element number less then N cycle repeat
sw t5, 0(a5) # if row element number not less then N - save result to resulting array
addi a5, a5, 4
addi t4, t4, 1
blt t4, t2, init
ret