	.text
	.file	"debug.c"
	.globl	trace                           # -- Begin function trace
	.p2align	4, 0x90
	.type	trace,@function
trace:                                  # @trace
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	#APP
	movq	%r10, %rax
	#NO_APP
	movq	%rax, -8(%rbp)
	#APP
	movq	%r11, %rax
	#NO_APP
	movq	%rax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	decl	%eax
	movl	%eax, %ecx
	movq	%rcx, -48(%rbp)                 # 8-byte Spill
	subl	$4, %eax
	ja	.LBB0_6
# %bb.8:
	movq	-48(%rbp), %rax                 # 8-byte Reload
	leaq	.LJTI0_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
.LBB0_1:
	movq	-8(%rbp), %rsi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB0_7
.LBB0_2:
	movq	-8(%rbp), %rsi
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB0_7
.LBB0_3:
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	leaq	.L.str.2(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	jmp	.LBB0_7
.LBB0_4:
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rsi
	leaq	.L.str.3(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB0_7
.LBB0_5:
	movq	-8(%rbp), %rcx
	leaq	.L.str.6(%rip), %rsi
	leaq	.L.str.5(%rip), %rax
	cmpq	$0, %rcx
	cmovneq	%rax, %rsi
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB0_7
.LBB0_6:
	movq	-8(%rbp), %rsi
	leaq	.L.str.7(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB0_7:
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	trace, .Lfunc_end0-trace
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0_0:
	.long	.LBB0_1-.LJTI0_0
	.long	.LBB0_2-.LJTI0_0
	.long	.LBB0_3-.LJTI0_0
	.long	.LBB0_4-.LJTI0_0
	.long	.LBB0_5-.LJTI0_0
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"TRACE INTEGER: %ld\n"
	.size	.L.str, 20

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"TRACE BIGINT: 0x%lx\n"
	.size	.L.str.1, 21

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"TRACE FLOAT: %14.6lf\n"
	.size	.L.str.2, 22

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"TRACE TEXT: '%s'\n"
	.size	.L.str.3, 18

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"TRACE BOOLEAN: %s\n"
	.size	.L.str.4, 19

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"true"
	.size	.L.str.5, 5

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"false"
	.size	.L.str.6, 6

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"TRACE <uncharted type>: %ld\n"
	.size	.L.str.7, 29

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
