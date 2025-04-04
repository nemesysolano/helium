	.text
	.file	"numeric.c"
	.globl	sum_long                        # -- Begin function sum_long
	.p2align	4, 0x90
	.type	sum_long,@function
sum_long:                               # @sum_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-8(%rbp), %rax
	addq	-16(%rbp), %rax
	addq	-24(%rbp), %rax
	addq	-32(%rbp), %rax
	addq	-40(%rbp), %rax
	addq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	sum_long, .Lfunc_end0-sum_long
                                        # -- End function
	.globl	sum_int                         # -- Begin function sum_int
	.p2align	4, 0x90
	.type	sum_int,@function
sum_int:                                # @sum_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movl	%r9d, -24(%rbp)
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	addl	-12(%rbp), %eax
	addl	-16(%rbp), %eax
	addl	-20(%rbp), %eax
	addl	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end1:
	.size	sum_int, .Lfunc_end1-sum_int
                                        # -- End function
	.globl	sum_double                      # -- Begin function sum_double
	.p2align	4, 0x90
	.type	sum_double,@function
sum_double:                             # @sum_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	%xmm2, -24(%rbp)
	movsd	%xmm3, -32(%rbp)
	movsd	%xmm4, -40(%rbp)
	movsd	%xmm5, -48(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	addsd	-16(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	addsd	-48(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	#APP
	movq	%xmm0, %rax

	#NO_APP
	movsd	-56(%rbp), %xmm0                # xmm0 = mem[0],zero
	popq	%rbp
	retq
.Lfunc_end2:
	.size	sum_double, .Lfunc_end2-sum_double
                                        # -- End function
	.globl	mul_long                        # -- Begin function mul_long
	.p2align	4, 0x90
	.type	mul_long,@function
mul_long:                               # @mul_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-8(%rbp), %rax
	imulq	-16(%rbp), %rax
	imulq	-24(%rbp), %rax
	imulq	-32(%rbp), %rax
	imulq	-40(%rbp), %rax
	imulq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end3:
	.size	mul_long, .Lfunc_end3-mul_long
                                        # -- End function
	.globl	mul_int                         # -- Begin function mul_int
	.p2align	4, 0x90
	.type	mul_int,@function
mul_int:                                # @mul_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movl	%r9d, -24(%rbp)
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	imull	-12(%rbp), %eax
	imull	-16(%rbp), %eax
	imull	-20(%rbp), %eax
	imull	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end4:
	.size	mul_int, .Lfunc_end4-mul_int
                                        # -- End function
	.globl	mul_double                      # -- Begin function mul_double
	.p2align	4, 0x90
	.type	mul_double,@function
mul_double:                             # @mul_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	%xmm2, -24(%rbp)
	movsd	%xmm3, -32(%rbp)
	movsd	%xmm4, -40(%rbp)
	movsd	%xmm5, -48(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	mulsd	-16(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	mulsd	-32(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	mulsd	-48(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	#APP
	movq	%xmm0, %rax

	#NO_APP
	movsd	-56(%rbp), %xmm0                # xmm0 = mem[0],zero
	popq	%rbp
	retq
.Lfunc_end5:
	.size	mul_double, .Lfunc_end5-mul_double
                                        # -- End function
	.globl	sub_long                        # -- Begin function sub_long
	.p2align	4, 0x90
	.type	sub_long,@function
sub_long:                               # @sub_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end6:
	.size	sub_long, .Lfunc_end6-sub_long
                                        # -- End function
	.globl	sub_int                         # -- Begin function sub_int
	.p2align	4, 0x90
	.type	sub_int,@function
sub_int:                                # @sub_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end7:
	.size	sub_int, .Lfunc_end7-sub_int
                                        # -- End function
	.globl	sub_double                      # -- Begin function sub_double
	.p2align	4, 0x90
	.type	sub_double,@function
sub_double:                             # @sub_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	subsd	-16(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	#APP
	movq	%xmm0, %rax

	#NO_APP
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	popq	%rbp
	retq
.Lfunc_end8:
	.size	sub_double, .Lfunc_end8-sub_double
                                        # -- End function
	.globl	div_long                        # -- Begin function div_long
	.p2align	4, 0x90
	.type	div_long,@function
div_long:                               # @div_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.LBB9_6
# %bb.1:
	cmpq	$0, -16(%rbp)
	jle	.LBB9_3
# %bb.2:
	movabsq	$9223372036854775807, %rax      # imm = 0x7FFFFFFFFFFFFFFF
	movq	%rax, -8(%rbp)
	jmp	.LBB9_7
.LBB9_3:
	cmpq	$0, -16(%rbp)
	jge	.LBB9_5
# %bb.4:
	movabsq	$-9223372036854775808, %rax     # imm = 0x8000000000000000
	movq	%rax, -8(%rbp)
	jmp	.LBB9_7
.LBB9_5:
	movq	$0, -8(%rbp)
	jmp	.LBB9_7
.LBB9_6:
	movq	-16(%rbp), %rax
	cqto
	idivq	-24(%rbp)
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.LBB9_7:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end9:
	.size	div_long, .Lfunc_end9-div_long
                                        # -- End function
	.globl	div_int                         # -- Begin function div_int
	.p2align	4, 0x90
	.type	div_int,@function
div_int:                                # @div_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.LBB10_6
# %bb.1:
	cmpl	$0, -8(%rbp)
	jle	.LBB10_3
# %bb.2:
	movl	$2147483647, -4(%rbp)           # imm = 0x7FFFFFFF
	jmp	.LBB10_7
.LBB10_3:
	cmpl	$0, -8(%rbp)
	jge	.LBB10_5
# %bb.4:
	movl	$-2147483648, -4(%rbp)          # imm = 0x80000000
	jmp	.LBB10_7
.LBB10_5:
	movl	$0, -4(%rbp)
	jmp	.LBB10_7
.LBB10_6:
	movl	-8(%rbp), %eax
	cltd
	idivl	-12(%rbp)
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -4(%rbp)
.LBB10_7:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end10:
	.size	div_int, .Lfunc_end10-div_int
                                        # -- End function
	.globl	div_double                      # -- Begin function div_double
	.p2align	4, 0x90
	.type	div_double,@function
div_double:                             # @div_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	divsd	-16(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	#APP
	movq	%xmm0, %rax

	#NO_APP
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	popq	%rbp
	retq
.Lfunc_end11:
	.size	div_double, .Lfunc_end11-div_double
                                        # -- End function
	.globl	clear_int_sum_param_registers   # -- Begin function clear_int_sum_param_registers
	.p2align	4, 0x90
	.type	clear_int_sum_param_registers,@function
clear_int_sum_param_registers:          # @clear_int_sum_param_registers
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	#APP
	xorq	%rdi, %rdi
	xorq	%rsi, %rsi
	xorq	%rdx, %rdx
	xorq	%rcx, %rcx
	xorq	%r8, %r8
	xorq	%r9, %r9

	#NO_APP
	popq	%rbp
	retq
.Lfunc_end12:
	.size	clear_int_sum_param_registers, .Lfunc_end12-clear_int_sum_param_registers
                                        # -- End function
	.globl	clear_double_sum_param_registers # -- Begin function clear_double_sum_param_registers
	.p2align	4, 0x90
	.type	clear_double_sum_param_registers,@function
clear_double_sum_param_registers:       # @clear_double_sum_param_registers
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	#APP
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	pxor	%xmm3, %xmm3
	pxor	%xmm4, %xmm4
	pxor	%xmm5, %xmm5

	#NO_APP
	popq	%rbp
	retq
.Lfunc_end13:
	.size	clear_double_sum_param_registers, .Lfunc_end13-clear_double_sum_param_registers
                                        # -- End function
	.globl	clear_int_mul_param_registers   # -- Begin function clear_int_mul_param_registers
	.p2align	4, 0x90
	.type	clear_int_mul_param_registers,@function
clear_int_mul_param_registers:          # @clear_int_mul_param_registers
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	#APP
	movq	$1, %rdi
	movq	$1, %rsi
	movq	$1, %rdx
	movq	$1, %rcx
	movq	$1, %r8
	movq	$1, %r9

	#NO_APP
	popq	%rbp
	retq
.Lfunc_end14:
	.size	clear_int_mul_param_registers, .Lfunc_end14-clear_int_mul_param_registers
                                        # -- End function
	.globl	clear_double_mul_param_registers # -- Begin function clear_double_mul_param_registers
	.p2align	4, 0x90
	.type	clear_double_mul_param_registers,@function
clear_double_mul_param_registers:       # @clear_double_mul_param_registers
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	#APP
	movq	$1, %rdx
	movq	%rdx, %xmm0
	movq	%rdx, %xmm1
	movq	%rdx, %xmm2
	movq	%rdx, %xmm3
	movq	%rdx, %xmm4
	movq	%rdx, %xmm5

	#NO_APP
	popq	%rbp
	retq
.Lfunc_end15:
	.size	clear_double_mul_param_registers, .Lfunc_end15-clear_double_mul_param_registers
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
