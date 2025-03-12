	.file	"main.c"
	.text
	.globl	A
	.data
	.align 8
	.type	A, @object
	.size	A, 8
A:
	.long	-187466733
	.long	1074340313
	.globl	B
	.section	.rodata
.LC0:
	.string	"21"
	.section	.data.rel.local,"aw"
	.align 8
	.type	B, @object
	.size	B, 8
B:
	.quad	.LC0
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movsd	A(%rip), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	B(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	$1234, -28(%rbp)
	movq	$1234567890, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	$6, %esi
	movl	$12, %edi
	movq	%rax, %xmm0
	call	print_float@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	print_string@PLT
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	print_integer@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	print_bigint@PLT
	movl	$0, %eax
	leave
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
