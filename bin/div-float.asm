default rel
section .note.GNU-stack noalloc noexec nowrite progbits
EXTERN print_float
EXTERN print_integer
EXTERN print_bigint
EXTERN print_string
EXTERN print_bool
EXTERN print_space
EXTERN print_newline
EXTERN trace
EXTERN sum_long
EXTERN sum_int
EXTERN sum_double
EXTERN mul_long
EXTERN mul_int
EXTERN mul_double
EXTERN sub_long
EXTERN sub_int
EXTERN sub_double
EXTERN div_long
EXTERN div_int
EXTERN div_double
EXTERN lt_long
EXTERN lt_int
EXTERN lt_double
EXTERN gt_long
EXTERN gt_int
EXTERN gt_double
EXTERN ne_long
EXTERN ne_int
EXTERN ne_double
EXTERN eq_long
EXTERN eq_int
EXTERN eq_double
EXTERN le_long
EXTERN le_int
EXTERN le_double
EXTERN ge_long
EXTERN ge_int
EXTERN ge_double
EXTERN truncate
EXTERN clear_int_sum_param_registers
EXTERN clear_double_sum_param_registers
EXTERN clear_int_mul_param_registers
EXTERN clear_double_mul_param_registers
section .data   align=8
	_static_4808662368408029763: DQ -2.0
	_static_17871257630512828545: DQ -6.0
	_static_4774046663370604595: DQ 2.0
	_static_8074408774107922484: DQ 3.0
	_static_229815896342578: DQ 6.0
section .text   align=1
	global main
	main:
		PUSH RBP
		MOV RBP, RSP
		SUB RSP, 32
		; div: 7
		XOR R10, R10
		XOR R11, R11
		MOV RAX, QWORD[REL _static_229815896342578]
		MOV R10, RAX
		MOV R11, 3
		CALL clear_double_mul_param_registers
		MOVQ XMM0, RAX
		MOV RAX, QWORD[REL _static_4774046663370604595]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL div_double
		MOV R10, RAX
		; trace: 8
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; div: 10
		XOR R10, R10
		XOR R11, R11
		MOV RAX, QWORD[REL _static_229815896342578]
		MOV R10, RAX
		MOV R11, 3
		CALL clear_double_mul_param_registers
		MOVQ XMM0, RAX
		MOV RAX, QWORD[REL _static_8074408774107922484]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL div_double
		MOV R10, RAX
		; trace: 11
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; div: 13
		XOR R10, R10
		XOR R11, R11
		MOV RAX, QWORD[REL _static_229815896342578]
		MOV R10, RAX
		MOV R11, 3
		CALL clear_double_mul_param_registers
		MOVQ XMM0, RAX
		MOV RAX, QWORD[REL _static_4808662368408029763]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL div_double
		MOV R10, RAX
		; trace: 14
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; div: 16
		XOR R10, R10
		XOR R11, R11
		MOV RAX, QWORD[REL _static_17871257630512828545]
		MOV R10, RAX
		MOV R11, 3
		CALL clear_double_mul_param_registers
		MOVQ XMM0, RAX
		MOV RAX, QWORD[REL _static_8074408774107922484]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL div_double
		MOV R10, RAX
		; trace: 17
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; a: 19
		MOV RAX, QWORD[REL _static_229815896342578]
		MOV R10, RAX
		MOV R11, 3
		MOV QWORD[RBP-8], RAX
		; b: 20
		MOV RAX, QWORD[REL _static_4774046663370604595]
		MOV R10, RAX
		MOV R11, 3
		MOV QWORD[RBP-16], RAX
		; c: 21
		MOV RAX, QWORD[REL _static_8074408774107922484]
		MOV R10, RAX
		MOV R11, 3
		MOV QWORD[RBP-24], RAX
		; div: 22
		XOR R10, R10
		XOR R11, R11
		MOV RAX, [RBP-8]
		MOV QWORD[RBP-8], RAX
		MOV R10, RAX
		MOV R11, 3
		CALL clear_double_mul_param_registers
		MOVQ XMM0, RAX
		MOV RAX, [RBP-16]
		MOV QWORD[RBP-16], RAX
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL div_double
		MOV R10, RAX
		; trace: 23
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; div: 25
		XOR R10, R10
		XOR R11, R11
		MOV RAX, [RBP-8]
		MOV QWORD[RBP-8], RAX
		MOV R10, RAX
		MOV R11, 3
		CALL clear_double_mul_param_registers
		MOVQ XMM0, RAX
		MOV RAX, [RBP-24]
		MOV QWORD[RBP-24], RAX
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL div_double
		MOV R10, RAX
		; trace: 26
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; div: 28
		XOR R10, R10
		XOR R11, R11
		MOV RAX, [RBP-8]
		MOV QWORD[RBP-8], RAX
		MOV R10, RAX
		MOV R11, 3
		CALL clear_double_mul_param_registers
		MOVQ XMM0, RAX
		MOV RAX, QWORD[REL _static_8074408774107922484]
		MOV R10, RAX
		MOV R11, 3
		MOVQ XMM1, RAX
		CALL div_double
		MOV R10, RAX
		; trace: 29
		CALL trace
		XOR R10, R10
		XOR R11, R11
		; return: 30
		MOV RAX, 0x7
		MOV R10, RAX
		MOV R11, 2
		JMP _global_exit
		XOR RAX, 0
	_global_exit:
		MOV RSP, RBP
		POP RBP
		RET
		NOP
