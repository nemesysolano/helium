	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Support Library Tests"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	.LC1(%rip), %rax
	movl	$6, %esi
	movl	$12, %edi
	movq	%rax, %xmm0
	call	print_float@PLT
	movl	$1234567890, %edi
	call	print_bigint@PLT
	movl	$0, %eax
	popq	%rbp
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	-187466733
	.long	1074340313
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
