	.file	"clab.c"
	.text
	.globl	pi
	.data
	.align 8
	.type	pi, @object
	.size	pi, 8
pi:
	.long	-187466733
	.long	1074340313
	.globl	message
	.section	.rodata
.LC0:
	.string	"Message"
	.section	.data.rel.local,"aw"
	.align 8
	.type	message, @object
	.size	message, 8
message:
	.quad	.LC0
	.section	.rodata
.LC1:
	.string	"%8.2f\n"
	.text
	.globl	print_double
	.type	print_double, @function
print_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	leave
	ret
	.size	print_double, .-print_double
	.globl	main
	.type	main, @function
main:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$1, -28(%rbp)
	movq	$2, -24(%rbp)
	movq	message(%rip), %rax
	movq	%rax, -16(%rbp)
	movsd	pi(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	ret
	.size	main, .-main
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
