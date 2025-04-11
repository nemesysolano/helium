	.file	"numeric.c"
	.text
	.globl	sum_long
	.type	sum_long, @function
sum_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	ret
	.size	sum_long, .-sum_long
	.globl	sum_int
	.type	sum_int, @function
sum_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	%r9d, -40(%rbp)
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	addl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%eax, %edx
	movl	-32(%rbp), %eax
	addl	%eax, %edx
	movl	-36(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
	.size	sum_int, .-sum_int
	.globl	sum_double
	.type	sum_double, @function
sum_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -24(%rbp)
	movsd	%xmm1, -32(%rbp)
	movsd	%xmm2, -40(%rbp)
	movsd	%xmm3, -48(%rbp)
	movsd	%xmm4, -56(%rbp)
	movsd	%xmm5, -64(%rbp)
	movsd	-24(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	addsd	-48(%rbp), %xmm0
	addsd	-56(%rbp), %xmm0
	movsd	-64(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
#APP
# 19 "src/numeric.c" 1
	movq %xmm0, %rax

# 0 "" 2
#NO_APP
	movsd	-8(%rbp), %xmm0
	popq	%rbp
	ret
	.size	sum_double, .-sum_double
	.globl	mul_long
	.type	mul_long, @function
mul_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	movq	-24(%rbp), %rax
	imulq	-32(%rbp), %rax
	imulq	-40(%rbp), %rax
	imulq	-48(%rbp), %rax
	imulq	-56(%rbp), %rax
	movq	-64(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	ret
	.size	mul_long, .-mul_long
	.globl	mul_int
	.type	mul_int, @function
mul_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	%r9d, -40(%rbp)
	movl	-20(%rbp), %eax
	imull	-24(%rbp), %eax
	imull	-28(%rbp), %eax
	imull	-32(%rbp), %eax
	imull	-36(%rbp), %eax
	movl	-40(%rbp), %edx
	imull	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
	.size	mul_int, .-mul_int
	.globl	mul_double
	.type	mul_double, @function
mul_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -24(%rbp)
	movsd	%xmm1, -32(%rbp)
	movsd	%xmm2, -40(%rbp)
	movsd	%xmm3, -48(%rbp)
	movsd	%xmm4, -56(%rbp)
	movsd	%xmm5, -64(%rbp)
	movsd	-24(%rbp), %xmm0
	mulsd	-32(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	mulsd	-48(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	-64(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
#APP
# 39 "src/numeric.c" 1
	movq %xmm0, %rax

# 0 "" 2
#NO_APP
	movsd	-8(%rbp), %xmm0
	popq	%rbp
	ret
	.size	mul_double, .-mul_double
	.globl	sub_long
	.type	sub_long, @function
sub_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	ret
	.size	sub_long, .-sub_long
	.globl	sub_int
	.type	sub_int, @function
sub_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-20(%rbp), %eax
	subl	-24(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
	.size	sub_int, .-sub_int
	.globl	sub_double
	.type	sub_double, @function
sub_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -24(%rbp)
	movsd	%xmm1, -32(%rbp)
	movsd	-24(%rbp), %xmm0
	subsd	-32(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
#APP
# 57 "src/numeric.c" 1
	movq %xmm0, %rax

# 0 "" 2
#NO_APP
	movsd	-8(%rbp), %xmm0
	popq	%rbp
	ret
	.size	sub_double, .-sub_double
	.globl	div_long
	.type	div_long, @function
div_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L20
	cmpq	$0, -24(%rbp)
	jle	.L21
	movabsq	$9223372036854775807, %rax
	jmp	.L22
.L21:
	cmpq	$0, -24(%rbp)
	jns	.L23
	movabsq	$-9223372036854775808, %rax
	jmp	.L22
.L23:
	movl	$0, %eax
	jmp	.L22
.L20:
	movq	-24(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
.L22:
	popq	%rbp
	ret
	.size	div_long, .-div_long
	.globl	div_int
	.type	div_int, @function
div_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	cmpl	$0, -24(%rbp)
	jne	.L25
	cmpl	$0, -20(%rbp)
	jle	.L26
	movl	$2147483647, %eax
	jmp	.L27
.L26:
	cmpl	$0, -20(%rbp)
	jns	.L28
	movl	$-2147483648, %eax
	jmp	.L27
.L28:
	movl	$0, %eax
	jmp	.L27
.L25:
	movl	-20(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
.L27:
	popq	%rbp
	ret
	.size	div_int, .-div_int
	.globl	div_double
	.type	div_double, @function
div_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -24(%rbp)
	movsd	%xmm1, -32(%rbp)
	movsd	-24(%rbp), %xmm0
	divsd	-32(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
#APP
# 94 "src/numeric.c" 1
	movq %xmm0, %rax

# 0 "" 2
#NO_APP
	movsd	-8(%rbp), %xmm0
	popq	%rbp
	ret
	.size	div_double, .-div_double
	.globl	clear_int_sum_param_registers
	.type	clear_int_sum_param_registers, @function
clear_int_sum_param_registers:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
#APP
# 101 "src/numeric.c" 1
	xor %rdi, %rdi
xor %rsi, %rsi
xor %rdx, %rdx
xor %rcx, %rcx
xor %r8, %r8
xor %r9, %r9

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	ret
	.size	clear_int_sum_param_registers, .-clear_int_sum_param_registers
	.globl	clear_double_sum_param_registers
	.type	clear_double_sum_param_registers, @function
clear_double_sum_param_registers:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
#APP
# 112 "src/numeric.c" 1
	pxor %xmm0, %xmm0
pxor %xmm1, %xmm1
pxor %xmm2, %xmm2
pxor %xmm3, %xmm3
pxor %xmm4, %xmm4
pxor %xmm5, %xmm5

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	ret
	.size	clear_double_sum_param_registers, .-clear_double_sum_param_registers
	.globl	clear_int_mul_param_registers
	.type	clear_int_mul_param_registers, @function
clear_int_mul_param_registers:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
#APP
# 123 "src/numeric.c" 1
	mov $1, %rdi
mov $1, %rsi
mov $1, %rdx
mov $1, %rcx
mov $1, %r8
mov $1, %r9

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	ret
	.size	clear_int_mul_param_registers, .-clear_int_mul_param_registers
	.globl	clear_double_mul_param_registers
	.type	clear_double_mul_param_registers, @function
clear_double_mul_param_registers:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
#APP
# 134 "src/numeric.c" 1
	mov $1,  %rdx
movd %rdx, %xmm0
movd %rdx, %xmm1
movd %rdx, %xmm2
movd %rdx, %xmm3
movd %rdx, %xmm4
movd %rdx, %xmm5

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	ret
	.size	clear_double_mul_param_registers, .-clear_double_mul_param_registers
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
