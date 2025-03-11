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
	.section	.rodata
.LC0:
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
	leaq	.LC0(%rip), %rax
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
	movq	pi(%rip), %rax
	movq	%rax, %xmm0
	call	print_double
	movq	.LC1(%rip), %rax
	movq	%rax, %xmm0
	call	print_double
	movl	$0, %eax
	popq	%rbp
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	467842198
	.long	1074118410
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
