sub $20, $15, $9
sub $20, $20, $9
add $15, $5, $15
add $15, $9, $15
slt $21, $20, $15
addi $10, $5, 15
ori $12, $6, 0xFF
andi $13, $7, 0xF0
lw $14, 8($0)
sw $15, 12($0)
beq $5, $6, label1
bne $5, $6, label2
bgtz $15, label3
j label4
nop

label1:
addi $16, $0, 1

label2:
addi $17, $0, 2

label3:
addi $18, $0, 3

label4:
addi $19, $0, 4