	.text
	.file	"main.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x400921d9f4d37c13              # double 3.1415289999999998
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movabsq	$78187493520, %rax              # imm = 0x1234567890
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	#APP
	movq	%rax, %r10
	#NO_APP
	movl	$2, %eax
	#APP
	movq	%rax, %r11
	#NO_APP
	movb	$0, %al
	callq	trace@PLT
	movabsq	$78187493520, %rax              # imm = 0x1234567890
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	#APP
	movq	%rax, %r10
	#NO_APP
	movl	$1, %eax
	#APP
	movq	%rax, %r11
	#NO_APP
	movb	$0, %al
	callq	trace@PLT
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = [3.1415289999999998E+0,0.0E+0]
	movsd	%xmm0, -24(%rbp)
	movq	-24(%rbp), %rax
	#APP
	movq	%rax, %r10
	#NO_APP
	movl	$3, %eax
	#APP
	movq	%rax, %r11
	#NO_APP
	movb	$0, %al
	callq	trace@PLT
	leaq	.L.str(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	#APP
	movq	%rax, %r10
	#NO_APP
	movl	$4, %eax
	#APP
	movq	%rax, %r11
	#NO_APP
	movb	$0, %al
	callq	trace@PLT
	movq	$1, -40(%rbp)
	movq	-40(%rbp), %rax
	#APP
	movq	%rax, %r10
	#NO_APP
	movl	$5, %eax
	#APP
	movq	%rax, %r11
	#NO_APP
	movb	$0, %al
	callq	trace@PLT
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.type	A,@object                       # @A
	.data
	.globl	A
	.p2align	3, 0x0
A:
	.quad	0x400921d9f4d37c13              # double 3.1415289999999998
	.size	A, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"lorem ipsum"
	.size	.L.str, 12

	.type	B,@object                       # @B
	.data
	.globl	B
	.p2align	3, 0x0
B:
	.quad	.L.str
	.size	B, 8

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym trace
