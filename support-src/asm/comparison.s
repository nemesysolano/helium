	.text
	.file	"comparison.c"
	.globl	lt_long                         # -- Begin function lt_long
	.p2align	4, 0x90
	.type	lt_long,@function
lt_long:                                # @lt_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setl	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	lt_long, .Lfunc_end0-lt_long
                                        # -- End function
	.globl	lt_int                          # -- Begin function lt_int
	.p2align	4, 0x90
	.type	lt_int,@function
lt_int:                                 # @lt_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setl	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end1:
	.size	lt_int, .Lfunc_end1-lt_int
                                        # -- End function
	.globl	lt_double                       # -- Begin function lt_double
	.p2align	4, 0x90
	.type	lt_double,@function
lt_double:                              # @lt_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm1                 # xmm1 = mem[0],zero
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	ucomisd	%xmm1, %xmm0
	seta	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end2:
	.size	lt_double, .Lfunc_end2-lt_double
                                        # -- End function
	.globl	gt_long                         # -- Begin function gt_long
	.p2align	4, 0x90
	.type	gt_long,@function
gt_long:                                # @gt_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setg	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end3:
	.size	gt_long, .Lfunc_end3-gt_long
                                        # -- End function
	.globl	gt_int                          # -- Begin function gt_int
	.p2align	4, 0x90
	.type	gt_int,@function
gt_int:                                 # @gt_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setg	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end4:
	.size	gt_int, .Lfunc_end4-gt_int
                                        # -- End function
	.globl	gt_double                       # -- Begin function gt_double
	.p2align	4, 0x90
	.type	gt_double,@function
gt_double:                              # @gt_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	ucomisd	-16(%rbp), %xmm0
	seta	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end5:
	.size	gt_double, .Lfunc_end5-gt_double
                                        # -- End function
	.globl	ne_long                         # -- Begin function ne_long
	.p2align	4, 0x90
	.type	ne_long,@function
ne_long:                                # @ne_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setne	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end6:
	.size	ne_long, .Lfunc_end6-ne_long
                                        # -- End function
	.globl	ne_int                          # -- Begin function ne_int
	.p2align	4, 0x90
	.type	ne_int,@function
ne_int:                                 # @ne_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setne	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end7:
	.size	ne_int, .Lfunc_end7-ne_int
                                        # -- End function
	.globl	eq_long                         # -- Begin function eq_long
	.p2align	4, 0x90
	.type	eq_long,@function
eq_long:                                # @eq_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	sete	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end8:
	.size	eq_long, .Lfunc_end8-eq_long
                                        # -- End function
	.globl	eq_int                          # -- Begin function eq_int
	.p2align	4, 0x90
	.type	eq_int,@function
eq_int:                                 # @eq_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	sete	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end9:
	.size	eq_int, .Lfunc_end9-eq_int
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
