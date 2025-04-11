	.file	"comparison.c"
	.text
	.globl	lt_long
	.type	lt_long, @function
lt_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setl	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	lt_long, .-lt_long
	.globl	lt_int
	.type	lt_int, @function
lt_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setl	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	lt_int, .-lt_int
	.globl	lt_double
	.type	lt_double, @function
lt_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	comisd	-8(%rbp), %xmm0
	seta	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	lt_double, .-lt_double
	.globl	gt_long
	.type	gt_long, @function
gt_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setg	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	gt_long, .-gt_long
	.globl	gt_int
	.type	gt_int, @function
gt_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setg	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	gt_int, .-gt_int
	.globl	gt_double
	.type	gt_double, @function
gt_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0
	comisd	-16(%rbp), %xmm0
	seta	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	gt_double, .-gt_double
	.globl	ne_long
	.type	ne_long, @function
ne_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setne	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	ne_long, .-ne_long
	.globl	ne_int
	.type	ne_int, @function
ne_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setne	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	ne_int, .-ne_int
	.globl	ne_double
	.type	ne_double, @function
ne_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	eq_double
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	leave
	ret
	.size	ne_double, .-ne_double
	.globl	eq_long
	.type	eq_long, @function
eq_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	eq_long, .-eq_long
	.globl	eq_int
	.type	eq_int, @function
eq_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	eq_int, .-eq_int
	.globl	eq_double
	.type	eq_double, @function
eq_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movsd	%xmm0, -24(%rbp)
	movsd	%xmm1, -32(%rbp)
	movsd	-24(%rbp), %xmm0
	subsd	-32(%rbp), %xmm0
	movq	.LC0(%rip), %xmm1
	andpd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	.LC1(%rip), %xmm0
	comisd	-8(%rbp), %xmm0
	jbe	.L28
	movl	$1, %eax
	jmp	.L26
.L28:
	movsd	-32(%rbp), %xmm0
	movq	.LC0(%rip), %xmm1
	andpd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movsd	-24(%rbp), %xmm0
	movq	.LC0(%rip), %xmm1
	andpd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	fmin@PLT
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	comisd	-8(%rbp), %xmm0
	seta	%al
	movzbl	%al, %eax
.L26:
	leave
	ret
	.size	eq_double, .-eq_double
	.globl	le_long
	.type	le_long, @function
le_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setle	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	le_long, .-le_long
	.globl	le_int
	.type	le_int, @function
le_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setle	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	le_int, .-le_int
	.globl	le_double
	.type	le_double, @function
le_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	lt_double
	testl	%eax, %eax
	jne	.L34
	movsd	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	eq_double
	testl	%eax, %eax
	je	.L35
.L34:
	movl	$1, %eax
	jmp	.L37
.L35:
	movl	$0, %eax
.L37:
	leave
	ret
	.size	le_double, .-le_double
	.globl	ge_long
	.type	ge_long, @function
ge_long:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	setge	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	ge_long, .-ge_long
	.globl	ge_int
	.type	ge_int, @function
ge_int:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setge	%al
	movzbl	%al, %eax
	popq	%rbp
	ret
	.size	ge_int, .-ge_int
	.globl	ge_double
	.type	ge_double, @function
ge_double:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	gt_double
	testl	%eax, %eax
	jne	.L43
	movsd	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	eq_double
	testl	%eax, %eax
	je	.L44
.L43:
	movl	$1, %eax
	jmp	.L46
.L44:
	movl	$0, %eax
.L46:
	leave
	ret
	.size	ge_double, .-ge_double
	.globl	trucate
	.type	trucate, @function
trucate:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movsd	%xmm0, -24(%rbp)
	movl	%edi, -28(%rbp)
	cmpl	$1, -28(%rbp)
	jg	.L48
	movl	$2, -12(%rbp)
	jmp	.L49
.L48:
	cmpl	$12, -28(%rbp)
	jle	.L50
	movl	$12, -12(%rbp)
	jmp	.L49
.L50:
	movl	-28(%rbp), %eax
	movl	%eax, -12(%rbp)
.L49:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-12(%rbp), %xmm0
	movq	.LC2(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movsd	-24(%rbp), %xmm0
	mulsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	call	trunc@PLT
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	divsd	-8(%rbp), %xmm0
	leave
	ret
	.size	trucate, .-trucate
	.section	.rodata
	.align 16
.LC0:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC1:
	.long	-400107883
	.long	1041313291
	.align 8
.LC2:
	.long	0
	.long	1076101120
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
