	.file	"debug.c"
	.text
	.section	.rodata
.LC0:
	.string	"TRACE INTEGER: %c%ld\n"
.LC1:
	.string	"TRACE BIGINT: %c0x%lx\n"
.LC2:
	.string	"TRACE FLOAT: %14.6lf\n"
.LC3:
	.string	"TRACE TEXT: '%s'\n"
.LC4:
	.string	"true"
.LC5:
	.string	"false"
.LC6:
	.string	"TRACE BOOLEAN: %s\n"
.LC7:
	.string	"TRACE <uncharted type>: %ld\n"
	.text
	.globl	trace
	.type	trace, @function
trace:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
#APP
# 12 "src/debug.c" 1
	movq %r10, %rax
# 0 "" 2
#NO_APP
	movq	%rax, -48(%rbp)
#APP
# 13 "src/debug.c" 1
	movq %r11, %rax
# 0 "" 2
#NO_APP
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	movl	%eax, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movl	%eax, -52(%rbp)
	cmpl	$5, -52(%rbp)
	ja	.L2
	movl	-52(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L4(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L4(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L2-.L4
	.long	.L8-.L4
	.long	.L7-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.text
.L8:
	movl	-56(%rbp), %eax
	cltq
	cmpl	$0, -56(%rbp)
	jns	.L9
	movq	$-1, %rdx
	jmp	.L10
.L9:
	movl	$1, %edx
.L10:
	imulq	%rdx, %rax
	cmpl	$0, -56(%rbp)
	jns	.L11
	movl	$45, %ecx
	jmp	.L12
.L11:
	movl	$32, %ecx
.L12:
	movq	%rax, %rdx
	movl	%ecx, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L13
.L7:
	cmpq	$0, -32(%rbp)
	jns	.L14
	movq	$-1, %rax
	jmp	.L15
.L14:
	movl	$1, %eax
.L15:
	imulq	-32(%rbp), %rax
	cmpq	$0, -32(%rbp)
	jns	.L16
	movl	$45, %ecx
	jmp	.L17
.L16:
	movl	$32, %ecx
.L17:
	movq	%rax, %rdx
	movl	%ecx, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L13
.L6:
	leaq	-48(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L13
.L5:
	movq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L13
.L3:
	movq	-48(%rbp), %rax
	testq	%rax, %rax
	je	.L18
	leaq	.LC4(%rip), %rax
	jmp	.L19
.L18:
	leaq	.LC5(%rip), %rax
.L19:
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L13
.L2:
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
.L13:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	ret
	.size	trace, .-trace
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
