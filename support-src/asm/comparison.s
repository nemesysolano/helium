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
	.globl	ne_double                       # -- Begin function ne_double
	.p2align	4, 0x90
	.type	ne_double,@function
ne_double:                              # @ne_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	-16(%rbp), %xmm1                # xmm1 = mem[0],zero
	callq	eq_double
	cmpl	$0, %eax
	setne	%al
	xorb	$-1, %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end8:
	.size	ne_double, .Lfunc_end8-ne_double
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function eq_double
.LCPI9_0:
	.quad	0x3e112e0be826d695              # double 1.0000000000000001E-9
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI9_1:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
	.text
	.globl	eq_double
	.p2align	4, 0x90
	.type	eq_double,@function
eq_double:                              # @eq_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -16(%rbp)
	movsd	%xmm1, -24(%rbp)
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	subsd	-24(%rbp), %xmm0
	movaps	.LCPI9_1(%rip), %xmm1           # xmm1 = [NaN,NaN]
	pand	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	.LCPI9_0(%rip), %xmm0           # xmm0 = [1.0000000000000001E-9,0.0E+0]
	ucomisd	-32(%rbp), %xmm0
	jbe	.LBB9_2
# %bb.1:
	movl	$1, -4(%rbp)
	jmp	.LBB9_3
.LBB9_2:
	movsd	-32(%rbp), %xmm1                # xmm1 = mem[0],zero
	movsd	-16(%rbp), %xmm4                # xmm4 = mem[0],zero
	movaps	.LCPI9_1(%rip), %xmm0           # xmm0 = [NaN,NaN]
	pand	%xmm0, %xmm4
	movsd	-24(%rbp), %xmm3                # xmm3 = mem[0],zero
	movaps	.LCPI9_1(%rip), %xmm0           # xmm0 = [NaN,NaN]
	pand	%xmm0, %xmm3
	movaps	%xmm3, %xmm5
	movaps	%xmm4, %xmm2
	cmpunordsd	%xmm2, %xmm2
	movaps	%xmm2, %xmm0
	pand	%xmm5, %xmm0
	minsd	%xmm4, %xmm3
	pandn	%xmm3, %xmm2
	por	%xmm0, %xmm2
	movsd	.LCPI9_0(%rip), %xmm0           # xmm0 = [1.0000000000000001E-9,0.0E+0]
	mulsd	%xmm2, %xmm0
	ucomisd	%xmm1, %xmm0
	seta	%al
	andb	$1, %al
	movzbl	%al, %eax
	movl	%eax, -4(%rbp)
.LBB9_3:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end9:
	.size	eq_double, .Lfunc_end9-eq_double
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
.Lfunc_end10:
	.size	eq_long, .Lfunc_end10-eq_long
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
.Lfunc_end11:
	.size	eq_int, .Lfunc_end11-eq_int
                                        # -- End function
	.globl	le_long                         # -- Begin function le_long
	.p2align	4, 0x90
	.type	le_long,@function
le_long:                                # @le_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setle	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end12:
	.size	le_long, .Lfunc_end12-le_long
                                        # -- End function
	.globl	le_int                          # -- Begin function le_int
	.p2align	4, 0x90
	.type	le_int,@function
le_int:                                 # @le_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setle	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end13:
	.size	le_int, .Lfunc_end13-le_int
                                        # -- End function
	.globl	le_double                       # -- Begin function le_double
	.p2align	4, 0x90
	.type	le_double,@function
le_double:                              # @le_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	-16(%rbp), %xmm1                # xmm1 = mem[0],zero
	callq	lt_double
	movl	%eax, %ecx
	movb	$1, %al
	cmpl	$0, %ecx
	movb	%al, -17(%rbp)                  # 1-byte Spill
	jne	.LBB14_2
# %bb.1:
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	-16(%rbp), %xmm1                # xmm1 = mem[0],zero
	callq	eq_double
	cmpl	$0, %eax
	setne	%al
	movb	%al, -17(%rbp)                  # 1-byte Spill
.LBB14_2:
	movb	-17(%rbp), %al                  # 1-byte Reload
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end14:
	.size	le_double, .Lfunc_end14-le_double
                                        # -- End function
	.globl	ge_long                         # -- Begin function ge_long
	.p2align	4, 0x90
	.type	ge_long,@function
ge_long:                                # @ge_long
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setge	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end15:
	.size	ge_long, .Lfunc_end15-ge_long
                                        # -- End function
	.globl	ge_int                          # -- Begin function ge_int
	.p2align	4, 0x90
	.type	ge_int,@function
ge_int:                                 # @ge_int
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setge	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
.Lfunc_end16:
	.size	ge_int, .Lfunc_end16-ge_int
                                        # -- End function
	.globl	ge_double                       # -- Begin function ge_double
	.p2align	4, 0x90
	.type	ge_double,@function
ge_double:                              # @ge_double
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	-16(%rbp), %xmm1                # xmm1 = mem[0],zero
	callq	gt_double
	movl	%eax, %ecx
	movb	$1, %al
	cmpl	$0, %ecx
	movb	%al, -17(%rbp)                  # 1-byte Spill
	jne	.LBB17_2
# %bb.1:
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	-16(%rbp), %xmm1                # xmm1 = mem[0],zero
	callq	eq_double
	cmpl	$0, %eax
	setne	%al
	movb	%al, -17(%rbp)                  # 1-byte Spill
.LBB17_2:
	movb	-17(%rbp), %al                  # 1-byte Reload
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end17:
	.size	ge_double, .Lfunc_end17-ge_double
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function trucate
.LCPI18_0:
	.quad	0x4024000000000000              # double 10
.LCPI18_1:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	trucate
	.p2align	4, 0x90
	.type	trucate,@function
trucate:                                # @trucate
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movsd	%xmm0, -8(%rbp)
	movl	%edi, -12(%rbp)
	cmpl	$2, -12(%rbp)
	jge	.LBB18_2
# %bb.1:
	movl	$2, -16(%rbp)
	jmp	.LBB18_6
.LBB18_2:
	cmpl	$12, -12(%rbp)
	jle	.LBB18_4
# %bb.3:
	movl	$12, -16(%rbp)
	jmp	.LBB18_5
.LBB18_4:
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
.LBB18_5:
	jmp	.LBB18_6
.LBB18_6:
	cvtsi2sdl	-16(%rbp), %xmm1
	movsd	.LCPI18_1(%rip), %xmm0          # xmm0 = [1.0E+0,0.0E+0]
	mulsd	%xmm0, %xmm1
	movsd	.LCPI18_0(%rip), %xmm0          # xmm0 = [1.0E+1,0.0E+0]
	callq	pow@PLT
	movsd	%xmm0, -24(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	mulsd	-24(%rbp), %xmm0
	callq	trunc@PLT
	divsd	-24(%rbp), %xmm0
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end18:
	.size	trucate, .Lfunc_end18-trucate
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym lt_double
	.addrsig_sym gt_double
	.addrsig_sym eq_double
	.addrsig_sym pow
