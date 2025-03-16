	.file	"print.c"
	.text
	.globl	new_line
	.section	.rodata
.LC0:
	.string	"\n"
	.section	.data.rel.local,"aw"
	.align 8
	.type	new_line, @object
	.size	new_line, 8
new_line:
	.quad	.LC0
	.section	.rodata
.LC1:
	.string	"%*.*f"
	.text
	.globl	print_float
	.type	print_float, @function
print_float:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movl	%edi, -12(%rbp)
	movl	%esi, -16(%rbp)
	movq	-8(%rbp), %rcx
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	movq	%rcx, %xmm0
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	leave
	ret
	.size	print_float, .-print_float
	.section	.rodata
.LC2:
	.string	"%d"
	.text
	.globl	print_integer
	.type	print_integer, @function
print_integer:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	ret
	.size	print_integer, .-print_integer
	.section	.rodata
.LC3:
	.string	"%ld"
	.text
	.globl	print_bigint
	.type	print_bigint, @function
print_bigint:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	ret
	.size	print_bigint, .-print_bigint
	.section	.rodata
.LC4:
	.string	"%s"
	.text
	.globl	print_string
	.type	print_string, @function
print_string:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	ret
	.size	print_string, .-print_string
	.section	.rodata
.LC5:
	.string	"true"
.LC6:
	.string	"false"
	.text
	.globl	print_bool
	.type	print_bool, @function
print_bool:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L6
	leaq	.LC5(%rip), %rax
	jmp	.L7
.L6:
	leaq	.LC6(%rip), %rax
.L7:
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	ret
	.size	print_bool, .-print_bool
	.globl	print_space
	.type	print_space, @function
print_space:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L9
.L10:
	movl	$32, %edi
	call	putchar@PLT
	addl	$1, -4(%rbp)
.L9:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L10
	nop
	nop
	leave
	ret
	.size	print_space, .-print_space
	.globl	print_newline
	.type	print_newline, @function
print_newline:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	new_line(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	ret
	.size	print_newline, .-print_newline
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
