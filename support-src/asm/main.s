	.text
	.file	"main.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function test_trace
.LCPI0_0:
	.quad	0x400921d9f4d37c13              # double 3.1415289999999998
	.text
	.globl	test_trace
	.p2align	4, 0x90
	.type	test_trace,@function
test_trace:                             # @test_trace
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
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	test_trace, .Lfunc_end0-test_trace
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI1_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI1_1:
	.quad	0x4000000000000000              # double 2
.LCPI1_2:
	.quad	0x4008000000000000              # double 3
.LCPI1_3:
	.quad	0x4014000000000000              # double 5
.LCPI1_4:
	.quad	0x401c000000000000              # double 7
.LCPI1_5:
	.quad	0x4026000000000000              # double 11
.LCPI1_6:
	.quad	0x402a000000000000              # double 13
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	$0, -4(%rbp)
	movl	$2, %edi
	movl	$3, %esi
	movl	$5, %edx
	movl	$7, %ecx
	movl	$11, %r8d
	movl	$13, %r9d
	callq	mul_long@PLT
	movq	%rax, -16(%rbp)
	movl	$2, %edi
	movl	$3, %esi
	movl	$5, %edx
	movl	$7, %ecx
	movl	$11, %r8d
	movl	$13, %r9d
	callq	mul_int@PLT
	movl	%eax, -20(%rbp)
	movsd	.LCPI1_1(%rip), %xmm0           # xmm0 = [2.0E+0,0.0E+0]
	movsd	.LCPI1_2(%rip), %xmm1           # xmm1 = [3.0E+0,0.0E+0]
	movsd	.LCPI1_3(%rip), %xmm2           # xmm2 = [5.0E+0,0.0E+0]
	movsd	.LCPI1_4(%rip), %xmm3           # xmm3 = [7.0E+0,0.0E+0]
	movsd	.LCPI1_5(%rip), %xmm4           # xmm4 = [1.1E+1,0.0E+0]
	movsd	.LCPI1_6(%rip), %xmm5           # xmm5 = [1.3E+1,0.0E+0]
	callq	mul_double@PLT
	movsd	%xmm0, -32(%rbp)
	movq	-16(%rbp), %rsi
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-20(%rbp), %esi
	leaq	.L.str.2(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movsd	-32(%rbp), %xmm0                # xmm0 = mem[0],zero
	leaq	.L.str.3(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	movl	$1, %edi
	movl	$2, %esi
	callq	lt_long@PLT
	movl	%eax, -36(%rbp)
	movl	$1, %edi
	movl	$2, %esi
	callq	lt_int@PLT
	movl	%eax, -40(%rbp)
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = [1.0E+0,0.0E+0]
	movsd	.LCPI1_1(%rip), %xmm1           # xmm1 = [2.0E+0,0.0E+0]
	callq	lt_double@PLT
	movl	%eax, -44(%rbp)
	movl	-36(%rbp), %esi
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-40(%rbp), %esi
	leaq	.L.str.5(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-44(%rbp), %esi
	leaq	.L.str.6(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
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

	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"Product of longs: %ld\n"
	.size	.L.str.1, 23

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Product of ints: %d\n"
	.size	.L.str.2, 21

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Product of doubles: %f\n"
	.size	.L.str.3, 24

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Long compare: %d\n"
	.size	.L.str.4, 18

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Int compare: %d\n"
	.size	.L.str.5, 17

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Double compare: %d\n"
	.size	.L.str.6, 20

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym trace
	.addrsig_sym mul_long
	.addrsig_sym mul_int
	.addrsig_sym mul_double
	.addrsig_sym printf
	.addrsig_sym lt_long
	.addrsig_sym lt_int
	.addrsig_sym lt_double
