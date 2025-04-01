	.text
	.file	"print.c"
	.globl	print_float                     # -- Begin function print_float
	.p2align	4, 0x90
	.type	print_float,@function
print_float:                            # @print_float
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movl	%edi, -12(%rbp)
	movl	%esi, -16(%rbp)
	movl	-12(%rbp), %esi
	movl	-16(%rbp), %edx
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	leaq	.L.str.1(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	print_float, .Lfunc_end0-print_float
                                        # -- End function
	.globl	print_integer                   # -- Begin function print_integer
	.p2align	4, 0x90
	.type	print_integer,@function
print_integer:                          # @print_integer
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %esi
	leaq	.L.str.2(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	print_integer, .Lfunc_end1-print_integer
                                        # -- End function
	.globl	print_bigint                    # -- Begin function print_bigint
	.p2align	4, 0x90
	.type	print_bigint,@function
print_bigint:                           # @print_bigint
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rsi
	leaq	.L.str.3(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	print_bigint, .Lfunc_end2-print_bigint
                                        # -- End function
	.globl	print_string                    # -- Begin function print_string
	.p2align	4, 0x90
	.type	print_string,@function
print_string:                           # @print_string
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rsi
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end3:
	.size	print_string, .Lfunc_end3-print_string
                                        # -- End function
	.globl	print_bool                      # -- Begin function print_bool
	.p2align	4, 0x90
	.type	print_bool,@function
print_bool:                             # @print_bool
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %ecx
	leaq	.L.str.6(%rip), %rsi
	leaq	.L.str.5(%rip), %rax
	cmpl	$0, %ecx
	cmovneq	%rax, %rsi
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end4:
	.size	print_bool, .Lfunc_end4-print_bool
                                        # -- End function
	.globl	print_space                     # -- Begin function print_space
	.p2align	4, 0x90
	.type	print_space,@function
print_space:                            # @print_space
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$0, -8(%rbp)
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB5_4
# %bb.2:                                #   in Loop: Header=BB5_1 Depth=1
	leaq	.L.str.7(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB5_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB5_1
.LBB5_4:
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end5:
	.size	print_space, .Lfunc_end5-print_space
                                        # -- End function
	.globl	print_newline                   # -- Begin function print_newline
	.p2align	4, 0x90
	.type	print_newline,@function
print_newline:                          # @print_newline
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	new_line(%rip), %rsi
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	popq	%rbp
	retq
.Lfunc_end6:
	.size	print_newline, .Lfunc_end6-print_newline
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\n"
	.size	.L.str, 2

	.type	new_line,@object                # @new_line
	.data
	.globl	new_line
	.p2align	3, 0x0
new_line:
	.quad	.L.str
	.size	new_line, 8

	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"%*.*f"
	.size	.L.str.1, 6

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%ld"
	.size	.L.str.3, 4

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"%s"
	.size	.L.str.4, 3

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
	.asciz	" "
	.size	.L.str.7, 2

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
	.addrsig_sym new_line
