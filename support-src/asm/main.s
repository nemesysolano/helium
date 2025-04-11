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
	.string	"lorem ipsum"
	.section	.data.rel.local,"aw"
	.align 8
	.type	B, @object
	.size	B, 8
B:
	.quad	.LC0
	.text
	.globl	test_trace
	.type	test_trace, @function
test_trace:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$56, %rsp
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movabsq	$78187493520, %rbx
	movq	%rbx, -56(%rbp)
	movq	-56(%rbp), %rax
#APP
# 12 "src/main.c" 1
	movq %rax, %r10
# 0 "" 2
#NO_APP
	movl	$2, %eax
#APP
# 13 "src/main.c" 1
	movq %rax, %r11
# 0 "" 2
#NO_APP
	movl	$0, %eax
	call	trace@PLT
	movq	%rbx, -48(%rbp)
	movq	-48(%rbp), %rax
#APP
# 17 "src/main.c" 1
	movq %rax, %r10
# 0 "" 2
#NO_APP
	movl	$1, %eax
#APP
# 18 "src/main.c" 1
	movq %rax, %r11
# 0 "" 2
#NO_APP
	movl	$0, %eax
	call	trace@PLT
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	leaq	-64(%rbp), %rax
	movq	(%rax), %rax
#APP
# 22 "src/main.c" 1
	movq %rax, %r10
# 0 "" 2
#NO_APP
	movl	$3, %eax
#APP
# 23 "src/main.c" 1
	movq %rax, %r11
# 0 "" 2
#NO_APP
	movl	$0, %eax
	call	trace@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
#APP
# 27 "src/main.c" 1
	movq %rax, %r10
# 0 "" 2
#NO_APP
	movl	$4, %eax
#APP
# 28 "src/main.c" 1
	movq %rax, %r11
# 0 "" 2
#NO_APP
	movl	$0, %eax
	call	trace@PLT
	movq	$1, -32(%rbp)
	movq	-32(%rbp), %rax
#APP
# 32 "src/main.c" 1
	movq %rax, %r10
# 0 "" 2
#NO_APP
	movl	$5, %eax
#APP
# 33 "src/main.c" 1
	movq %rax, %r11
# 0 "" 2
#NO_APP
	movl	$0, %eax
	call	trace@PLT
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	movq	-8(%rbp), %rbx
	leave
	ret
	.size	test_trace, .-test_trace
	.section	.rodata
.LC8:
	.string	"Product of longs: %ld\n"
.LC9:
	.string	"Product of ints: %d\n"
.LC10:
	.string	"Product of doubles: %f\n"
.LC12:
	.string	"Long compare: %d\n"
.LC13:
	.string	"Int compare: %d\n"
.LC14:
	.string	"Double compare: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	$13, %r9d
	movl	$11, %r8d
	movl	$7, %ecx
	movl	$5, %edx
	movl	$3, %esi
	movl	$2, %edi
	call	mul_long@PLT
	movq	%rax, -16(%rbp)
	movl	$13, %r9d
	movl	$11, %r8d
	movl	$7, %ecx
	movl	$5, %edx
	movl	$3, %esi
	movl	$2, %edi
	call	mul_int@PLT
	movl	%eax, -32(%rbp)
	movsd	.LC2(%rip), %xmm4
	movsd	.LC3(%rip), %xmm3
	movsd	.LC4(%rip), %xmm2
	movsd	.LC5(%rip), %xmm1
	movsd	.LC6(%rip), %xmm0
	movq	.LC7(%rip), %rax
	movapd	%xmm4, %xmm5
	movapd	%xmm3, %xmm4
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	mul_double@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-32(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$2, %esi
	movl	$1, %edi
	call	lt_long@PLT
	movl	%eax, -28(%rbp)
	movl	$2, %esi
	movl	$1, %edi
	call	lt_int@PLT
	movl	%eax, -24(%rbp)
	movsd	.LC7(%rip), %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lt_double@PLT
	movl	%eax, -20(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	-187466733
	.long	1074340313
	.align 8
.LC2:
	.long	0
	.long	1076494336
	.align 8
.LC3:
	.long	0
	.long	1076232192
	.align 8
.LC4:
	.long	0
	.long	1075576832
	.align 8
.LC5:
	.long	0
	.long	1075052544
	.align 8
.LC6:
	.long	0
	.long	1074266112
	.align 8
.LC7:
	.long	0
	.long	1073741824
	.align 8
.LC11:
	.long	0
	.long	1072693248
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
