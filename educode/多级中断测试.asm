#############################################################
#中断演示程序，简单走马灯测试，按下1号键用数字1循环移位测试
#中断演示程序，简单走马灯测试，按下2号键用数字2循环移位测试
#最右侧显示数据是循环计数
#这只是中断服务程序演示程序，方便大家检查中断嵌套，
#设计时需要考虑开中断，关中断，设置中断屏蔽字如何用软件指令实现，如何保护现场，中断隐指令需要多少周期
#############################################################
.text
j Benchmark_Start	#跳转到benchmark处
addi $sp,$sp,-4   #25个寄存器压栈 1号
sw $1,0($sp)
addi $sp,$sp,-4
sw $2,0($sp)
addi $sp,$sp,-4
sw $3,0($sp)
addi $sp,$sp,-4
sw $4,0($sp)
addi $sp,$sp,-4
sw $5,0($sp)
addi $sp,$sp,-4
sw $6,0($sp)
addi $sp,$sp,-4
sw $7,0($sp)
addi $sp,$sp,-4
sw $8,0($sp)
addi $sp,$sp,-4
sw $9,0($sp)
addi $sp,$sp,-4
sw $10,0($sp)
addi $sp,$sp,-4
sw $11,0($sp)
addi $sp,$sp,-4
sw $12,0($sp)
addi $sp,$sp,-4
sw $13,0($sp)
addi $sp,$sp,-4
sw $14,0($sp)
addi $sp,$sp,-4
sw $15,0($sp)
addi $sp,$sp,-4
sw $16,0($sp)
addi $sp,$sp,-4
sw $17,0($sp)
addi $sp,$sp,-4
sw $18,0($sp)
addi $sp,$sp,-4
sw $19,0($sp)
addi $sp,$sp,-4
sw $20,0($sp)
addi $sp,$sp,-4
sw $21,0($sp)
addi $sp,$sp,-4
sw $22,0($sp)
addi $sp,$sp,-4
sw $23,0($sp)
addi $sp,$sp,-4
sw $24,0($sp)
addi $sp,$sp,-4
sw $25,0($sp)

MFC0 $1,$1	#屏蔽字到寄存器$1
#$1的屏蔽字压栈
addi $sp,$sp,-4
sw $1,0($sp)

MFC0 $2,$2	#EPC到寄存器$2
#$2的EPC压栈
addi $sp,$sp,-4
sw $2,0($sp)
#栈顶-EPC-屏蔽字-$31-$0

addi $1,$0,0x3	#1号中断的屏蔽字，4位
MTC0 $1,$1	#设置屏蔽字为0001

addi $3,$0,0x1	#IE置为1
MTC0 $3,$3	#关中断

addi $s6,$zero,1       #中断号1,2,3   不同中断号显示值不一样
addi $s4,$zero,6      #循环次数初始值  
addi $s5,$zero,1       #计数器累加值
###################################################################
#                逻辑左移，每次移位4位 
# 显示区域依次显示0x00000016 0x00000106 0x00001006 0x00010006 ... 10000006  00000006 依次循环6次
###################################################################
IntLoop1:
add $s0,$zero,$s6   
IntLeftShift1:       
sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.   

bne $s0, $zero, IntLeftShift1
sub $s4,$s4,$s5      #循环次数递减
bne $s4, $zero, IntLoop1

MTC0 $0,$3	#开中断

#EPC出栈$2
lw $2,0($sp)
addi $sp,$sp,4
MTC0 $2,$2	#$2恢复EPC

#屏蔽字出栈$1
lw $1,0($sp)
addi $sp,$sp,4
MTC0 $1,$1	#$1恢复屏蔽字

#32个寄存器出栈
lw $25,0($sp)
addi $sp,$sp,4
lw $24,0($sp)
addi $sp,$sp,4
lw $23,0($sp)
addi $sp,$sp,4
lw $22,0($sp)
addi $sp,$sp,4
lw $21,0($sp)
addi $sp,$sp,4
lw $20,0($sp)
addi $sp,$sp,4
lw $19,0($sp)
addi $sp,$sp,4
lw $18,0($sp)
addi $sp,$sp,4
lw $17,0($sp)
addi $sp,$sp,4
lw $16,0($sp)
addi $sp,$sp,4
lw $15,0($sp)
addi $sp,$sp,4
lw $14,0($sp)
addi $sp,$sp,4
lw $13,0($sp)
addi $sp,$sp,4
lw $12,0($sp)
addi $sp,$sp,4
lw $11,0($sp)
addi $sp,$sp,4
lw $10,0($sp)
addi $sp,$sp,4
lw $9,0($sp)
addi $sp,$sp,4
lw $8,0($sp)
addi $sp,$sp,4
lw $7,0($sp)
addi $sp,$sp,4
lw $6,0($sp)
addi $sp,$sp,4
lw $5,0($sp)
addi $sp,$sp,4
lw $4,0($sp)
addi $sp,$sp,4
lw $3,0($sp)
addi $sp,$sp,4
lw $2,0($sp)
addi $sp,$sp,4
lw $1,0($sp)
addi $sp,$sp,4

eret # 同时关中断
#addi   $v0,$zero,10         # system call for exit
#syscall                  # we are out of here. 




# 中断2
addi $sp,$sp,-4   #25个寄存器压栈 2号
sw $1,0($sp)
addi $sp,$sp,-4
sw $2,0($sp)
addi $sp,$sp,-4
sw $3,0($sp)
addi $sp,$sp,-4
sw $4,0($sp)
addi $sp,$sp,-4
sw $5,0($sp)
addi $sp,$sp,-4
sw $6,0($sp)
addi $sp,$sp,-4
sw $7,0($sp)
addi $sp,$sp,-4
sw $8,0($sp)
addi $sp,$sp,-4
sw $9,0($sp)
addi $sp,$sp,-4
sw $10,0($sp)
addi $sp,$sp,-4
sw $11,0($sp)
addi $sp,$sp,-4
sw $12,0($sp)
addi $sp,$sp,-4
sw $13,0($sp)
addi $sp,$sp,-4
sw $14,0($sp)
addi $sp,$sp,-4
sw $15,0($sp)
addi $sp,$sp,-4
sw $16,0($sp)
addi $sp,$sp,-4
sw $17,0($sp)
addi $sp,$sp,-4
sw $18,0($sp)
addi $sp,$sp,-4
sw $19,0($sp)
addi $sp,$sp,-4
sw $20,0($sp)
addi $sp,$sp,-4
sw $21,0($sp)
addi $sp,$sp,-4
sw $22,0($sp)
addi $sp,$sp,-4
sw $23,0($sp)
addi $sp,$sp,-4
sw $24,0($sp)
addi $sp,$sp,-4
sw $25,0($sp)

MFC0 $1,$1	#屏蔽字到寄存器$1
#$1的屏蔽字压栈
addi $sp,$sp,-4
sw $1,0($sp)

MFC0 $2,$2	#EPC到寄存器$2
#$2的EPC压栈
addi $sp,$sp,-4
sw $2,0($sp)
#栈顶-EPC-屏蔽字-$31-$0

addi $1,$0,0x7	#2号中断的屏蔽字，4位
MTC0 $1,$1	#设置屏蔽字为0011

addi $3,$0,0x1	#IE置为1
MTC0 $3,$3	#开中断

addi $s6,$zero,2       #中断号1,2,3   不同中断号显示值不一样
addi $s4,$zero,6      #循环次数初始值  
addi $s5,$zero,1       #计数器累加值
###################################################################
#                逻辑左移，每次移位4位 
# 显示区域依次显示0x00000016 0x00000106 0x00001006 0x00010006 ... 10000006  00000006 依次循环6次
###################################################################
IntLoop2:
add $s0,$zero,$s6   
IntLeftShift2:       
sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.   

bne $s0, $zero, IntLeftShift2
sub $s4,$s4,$s5      #循环次数递减
bne $s4, $zero, IntLoop2

MTC0 $0,$3	#关中断
#EPC出栈$2
lw $2,0($sp)
addi $sp,$sp,4
MTC0 $2,$2	#$2恢复EPC
#屏蔽字出栈$1
lw $1,0($sp)
addi $sp,$sp,4
MTC0 $1,$1	#$1恢复屏蔽字

#32个寄存器出栈
lw $25,0($sp)
addi $sp,$sp,4
lw $24,0($sp)
addi $sp,$sp,4
lw $23,0($sp)
addi $sp,$sp,4
lw $22,0($sp)
addi $sp,$sp,4
lw $21,0($sp)
addi $sp,$sp,4
lw $20,0($sp)
addi $sp,$sp,4
lw $19,0($sp)
addi $sp,$sp,4
lw $18,0($sp)
addi $sp,$sp,4
lw $17,0($sp)
addi $sp,$sp,4
lw $16,0($sp)
addi $sp,$sp,4
lw $15,0($sp)
addi $sp,$sp,4
lw $14,0($sp)
addi $sp,$sp,4
lw $13,0($sp)
addi $sp,$sp,4
lw $12,0($sp)
addi $sp,$sp,4
lw $11,0($sp)
addi $sp,$sp,4
lw $10,0($sp)
addi $sp,$sp,4
lw $9,0($sp)
addi $sp,$sp,4
lw $8,0($sp)
addi $sp,$sp,4
lw $7,0($sp)
addi $sp,$sp,4
lw $6,0($sp)
addi $sp,$sp,4
lw $5,0($sp)
addi $sp,$sp,4
lw $4,0($sp)
addi $sp,$sp,4
lw $3,0($sp)
addi $sp,$sp,4
lw $2,0($sp)
addi $sp,$sp,4
lw $1,0($sp)
addi $sp,$sp,4

eret
#addi   $v0,$zero,10         # system call for exit
#syscall                  # we are out of here.





addi $sp,$sp,-4   #25个寄存器压栈
sw $1,0($sp)
addi $sp,$sp,-4
sw $2,0($sp)
addi $sp,$sp,-4
sw $3,0($sp)
addi $sp,$sp,-4
sw $4,0($sp)
addi $sp,$sp,-4
sw $5,0($sp)
addi $sp,$sp,-4
sw $6,0($sp)
addi $sp,$sp,-4
sw $7,0($sp)
addi $sp,$sp,-4
sw $8,0($sp)
addi $sp,$sp,-4
sw $9,0($sp)
addi $sp,$sp,-4
sw $10,0($sp)
addi $sp,$sp,-4
sw $11,0($sp)
addi $sp,$sp,-4
sw $12,0($sp)
addi $sp,$sp,-4
sw $13,0($sp)
addi $sp,$sp,-4
sw $14,0($sp)
addi $sp,$sp,-4
sw $15,0($sp)
addi $sp,$sp,-4
sw $16,0($sp)
addi $sp,$sp,-4
sw $17,0($sp)
addi $sp,$sp,-4
sw $18,0($sp)
addi $sp,$sp,-4
sw $19,0($sp)
addi $sp,$sp,-4
sw $20,0($sp)
addi $sp,$sp,-4
sw $21,0($sp)
addi $sp,$sp,-4
sw $22,0($sp)
addi $sp,$sp,-4
sw $23,0($sp)
addi $sp,$sp,-4
sw $24,0($sp)
addi $sp,$sp,-4
sw $25,0($sp)

MFC0 $1,$1	#屏蔽字到寄存器$1
#$1的屏蔽字压栈
addi $sp,$sp,-4
sw $1,0($sp)

MFC0 $2,$2	#EPC到寄存器$2
#$2的EPC压栈
addi $sp,$sp,-4
sw $2,0($sp)
#栈顶-EPC-屏蔽字-$31-$0

addi $1,$0,0xf	#3号中断的屏蔽字，4位
MTC0 $1,$1	#设置屏蔽字为0111

addi $3,$0,0x1	#IE置为1
MTC0 $3,$3	#开中断

addi $s6,$zero,3       #中断号1,2,3   不同中断号显示值不一样
addi $s4,$zero,6      #循环次数初始值  
addi $s5,$zero,1       #计数器累加值
###################################################################
#                逻辑左移，每次移位4位 
# 显示区域依次显示0x00000016 0x00000106 0x00001006 0x00010006 ... 10000006  00000006 依次循环6次
###################################################################
IntLoop3:
add $s0,$zero,$s6   
IntLeftShift3:       
sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.   

bne $s0, $zero, IntLeftShift3
sub $s4,$s4,$s5      #循环次数递减
bne $s4, $zero, IntLoop3

MTC0 $0,$3	#关中断
#EPC出栈$2
lw $2,0($sp)
addi $sp,$sp,4
MTC0 $2,$2	#$2恢复EPC
#屏蔽字出栈$1
lw $1,0($sp)
addi $sp,$sp,4
MTC0 $1,$1	#$1恢复屏蔽字

#32个寄存器出栈
lw $25,0($sp)
addi $sp,$sp,4
lw $24,0($sp)
addi $sp,$sp,4
lw $23,0($sp)
addi $sp,$sp,4
lw $22,0($sp)
addi $sp,$sp,4
lw $21,0($sp)
addi $sp,$sp,4
lw $20,0($sp)
addi $sp,$sp,4
lw $19,0($sp)
addi $sp,$sp,4
lw $18,0($sp)
addi $sp,$sp,4
lw $17,0($sp)
addi $sp,$sp,4
lw $16,0($sp)
addi $sp,$sp,4
lw $15,0($sp)
addi $sp,$sp,4
lw $14,0($sp)
addi $sp,$sp,4
lw $13,0($sp)
addi $sp,$sp,4
lw $12,0($sp)
addi $sp,$sp,4
lw $11,0($sp)
addi $sp,$sp,4
lw $10,0($sp)
addi $sp,$sp,4
lw $9,0($sp)
addi $sp,$sp,4
lw $8,0($sp)
addi $sp,$sp,4
lw $7,0($sp)
addi $sp,$sp,4
lw $6,0($sp)
addi $sp,$sp,4
lw $5,0($sp)
addi $sp,$sp,4
lw $4,0($sp)
addi $sp,$sp,4
lw $3,0($sp)
addi $sp,$sp,4
lw $2,0($sp)
addi $sp,$sp,4
lw $1,0($sp)
addi $sp,$sp,4

eret
#addi   $v0,$zero,10         # system call for exit
#syscall                  # we are out of here. 



#interupt demo  main program 
#1st section, auto decrement counter and display
#2nd section: ccmb instruction test
Benchmark_Start:
addi $s1,$zero,0x200      #initial nubmer
addi $v0,$zero,34    
counter_branch:
add $a0,$0,$s1          
syscall                 #display number
addi $s1,$s1,-1         #decrement
bne $s1,$zero,counter_branch
nop
nop
nop
nop
addi $v0,$zero,10
syscall                 #pause
############################################
# insert your ccmb benchmark program here!!!
#C1 instruction



#C2 instruction



#Mem instruction




#Branch instruction




addi $v0,$zero,10
syscall                 #pause











