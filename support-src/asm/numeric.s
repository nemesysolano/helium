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
	.globl	clear_int_param_registers       # -- Begin function clear_int_param_registers
	.p2align	4, 0x90
	.type	clear_int_param_registers,@function
clear_int_param_registers:              # @clear_int_param_registers
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
.Lfunc_end6:
	.size	clear_int_param_registers, .Lfunc_end6-clear_int_param_registers
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
