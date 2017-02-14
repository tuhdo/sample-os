	.file	"irq.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.local	irq_gates
	.comm	irq_gates,2048,32
	.globl	idt
	.data
	.align 4
	.type	idt, @object
	.size	idt, 8
idt:
	.value	2048
	.long	irq_gates
	.value	0
	.text
	.globl	setup_irq
	.type	setup_irq, @function
setup_irq:
.LFB0:
	.file 1 "irq.c"
	.loc 1 13 0
	.cfi_startproc
	push	ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI1:
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 1 14 0
	call	irq0_init
	movzx	eax, WORD PTR task_id_irq0
	movzx	eax, ax
	sal	eax, 3
	sub	esp, 8
	push	0
	push	0
	push	34048
	push	0
	push	eax
	push	OFFSET FLAT:idt
	call	add_segment
	add	esp, 32
	.loc 1 15 0
	call	irq1_init
	movzx	eax, WORD PTR task_id_irq1
	movzx	eax, ax
	sal	eax, 3
	sub	esp, 8
	push	0
	push	1
	push	34048
	push	0
	push	eax
	push	OFFSET FLAT:idt
	call	add_segment
	add	esp, 32
	.loc 1 16 0
	call	irq8_init
	movzx	eax, WORD PTR task_id_irq8
	movzx	eax, ax
	sal	eax, 3
	sub	esp, 8
	push	0
	push	8
	push	34048
	push	0
	push	eax
	push	OFFSET FLAT:idt
	call	add_segment
	add	esp, 32
	.loc 1 17 0
	call	irq10_init
	movzx	eax, WORD PTR task_id_irq10
	movzx	eax, ax
	sal	eax, 3
	sub	esp, 8
	push	0
	push	10
	push	34048
	push	0
	push	eax
	push	OFFSET FLAT:idt
	call	add_segment
	add	esp, 32
	.loc 1 18 0
	call	irq11_init
	movzx	eax, WORD PTR task_id_irq11
	movzx	eax, ax
	sal	eax, 3
	sub	esp, 8
	push	0
	push	11
	push	34048
	push	0
	push	eax
	push	OFFSET FLAT:idt
	call	add_segment
	add	esp, 32
	.loc 1 19 0
	call	irq13_init
	movzx	eax, WORD PTR task_id_irq13
	movzx	eax, ax
	sal	eax, 3
	sub	esp, 8
	push	0
	push	13
	push	34048
	push	0
	push	eax
	push	OFFSET FLAT:idt
	call	add_segment
	add	esp, 32
	.loc 1 20 0
	call	irq32_init
	movzx	eax, WORD PTR task_id_irq32
	movzx	eax, ax
	sal	eax, 3
	sub	esp, 8
	push	0
	push	32
	push	34048
	push	0
	push	eax
	push	OFFSET FLAT:idt
	call	add_segment
	add	esp, 32
	.loc 1 25 0
#APP
# 25 "irq.c" 1
	lidt idt
# 0 "" 2
	.loc 1 26 0
#NO_APP
	nop
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	setup_irq, .-setup_irq
	.globl	__TASK_START_irq0
	.type	__TASK_START_irq0, @function
__TASK_START_irq0:
.LFB1:
	.loc 1 28 0
	.cfi_startproc
	push	ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI4:
	.cfi_def_cfa_register 5
	.loc 1 28 0
	nop
	pop	ebp
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	__TASK_START_irq0, .-__TASK_START_irq0
	.comm	irq0_ldt_segments,24,4
	.comm	ldt_irq0,8,4
	.comm	task_id_irq0,2,2
	.globl	irq0_tss
	.data
	.align 32
	.type	irq0_tss, @object
	.size	irq0_tss, 104
irq0_tss:
	.value	24
	.zero	6
	.value	16
	.zero	18
	.long	8192
	.long	divide_by_zero_handler
	.long	135
	.zero	16
	.long	12288
	.zero	12
	.value	32
	.zero	2
	.value	8
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	10
	.text
	.globl	irq0_init
	.type	irq0_init, @function
irq0_init:
.LFB2:
	.loc 1 28 0
	.cfi_startproc
	push	ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI7:
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 28 0
	mov	DWORD PTR ldt_irq0+2, OFFSET FLAT:irq0_ldt_segments
	mov	WORD PTR ldt_irq0, 24
	mov	WORD PTR ldt_irq0+6, 0
	mov	eax, OFFSET FLAT:irq0_tss
	sub	esp, 8
	push	1
	push	0
	push	1083648
	push	103
	push	eax
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR task_id_irq0, ax
	movzx	eax, WORD PTR ldt_irq0
	movzx	eax, ax
	mov	edx, OFFSET FLAT:irq0_ldt_segments
	sub	esp, 8
	push	1
	push	0
	push	4227584
	push	eax
	push	edx
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR [ebp-10], ax
	movzx	eax, WORD PTR task_id_irq0
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq0_tss+4, eax
	movzx	eax, WORD PTR task_id_irq0
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq0_tss+56, eax
	movzx	eax, WORD PTR [ebp-10]
	sal	eax, 3
	mov	WORD PTR irq0_tss+96, ax
	sub	esp, 8
	push	1
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:ldt_irq0
	call	add_segment
	add	esp, 32
	mov	edx, OFFSET FLAT:__TASK_END_irq0
	mov	eax, OFFSET FLAT:__TASK_START_irq0
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	mov	eax, OFFSET FLAT:__TASK_START_irq0
	sub	esp, 8
	push	1
	push	0
	push	14653952
	push	edx
	push	eax
	push	OFFSET FLAT:ldt_irq0
	call	add_segment
	add	esp, 32
	movzx	eax, WORD PTR task_id_irq0
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	sub	esp, 8
	push	1
	push	0
	push	14652928
	push	65535
	push	eax
	push	OFFSET FLAT:ldt_irq0
	call	add_segment
	add	esp, 32
	nop
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	irq0_init, .-irq0_init
	.globl	irq0_start
	.type	irq0_start, @function
irq0_start:
.LFB3:
	.loc 1 28 0
	.cfi_startproc
	push	ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI10:
	.cfi_def_cfa_register 5
	.loc 1 28 0
#APP
# 28 "irq.c" 1
	pushw 0xa0
# 0 "" 2
# 28 "irq.c" 1
	pushd 0x0
# 0 "" 2
# 28 "irq.c" 1
	jmp FAR PTR  [esp]
# 0 "" 2
#NO_APP
	nop
	pop	ebp
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	irq0_start, .-irq0_start
	.globl	divide_by_zero_handler
	.type	divide_by_zero_handler, @function
divide_by_zero_handler:
.LFB4:
	.loc 1 29 0
	.cfi_startproc
	push	ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI13:
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 1 30 0
#APP
# 30 "irq.c" 1
	add esp, 0x4
# 0 "" 2
# 30 "irq.c" 1
	leave
# 0 "" 2
# 30 "irq.c" 1
	pop eax
# 0 "" 2
# 30 "irq.c" 1
	iret
# 0 "" 2
	.loc 1 32 0
#NO_APP
	call	divide_by_zero_handler
	.loc 1 33 0
	nop
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	divide_by_zero_handler, .-divide_by_zero_handler
	.globl	__TASK_END_irq0
	.type	__TASK_END_irq0, @function
__TASK_END_irq0:
.LFB5:
	.loc 1 34 0
	.cfi_startproc
	push	ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI16:
	.cfi_def_cfa_register 5
	.loc 1 34 0
	nop
	pop	ebp
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	__TASK_END_irq0, .-__TASK_END_irq0
	.globl	__TASK_START_irq1
	.type	__TASK_START_irq1, @function
__TASK_START_irq1:
.LFB6:
	.loc 1 36 0
	.cfi_startproc
	push	ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI19:
	.cfi_def_cfa_register 5
	.loc 1 36 0
	nop
	pop	ebp
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	__TASK_START_irq1, .-__TASK_START_irq1
	.comm	irq1_ldt_segments,24,4
	.comm	ldt_irq1,8,4
	.comm	task_id_irq1,2,2
	.globl	irq1_tss
	.data
	.align 32
	.type	irq1_tss, @object
	.size	irq1_tss, 104
irq1_tss:
	.value	24
	.zero	6
	.value	16
	.zero	18
	.long	8192
	.long	debug_exception
	.long	135
	.zero	16
	.long	12288
	.zero	12
	.value	32
	.zero	2
	.value	8
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	10
	.text
	.globl	irq1_init
	.type	irq1_init, @function
irq1_init:
.LFB7:
	.loc 1 36 0
	.cfi_startproc
	push	ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI22:
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 36 0
	mov	DWORD PTR ldt_irq1+2, OFFSET FLAT:irq1_ldt_segments
	mov	WORD PTR ldt_irq1, 24
	mov	WORD PTR ldt_irq1+6, 0
	mov	eax, OFFSET FLAT:irq1_tss
	sub	esp, 8
	push	1
	push	0
	push	1083648
	push	103
	push	eax
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR task_id_irq1, ax
	movzx	eax, WORD PTR ldt_irq1
	movzx	eax, ax
	mov	edx, OFFSET FLAT:irq1_ldt_segments
	sub	esp, 8
	push	1
	push	0
	push	4227584
	push	eax
	push	edx
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR [ebp-10], ax
	movzx	eax, WORD PTR task_id_irq1
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq1_tss+4, eax
	movzx	eax, WORD PTR task_id_irq1
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq1_tss+56, eax
	movzx	eax, WORD PTR [ebp-10]
	sal	eax, 3
	mov	WORD PTR irq1_tss+96, ax
	sub	esp, 8
	push	1
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:ldt_irq1
	call	add_segment
	add	esp, 32
	mov	edx, OFFSET FLAT:__TASK_END_irq1
	mov	eax, OFFSET FLAT:__TASK_START_irq1
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	mov	eax, OFFSET FLAT:__TASK_START_irq1
	sub	esp, 8
	push	1
	push	0
	push	14653952
	push	edx
	push	eax
	push	OFFSET FLAT:ldt_irq1
	call	add_segment
	add	esp, 32
	movzx	eax, WORD PTR task_id_irq1
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	sub	esp, 8
	push	1
	push	0
	push	14652928
	push	65535
	push	eax
	push	OFFSET FLAT:ldt_irq1
	call	add_segment
	add	esp, 32
	nop
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	irq1_init, .-irq1_init
	.globl	irq1_start
	.type	irq1_start, @function
irq1_start:
.LFB8:
	.loc 1 36 0
	.cfi_startproc
	push	ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI25:
	.cfi_def_cfa_register 5
	.loc 1 36 0
#APP
# 36 "irq.c" 1
	pushw 0xa0
# 0 "" 2
# 36 "irq.c" 1
	pushd 0x0
# 0 "" 2
# 36 "irq.c" 1
	jmp FAR PTR  [esp]
# 0 "" 2
#NO_APP
	nop
	pop	ebp
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	irq1_start, .-irq1_start
	.globl	debug_exception
	.type	debug_exception, @function
debug_exception:
.LFB9:
	.loc 1 37 0
	.cfi_startproc
	push	ebp
.LCFI27:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI28:
	.cfi_def_cfa_register 5
	.loc 1 38 0
#APP
# 38 "irq.c" 1
	int 8
# 0 "" 2
	.loc 1 40 0
#NO_APP
	nop
	pop	ebp
.LCFI29:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	debug_exception, .-debug_exception
	.globl	__TASK_END_irq1
	.type	__TASK_END_irq1, @function
__TASK_END_irq1:
.LFB10:
	.loc 1 41 0
	.cfi_startproc
	push	ebp
.LCFI30:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI31:
	.cfi_def_cfa_register 5
	.loc 1 41 0
	nop
	pop	ebp
.LCFI32:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	__TASK_END_irq1, .-__TASK_END_irq1
	.globl	__TASK_START_irq8
	.type	__TASK_START_irq8, @function
__TASK_START_irq8:
.LFB11:
	.loc 1 43 0
	.cfi_startproc
	push	ebp
.LCFI33:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI34:
	.cfi_def_cfa_register 5
	.loc 1 43 0
	nop
	pop	ebp
.LCFI35:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	__TASK_START_irq8, .-__TASK_START_irq8
	.comm	irq8_ldt_segments,24,4
	.comm	ldt_irq8,8,4
	.comm	task_id_irq8,2,2
	.globl	irq8_tss
	.data
	.align 32
	.type	irq8_tss, @object
	.size	irq8_tss, 104
irq8_tss:
	.value	24
	.zero	6
	.value	16
	.zero	18
	.long	8192
	.long	double_fault_handler
	.long	135
	.zero	16
	.long	12288
	.zero	12
	.value	32
	.zero	2
	.value	8
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	10
	.text
	.globl	irq8_init
	.type	irq8_init, @function
irq8_init:
.LFB12:
	.loc 1 43 0
	.cfi_startproc
	push	ebp
.LCFI36:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI37:
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 43 0
	mov	DWORD PTR ldt_irq8+2, OFFSET FLAT:irq8_ldt_segments
	mov	WORD PTR ldt_irq8, 24
	mov	WORD PTR ldt_irq8+6, 0
	mov	eax, OFFSET FLAT:irq8_tss
	sub	esp, 8
	push	1
	push	0
	push	1083648
	push	103
	push	eax
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR task_id_irq8, ax
	movzx	eax, WORD PTR ldt_irq8
	movzx	eax, ax
	mov	edx, OFFSET FLAT:irq8_ldt_segments
	sub	esp, 8
	push	1
	push	0
	push	4227584
	push	eax
	push	edx
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR [ebp-10], ax
	movzx	eax, WORD PTR task_id_irq8
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq8_tss+4, eax
	movzx	eax, WORD PTR task_id_irq8
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq8_tss+56, eax
	movzx	eax, WORD PTR [ebp-10]
	sal	eax, 3
	mov	WORD PTR irq8_tss+96, ax
	sub	esp, 8
	push	1
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:ldt_irq8
	call	add_segment
	add	esp, 32
	mov	edx, OFFSET FLAT:__TASK_END_irq8
	mov	eax, OFFSET FLAT:__TASK_START_irq8
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	mov	eax, OFFSET FLAT:__TASK_START_irq8
	sub	esp, 8
	push	1
	push	0
	push	14653952
	push	edx
	push	eax
	push	OFFSET FLAT:ldt_irq8
	call	add_segment
	add	esp, 32
	movzx	eax, WORD PTR task_id_irq8
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	sub	esp, 8
	push	1
	push	0
	push	14652928
	push	65535
	push	eax
	push	OFFSET FLAT:ldt_irq8
	call	add_segment
	add	esp, 32
	nop
	leave
.LCFI38:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	irq8_init, .-irq8_init
	.globl	irq8_start
	.type	irq8_start, @function
irq8_start:
.LFB13:
	.loc 1 43 0
	.cfi_startproc
	push	ebp
.LCFI39:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI40:
	.cfi_def_cfa_register 5
	.loc 1 43 0
#APP
# 43 "irq.c" 1
	pushw 0xa0
# 0 "" 2
# 43 "irq.c" 1
	pushd 0x0
# 0 "" 2
# 43 "irq.c" 1
	jmp FAR PTR  [esp]
# 0 "" 2
#NO_APP
	nop
	pop	ebp
.LCFI41:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	irq8_start, .-irq8_start
	.globl	double_fault_handler
	.type	double_fault_handler, @function
double_fault_handler:
.LFB14:
	.loc 1 44 0
	.cfi_startproc
	push	ebp
.LCFI42:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI43:
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 1 45 0
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-4], eax
	.loc 1 46 0
#APP
# 46 "irq.c" 1
	add esp, 0x4
# 0 "" 2
# 46 "irq.c" 1
	leave
# 0 "" 2
# 46 "irq.c" 1
	pop eax
# 0 "" 2
# 46 "irq.c" 1
	iret
# 0 "" 2
#NO_APP
	.cfi_endproc
.LFE14:
	.size	double_fault_handler, .-double_fault_handler
	.globl	__TASK_END_irq8
	.type	__TASK_END_irq8, @function
__TASK_END_irq8:
.LFB15:
	.loc 1 49 0
	.cfi_startproc
	push	ebp
.LCFI44:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI45:
	.cfi_def_cfa_register 5
	.loc 1 49 0
	nop
	pop	ebp
.LCFI46:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	__TASK_END_irq8, .-__TASK_END_irq8
	.globl	__TASK_START_irq10
	.type	__TASK_START_irq10, @function
__TASK_START_irq10:
.LFB16:
	.loc 1 51 0
	.cfi_startproc
	push	ebp
.LCFI47:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI48:
	.cfi_def_cfa_register 5
	.loc 1 51 0
	nop
	pop	ebp
.LCFI49:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	__TASK_START_irq10, .-__TASK_START_irq10
	.comm	irq10_ldt_segments,24,4
	.comm	ldt_irq10,8,4
	.comm	task_id_irq10,2,2
	.globl	irq10_tss
	.data
	.align 32
	.type	irq10_tss, @object
	.size	irq10_tss, 104
irq10_tss:
	.value	24
	.zero	6
	.value	16
	.zero	18
	.long	8192
	.long	invalid_tss_handler
	.long	135
	.zero	16
	.long	12288
	.zero	12
	.value	32
	.zero	2
	.value	8
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	10
	.text
	.globl	irq10_init
	.type	irq10_init, @function
irq10_init:
.LFB17:
	.loc 1 51 0
	.cfi_startproc
	push	ebp
.LCFI50:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI51:
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 51 0
	mov	DWORD PTR ldt_irq10+2, OFFSET FLAT:irq10_ldt_segments
	mov	WORD PTR ldt_irq10, 24
	mov	WORD PTR ldt_irq10+6, 0
	mov	eax, OFFSET FLAT:irq10_tss
	sub	esp, 8
	push	1
	push	0
	push	1083648
	push	103
	push	eax
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR task_id_irq10, ax
	movzx	eax, WORD PTR ldt_irq10
	movzx	eax, ax
	mov	edx, OFFSET FLAT:irq10_ldt_segments
	sub	esp, 8
	push	1
	push	0
	push	4227584
	push	eax
	push	edx
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR [ebp-10], ax
	movzx	eax, WORD PTR task_id_irq10
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq10_tss+4, eax
	movzx	eax, WORD PTR task_id_irq10
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq10_tss+56, eax
	movzx	eax, WORD PTR [ebp-10]
	sal	eax, 3
	mov	WORD PTR irq10_tss+96, ax
	sub	esp, 8
	push	1
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:ldt_irq10
	call	add_segment
	add	esp, 32
	mov	edx, OFFSET FLAT:__TASK_END_irq10
	mov	eax, OFFSET FLAT:__TASK_START_irq10
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	mov	eax, OFFSET FLAT:__TASK_START_irq10
	sub	esp, 8
	push	1
	push	0
	push	14653952
	push	edx
	push	eax
	push	OFFSET FLAT:ldt_irq10
	call	add_segment
	add	esp, 32
	movzx	eax, WORD PTR task_id_irq10
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	sub	esp, 8
	push	1
	push	0
	push	14652928
	push	65535
	push	eax
	push	OFFSET FLAT:ldt_irq10
	call	add_segment
	add	esp, 32
	nop
	leave
.LCFI52:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	irq10_init, .-irq10_init
	.globl	irq10_start
	.type	irq10_start, @function
irq10_start:
.LFB18:
	.loc 1 51 0
	.cfi_startproc
	push	ebp
.LCFI53:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI54:
	.cfi_def_cfa_register 5
	.loc 1 51 0
#APP
# 51 "irq.c" 1
	pushw 0xa0
# 0 "" 2
# 51 "irq.c" 1
	pushd 0x0
# 0 "" 2
# 51 "irq.c" 1
	jmp FAR PTR  [esp]
# 0 "" 2
#NO_APP
	nop
	pop	ebp
.LCFI55:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	irq10_start, .-irq10_start
	.globl	invalid_tss_handler
	.type	invalid_tss_handler, @function
invalid_tss_handler:
.LFB19:
	.loc 1 52 0
	.cfi_startproc
	push	ebp
.LCFI56:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI57:
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 1 53 0
#APP
# 53 "irq.c" 1
	mov eax, [ebp + 4]
# 0 "" 2
	.loc 1 54 0
#NO_APP
	mov	DWORD PTR [ebp-4], 0
	.loc 1 55 0
#APP
# 55 "irq.c" 1
	mov eax, eax
# 0 "" 2
#NO_APP
	mov	DWORD PTR [ebp-4], eax
	.loc 1 56 0
#APP
# 56 "irq.c" 1
	add esp, 0x4
# 0 "" 2
# 56 "irq.c" 1
	leave
# 0 "" 2
# 56 "irq.c" 1
	pop eax
# 0 "" 2
# 56 "irq.c" 1
	iret
# 0 "" 2
	.loc 1 57 0
#NO_APP
	nop
	leave
.LCFI58:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	invalid_tss_handler, .-invalid_tss_handler
	.globl	__TASK_END_irq10
	.type	__TASK_END_irq10, @function
__TASK_END_irq10:
.LFB20:
	.loc 1 58 0
	.cfi_startproc
	push	ebp
.LCFI59:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI60:
	.cfi_def_cfa_register 5
	.loc 1 58 0
	nop
	pop	ebp
.LCFI61:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	__TASK_END_irq10, .-__TASK_END_irq10
	.globl	__TASK_START_irq11
	.type	__TASK_START_irq11, @function
__TASK_START_irq11:
.LFB21:
	.loc 1 60 0
	.cfi_startproc
	push	ebp
.LCFI62:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI63:
	.cfi_def_cfa_register 5
	.loc 1 60 0
	nop
	pop	ebp
.LCFI64:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	__TASK_START_irq11, .-__TASK_START_irq11
	.comm	irq11_ldt_segments,24,4
	.comm	ldt_irq11,8,4
	.comm	task_id_irq11,2,2
	.globl	irq11_tss
	.data
	.align 32
	.type	irq11_tss, @object
	.size	irq11_tss, 104
irq11_tss:
	.value	24
	.zero	6
	.value	16
	.zero	18
	.long	8192
	.long	segment_not_present
	.long	135
	.zero	16
	.long	12288
	.zero	12
	.value	32
	.zero	2
	.value	8
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	10
	.text
	.globl	irq11_init
	.type	irq11_init, @function
irq11_init:
.LFB22:
	.loc 1 60 0
	.cfi_startproc
	push	ebp
.LCFI65:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI66:
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 60 0
	mov	DWORD PTR ldt_irq11+2, OFFSET FLAT:irq11_ldt_segments
	mov	WORD PTR ldt_irq11, 24
	mov	WORD PTR ldt_irq11+6, 0
	mov	eax, OFFSET FLAT:irq11_tss
	sub	esp, 8
	push	1
	push	0
	push	1083648
	push	103
	push	eax
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR task_id_irq11, ax
	movzx	eax, WORD PTR ldt_irq11
	movzx	eax, ax
	mov	edx, OFFSET FLAT:irq11_ldt_segments
	sub	esp, 8
	push	1
	push	0
	push	4227584
	push	eax
	push	edx
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR [ebp-10], ax
	movzx	eax, WORD PTR task_id_irq11
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq11_tss+4, eax
	movzx	eax, WORD PTR task_id_irq11
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq11_tss+56, eax
	movzx	eax, WORD PTR [ebp-10]
	sal	eax, 3
	mov	WORD PTR irq11_tss+96, ax
	sub	esp, 8
	push	1
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:ldt_irq11
	call	add_segment
	add	esp, 32
	mov	edx, OFFSET FLAT:__TASK_END_irq11
	mov	eax, OFFSET FLAT:__TASK_START_irq11
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	mov	eax, OFFSET FLAT:__TASK_START_irq11
	sub	esp, 8
	push	1
	push	0
	push	14653952
	push	edx
	push	eax
	push	OFFSET FLAT:ldt_irq11
	call	add_segment
	add	esp, 32
	movzx	eax, WORD PTR task_id_irq11
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	sub	esp, 8
	push	1
	push	0
	push	14652928
	push	65535
	push	eax
	push	OFFSET FLAT:ldt_irq11
	call	add_segment
	add	esp, 32
	nop
	leave
.LCFI67:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	irq11_init, .-irq11_init
	.globl	irq11_start
	.type	irq11_start, @function
irq11_start:
.LFB23:
	.loc 1 60 0
	.cfi_startproc
	push	ebp
.LCFI68:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI69:
	.cfi_def_cfa_register 5
	.loc 1 60 0
#APP
# 60 "irq.c" 1
	pushw 0xa0
# 0 "" 2
# 60 "irq.c" 1
	pushd 0x0
# 0 "" 2
# 60 "irq.c" 1
	jmp FAR PTR  [esp]
# 0 "" 2
#NO_APP
	nop
	pop	ebp
.LCFI70:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	irq11_start, .-irq11_start
	.globl	segment_not_present
	.type	segment_not_present, @function
segment_not_present:
.LFB24:
	.loc 1 61 0
	.cfi_startproc
	push	ebp
.LCFI71:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI72:
	.cfi_def_cfa_register 5
	.loc 1 62 0
#APP
# 62 "irq.c" 1
	add esp, 0x4
# 0 "" 2
# 62 "irq.c" 1
	leave
# 0 "" 2
# 62 "irq.c" 1
	pop eax
# 0 "" 2
# 62 "irq.c" 1
	iret
# 0 "" 2
	.loc 1 63 0
#NO_APP
	nop
	pop	ebp
.LCFI73:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	segment_not_present, .-segment_not_present
	.globl	__TASK_END_irq11
	.type	__TASK_END_irq11, @function
__TASK_END_irq11:
.LFB25:
	.loc 1 64 0
	.cfi_startproc
	push	ebp
.LCFI74:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI75:
	.cfi_def_cfa_register 5
	.loc 1 64 0
	nop
	pop	ebp
.LCFI76:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	__TASK_END_irq11, .-__TASK_END_irq11
	.globl	__TASK_START_irq13
	.type	__TASK_START_irq13, @function
__TASK_START_irq13:
.LFB26:
	.loc 1 66 0
	.cfi_startproc
	push	ebp
.LCFI77:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI78:
	.cfi_def_cfa_register 5
	.loc 1 66 0
	nop
	pop	ebp
.LCFI79:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	__TASK_START_irq13, .-__TASK_START_irq13
	.comm	irq13_ldt_segments,24,4
	.comm	ldt_irq13,8,4
	.comm	task_id_irq13,2,2
	.globl	irq13_tss
	.data
	.align 32
	.type	irq13_tss, @object
	.size	irq13_tss, 104
irq13_tss:
	.value	24
	.zero	6
	.value	16
	.zero	18
	.long	8192
	.long	general_protection_exception
	.long	135
	.zero	16
	.long	12288
	.zero	12
	.value	32
	.zero	2
	.value	8
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	10
	.text
	.globl	irq13_init
	.type	irq13_init, @function
irq13_init:
.LFB27:
	.loc 1 66 0
	.cfi_startproc
	push	ebp
.LCFI80:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI81:
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 66 0
	mov	DWORD PTR ldt_irq13+2, OFFSET FLAT:irq13_ldt_segments
	mov	WORD PTR ldt_irq13, 24
	mov	WORD PTR ldt_irq13+6, 0
	mov	eax, OFFSET FLAT:irq13_tss
	sub	esp, 8
	push	1
	push	0
	push	1083648
	push	103
	push	eax
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR task_id_irq13, ax
	movzx	eax, WORD PTR ldt_irq13
	movzx	eax, ax
	mov	edx, OFFSET FLAT:irq13_ldt_segments
	sub	esp, 8
	push	1
	push	0
	push	4227584
	push	eax
	push	edx
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR [ebp-10], ax
	movzx	eax, WORD PTR task_id_irq13
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq13_tss+4, eax
	movzx	eax, WORD PTR task_id_irq13
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq13_tss+56, eax
	movzx	eax, WORD PTR [ebp-10]
	sal	eax, 3
	mov	WORD PTR irq13_tss+96, ax
	sub	esp, 8
	push	1
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:ldt_irq13
	call	add_segment
	add	esp, 32
	mov	edx, OFFSET FLAT:__TASK_END_irq13
	mov	eax, OFFSET FLAT:__TASK_START_irq13
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	mov	eax, OFFSET FLAT:__TASK_START_irq13
	sub	esp, 8
	push	1
	push	0
	push	14653952
	push	edx
	push	eax
	push	OFFSET FLAT:ldt_irq13
	call	add_segment
	add	esp, 32
	movzx	eax, WORD PTR task_id_irq13
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	sub	esp, 8
	push	1
	push	0
	push	14652928
	push	65535
	push	eax
	push	OFFSET FLAT:ldt_irq13
	call	add_segment
	add	esp, 32
	nop
	leave
.LCFI82:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	irq13_init, .-irq13_init
	.globl	irq13_start
	.type	irq13_start, @function
irq13_start:
.LFB28:
	.loc 1 66 0
	.cfi_startproc
	push	ebp
.LCFI83:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI84:
	.cfi_def_cfa_register 5
	.loc 1 66 0
#APP
# 66 "irq.c" 1
	pushw 0xa0
# 0 "" 2
# 66 "irq.c" 1
	pushd 0x0
# 0 "" 2
# 66 "irq.c" 1
	jmp FAR PTR  [esp]
# 0 "" 2
#NO_APP
	nop
	pop	ebp
.LCFI85:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	irq13_start, .-irq13_start
	.globl	general_protection_exception
	.type	general_protection_exception, @function
general_protection_exception:
.LFB29:
	.loc 1 67 0
	.cfi_startproc
	push	ebp
.LCFI86:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI87:
	.cfi_def_cfa_register 5
	sub	esp, 16
.L31:
	.loc 1 69 0 discriminator 1
#APP
# 69 "irq.c" 1
	mov eax, [ebp + 4]
# 0 "" 2
	.loc 1 70 0 discriminator 1
#NO_APP
	mov	DWORD PTR [ebp-4], 0
	.loc 1 71 0 discriminator 1
#APP
# 71 "irq.c" 1
	mov eax, eax
# 0 "" 2
#NO_APP
	mov	DWORD PTR [ebp-4], eax
	.loc 1 73 0 discriminator 1
#APP
# 73 "irq.c" 1
	add esp, 0x4
# 0 "" 2
# 73 "irq.c" 1
	leave
# 0 "" 2
# 73 "irq.c" 1
	pop eax
# 0 "" 2
# 73 "irq.c" 1
	iret
# 0 "" 2
	.loc 1 75 0 discriminator 1
# 75 "irq.c" 1
	mov ebp, esp
# 0 "" 2
	.loc 1 76 0 discriminator 1
# 76 "irq.c" 1
	sub ebp, 4
# 0 "" 2
	.loc 1 77 0 discriminator 1
#NO_APP
	jmp	.L31
	.cfi_endproc
.LFE29:
	.size	general_protection_exception, .-general_protection_exception
	.globl	__TASK_END_irq13
	.type	__TASK_END_irq13, @function
__TASK_END_irq13:
.LFB30:
	.loc 1 79 0
	.cfi_startproc
	push	ebp
.LCFI88:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI89:
	.cfi_def_cfa_register 5
	.loc 1 79 0
	nop
	pop	ebp
.LCFI90:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE30:
	.size	__TASK_END_irq13, .-__TASK_END_irq13
	.globl	__TASK_START_irq32
	.type	__TASK_START_irq32, @function
__TASK_START_irq32:
.LFB31:
	.loc 1 81 0
	.cfi_startproc
	push	ebp
.LCFI91:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI92:
	.cfi_def_cfa_register 5
	.loc 1 81 0
	nop
	pop	ebp
.LCFI93:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE31:
	.size	__TASK_START_irq32, .-__TASK_START_irq32
	.comm	irq32_ldt_segments,24,4
	.comm	ldt_irq32,8,4
	.comm	task_id_irq32,2,2
	.globl	irq32_tss
	.data
	.align 32
	.type	irq32_tss, @object
	.size	irq32_tss, 104
irq32_tss:
	.value	24
	.zero	6
	.value	16
	.zero	18
	.long	8192
	.long	lapic_timer_handler
	.long	135
	.zero	16
	.long	12288
	.zero	12
	.value	32
	.zero	2
	.value	8
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	10
	.text
	.globl	irq32_init
	.type	irq32_init, @function
irq32_init:
.LFB32:
	.loc 1 81 0
	.cfi_startproc
	push	ebp
.LCFI94:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI95:
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 81 0
	mov	DWORD PTR ldt_irq32+2, OFFSET FLAT:irq32_ldt_segments
	mov	WORD PTR ldt_irq32, 24
	mov	WORD PTR ldt_irq32+6, 0
	mov	eax, OFFSET FLAT:irq32_tss
	sub	esp, 8
	push	1
	push	0
	push	1083648
	push	103
	push	eax
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR task_id_irq32, ax
	movzx	eax, WORD PTR ldt_irq32
	movzx	eax, ax
	mov	edx, OFFSET FLAT:irq32_ldt_segments
	sub	esp, 8
	push	1
	push	0
	push	4227584
	push	eax
	push	edx
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR [ebp-10], ax
	movzx	eax, WORD PTR task_id_irq32
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq32_tss+4, eax
	movzx	eax, WORD PTR task_id_irq32
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq32_tss+56, eax
	movzx	eax, WORD PTR [ebp-10]
	sal	eax, 3
	mov	WORD PTR irq32_tss+96, ax
	sub	esp, 8
	push	1
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:ldt_irq32
	call	add_segment
	add	esp, 32
	mov	edx, OFFSET FLAT:__TASK_END_irq32
	mov	eax, OFFSET FLAT:__TASK_START_irq32
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	mov	eax, OFFSET FLAT:__TASK_START_irq32
	sub	esp, 8
	push	1
	push	0
	push	14653952
	push	edx
	push	eax
	push	OFFSET FLAT:ldt_irq32
	call	add_segment
	add	esp, 32
	movzx	eax, WORD PTR task_id_irq32
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	sub	esp, 8
	push	1
	push	0
	push	14652928
	push	65535
	push	eax
	push	OFFSET FLAT:ldt_irq32
	call	add_segment
	add	esp, 32
	nop
	leave
.LCFI96:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE32:
	.size	irq32_init, .-irq32_init
	.globl	irq32_start
	.type	irq32_start, @function
irq32_start:
.LFB33:
	.loc 1 81 0
	.cfi_startproc
	push	ebp
.LCFI97:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI98:
	.cfi_def_cfa_register 5
	.loc 1 81 0
#APP
# 81 "irq.c" 1
	pushw 0xa0
# 0 "" 2
# 81 "irq.c" 1
	pushd 0x0
# 0 "" 2
# 81 "irq.c" 1
	jmp FAR PTR  [esp]
# 0 "" 2
#NO_APP
	nop
	pop	ebp
.LCFI99:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE33:
	.size	irq32_start, .-irq32_start
	.globl	current_task_id
	.data
	.align 4
	.type	current_task_id, @object
	.size	current_task_id, 4
current_task_id:
	.long	1
	.text
	.globl	lapic_timer_handler
	.type	lapic_timer_handler, @function
lapic_timer_handler:
.LFB34:
	.loc 1 83 0
	.cfi_startproc
	push	ebp
.LCFI100:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI101:
	.cfi_def_cfa_register 5
	sub	esp, 16
.L37:
	.loc 1 91 0
	mov	eax, DWORD PTR current_task_id
	cmp	eax, 1
	jne	.L38
	.loc 1 92 0
	mov	DWORD PTR current_task_id, 2
	jmp	.L39
.L38:
	.loc 1 94 0
	mov	DWORD PTR current_task_id, 1
.L39:
	.loc 1 96 0
	mov	DWORD PTR [ebp-4], -18874192
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [eax], 1
	.loc 1 97 0
#APP
# 97 "irq.c" 1
	add esp, 0x4
# 0 "" 2
# 97 "irq.c" 1
	leave
# 0 "" 2
# 97 "irq.c" 1
	pop eax
# 0 "" 2
# 97 "irq.c" 1
	iret
# 0 "" 2
	.loc 1 98 0
# 98 "irq.c" 1
	mov ebp, esp
# 0 "" 2
	.loc 1 99 0
# 99 "irq.c" 1
	sub ebp, 4
# 0 "" 2
	.loc 1 100 0
#NO_APP
	jmp	.L37
	.cfi_endproc
.LFE34:
	.size	lapic_timer_handler, .-lapic_timer_handler
	.globl	__TASK_END_irq32
	.type	__TASK_END_irq32, @function
__TASK_END_irq32:
.LFB35:
	.loc 1 102 0
	.cfi_startproc
	push	ebp
.LCFI102:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI103:
	.cfi_def_cfa_register 5
	.loc 1 102 0
	nop
	pop	ebp
.LCFI104:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE35:
	.size	__TASK_END_irq32, .-__TASK_END_irq32
	.globl	__TASK_START_irq20
	.type	__TASK_START_irq20, @function
__TASK_START_irq20:
.LFB36:
	.loc 1 104 0
	.cfi_startproc
	push	ebp
.LCFI105:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI106:
	.cfi_def_cfa_register 5
	.loc 1 104 0
	nop
	pop	ebp
.LCFI107:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE36:
	.size	__TASK_START_irq20, .-__TASK_START_irq20
	.comm	irq20_ldt_segments,24,4
	.comm	ldt_irq20,8,4
	.comm	task_id_irq20,2,2
	.globl	irq20_tss
	.data
	.align 32
	.type	irq20_tss, @object
	.size	irq20_tss, 104
irq20_tss:
	.value	24
	.zero	6
	.value	16
	.zero	18
	.long	8192
	.long	double_fault_handler2
	.long	135
	.zero	16
	.long	12288
	.zero	12
	.value	32
	.zero	2
	.value	8
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	2
	.value	16
	.zero	10
	.text
	.globl	irq20_init
	.type	irq20_init, @function
irq20_init:
.LFB37:
	.loc 1 104 0
	.cfi_startproc
	push	ebp
.LCFI108:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI109:
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 104 0
	mov	DWORD PTR ldt_irq20+2, OFFSET FLAT:irq20_ldt_segments
	mov	WORD PTR ldt_irq20, 24
	mov	WORD PTR ldt_irq20+6, 0
	mov	eax, OFFSET FLAT:irq20_tss
	sub	esp, 8
	push	1
	push	0
	push	1083648
	push	103
	push	eax
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR task_id_irq20, ax
	movzx	eax, WORD PTR ldt_irq20
	movzx	eax, ax
	mov	edx, OFFSET FLAT:irq20_ldt_segments
	sub	esp, 8
	push	1
	push	0
	push	4227584
	push	eax
	push	edx
	push	OFFSET FLAT:gdt
	call	add_segment
	add	esp, 32
	mov	WORD PTR [ebp-10], ax
	movzx	eax, WORD PTR task_id_irq20
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq20_tss+4, eax
	movzx	eax, WORD PTR task_id_irq20
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	mov	DWORD PTR irq20_tss+56, eax
	movzx	eax, WORD PTR [ebp-10]
	sal	eax, 3
	mov	WORD PTR irq20_tss+96, ax
	sub	esp, 8
	push	1
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:ldt_irq20
	call	add_segment
	add	esp, 32
	mov	edx, OFFSET FLAT:__TASK_END_irq20
	mov	eax, OFFSET FLAT:__TASK_START_irq20
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	mov	eax, OFFSET FLAT:__TASK_START_irq20
	sub	esp, 8
	push	1
	push	0
	push	14653952
	push	edx
	push	eax
	push	OFFSET FLAT:ldt_irq20
	call	add_segment
	add	esp, 32
	movzx	eax, WORD PTR task_id_irq20
	movzx	eax, ax
	add	eax, 53
	sal	eax, 12
	sub	esp, 8
	push	1
	push	0
	push	14652928
	push	65535
	push	eax
	push	OFFSET FLAT:ldt_irq20
	call	add_segment
	add	esp, 32
	nop
	leave
.LCFI110:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE37:
	.size	irq20_init, .-irq20_init
	.globl	irq20_start
	.type	irq20_start, @function
irq20_start:
.LFB38:
	.loc 1 104 0
	.cfi_startproc
	push	ebp
.LCFI111:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI112:
	.cfi_def_cfa_register 5
	.loc 1 104 0
#APP
# 104 "irq.c" 1
	pushw 0xa0
# 0 "" 2
# 104 "irq.c" 1
	pushd 0x0
# 0 "" 2
# 104 "irq.c" 1
	jmp FAR PTR  [esp]
# 0 "" 2
#NO_APP
	nop
	pop	ebp
.LCFI113:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE38:
	.size	irq20_start, .-irq20_start
	.globl	double_fault_handler2
	.type	double_fault_handler2, @function
double_fault_handler2:
.LFB39:
	.loc 1 105 0
	.cfi_startproc
	push	ebp
.LCFI114:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI115:
	.cfi_def_cfa_register 5
	.loc 1 106 0
#APP
# 106 "irq.c" 1
	add esp, 0x4
# 0 "" 2
# 106 "irq.c" 1
	leave
# 0 "" 2
# 106 "irq.c" 1
	pop eax
# 0 "" 2
# 106 "irq.c" 1
	iret
# 0 "" 2
	.loc 1 107 0
#NO_APP
	nop
	pop	ebp
.LCFI116:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE39:
	.size	double_fault_handler2, .-double_fault_handler2
	.globl	__TASK_END_irq20
	.type	__TASK_END_irq20, @function
__TASK_END_irq20:
.LFB40:
	.loc 1 108 0
	.cfi_startproc
	push	ebp
.LCFI117:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI118:
	.cfi_def_cfa_register 5
	.loc 1 108 0
	nop
	pop	ebp
.LCFI119:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE40:
	.size	__TASK_END_irq20, .-__TASK_END_irq20
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "gdt.h"
	.file 4 "task.h"
	.file 5 "irq.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb10
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF846
	.byte	0xc
	.long	.LASF847
	.long	.LASF848
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF710
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF711
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF712
	.uleb128 0x4
	.long	.LASF714
	.byte	0x2
	.byte	0x30
	.long	0x50
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF713
	.uleb128 0x4
	.long	.LASF715
	.byte	0x2
	.byte	0x31
	.long	0x62
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF716
	.uleb128 0x4
	.long	.LASF717
	.byte	0x2
	.byte	0x33
	.long	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF718
	.uleb128 0x4
	.long	.LASF719
	.byte	0x2
	.byte	0x3a
	.long	0x86
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF720
	.uleb128 0x4
	.long	.LASF721
	.byte	0x2
	.byte	0x80
	.long	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF722
	.uleb128 0x5
	.byte	0x8
	.byte	0x3
	.byte	0x60
	.long	0xc4
	.uleb128 0x6
	.long	.LASF723
	.byte	0x3
	.byte	0x61
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF724
	.byte	0x3
	.byte	0x62
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.byte	0x3
	.byte	0x65
	.long	0x121
	.uleb128 0x6
	.long	.LASF725
	.byte	0x3
	.byte	0x66
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF726
	.byte	0x3
	.byte	0x67
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.long	.LASF727
	.byte	0x3
	.byte	0x68
	.long	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF728
	.byte	0x3
	.byte	0x69
	.long	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.long	.LASF729
	.byte	0x3
	.byte	0x6a
	.long	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x6
	.long	.LASF730
	.byte	0x3
	.byte	0x6b
	.long	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0
	.uleb128 0x7
	.long	.LASF849
	.byte	0x8
	.byte	0x3
	.byte	0x5d
	.long	0x143
	.uleb128 0x8
	.string	"raw"
	.byte	0x3
	.byte	0x5e
	.long	0x7b
	.uleb128 0x9
	.long	0x9f
	.uleb128 0x9
	.long	0xc4
	.byte	0
	.uleb128 0x4
	.long	.LASF731
	.byte	0x3
	.byte	0x6d
	.long	0x121
	.uleb128 0xa
	.string	"gdt"
	.byte	0x8
	.byte	0x3
	.byte	0x7b
	.long	0x185
	.uleb128 0x6
	.long	.LASF732
	.byte	0x3
	.byte	0x7f
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF733
	.byte	0x3
	.byte	0x80
	.long	0x185
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.long	.LASF734
	.byte	0x3
	.byte	0x81
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.long	0x143
	.uleb128 0x4
	.long	.LASF735
	.byte	0x3
	.byte	0x82
	.long	0x14e
	.uleb128 0x4
	.long	.LASF736
	.byte	0x3
	.byte	0x84
	.long	0x18b
	.uleb128 0x4
	.long	.LASF737
	.byte	0x3
	.byte	0x85
	.long	0x18b
	.uleb128 0xa
	.string	"tss"
	.byte	0x68
	.byte	0x4
	.byte	0x7
	.long	0x3cd
	.uleb128 0x6
	.long	.LASF738
	.byte	0x4
	.byte	0x8
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF739
	.byte	0x4
	.byte	0x9
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.long	.LASF740
	.byte	0x4
	.byte	0xa
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF741
	.byte	0x4
	.byte	0xb
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF742
	.byte	0x4
	.byte	0xc
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x6
	.long	.LASF743
	.byte	0x4
	.byte	0xd
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.long	.LASF744
	.byte	0x4
	.byte	0xe
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF745
	.byte	0x4
	.byte	0xf
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x6
	.long	.LASF746
	.byte	0x4
	.byte	0x10
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.long	.LASF747
	.byte	0x4
	.byte	0x11
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.long	.LASF748
	.byte	0x4
	.byte	0x12
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xc
	.string	"cr3"
	.byte	0x4
	.byte	0x13
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xc
	.string	"eip"
	.byte	0x4
	.byte	0x14
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF749
	.byte	0x4
	.byte	0x15
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xc
	.string	"eax"
	.byte	0x4
	.byte	0x16
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xc
	.string	"ecx"
	.byte	0x4
	.byte	0x17
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xc
	.string	"edx"
	.byte	0x4
	.byte	0x18
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xc
	.string	"ebx"
	.byte	0x4
	.byte	0x19
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xc
	.string	"esp"
	.byte	0x4
	.byte	0x1a
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xc
	.string	"ebp"
	.byte	0x4
	.byte	0x1b
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xc
	.string	"esi"
	.byte	0x4
	.byte	0x1c
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xc
	.string	"edi"
	.byte	0x4
	.byte	0x1d
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.long	.LASF750
	.byte	0x4
	.byte	0x1e
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.long	.LASF751
	.byte	0x4
	.byte	0x1f
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x6
	.long	.LASF752
	.byte	0x4
	.byte	0x20
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x6
	.long	.LASF753
	.byte	0x4
	.byte	0x21
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x6
	.long	.LASF754
	.byte	0x4
	.byte	0x22
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x6
	.long	.LASF755
	.byte	0x4
	.byte	0x23
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x6
	.long	.LASF756
	.byte	0x4
	.byte	0x24
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x6
	.long	.LASF757
	.byte	0x4
	.byte	0x25
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x6
	.long	.LASF758
	.byte	0x4
	.byte	0x26
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x6
	.long	.LASF759
	.byte	0x4
	.byte	0x27
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x6
	.long	.LASF760
	.byte	0x4
	.byte	0x28
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x6
	.long	.LASF761
	.byte	0x4
	.byte	0x29
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x6
	.long	.LASF762
	.byte	0x4
	.byte	0x2a
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x6
	.long	.LASF763
	.byte	0x4
	.byte	0x2b
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x6
	.long	.LASF764
	.byte	0x4
	.byte	0x2c
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x6
	.long	.LASF765
	.byte	0x4
	.byte	0x2d
	.long	0x57
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.byte	0
	.uleb128 0x4
	.long	.LASF766
	.byte	0x5
	.byte	0x9
	.long	0x18b
	.uleb128 0xd
	.byte	0x1
	.long	.LASF767
	.byte	0x1
	.byte	0xd
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF768
	.byte	0x1
	.byte	0x1c
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF773
	.byte	0x1
	.byte	0x1c
	.long	.LFB2
	.long	.LFE2
	.long	.LLST2
	.byte	0x1
	.long	0x42a
	.uleb128 0x10
	.long	.LASF775
	.byte	0x1
	.byte	0x1c
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF769
	.byte	0x1
	.byte	0x1c
	.long	.LFB3
	.long	.LFE3
	.long	.LLST3
	.byte	0x1
	.uleb128 0xd
	.byte	0x1
	.long	.LASF770
	.byte	0x1
	.byte	0x1d
	.long	.LFB4
	.long	.LFE4
	.long	.LLST4
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF771
	.byte	0x1
	.byte	0x22
	.long	.LFB5
	.long	.LFE5
	.long	.LLST5
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF772
	.byte	0x1
	.byte	0x24
	.long	.LFB6
	.long	.LFE6
	.long	.LLST6
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF774
	.byte	0x1
	.byte	0x24
	.long	.LFB7
	.long	.LFE7
	.long	.LLST7
	.byte	0x1
	.long	0x4a6
	.uleb128 0x10
	.long	.LASF775
	.byte	0x1
	.byte	0x24
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF776
	.byte	0x1
	.byte	0x24
	.long	.LFB8
	.long	.LFE8
	.long	.LLST8
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF777
	.byte	0x1
	.byte	0x25
	.long	.LFB9
	.long	.LFE9
	.long	.LLST9
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF778
	.byte	0x1
	.byte	0x29
	.long	.LFB10
	.long	.LFE10
	.long	.LLST10
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF779
	.byte	0x1
	.byte	0x2b
	.long	.LFB11
	.long	.LFE11
	.long	.LLST11
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF780
	.byte	0x1
	.byte	0x2b
	.long	.LFB12
	.long	.LFE12
	.long	.LLST12
	.byte	0x1
	.long	0x522
	.uleb128 0x10
	.long	.LASF775
	.byte	0x1
	.byte	0x2b
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF781
	.byte	0x1
	.byte	0x2b
	.long	.LFB13
	.long	.LFE13
	.long	.LLST13
	.byte	0x1
	.uleb128 0x11
	.byte	0x1
	.long	.LASF792
	.byte	0x1
	.byte	0x2c
	.byte	0x1
	.long	.LFB14
	.long	.LFE14
	.long	.LLST14
	.byte	0x1
	.long	0x56c
	.uleb128 0x12
	.long	.LASF787
	.byte	0x1
	.byte	0x2c
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.string	"i"
	.byte	0x1
	.byte	0x2d
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF782
	.byte	0x1
	.byte	0x31
	.long	.LFB15
	.long	.LFE15
	.long	.LLST15
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF783
	.byte	0x1
	.byte	0x33
	.long	.LFB16
	.long	.LFE16
	.long	.LLST16
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF784
	.byte	0x1
	.byte	0x33
	.long	.LFB17
	.long	.LFE17
	.long	.LLST17
	.byte	0x1
	.long	0x5be
	.uleb128 0x10
	.long	.LASF775
	.byte	0x1
	.byte	0x33
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF785
	.byte	0x1
	.byte	0x33
	.long	.LFB18
	.long	.LFE18
	.long	.LLST18
	.byte	0x1
	.uleb128 0x14
	.byte	0x1
	.long	.LASF786
	.byte	0x1
	.byte	0x34
	.long	.LFB19
	.long	.LFE19
	.long	.LLST19
	.byte	0x1
	.long	0x5fb
	.uleb128 0x10
	.long	.LASF787
	.byte	0x1
	.byte	0x36
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF788
	.byte	0x1
	.byte	0x3a
	.long	.LFB20
	.long	.LFE20
	.long	.LLST20
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF789
	.byte	0x1
	.byte	0x3c
	.long	.LFB21
	.long	.LFE21
	.long	.LLST21
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF790
	.byte	0x1
	.byte	0x3c
	.long	.LFB22
	.long	.LFE22
	.long	.LLST22
	.byte	0x1
	.long	0x64d
	.uleb128 0x10
	.long	.LASF775
	.byte	0x1
	.byte	0x3c
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF791
	.byte	0x1
	.byte	0x3c
	.long	.LFB23
	.long	.LFE23
	.long	.LLST23
	.byte	0x1
	.uleb128 0x11
	.byte	0x1
	.long	.LASF793
	.byte	0x1
	.byte	0x3d
	.byte	0x1
	.long	.LFB24
	.long	.LFE24
	.long	.LLST24
	.byte	0x1
	.long	0x68b
	.uleb128 0x12
	.long	.LASF787
	.byte	0x1
	.byte	0x3d
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF794
	.byte	0x1
	.byte	0x40
	.long	.LFB25
	.long	.LFE25
	.long	.LLST25
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF795
	.byte	0x1
	.byte	0x42
	.long	.LFB26
	.long	.LFE26
	.long	.LLST26
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF796
	.byte	0x1
	.byte	0x42
	.long	.LFB27
	.long	.LFE27
	.long	.LLST27
	.byte	0x1
	.long	0x6dd
	.uleb128 0x10
	.long	.LASF775
	.byte	0x1
	.byte	0x42
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF797
	.byte	0x1
	.byte	0x42
	.long	.LFB28
	.long	.LFE28
	.long	.LLST28
	.byte	0x1
	.uleb128 0x14
	.byte	0x1
	.long	.LASF798
	.byte	0x1
	.byte	0x43
	.long	.LFB29
	.long	.LFE29
	.long	.LLST29
	.byte	0x1
	.long	0x725
	.uleb128 0x15
	.long	.LASF804
	.byte	0x1
	.byte	0x44
	.long	.L31
	.uleb128 0x10
	.long	.LASF787
	.byte	0x1
	.byte	0x46
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF799
	.byte	0x1
	.byte	0x4f
	.long	.LFB30
	.long	.LFE30
	.long	.LLST30
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF800
	.byte	0x1
	.byte	0x51
	.long	.LFB31
	.long	.LFE31
	.long	.LLST31
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF801
	.byte	0x1
	.byte	0x51
	.long	.LFB32
	.long	.LFE32
	.long	.LLST32
	.byte	0x1
	.long	0x777
	.uleb128 0x10
	.long	.LASF775
	.byte	0x1
	.byte	0x51
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF802
	.byte	0x1
	.byte	0x51
	.long	.LFB33
	.long	.LFE33
	.long	.LLST33
	.byte	0x1
	.uleb128 0x14
	.byte	0x1
	.long	.LASF803
	.byte	0x1
	.byte	0x53
	.long	.LFB34
	.long	.LFE34
	.long	.LLST34
	.byte	0x1
	.long	0x7bf
	.uleb128 0x15
	.long	.LASF804
	.byte	0x1
	.byte	0x54
	.long	.L37
	.uleb128 0x13
	.string	"eoi"
	.byte	0x1
	.byte	0x60
	.long	0x7bf
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.long	0x69
	.uleb128 0xe
	.byte	0x1
	.long	.LASF805
	.byte	0x1
	.byte	0x66
	.long	.LFB35
	.long	.LFE35
	.long	.LLST35
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF806
	.byte	0x1
	.byte	0x68
	.long	.LFB36
	.long	.LFE36
	.long	.LLST36
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF807
	.byte	0x1
	.byte	0x68
	.long	.LFB37
	.long	.LFE37
	.long	.LLST37
	.byte	0x1
	.long	0x817
	.uleb128 0x10
	.long	.LASF775
	.byte	0x1
	.byte	0x68
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF808
	.byte	0x1
	.byte	0x68
	.long	.LFB38
	.long	.LFE38
	.long	.LLST38
	.byte	0x1
	.uleb128 0x11
	.byte	0x1
	.long	.LASF809
	.byte	0x1
	.byte	0x69
	.byte	0x1
	.long	.LFB39
	.long	.LFE39
	.long	.LLST39
	.byte	0x1
	.long	0x855
	.uleb128 0x12
	.long	.LASF787
	.byte	0x1
	.byte	0x69
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF810
	.byte	0x1
	.byte	0x6c
	.long	.LFB40
	.long	.LFE40
	.long	.LLST40
	.byte	0x1
	.uleb128 0x16
	.long	0x143
	.long	0x87a
	.uleb128 0x17
	.long	0x87a
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF811
	.uleb128 0x10
	.long	.LASF812
	.byte	0x1
	.byte	0x5
	.long	0x86a
	.byte	0x5
	.byte	0x3
	.long	irq_gates
	.uleb128 0x18
	.string	"gdt"
	.byte	0x3
	.byte	0x87
	.long	0x196
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.string	"idt"
	.byte	0x1
	.byte	0x7
	.long	0x3cd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	idt
	.uleb128 0x1a
	.long	.LASF813
	.byte	0x1
	.byte	0x1c
	.long	0x57
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	task_id_irq0
	.uleb128 0x1a
	.long	.LASF814
	.byte	0x1
	.byte	0x24
	.long	0x57
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	task_id_irq1
	.uleb128 0x1a
	.long	.LASF815
	.byte	0x1
	.byte	0x2b
	.long	0x57
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	task_id_irq8
	.uleb128 0x1a
	.long	.LASF816
	.byte	0x1
	.byte	0x33
	.long	0x57
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	task_id_irq10
	.uleb128 0x1a
	.long	.LASF817
	.byte	0x1
	.byte	0x3c
	.long	0x57
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	task_id_irq11
	.uleb128 0x1a
	.long	.LASF818
	.byte	0x1
	.byte	0x42
	.long	0x57
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	task_id_irq13
	.uleb128 0x1a
	.long	.LASF819
	.byte	0x1
	.byte	0x68
	.long	0x57
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	task_id_irq20
	.uleb128 0x1a
	.long	.LASF820
	.byte	0x1
	.byte	0x51
	.long	0x57
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	task_id_irq32
	.uleb128 0x16
	.long	0x143
	.long	0x951
	.uleb128 0x17
	.long	0x87a
	.byte	0x2
	.byte	0
	.uleb128 0x1a
	.long	.LASF821
	.byte	0x1
	.byte	0x1c
	.long	0x941
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq0_ldt_segments
	.uleb128 0x1a
	.long	.LASF822
	.byte	0x1
	.byte	0x1c
	.long	0x1a1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ldt_irq0
	.uleb128 0x1a
	.long	.LASF823
	.byte	0x1
	.byte	0x1c
	.long	0x1ac
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq0_tss
	.uleb128 0x1a
	.long	.LASF824
	.byte	0x1
	.byte	0x24
	.long	0x941
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq1_ldt_segments
	.uleb128 0x1a
	.long	.LASF825
	.byte	0x1
	.byte	0x24
	.long	0x1a1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ldt_irq1
	.uleb128 0x1a
	.long	.LASF826
	.byte	0x1
	.byte	0x24
	.long	0x1ac
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq1_tss
	.uleb128 0x1a
	.long	.LASF827
	.byte	0x1
	.byte	0x2b
	.long	0x941
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq8_ldt_segments
	.uleb128 0x1a
	.long	.LASF828
	.byte	0x1
	.byte	0x2b
	.long	0x1a1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ldt_irq8
	.uleb128 0x1a
	.long	.LASF829
	.byte	0x1
	.byte	0x2b
	.long	0x1ac
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq8_tss
	.uleb128 0x1a
	.long	.LASF830
	.byte	0x1
	.byte	0x33
	.long	0x941
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq10_ldt_segments
	.uleb128 0x1a
	.long	.LASF831
	.byte	0x1
	.byte	0x33
	.long	0x1a1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ldt_irq10
	.uleb128 0x1a
	.long	.LASF832
	.byte	0x1
	.byte	0x33
	.long	0x1ac
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq10_tss
	.uleb128 0x1a
	.long	.LASF833
	.byte	0x1
	.byte	0x3c
	.long	0x941
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq11_ldt_segments
	.uleb128 0x1a
	.long	.LASF834
	.byte	0x1
	.byte	0x3c
	.long	0x1a1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ldt_irq11
	.uleb128 0x1a
	.long	.LASF835
	.byte	0x1
	.byte	0x3c
	.long	0x1ac
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq11_tss
	.uleb128 0x1a
	.long	.LASF836
	.byte	0x1
	.byte	0x42
	.long	0x941
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq13_ldt_segments
	.uleb128 0x1a
	.long	.LASF837
	.byte	0x1
	.byte	0x42
	.long	0x1a1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ldt_irq13
	.uleb128 0x1a
	.long	.LASF838
	.byte	0x1
	.byte	0x42
	.long	0x1ac
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq13_tss
	.uleb128 0x1a
	.long	.LASF839
	.byte	0x1
	.byte	0x51
	.long	0x941
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq32_ldt_segments
	.uleb128 0x1a
	.long	.LASF840
	.byte	0x1
	.byte	0x51
	.long	0x1a1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ldt_irq32
	.uleb128 0x1a
	.long	.LASF841
	.byte	0x1
	.byte	0x51
	.long	0x1ac
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq32_tss
	.uleb128 0x1a
	.long	.LASF842
	.byte	0x1
	.byte	0x52
	.long	0x37
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	current_task_id
	.uleb128 0x1a
	.long	.LASF843
	.byte	0x1
	.byte	0x68
	.long	0x941
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq20_ldt_segments
	.uleb128 0x1a
	.long	.LASF844
	.byte	0x1
	.byte	0x68
	.long	0x1a1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ldt_irq20
	.uleb128 0x1a
	.long	.LASF845
	.byte	0x1
	.byte	0x68
	.long	0x1ac
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	irq20_tss
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x2119
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB0-.Ltext0
	.long	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI1-.Ltext0
	.long	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI2-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB1-.Ltext0
	.long	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI3-.Ltext0
	.long	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI4-.Ltext0
	.long	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI5-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB2-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI6-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI7-.Ltext0
	.long	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI8-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LFB3-.Ltext0
	.long	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI9-.Ltext0
	.long	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI10-.Ltext0
	.long	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI11-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST4:
	.long	.LFB4-.Ltext0
	.long	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI12-.Ltext0
	.long	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI13-.Ltext0
	.long	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI14-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LFB5-.Ltext0
	.long	.LCFI15-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI15-.Ltext0
	.long	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI16-.Ltext0
	.long	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI17-.Ltext0
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LFB6-.Ltext0
	.long	.LCFI18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI18-.Ltext0
	.long	.LCFI19-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI19-.Ltext0
	.long	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI20-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LFB7-.Ltext0
	.long	.LCFI21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI21-.Ltext0
	.long	.LCFI22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI22-.Ltext0
	.long	.LCFI23-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI23-.Ltext0
	.long	.LFE7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST8:
	.long	.LFB8-.Ltext0
	.long	.LCFI24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI24-.Ltext0
	.long	.LCFI25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI25-.Ltext0
	.long	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI26-.Ltext0
	.long	.LFE8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST9:
	.long	.LFB9-.Ltext0
	.long	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI27-.Ltext0
	.long	.LCFI28-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI28-.Ltext0
	.long	.LCFI29-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI29-.Ltext0
	.long	.LFE9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST10:
	.long	.LFB10-.Ltext0
	.long	.LCFI30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI30-.Ltext0
	.long	.LCFI31-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI31-.Ltext0
	.long	.LCFI32-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI32-.Ltext0
	.long	.LFE10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST11:
	.long	.LFB11-.Ltext0
	.long	.LCFI33-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI33-.Ltext0
	.long	.LCFI34-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI34-.Ltext0
	.long	.LCFI35-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI35-.Ltext0
	.long	.LFE11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST12:
	.long	.LFB12-.Ltext0
	.long	.LCFI36-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI36-.Ltext0
	.long	.LCFI37-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI37-.Ltext0
	.long	.LCFI38-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI38-.Ltext0
	.long	.LFE12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST13:
	.long	.LFB13-.Ltext0
	.long	.LCFI39-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI39-.Ltext0
	.long	.LCFI40-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI40-.Ltext0
	.long	.LCFI41-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI41-.Ltext0
	.long	.LFE13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST14:
	.long	.LFB14-.Ltext0
	.long	.LCFI42-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI42-.Ltext0
	.long	.LCFI43-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI43-.Ltext0
	.long	.LFE14-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST15:
	.long	.LFB15-.Ltext0
	.long	.LCFI44-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI44-.Ltext0
	.long	.LCFI45-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI45-.Ltext0
	.long	.LCFI46-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI46-.Ltext0
	.long	.LFE15-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST16:
	.long	.LFB16-.Ltext0
	.long	.LCFI47-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI47-.Ltext0
	.long	.LCFI48-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI48-.Ltext0
	.long	.LCFI49-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI49-.Ltext0
	.long	.LFE16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST17:
	.long	.LFB17-.Ltext0
	.long	.LCFI50-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI50-.Ltext0
	.long	.LCFI51-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI51-.Ltext0
	.long	.LCFI52-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI52-.Ltext0
	.long	.LFE17-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST18:
	.long	.LFB18-.Ltext0
	.long	.LCFI53-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI53-.Ltext0
	.long	.LCFI54-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI54-.Ltext0
	.long	.LCFI55-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI55-.Ltext0
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST19:
	.long	.LFB19-.Ltext0
	.long	.LCFI56-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI56-.Ltext0
	.long	.LCFI57-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI57-.Ltext0
	.long	.LCFI58-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI58-.Ltext0
	.long	.LFE19-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST20:
	.long	.LFB20-.Ltext0
	.long	.LCFI59-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI59-.Ltext0
	.long	.LCFI60-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI60-.Ltext0
	.long	.LCFI61-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI61-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST21:
	.long	.LFB21-.Ltext0
	.long	.LCFI62-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI62-.Ltext0
	.long	.LCFI63-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI63-.Ltext0
	.long	.LCFI64-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI64-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST22:
	.long	.LFB22-.Ltext0
	.long	.LCFI65-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI65-.Ltext0
	.long	.LCFI66-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI66-.Ltext0
	.long	.LCFI67-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI67-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST23:
	.long	.LFB23-.Ltext0
	.long	.LCFI68-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI68-.Ltext0
	.long	.LCFI69-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI69-.Ltext0
	.long	.LCFI70-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI70-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST24:
	.long	.LFB24-.Ltext0
	.long	.LCFI71-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI71-.Ltext0
	.long	.LCFI72-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI72-.Ltext0
	.long	.LCFI73-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI73-.Ltext0
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST25:
	.long	.LFB25-.Ltext0
	.long	.LCFI74-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI74-.Ltext0
	.long	.LCFI75-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI75-.Ltext0
	.long	.LCFI76-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI76-.Ltext0
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST26:
	.long	.LFB26-.Ltext0
	.long	.LCFI77-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI77-.Ltext0
	.long	.LCFI78-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI78-.Ltext0
	.long	.LCFI79-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI79-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST27:
	.long	.LFB27-.Ltext0
	.long	.LCFI80-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI80-.Ltext0
	.long	.LCFI81-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI81-.Ltext0
	.long	.LCFI82-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI82-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST28:
	.long	.LFB28-.Ltext0
	.long	.LCFI83-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI83-.Ltext0
	.long	.LCFI84-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI84-.Ltext0
	.long	.LCFI85-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI85-.Ltext0
	.long	.LFE28-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST29:
	.long	.LFB29-.Ltext0
	.long	.LCFI86-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI86-.Ltext0
	.long	.LCFI87-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI87-.Ltext0
	.long	.LFE29-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST30:
	.long	.LFB30-.Ltext0
	.long	.LCFI88-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI88-.Ltext0
	.long	.LCFI89-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI89-.Ltext0
	.long	.LCFI90-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI90-.Ltext0
	.long	.LFE30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST31:
	.long	.LFB31-.Ltext0
	.long	.LCFI91-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI91-.Ltext0
	.long	.LCFI92-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI92-.Ltext0
	.long	.LCFI93-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI93-.Ltext0
	.long	.LFE31-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST32:
	.long	.LFB32-.Ltext0
	.long	.LCFI94-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI94-.Ltext0
	.long	.LCFI95-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI95-.Ltext0
	.long	.LCFI96-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI96-.Ltext0
	.long	.LFE32-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST33:
	.long	.LFB33-.Ltext0
	.long	.LCFI97-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI97-.Ltext0
	.long	.LCFI98-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI98-.Ltext0
	.long	.LCFI99-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI99-.Ltext0
	.long	.LFE33-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST34:
	.long	.LFB34-.Ltext0
	.long	.LCFI100-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI100-.Ltext0
	.long	.LCFI101-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI101-.Ltext0
	.long	.LFE34-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST35:
	.long	.LFB35-.Ltext0
	.long	.LCFI102-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI102-.Ltext0
	.long	.LCFI103-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI103-.Ltext0
	.long	.LCFI104-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI104-.Ltext0
	.long	.LFE35-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST36:
	.long	.LFB36-.Ltext0
	.long	.LCFI105-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI105-.Ltext0
	.long	.LCFI106-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI106-.Ltext0
	.long	.LCFI107-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI107-.Ltext0
	.long	.LFE36-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST37:
	.long	.LFB37-.Ltext0
	.long	.LCFI108-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI108-.Ltext0
	.long	.LCFI109-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI109-.Ltext0
	.long	.LCFI110-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI110-.Ltext0
	.long	.LFE37-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST38:
	.long	.LFB38-.Ltext0
	.long	.LCFI111-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI111-.Ltext0
	.long	.LCFI112-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI112-.Ltext0
	.long	.LCFI113-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI113-.Ltext0
	.long	.LFE38-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST39:
	.long	.LFB39-.Ltext0
	.long	.LCFI114-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI114-.Ltext0
	.long	.LCFI115-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI115-.Ltext0
	.long	.LCFI116-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI116-.Ltext0
	.long	.LFE39-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST40:
	.long	.LFB40-.Ltext0
	.long	.LCFI117-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI117-.Ltext0
	.long	.LCFI118-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI118-.Ltext0
	.long	.LCFI119-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI119-.Ltext0
	.long	.LFE40-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0x1
	.long	.LASF0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1
	.byte	0x5
	.uleb128 0x3
	.long	.LASF2
	.byte	0x5
	.uleb128 0x4
	.long	.LASF3
	.byte	0x5
	.uleb128 0x5
	.long	.LASF4
	.byte	0x5
	.uleb128 0x6
	.long	.LASF5
	.byte	0x5
	.uleb128 0x7
	.long	.LASF6
	.byte	0x5
	.uleb128 0x8
	.long	.LASF7
	.byte	0x5
	.uleb128 0x9
	.long	.LASF8
	.byte	0x5
	.uleb128 0xa
	.long	.LASF9
	.byte	0x5
	.uleb128 0xb
	.long	.LASF10
	.byte	0x5
	.uleb128 0xc
	.long	.LASF11
	.byte	0x5
	.uleb128 0xd
	.long	.LASF12
	.byte	0x5
	.uleb128 0xe
	.long	.LASF13
	.byte	0x5
	.uleb128 0xf
	.long	.LASF14
	.byte	0x5
	.uleb128 0x10
	.long	.LASF15
	.byte	0x5
	.uleb128 0x11
	.long	.LASF16
	.byte	0x5
	.uleb128 0x12
	.long	.LASF17
	.byte	0x5
	.uleb128 0x13
	.long	.LASF18
	.byte	0x5
	.uleb128 0x14
	.long	.LASF19
	.byte	0x5
	.uleb128 0x15
	.long	.LASF20
	.byte	0x5
	.uleb128 0x16
	.long	.LASF21
	.byte	0x5
	.uleb128 0x17
	.long	.LASF22
	.byte	0x5
	.uleb128 0x18
	.long	.LASF23
	.byte	0x5
	.uleb128 0x19
	.long	.LASF24
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF25
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF26
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF27
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF28
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF29
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF30
	.byte	0x5
	.uleb128 0x20
	.long	.LASF31
	.byte	0x5
	.uleb128 0x21
	.long	.LASF32
	.byte	0x5
	.uleb128 0x22
	.long	.LASF33
	.byte	0x5
	.uleb128 0x23
	.long	.LASF34
	.byte	0x5
	.uleb128 0x24
	.long	.LASF35
	.byte	0x5
	.uleb128 0x25
	.long	.LASF36
	.byte	0x5
	.uleb128 0x26
	.long	.LASF37
	.byte	0x5
	.uleb128 0x27
	.long	.LASF38
	.byte	0x5
	.uleb128 0x28
	.long	.LASF39
	.byte	0x5
	.uleb128 0x29
	.long	.LASF40
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF41
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF42
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF43
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF44
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF45
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF46
	.byte	0x5
	.uleb128 0x30
	.long	.LASF47
	.byte	0x5
	.uleb128 0x31
	.long	.LASF48
	.byte	0x5
	.uleb128 0x32
	.long	.LASF49
	.byte	0x5
	.uleb128 0x33
	.long	.LASF50
	.byte	0x5
	.uleb128 0x34
	.long	.LASF51
	.byte	0x5
	.uleb128 0x35
	.long	.LASF52
	.byte	0x5
	.uleb128 0x36
	.long	.LASF53
	.byte	0x5
	.uleb128 0x37
	.long	.LASF54
	.byte	0x5
	.uleb128 0x38
	.long	.LASF55
	.byte	0x5
	.uleb128 0x39
	.long	.LASF56
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF57
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF58
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF59
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF60
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF61
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF62
	.byte	0x5
	.uleb128 0x40
	.long	.LASF63
	.byte	0x5
	.uleb128 0x41
	.long	.LASF64
	.byte	0x5
	.uleb128 0x42
	.long	.LASF65
	.byte	0x5
	.uleb128 0x43
	.long	.LASF66
	.byte	0x5
	.uleb128 0x44
	.long	.LASF67
	.byte	0x5
	.uleb128 0x45
	.long	.LASF68
	.byte	0x5
	.uleb128 0x46
	.long	.LASF69
	.byte	0x5
	.uleb128 0x47
	.long	.LASF70
	.byte	0x5
	.uleb128 0x48
	.long	.LASF71
	.byte	0x5
	.uleb128 0x49
	.long	.LASF72
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF73
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF74
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF75
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF76
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF77
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF78
	.byte	0x5
	.uleb128 0x50
	.long	.LASF79
	.byte	0x5
	.uleb128 0x51
	.long	.LASF80
	.byte	0x5
	.uleb128 0x52
	.long	.LASF81
	.byte	0x5
	.uleb128 0x53
	.long	.LASF82
	.byte	0x5
	.uleb128 0x54
	.long	.LASF83
	.byte	0x5
	.uleb128 0x55
	.long	.LASF84
	.byte	0x5
	.uleb128 0x56
	.long	.LASF85
	.byte	0x5
	.uleb128 0x57
	.long	.LASF86
	.byte	0x5
	.uleb128 0x58
	.long	.LASF87
	.byte	0x5
	.uleb128 0x59
	.long	.LASF88
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF89
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF90
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF91
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF92
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF93
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF94
	.byte	0x5
	.uleb128 0x60
	.long	.LASF95
	.byte	0x5
	.uleb128 0x61
	.long	.LASF96
	.byte	0x5
	.uleb128 0x62
	.long	.LASF97
	.byte	0x5
	.uleb128 0x63
	.long	.LASF98
	.byte	0x5
	.uleb128 0x64
	.long	.LASF99
	.byte	0x5
	.uleb128 0x65
	.long	.LASF100
	.byte	0x5
	.uleb128 0x66
	.long	.LASF101
	.byte	0x5
	.uleb128 0x67
	.long	.LASF102
	.byte	0x5
	.uleb128 0x68
	.long	.LASF103
	.byte	0x5
	.uleb128 0x69
	.long	.LASF104
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF105
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF106
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF107
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF108
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF109
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF110
	.byte	0x5
	.uleb128 0x70
	.long	.LASF111
	.byte	0x5
	.uleb128 0x71
	.long	.LASF112
	.byte	0x5
	.uleb128 0x72
	.long	.LASF113
	.byte	0x5
	.uleb128 0x73
	.long	.LASF114
	.byte	0x5
	.uleb128 0x74
	.long	.LASF115
	.byte	0x5
	.uleb128 0x75
	.long	.LASF116
	.byte	0x5
	.uleb128 0x76
	.long	.LASF117
	.byte	0x5
	.uleb128 0x77
	.long	.LASF118
	.byte	0x5
	.uleb128 0x78
	.long	.LASF119
	.byte	0x5
	.uleb128 0x79
	.long	.LASF120
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF121
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF122
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF123
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF124
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF125
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF126
	.byte	0x5
	.uleb128 0x80
	.long	.LASF127
	.byte	0x5
	.uleb128 0x81
	.long	.LASF128
	.byte	0x5
	.uleb128 0x82
	.long	.LASF129
	.byte	0x5
	.uleb128 0x83
	.long	.LASF130
	.byte	0x5
	.uleb128 0x84
	.long	.LASF131
	.byte	0x5
	.uleb128 0x85
	.long	.LASF132
	.byte	0x5
	.uleb128 0x86
	.long	.LASF133
	.byte	0x5
	.uleb128 0x87
	.long	.LASF134
	.byte	0x5
	.uleb128 0x88
	.long	.LASF135
	.byte	0x5
	.uleb128 0x89
	.long	.LASF136
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF137
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF138
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF139
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF140
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF141
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF142
	.byte	0x5
	.uleb128 0x90
	.long	.LASF143
	.byte	0x5
	.uleb128 0x91
	.long	.LASF144
	.byte	0x5
	.uleb128 0x92
	.long	.LASF145
	.byte	0x5
	.uleb128 0x93
	.long	.LASF146
	.byte	0x5
	.uleb128 0x94
	.long	.LASF147
	.byte	0x5
	.uleb128 0x95
	.long	.LASF148
	.byte	0x5
	.uleb128 0x96
	.long	.LASF149
	.byte	0x5
	.uleb128 0x97
	.long	.LASF150
	.byte	0x5
	.uleb128 0x98
	.long	.LASF151
	.byte	0x5
	.uleb128 0x99
	.long	.LASF152
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF153
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF154
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF155
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF156
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF157
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF158
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF159
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF160
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF161
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF162
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF163
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF164
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF165
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF166
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF167
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF168
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF169
	.byte	0x5
	.uleb128 0xab
	.long	.LASF170
	.byte	0x5
	.uleb128 0xac
	.long	.LASF171
	.byte	0x5
	.uleb128 0xad
	.long	.LASF172
	.byte	0x5
	.uleb128 0xae
	.long	.LASF173
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF174
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF175
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF176
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF177
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF178
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF179
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF180
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF181
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF182
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF183
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF184
	.byte	0x5
	.uleb128 0xba
	.long	.LASF185
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF186
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF187
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF188
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF189
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF190
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF191
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF192
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF193
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF194
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF195
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF196
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF197
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF198
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF199
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF200
	.byte	0x5
	.uleb128 0xca
	.long	.LASF201
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF202
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF203
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF204
	.byte	0x5
	.uleb128 0xce
	.long	.LASF205
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF206
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF207
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF208
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF209
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF210
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF211
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF212
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF213
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF214
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF215
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF216
	.byte	0x5
	.uleb128 0xda
	.long	.LASF217
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF218
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF219
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF220
	.byte	0x5
	.uleb128 0xde
	.long	.LASF221
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF222
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF223
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF224
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF225
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF226
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF227
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF228
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF229
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF230
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF231
	.byte	0x5
	.uleb128 0xe9
	.long	.LASF232
	.byte	0x5
	.uleb128 0xea
	.long	.LASF233
	.file 6 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x5
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x3
	.file 7 "/usr/include/inttypes.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x17
	.long	.LASF239
	.file 8 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro2
	.file 9 "/usr/include/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro3
	.file 10 "/usr/include/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0xa
	.byte	0x5
	.uleb128 0x6
	.long	.LASF347
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.file 11 "/usr/include/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0xb
	.file 12 "/usr/include/gnu/stubs-32.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 13 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF366
	.file 14 "/usr/include/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xa
	.byte	0x5
	.uleb128 0x6
	.long	.LASF347
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF434
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 15 "bitmanip.h"
	.byte	0x3
	.uleb128 0x2
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.file 16 "asm.h"
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x4
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.file 17 "lapic.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.byte	0x4
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdcpredef.h.19.bf2bf6c5fb087dfb5ef2d2297c2795de,comdat
.Ldebug_macro1:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF234
	.byte	0x5
	.uleb128 0x26
	.long	.LASF235
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF236
	.byte	0x5
	.uleb128 0x37
	.long	.LASF237
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF238
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.c1be7345a20e74daf6be67323b7aa6e6,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF240
	.byte	0x6
	.uleb128 0x61
	.long	.LASF241
	.byte	0x6
	.uleb128 0x62
	.long	.LASF242
	.byte	0x6
	.uleb128 0x63
	.long	.LASF243
	.byte	0x6
	.uleb128 0x64
	.long	.LASF244
	.byte	0x6
	.uleb128 0x65
	.long	.LASF245
	.byte	0x6
	.uleb128 0x66
	.long	.LASF246
	.byte	0x6
	.uleb128 0x67
	.long	.LASF247
	.byte	0x6
	.uleb128 0x68
	.long	.LASF248
	.byte	0x6
	.uleb128 0x69
	.long	.LASF249
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF250
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF251
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF252
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF253
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF254
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF255
	.byte	0x6
	.uleb128 0x70
	.long	.LASF256
	.byte	0x6
	.uleb128 0x71
	.long	.LASF257
	.byte	0x6
	.uleb128 0x72
	.long	.LASF258
	.byte	0x6
	.uleb128 0x73
	.long	.LASF259
	.byte	0x6
	.uleb128 0x74
	.long	.LASF260
	.byte	0x6
	.uleb128 0x75
	.long	.LASF261
	.byte	0x6
	.uleb128 0x76
	.long	.LASF262
	.byte	0x6
	.uleb128 0x77
	.long	.LASF263
	.byte	0x6
	.uleb128 0x78
	.long	.LASF264
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF265
	.byte	0x5
	.uleb128 0x88
	.long	.LASF266
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF267
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF268
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF269
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF270
	.byte	0x5
	.uleb128 0xce
	.long	.LASF271
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF272
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF273
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF274
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF275
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF276
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF277
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF278
	.byte	0x5
	.uleb128 0x101
	.long	.LASF279
	.byte	0x5
	.uleb128 0x105
	.long	.LASF280
	.byte	0x5
	.uleb128 0x109
	.long	.LASF281
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF243
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF271
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF242
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF270
	.byte	0x5
	.uleb128 0x111
	.long	.LASF282
	.byte	0x6
	.uleb128 0x112
	.long	.LASF283
	.byte	0x5
	.uleb128 0x113
	.long	.LASF284
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF285
	.byte	0x5
	.uleb128 0x141
	.long	.LASF286
	.byte	0x5
	.uleb128 0x154
	.long	.LASF287
	.byte	0x6
	.uleb128 0x161
	.long	.LASF288
	.byte	0x5
	.uleb128 0x162
	.long	.LASF289
	.byte	0x5
	.uleb128 0x166
	.long	.LASF290
	.byte	0x5
	.uleb128 0x167
	.long	.LASF291
	.byte	0x5
	.uleb128 0x169
	.long	.LASF292
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF293
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF294
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF295
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF296
	.byte	0x5
	.uleb128 0x37
	.long	.LASF297
	.byte	0x5
	.uleb128 0x38
	.long	.LASF298
	.byte	0x5
	.uleb128 0x39
	.long	.LASF299
	.byte	0x5
	.uleb128 0x52
	.long	.LASF300
	.byte	0x5
	.uleb128 0x53
	.long	.LASF301
	.byte	0x5
	.uleb128 0x58
	.long	.LASF302
	.byte	0x5
	.uleb128 0x59
	.long	.LASF303
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF304
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF305
	.byte	0x5
	.uleb128 0x65
	.long	.LASF306
	.byte	0x5
	.uleb128 0x66
	.long	.LASF307
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF308
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF309
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF310
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF311
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF312
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF313
	.byte	0x5
	.uleb128 0x84
	.long	.LASF314
	.byte	0x5
	.uleb128 0x85
	.long	.LASF315
	.byte	0x5
	.uleb128 0x88
	.long	.LASF316
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF317
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF318
	.byte	0x5
	.uleb128 0x96
	.long	.LASF319
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF320
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF321
	.byte	0x5
	.uleb128 0xba
	.long	.LASF322
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF323
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF324
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF325
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF326
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF327
	.byte	0x5
	.uleb128 0xec
	.long	.LASF328
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF329
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF330
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF331
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF332
	.byte	0x5
	.uleb128 0x114
	.long	.LASF333
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF334
	.byte	0x5
	.uleb128 0x125
	.long	.LASF335
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF336
	.byte	0x5
	.uleb128 0x133
	.long	.LASF337
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF338
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF339
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF340
	.byte	0x5
	.uleb128 0x157
	.long	.LASF341
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF342
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF343
	.byte	0x5
	.uleb128 0x172
	.long	.LASF344
	.byte	0x5
	.uleb128 0x181
	.long	.LASF345
	.byte	0x5
	.uleb128 0x182
	.long	.LASF346
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF348
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF349
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF350
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF351
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF352
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF353
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF354
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs32.h.10.16e057f848ed2f3683567e3da4309c47,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF355
	.byte	0x5
	.uleb128 0xb
	.long	.LASF356
	.byte	0x5
	.uleb128 0xc
	.long	.LASF357
	.byte	0x5
	.uleb128 0xd
	.long	.LASF358
	.byte	0x5
	.uleb128 0xe
	.long	.LASF359
	.byte	0x5
	.uleb128 0xf
	.long	.LASF360
	.byte	0x5
	.uleb128 0x10
	.long	.LASF361
	.byte	0x5
	.uleb128 0x11
	.long	.LASF362
	.byte	0x5
	.uleb128 0x12
	.long	.LASF363
	.byte	0x5
	.uleb128 0x13
	.long	.LASF364
	.byte	0x5
	.uleb128 0x14
	.long	.LASF365
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF367
	.byte	0x5
	.uleb128 0x22
	.long	.LASF368
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF369
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.8a6edafb73695aeb474ec9e9bf7f7153,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF370
	.byte	0x5
	.uleb128 0x34
	.long	.LASF371
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF372
	.byte	0x5
	.uleb128 0x94
	.long	.LASF102
	.byte	0x5
	.uleb128 0x95
	.long	.LASF110
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF373
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF374
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF375
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF376
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF377
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF378
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF379
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF380
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF381
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF382
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF383
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF384
	.byte	0x5
	.uleb128 0xad
	.long	.LASF385
	.byte	0x5
	.uleb128 0xae
	.long	.LASF386
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF387
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF388
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF389
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF390
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF391
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF392
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF393
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF394
	.byte	0x5
	.uleb128 0xba
	.long	.LASF395
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF396
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF397
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF398
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF399
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF400
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF401
	.byte	0x5
	.uleb128 0xce
	.long	.LASF402
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF403
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF404
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF405
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF406
	.byte	0x5
	.uleb128 0xda
	.long	.LASF407
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF408
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF409
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF410
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF411
	.byte	0x5
	.uleb128 0xec
	.long	.LASF412
	.byte	0x5
	.uleb128 0xee
	.long	.LASF413
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF414
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF415
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF416
	.byte	0x5
	.uleb128 0x100
	.long	.LASF417
	.byte	0x5
	.uleb128 0x101
	.long	.LASF418
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF419
	.byte	0x5
	.uleb128 0x111
	.long	.LASF420
	.byte	0x5
	.uleb128 0x112
	.long	.LASF421
	.byte	0x5
	.uleb128 0x116
	.long	.LASF422
	.byte	0x5
	.uleb128 0x117
	.long	.LASF423
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF424
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF425
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF426
	.byte	0x5
	.uleb128 0x120
	.long	.LASF427
	.byte	0x5
	.uleb128 0x124
	.long	.LASF428
	.byte	0x5
	.uleb128 0x125
	.long	.LASF429
	.byte	0x5
	.uleb128 0x126
	.long	.LASF430
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF431
	.byte	0x5
	.uleb128 0x132
	.long	.LASF432
	.byte	0x5
	.uleb128 0x133
	.long	.LASF433
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.inttypes.h.40.616c6bc004e0dde7925f1f045323df77,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF435
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF436
	.byte	0x5
	.uleb128 0x30
	.long	.LASF437
	.byte	0x5
	.uleb128 0x36
	.long	.LASF438
	.byte	0x5
	.uleb128 0x37
	.long	.LASF439
	.byte	0x5
	.uleb128 0x38
	.long	.LASF440
	.byte	0x5
	.uleb128 0x39
	.long	.LASF441
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF442
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF443
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF444
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF445
	.byte	0x5
	.uleb128 0x40
	.long	.LASF446
	.byte	0x5
	.uleb128 0x41
	.long	.LASF447
	.byte	0x5
	.uleb128 0x42
	.long	.LASF448
	.byte	0x5
	.uleb128 0x43
	.long	.LASF449
	.byte	0x5
	.uleb128 0x46
	.long	.LASF450
	.byte	0x5
	.uleb128 0x47
	.long	.LASF451
	.byte	0x5
	.uleb128 0x48
	.long	.LASF452
	.byte	0x5
	.uleb128 0x49
	.long	.LASF453
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF454
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF455
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF456
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF457
	.byte	0x5
	.uleb128 0x50
	.long	.LASF458
	.byte	0x5
	.uleb128 0x51
	.long	.LASF459
	.byte	0x5
	.uleb128 0x52
	.long	.LASF460
	.byte	0x5
	.uleb128 0x53
	.long	.LASF461
	.byte	0x5
	.uleb128 0x56
	.long	.LASF462
	.byte	0x5
	.uleb128 0x57
	.long	.LASF463
	.byte	0x5
	.uleb128 0x58
	.long	.LASF464
	.byte	0x5
	.uleb128 0x59
	.long	.LASF465
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF466
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF467
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF468
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF469
	.byte	0x5
	.uleb128 0x60
	.long	.LASF470
	.byte	0x5
	.uleb128 0x61
	.long	.LASF471
	.byte	0x5
	.uleb128 0x62
	.long	.LASF472
	.byte	0x5
	.uleb128 0x63
	.long	.LASF473
	.byte	0x5
	.uleb128 0x66
	.long	.LASF474
	.byte	0x5
	.uleb128 0x67
	.long	.LASF475
	.byte	0x5
	.uleb128 0x68
	.long	.LASF476
	.byte	0x5
	.uleb128 0x69
	.long	.LASF477
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF478
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF479
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF480
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF481
	.byte	0x5
	.uleb128 0x70
	.long	.LASF482
	.byte	0x5
	.uleb128 0x71
	.long	.LASF483
	.byte	0x5
	.uleb128 0x72
	.long	.LASF484
	.byte	0x5
	.uleb128 0x73
	.long	.LASF485
	.byte	0x5
	.uleb128 0x76
	.long	.LASF486
	.byte	0x5
	.uleb128 0x77
	.long	.LASF487
	.byte	0x5
	.uleb128 0x78
	.long	.LASF488
	.byte	0x5
	.uleb128 0x79
	.long	.LASF489
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF490
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF491
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF492
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF493
	.byte	0x5
	.uleb128 0x80
	.long	.LASF494
	.byte	0x5
	.uleb128 0x81
	.long	.LASF495
	.byte	0x5
	.uleb128 0x82
	.long	.LASF496
	.byte	0x5
	.uleb128 0x83
	.long	.LASF497
	.byte	0x5
	.uleb128 0x86
	.long	.LASF498
	.byte	0x5
	.uleb128 0x87
	.long	.LASF499
	.byte	0x5
	.uleb128 0x88
	.long	.LASF500
	.byte	0x5
	.uleb128 0x89
	.long	.LASF501
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF502
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF503
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF504
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF505
	.byte	0x5
	.uleb128 0x90
	.long	.LASF506
	.byte	0x5
	.uleb128 0x91
	.long	.LASF507
	.byte	0x5
	.uleb128 0x92
	.long	.LASF508
	.byte	0x5
	.uleb128 0x93
	.long	.LASF509
	.byte	0x5
	.uleb128 0x97
	.long	.LASF510
	.byte	0x5
	.uleb128 0x98
	.long	.LASF511
	.byte	0x5
	.uleb128 0x99
	.long	.LASF512
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF513
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF514
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF515
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF516
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF517
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF518
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF519
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF520
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF521
	.byte	0x5
	.uleb128 0xab
	.long	.LASF522
	.byte	0x5
	.uleb128 0xac
	.long	.LASF523
	.byte	0x5
	.uleb128 0xad
	.long	.LASF524
	.byte	0x5
	.uleb128 0xae
	.long	.LASF525
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF526
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF527
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF528
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF529
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF530
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF531
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF532
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF533
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF534
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF535
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF536
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF537
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF538
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF539
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF540
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF541
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF542
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF543
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF544
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF545
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF546
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF547
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF548
	.byte	0x5
	.uleb128 0xce
	.long	.LASF549
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF550
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF551
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF552
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF553
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF554
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF555
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF556
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF557
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF558
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF559
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF560
	.byte	0x5
	.uleb128 0xde
	.long	.LASF561
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF562
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF563
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF564
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF565
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF566
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF567
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF568
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF569
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF570
	.byte	0x5
	.uleb128 0xec
	.long	.LASF571
	.byte	0x5
	.uleb128 0xed
	.long	.LASF572
	.byte	0x5
	.uleb128 0xee
	.long	.LASF573
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF574
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF575
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF576
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF577
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF578
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF579
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF580
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF581
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF582
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF583
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF584
	.byte	0x5
	.uleb128 0xff
	.long	.LASF585
	.byte	0x5
	.uleb128 0x100
	.long	.LASF586
	.byte	0x5
	.uleb128 0x103
	.long	.LASF587
	.byte	0x5
	.uleb128 0x104
	.long	.LASF588
	.byte	0x5
	.uleb128 0x105
	.long	.LASF589
	.byte	0x5
	.uleb128 0x106
	.long	.LASF590
	.byte	0x5
	.uleb128 0x107
	.long	.LASF591
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.bitmanip.h.1.168232c1c6081d939487bc690acf9059,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1
	.long	.LASF592
	.byte	0x5
	.uleb128 0x2
	.long	.LASF593
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.asm.h.1.e42e6677973ed44f9f9cedbd4a75f30f,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1
	.long	.LASF594
	.byte	0x5
	.uleb128 0x2
	.long	.LASF595
	.byte	0x5
	.uleb128 0x3
	.long	.LASF596
	.byte	0x5
	.uleb128 0x9
	.long	.LASF597
	.byte	0x5
	.uleb128 0xd
	.long	.LASF598
	.byte	0x5
	.uleb128 0x11
	.long	.LASF599
	.byte	0x5
	.uleb128 0x15
	.long	.LASF600
	.byte	0x5
	.uleb128 0x19
	.long	.LASF601
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF602
	.byte	0x5
	.uleb128 0x21
	.long	.LASF603
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.gdt.h.7.d08c6aab56e52cb2c7e0b412a317e9aa,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x7
	.long	.LASF604
	.byte	0x5
	.uleb128 0x9
	.long	.LASF605
	.byte	0x5
	.uleb128 0xa
	.long	.LASF606
	.byte	0x5
	.uleb128 0xb
	.long	.LASF607
	.byte	0x5
	.uleb128 0xc
	.long	.LASF608
	.byte	0x5
	.uleb128 0xf
	.long	.LASF609
	.byte	0x5
	.uleb128 0x10
	.long	.LASF610
	.byte	0x5
	.uleb128 0x11
	.long	.LASF611
	.byte	0x5
	.uleb128 0x12
	.long	.LASF612
	.byte	0x5
	.uleb128 0x13
	.long	.LASF613
	.byte	0x5
	.uleb128 0x14
	.long	.LASF614
	.byte	0x5
	.uleb128 0x15
	.long	.LASF615
	.byte	0x5
	.uleb128 0x16
	.long	.LASF616
	.byte	0x5
	.uleb128 0x17
	.long	.LASF617
	.byte	0x5
	.uleb128 0x18
	.long	.LASF618
	.byte	0x5
	.uleb128 0x19
	.long	.LASF619
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF620
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF621
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF622
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF623
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF624
	.byte	0x5
	.uleb128 0x22
	.long	.LASF625
	.byte	0x5
	.uleb128 0x23
	.long	.LASF626
	.byte	0x5
	.uleb128 0x24
	.long	.LASF627
	.byte	0x5
	.uleb128 0x25
	.long	.LASF628
	.byte	0x5
	.uleb128 0x26
	.long	.LASF629
	.byte	0x5
	.uleb128 0x27
	.long	.LASF630
	.byte	0x5
	.uleb128 0x28
	.long	.LASF631
	.byte	0x5
	.uleb128 0x29
	.long	.LASF632
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF633
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF634
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF635
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF636
	.byte	0x5
	.uleb128 0x30
	.long	.LASF637
	.byte	0x5
	.uleb128 0x31
	.long	.LASF638
	.byte	0x5
	.uleb128 0x34
	.long	.LASF639
	.byte	0x5
	.uleb128 0x35
	.long	.LASF640
	.byte	0x5
	.uleb128 0x36
	.long	.LASF641
	.byte	0x5
	.uleb128 0x37
	.long	.LASF642
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF643
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF644
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF645
	.byte	0x5
	.uleb128 0x41
	.long	.LASF646
	.byte	0x5
	.uleb128 0x42
	.long	.LASF647
	.byte	0x5
	.uleb128 0x45
	.long	.LASF648
	.byte	0x5
	.uleb128 0x46
	.long	.LASF649
	.byte	0x5
	.uleb128 0x49
	.long	.LASF650
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF651
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF652
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF653
	.byte	0x5
	.uleb128 0x50
	.long	.LASF654
	.byte	0x5
	.uleb128 0x52
	.long	.LASF655
	.byte	0x5
	.uleb128 0x53
	.long	.LASF656
	.byte	0x5
	.uleb128 0x55
	.long	.LASF657
	.byte	0x5
	.uleb128 0x56
	.long	.LASF658
	.byte	0x5
	.uleb128 0x57
	.long	.LASF659
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF660
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF661
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF662
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF663
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.task.h.50.e52b1fb33ece0bac52e06e9797301dc4,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x32
	.long	.LASF664
	.byte	0x5
	.uleb128 0x35
	.long	.LASF665
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF666
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF667
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF668
	.byte	0x5
	.uleb128 0x77
	.long	.LASF669
	.byte	0x5
	.uleb128 0x78
	.long	.LASF670
	.byte	0x5
	.uleb128 0x79
	.long	.LASF671
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF672
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.lapic.h.3.ff9ded580783d9ae2148e4d1eb3d8418,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF673
	.byte	0x5
	.uleb128 0x4
	.long	.LASF674
	.byte	0x5
	.uleb128 0x5
	.long	.LASF675
	.byte	0x5
	.uleb128 0x6
	.long	.LASF676
	.byte	0x5
	.uleb128 0x8
	.long	.LASF677
	.byte	0x5
	.uleb128 0x9
	.long	.LASF678
	.byte	0x5
	.uleb128 0xa
	.long	.LASF679
	.byte	0x5
	.uleb128 0xb
	.long	.LASF680
	.byte	0x5
	.uleb128 0xd
	.long	.LASF681
	.byte	0x5
	.uleb128 0x16
	.long	.LASF682
	.byte	0x5
	.uleb128 0x18
	.long	.LASF683
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF684
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF685
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF686
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF687
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF688
	.byte	0x5
	.uleb128 0x20
	.long	.LASF689
	.byte	0x5
	.uleb128 0x21
	.long	.LASF690
	.byte	0x5
	.uleb128 0x22
	.long	.LASF691
	.byte	0x5
	.uleb128 0x23
	.long	.LASF692
	.byte	0x5
	.uleb128 0x24
	.long	.LASF693
	.byte	0x5
	.uleb128 0x25
	.long	.LASF694
	.byte	0x5
	.uleb128 0x27
	.long	.LASF695
	.byte	0x5
	.uleb128 0x28
	.long	.LASF696
	.byte	0x5
	.uleb128 0x29
	.long	.LASF697
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF698
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF699
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF700
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF701
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF702
	.byte	0x5
	.uleb128 0x32
	.long	.LASF703
	.byte	0x5
	.uleb128 0x35
	.long	.LASF704
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.irq.h.6.55f7770e4b83e9d24b17849e82268545,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6
	.long	.LASF705
	.byte	0x5
	.uleb128 0x7
	.long	.LASF706
	.byte	0x5
	.uleb128 0xd
	.long	.LASF707
	.byte	0x5
	.uleb128 0x10
	.long	.LASF708
	.byte	0x5
	.uleb128 0x13
	.long	.LASF709
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF379:
	.string	"INT32_MAX (2147483647)"
.LASF473:
	.string	"PRIoFAST64 __PRI64_PREFIX \"o\""
.LASF742:
	.string	"ss0_h"
.LASF690:
	.string	"TIMER_DIV_16 0x3"
.LASF383:
	.string	"UINT32_MAX (4294967295U)"
.LASF741:
	.string	"ss0_r"
.LASF47:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF201:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF93:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF120:
	.string	"__UINTPTR_MAX__ 0xffffffffU"
.LASF269:
	.string	"__USE_ISOC11 1"
.LASF811:
	.string	"sizetype"
.LASF637:
	.string	"SEG_SYSTEM 0"
.LASF433:
	.string	"UINTMAX_C(c) c ## ULL"
.LASF79:
	.string	"__PTRDIFF_MAX__ 0x7fffffff"
.LASF82:
	.string	"__INTMAX_C(c) c ## LL"
.LASF81:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffLL"
.LASF174:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF255:
	.string	"__USE_XOPEN2K8XSI"
.LASF551:
	.string	"SCNuLEAST16 \"hu\""
.LASF472:
	.string	"PRIoFAST32 __PRIPTR_PREFIX \"o\""
.LASF607:
	.string	"SEG_BASE_16_23(base) bit_value(base, 16, 23)"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF523:
	.string	"SCNd16 \"hd\""
.LASF348:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF260:
	.string	"__USE_ATFILE"
.LASF319:
	.string	"__flexarr []"
.LASF160:
	.string	"__DECIMAL_DIG__ 21"
.LASF777:
	.string	"debug_exception"
.LASF425:
	.string	"INT16_C(c) c"
.LASF126:
	.string	"__FLT_MANT_DIG__ 24"
.LASF240:
	.string	"_FEATURES_H 1"
.LASF288:
	.string	"__GNU_LIBRARY__"
.LASF145:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF698:
	.string	"DELIVERY_MODE(s) (s << 8)"
.LASF327:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF692:
	.string	"TIMER_DIV_64 0x9"
.LASF171:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF568:
	.string	"SCNoFAST32 __PRIPTR_PREFIX \"o\""
.LASF28:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF32:
	.string	"__SIZE_TYPE__ unsigned int"
.LASF177:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF137:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF41:
	.string	"__INT8_TYPE__ signed char"
.LASF681:
	.string	"LAPIC_ISR_BASE LAPIC_BASE + 0x0100"
.LASF462:
	.string	"PRIo8 \"o\""
.LASF792:
	.string	"double_fault_handler"
.LASF547:
	.string	"SCNu16 \"hu\""
.LASF566:
	.string	"SCNoFAST8 \"hho\""
.LASF685:
	.string	"TIMER_PERIODIC 0x1"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF104:
	.string	"__UINT8_C(c) c"
.LASF419:
	.string	"SIZE_MAX (4294967295U)"
.LASF42:
	.string	"__INT16_TYPE__ short int"
.LASF228:
	.string	"linux 1"
.LASF571:
	.string	"SCNx16 \"hx\""
.LASF161:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF410:
	.string	"INTPTR_MAX (2147483647)"
.LASF464:
	.string	"PRIo32 \"o\""
.LASF483:
	.string	"PRIuFAST16 __PRIPTR_PREFIX \"u\""
.LASF330:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF193:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF489:
	.string	"PRIx64 __PRI64_PREFIX \"x\""
.LASF477:
	.string	"PRIu64 __PRI64_PREFIX \"u\""
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF461:
	.string	"PRIiFAST64 __PRI64_PREFIX \"i\""
.LASF134:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF404:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF60:
	.string	"__INT_FAST64_TYPE__ long long int"
.LASF661:
	.string	"gdt_get_segment(index) get_segment(gdt, index)"
.LASF555:
	.string	"SCNuFAST16 __PRIPTR_PREFIX \"u\""
.LASF480:
	.string	"PRIuLEAST32 \"u\""
.LASF154:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF650:
	.string	"SEG16 0"
.LASF446:
	.string	"PRIdFAST8 \"d\""
.LASF408:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF398:
	.string	"INT_FAST16_MIN (-2147483647-1)"
.LASF809:
	.string	"double_fault_handler2"
.LASF429:
	.string	"UINT16_C(c) c"
.LASF373:
	.string	"INT8_MIN (-128)"
.LASF601:
	.string	"set_gs(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov gs, dx\")"
.LASF493:
	.string	"PRIxLEAST64 __PRI64_PREFIX \"x\""
.LASF292:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF687:
	.string	"TIMER_DIV_2 0x0"
.LASF320:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF827:
	.string	"irq8_ldt_segments"
.LASF27:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF66:
	.string	"__UINTPTR_TYPE__ unsigned int"
.LASF612:
	.string	"SEG_RWA (0x3 << 8)"
.LASF382:
	.string	"UINT16_MAX (65535)"
.LASF808:
	.string	"irq20_start"
.LASF521:
	.string	"PRIXPTR __PRIPTR_PREFIX \"X\""
.LASF575:
	.string	"SCNxLEAST16 \"hx\""
.LASF459:
	.string	"PRIiFAST16 __PRIPTR_PREFIX \"i\""
.LASF577:
	.string	"SCNxLEAST64 __PRI64_PREFIX \"x\""
.LASF245:
	.string	"__USE_POSIX"
.LASF173:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF52:
	.string	"__INT_LEAST64_TYPE__ long long int"
.LASF507:
	.string	"PRIXFAST16 __PRIPTR_PREFIX \"X\""
.LASF119:
	.string	"__INTPTR_MAX__ 0x7fffffff"
.LASF357:
	.string	"__stub_fchflags "
.LASF116:
	.string	"__UINT_FAST16_MAX__ 0xffffffffU"
.LASF683:
	.string	"LAPIC_ERROR_REG LAPIC_BASE + 0x0280"
.LASF445:
	.string	"PRIdLEAST64 __PRI64_PREFIX \"d\""
.LASF135:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF266:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF821:
	.string	"irq0_ldt_segments"
.LASF115:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF436:
	.string	"__PRI64_PREFIX \"ll\""
.LASF254:
	.string	"__USE_XOPEN2K8"
.LASF634:
	.string	"SEG_CALLGATE32 (0xC << 8)"
.LASF53:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF470:
	.string	"PRIoFAST8 \"o\""
.LASF394:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF218:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF290:
	.string	"__GLIBC__ 2"
.LASF722:
	.string	"long int"
.LASF114:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL"
.LASF660:
	.string	"GDT_OFFSET(index) (index * 8)"
.LASF431:
	.string	"UINT64_C(c) c ## ULL"
.LASF282:
	.string	"__USE_XOPEN2K8 1"
.LASF524:
	.string	"SCNd32 \"d\""
.LASF183:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF84:
	.string	"__UINTMAX_C(c) c ## ULL"
.LASF31:
	.string	"__SIZEOF_POINTER__ 4"
.LASF49:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF599:
	.string	"set_ds(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov ds, dx\")"
.LASF299:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF197:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF370:
	.string	"__int8_t_defined "
.LASF346:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF253:
	.string	"__USE_XOPEN2KXSI"
.LASF669:
	.string	"INIT_TASK(name) name ## _init()"
.LASF716:
	.string	"short unsigned int"
.LASF803:
	.string	"lapic_timer_handler"
.LASF613:
	.string	"SEG_RE (0x4 << 8)"
.LASF670:
	.string	"RUN_TASK(name) name ## _start()"
.LASF323:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF302:
	.string	"__CONCAT(x,y) x ## y"
.LASF276:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF824:
	.string	"irq1_ldt_segments"
.LASF117:
	.string	"__UINT_FAST32_MAX__ 0xffffffffU"
.LASF691:
	.string	"TIMER_DIV_32 0x8"
.LASF130:
	.string	"__FLT_MAX_EXP__ 128"
.LASF17:
	.string	"__SIZEOF_LONG__ 4"
.LASF506:
	.string	"PRIXFAST8 \"X\""
.LASF595:
	.string	"lgdt(gdt) asm(\"lgdt \"#gdt)"
.LASF235:
	.string	"__STDC_IEC_559__ 1"
.LASF435:
	.string	"____gwchar_t_defined 1"
.LASF417:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF833:
	.string	"irq11_ldt_segments"
.LASF21:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF678:
	.string	"TIMER_INIT_COUNT_REG LAPIC_BASE + 0x0380"
.LASF234:
	.string	"_STDC_PREDEF_H 1"
.LASF148:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF739:
	.string	"link_h"
.LASF423:
	.string	"WINT_MAX (4294967295u)"
.LASF179:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF321:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF129:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF132:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF600:
	.string	"set_ss(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov ss, dx\")"
.LASF406:
	.string	"UINT_FAST16_MAX (4294967295U)"
.LASF727:
	.string	"base_16_23"
.LASF48:
	.string	"__UINT64_TYPE__ long long unsigned int"
.LASF709:
	.string	"init_irq(irq_name,id) INIT_TASK(irq_name); idt_add_gate(TASK_SELECTOR(irq_name), 0x85, id)"
.LASF714:
	.string	"uint8_t"
.LASF645:
	.string	"SEG_LIMIT_16_19(lim) (lim << 16)"
.LASF304:
	.string	"__ptr_t void *"
.LASF744:
	.string	"ss1_r"
.LASF519:
	.string	"PRIuPTR __PRIPTR_PREFIX \"u\""
.LASF139:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF457:
	.string	"PRIiLEAST64 __PRI64_PREFIX \"i\""
.LASF407:
	.string	"UINT_FAST32_MAX (4294967295U)"
.LASF847:
	.string	"irq.c"
.LASF105:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF222:
	.string	"__pentiumpro 1"
.LASF673:
	.string	"LAPIC_BASE 0xfee00000"
.LASF107:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF220:
	.string	"__i686 1"
.LASF527:
	.string	"SCNdLEAST16 \"hd\""
.LASF63:
	.string	"__UINT_FAST32_TYPE__ unsigned int"
.LASF713:
	.string	"unsigned char"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF270:
	.string	"__USE_ISOC99 1"
.LASF131:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF301:
	.string	"__PMT(args) args"
.LASF275:
	.string	"_POSIX_C_SOURCE"
.LASF184:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF479:
	.string	"PRIuLEAST16 \"u\""
.LASF395:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF798:
	.string	"general_protection_exception"
.LASF113:
	.string	"__INT_FAST32_MAX__ 0x7fffffff"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF258:
	.string	"__USE_FILE_OFFSET64"
.LASF504:
	.string	"PRIXLEAST32 \"X\""
.LASF735:
	.string	"descriptor_table"
.LASF92:
	.string	"__UINT16_MAX__ 0xffff"
.LASF697:
	.string	"DELIVERY_STATUS(s) (s << 12)"
.LASF452:
	.string	"PRIi32 \"i\""
.LASF652:
	.string	"SEG1B 0"
.LASF108:
	.string	"__UINT32_C(c) c ## U"
.LASF695:
	.string	"TIMER_MODE(mode) (mode << 17)"
.LASF654:
	.string	"SEG_AVAILABLE 0"
.LASF158:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF485:
	.string	"PRIuFAST64 __PRI64_PREFIX \"u\""
.LASF374:
	.string	"INT16_MIN (-32767-1)"
.LASF19:
	.string	"__SIZEOF_SHORT__ 2"
.LASF501:
	.string	"PRIX64 __PRI64_PREFIX \"X\""
.LASF845:
	.string	"irq20_tss"
.LASF594:
	.string	"lidt(idt) asm(\"lidt \"#idt)"
.LASF583:
	.string	"SCNiMAX __PRI64_PREFIX \"i\""
.LASF776:
	.string	"irq1_start"
.LASF316:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF646:
	.string	"SEG_AVAILABLE_0 0"
.LASF261:
	.string	"__USE_GNU"
.LASF209:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF390:
	.string	"INT_LEAST16_MAX (32767)"
.LASF657:
	.string	"CODE_SELECTOR (0x1 << 3)"
.LASF70:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF328:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF194:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF237:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF149:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF750:
	.string	"es_r"
.LASF64:
	.string	"__UINT_FAST64_TYPE__ long long unsigned int"
.LASF69:
	.string	"__GXX_ABI_VERSION 1009"
.LASF447:
	.string	"PRIdFAST16 __PRIPTR_PREFIX \"d\""
.LASF223:
	.string	"__pentiumpro__ 1"
.LASF475:
	.string	"PRIu16 \"u\""
.LASF352:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF25:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF693:
	.string	"TIMER_DIV_128 0xA"
.LASF341:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF229:
	.string	"__unix 1"
.LASF434:
	.string	"_GCC_WRAP_STDINT_H "
.LASF516:
	.string	"PRIdPTR __PRIPTR_PREFIX \"d\""
.LASF534:
	.string	"SCNi8 \"hhi\""
.LASF291:
	.string	"__GLIBC_MINOR__ 23"
.LASF252:
	.string	"__USE_XOPEN2K"
.LASF360:
	.string	"__stub_lchmod "
.LASF91:
	.string	"__UINT8_MAX__ 0xff"
.LASF720:
	.string	"long long unsigned int"
.LASF531:
	.string	"SCNdFAST16 __PRIPTR_PREFIX \"d\""
.LASF644:
	.string	"SEG_PRESENT (1 << 15)"
.LASF339:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF627:
	.string	"SEG_TSS16_BUSY (0x3 << 8)"
.LASF151:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF443:
	.string	"PRIdLEAST16 \"d\""
.LASF279:
	.string	"__USE_POSIX199309 1"
.LASF455:
	.string	"PRIiLEAST16 \"i\""
.LASF700:
	.string	"CONCATENATE_DETAILS(x,y) x ## y"
.LASF401:
	.string	"INT_FAST8_MAX (127)"
.LASF402:
	.string	"INT_FAST16_MAX (2147483647)"
.LASF389:
	.string	"INT_LEAST8_MAX (127)"
.LASF491:
	.string	"PRIxLEAST16 \"x\""
.LASF343:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF703:
	.string	"defpointer(type,name,address) type* name = (type *)((uintptr_t) address);"
.LASF97:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF686:
	.string	"TIMER_TSC_DEADLINE 0x2"
.LASF430:
	.string	"UINT32_C(c) c ## U"
.LASF247:
	.string	"__USE_POSIX199309"
.LASF380:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF651:
	.string	"SEG32 (1 << 22)"
.LASF68:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF581:
	.string	"SCNxFAST64 __PRI64_PREFIX \"x\""
.LASF437:
	.string	"__PRIPTR_PREFIX "
.LASF679:
	.string	"TIMER_CURRENT_COUNT_REG LAPIC_BASE + 0x0390"
.LASF832:
	.string	"irq10_tss"
.LASF587:
	.string	"SCNdPTR __PRIPTR_PREFIX \"d\""
.LASF412:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF251:
	.string	"__USE_UNIX98"
.LASF57:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF33:
	.string	"__PTRDIFF_TYPE__ int"
.LASF265:
	.string	"__KERNEL_STRICT_NAMES "
.LASF746:
	.string	"esp2"
.LASF438:
	.string	"PRId8 \"d\""
.LASF675:
	.string	"CMICI_REG LAPIC_BASE + 0x02F0"
.LASF526:
	.string	"SCNdLEAST8 \"hhd\""
.LASF202:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF638:
	.string	"SEG_CODE_DATA (0x1 << 12)"
.LASF215:
	.string	"i386 1"
.LASF206:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF780:
	.string	"irq8_init"
.LASF232:
	.string	"__ELF__ 1"
.LASF694:
	.string	"TIMER_DIV_1 0xB"
.LASF76:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF584:
	.string	"SCNoMAX __PRI64_PREFIX \"o\""
.LASF397:
	.string	"INT_FAST8_MIN (-128)"
.LASF166:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF362:
	.string	"__stub_setlogin "
.LASF172:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF213:
	.string	"__i386 1"
.LASF617:
	.string	"SEG_X (0x8 << 8)"
.LASF112:
	.string	"__INT_FAST16_MAX__ 0x7fffffff"
.LASF621:
	.string	"SEG_XC (0xC << 8)"
.LASF86:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF103:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF608:
	.string	"SEG_BASE_24_31(base) (bit_value(base, 24, 31) << 24)"
.LASF609:
	.string	"SEG_R (0x0 << 8)"
.LASF766:
	.string	"idt_t"
.LASF553:
	.string	"SCNuLEAST64 __PRI64_PREFIX \"u\""
.LASF748:
	.string	"ss2_h"
.LASF124:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF825:
	.string	"ldt_irq1"
.LASF795:
	.string	"__TASK_START_irq13"
.LASF611:
	.string	"SEG_RW (0x2 << 8)"
.LASF400:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF543:
	.string	"SCNiFAST16 __PRIPTR_PREFIX \"i\""
.LASF181:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF658:
	.string	"DATA_SELECTOR ((0x2 << 3))"
.LASF484:
	.string	"PRIuFAST32 __PRIPTR_PREFIX \"u\""
.LASF747:
	.string	"ss2_r"
.LASF342:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF225:
	.string	"__gnu_linux__ 1"
.LASF280:
	.string	"__USE_POSIX199506 1"
.LASF94:
	.string	"__UINT64_MAX__ 0xffffffffffffffffULL"
.LASF420:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF560:
	.string	"SCNo32 \"o\""
.LASF283:
	.string	"_ATFILE_SOURCE"
.LASF1:
	.string	"__STDC_VERSION__ 201112L"
.LASF95:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF764:
	.string	"trap_r"
.LASF207:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF846:
	.string	"GNU C11 5.4.0 20160609 -masm=intel -m32 -mtune=generic -march=i686 -gdwarf-2 -ggdb3 -fno-stack-protector -fno-omit-frame-pointer -fno-asynchronous-unwind-tables -fno-builtin"
.LASF676:
	.string	"THERMAL_MONITOR_REG LAPIC_BASE + 0x0330"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF680:
	.string	"TIMER_DIVIDE_CONFIG_REG LAPIC_BASE + 0x03E0"
.LASF768:
	.string	"__TASK_START_irq0"
.LASF772:
	.string	"__TASK_START_irq1"
.LASF241:
	.string	"__USE_ISOC11"
.LASF556:
	.string	"SCNuFAST32 __PRIPTR_PREFIX \"u\""
.LASF779:
	.string	"__TASK_START_irq8"
.LASF67:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF399:
	.string	"INT_FAST32_MIN (-2147483647-1)"
.LASF138:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF236:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF451:
	.string	"PRIi16 \"i\""
.LASF87:
	.string	"__INT8_MAX__ 0x7f"
.LASF413:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF738:
	.string	"link_r"
.LASF208:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF753:
	.string	"cs_h"
.LASF381:
	.string	"UINT8_MAX (255)"
.LASF597:
	.string	"set_es(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov es, dx\" :: \"r\"(var))"
.LASF418:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF296:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF5:
	.string	"__GNUC__ 5"
.LASF122:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF46:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF273:
	.string	"_POSIX_SOURCE"
.LASF478:
	.string	"PRIuLEAST8 \"u\""
.LASF271:
	.string	"__USE_ISOC95 1"
.LASF361:
	.string	"__stub_revoke "
.LASF170:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF751:
	.string	"es_h"
.LASF771:
	.string	"__TASK_END_irq0"
.LASF778:
	.string	"__TASK_END_irq1"
.LASF453:
	.string	"PRIi64 __PRI64_PREFIX \"i\""
.LASF310:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF782:
	.string	"__TASK_END_irq8"
.LASF672:
	.string	"TASK_START_ADDRESS(name) (uintptr_t) &name ##_start"
.LASF606:
	.string	"SEG_BASE_0_15(base) (bit_value(base, 0, 15) << 16)"
.LASF740:
	.string	"esp0"
.LASF806:
	.string	"__TASK_START_irq20"
.LASF512:
	.string	"PRIoMAX __PRI64_PREFIX \"o\""
.LASF101:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL"
.LASF297:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF300:
	.string	"__P(args) args"
.LASF569:
	.string	"SCNoFAST64 __PRI64_PREFIX \"o\""
.LASF96:
	.string	"__INT8_C(c) c"
.LASF769:
	.string	"irq0_start"
.LASF268:
	.string	"_DEFAULT_SOURCE 1"
.LASF186:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF422:
	.string	"WINT_MIN (0u)"
.LASF701:
	.string	"CONCATENATE(x,y) CONCATENATE_DETAILS(x, y)"
.LASF295:
	.string	"__LEAF , __leaf__"
.LASF515:
	.string	"PRIXMAX __PRI64_PREFIX \"X\""
.LASF56:
	.string	"__UINT_LEAST64_TYPE__ long long unsigned int"
.LASF187:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF329:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF567:
	.string	"SCNoFAST16 __PRIPTR_PREFIX \"o\""
.LASF509:
	.string	"PRIXFAST64 __PRI64_PREFIX \"X\""
.LASF199:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF721:
	.string	"uintptr_t"
.LASF144:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF278:
	.string	"__USE_POSIX2 1"
.LASF572:
	.string	"SCNx32 \"x\""
.LASF815:
	.string	"task_id_irq8"
.LASF59:
	.string	"__INT_FAST32_TYPE__ int"
.LASF642:
	.string	"SEG_RING3 (0x3 << 13)"
.LASF358:
	.string	"__stub_fdetach "
.LASF272:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF726:
	.string	"base_0_15"
.LASF90:
	.string	"__INT64_MAX__ 0x7fffffffffffffffLL"
.LASF449:
	.string	"PRIdFAST64 __PRI64_PREFIX \"d\""
.LASF494:
	.string	"PRIxFAST8 \"x\""
.LASF765:
	.string	"io_base"
.LASF444:
	.string	"PRIdLEAST32 \"d\""
.LASF630:
	.string	"SEG_INTGATE16 (0x6 << 8)"
.LASF456:
	.string	"PRIiLEAST32 \"i\""
.LASF785:
	.string	"irq10_start"
.LASF492:
	.string	"PRIxLEAST32 \"x\""
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF99:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF350:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF246:
	.string	"__USE_POSIX2"
.LASF745:
	.string	"ss1_h"
.LASF655:
	.string	"GDT_ENTRY_SIZE 8"
.LASF204:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF842:
	.string	"current_task_id"
.LASF307:
	.string	"__END_DECLS "
.LASF528:
	.string	"SCNdLEAST32 \"d\""
.LASF125:
	.string	"__FLT_RADIX__ 2"
.LASF540:
	.string	"SCNiLEAST32 \"i\""
.LASF712:
	.string	"long long int"
.LASF656:
	.string	"GDT_SIZE 8192"
.LASF576:
	.string	"SCNxLEAST32 \"x\""
.LASF39:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF707:
	.string	"ISEG_ACCESS(access) (access << 8)"
.LASF167:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF702:
	.string	"MAKE_UNIQE(x) CONCATENATE(x,__COUNTER__)"
.LASF529:
	.string	"SCNdLEAST64 __PRI64_PREFIX \"d\""
.LASF366:
	.string	"_STDINT_H 1"
.LASF671:
	.string	"TASK_END(name) void __TASK_END_ ##name() {}"
.LASF545:
	.string	"SCNiFAST64 __PRI64_PREFIX \"i\""
.LASF205:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF724:
	.string	"second"
.LASF334:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF731:
	.string	"segment_descriptor"
.LASF500:
	.string	"PRIX32 \"X\""
.LASF604:
	.string	"DESCRIPTOR_SIZE 8"
.LASF554:
	.string	"SCNuFAST8 \"hhu\""
.LASF662:
	.string	"remove_segment(index) (gdt.base[index].raw = 0)"
.LASF44:
	.string	"__INT64_TYPE__ long long int"
.LASF812:
	.string	"irq_gates"
.LASF24:
	.string	"__CHAR_BIT__ 8"
.LASF332:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF210:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF591:
	.string	"SCNxPTR __PRIPTR_PREFIX \"x\""
.LASF294:
	.string	"__PMT"
.LASF544:
	.string	"SCNiFAST32 __PRIPTR_PREFIX \"i\""
.LASF561:
	.string	"SCNo64 __PRI64_PREFIX \"o\""
.LASF147:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF415:
	.string	"PTRDIFF_MIN (-2147483647-1)"
.LASF653:
	.string	"SEG4K (1 << 23)"
.LASF284:
	.string	"_ATFILE_SOURCE 1"
.LASF802:
	.string	"irq32_start"
.LASF29:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF100:
	.string	"__INT32_C(c) c"
.LASF817:
	.string	"task_id_irq11"
.LASF818:
	.string	"task_id_irq13"
.LASF427:
	.string	"INT64_C(c) c ## LL"
.LASF190:
	.string	"__USER_LABEL_PREFIX__ "
.LASF774:
	.string	"irq1_init"
.LASF409:
	.string	"INTPTR_MIN (-2147483647-1)"
.LASF377:
	.string	"INT8_MAX (127)"
.LASF762:
	.string	"ldt_r"
.LASF696:
	.string	"MASK(m) (m << 16)"
.LASF496:
	.string	"PRIxFAST32 __PRIPTR_PREFIX \"x\""
.LASF18:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF55:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF718:
	.string	"unsigned int"
.LASF476:
	.string	"PRIu32 \"u\""
.LASF128:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF841:
	.string	"irq32_tss"
.LASF633:
	.string	"SEG_TSS32_BUSY (0xB << 8)"
.LASF784:
	.string	"irq10_init"
.LASF35:
	.string	"__WINT_TYPE__ unsigned int"
.LASF469:
	.string	"PRIoLEAST64 __PRI64_PREFIX \"o\""
.LASF259:
	.string	"__USE_MISC"
.LASF256:
	.string	"__USE_LARGEFILE"
.LASF127:
	.string	"__FLT_DIG__ 6"
.LASF37:
	.string	"__UINTMAX_TYPE__ long long unsigned int"
.LASF539:
	.string	"SCNiLEAST16 \"hi\""
.LASF761:
	.string	"gs_h"
.LASF281:
	.string	"__USE_XOPEN2K 1"
.LASF819:
	.string	"task_id_irq20"
.LASF123:
	.string	"__FLT_EVAL_METHOD__ 2"
.LASF520:
	.string	"PRIxPTR __PRIPTR_PREFIX \"x\""
.LASF643:
	.string	"SEG_NOT_PRESENT 0"
.LASF706:
	.string	"IDT_ENTRY_SIZE GDT_ENTRY_SIZE"
.LASF326:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF760:
	.string	"gs_r"
.LASF562:
	.string	"SCNoLEAST8 \"hho\""
.LASF176:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF121:
	.string	"__GCC_IEC_559 2"
.LASF565:
	.string	"SCNoLEAST64 __PRI64_PREFIX \"o\""
.LASF212:
	.string	"__SIZEOF_PTRDIFF_T__ 4"
.LASF359:
	.string	"__stub_gtty "
.LASF0:
	.string	"__STDC__ 1"
.LASF392:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF442:
	.string	"PRIdLEAST8 \"d\""
.LASF448:
	.string	"PRIdFAST32 __PRIPTR_PREFIX \"d\""
.LASF385:
	.string	"INT_LEAST8_MIN (-128)"
.LASF30:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF45:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF786:
	.string	"invalid_tss_handler"
.LASF336:
	.string	"__wur "
.LASF214:
	.string	"__i386__ 1"
.LASF535:
	.string	"SCNi16 \"hi\""
.LASF182:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF424:
	.string	"INT8_C(c) c"
.LASF593:
	.string	"bit_value(v,start,end) ((bit_mask(start, end) & v) >> start)"
.LASF289:
	.string	"__GNU_LIBRARY__ 6"
.LASF820:
	.string	"task_id_irq32"
.LASF532:
	.string	"SCNdFAST32 __PRIPTR_PREFIX \"d\""
.LASF198:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF344:
	.string	"__restrict_arr __restrict"
.LASF723:
	.string	"first"
.LASF574:
	.string	"SCNxLEAST8 \"hhx\""
.LASF822:
	.string	"ldt_irq0"
.LASF298:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF349:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF89:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF807:
	.string	"irq20_init"
.LASF303:
	.string	"__STRING(x) #x"
.LASF828:
	.string	"ldt_irq8"
.LASF522:
	.string	"SCNd8 \"hhd\""
.LASF347:
	.string	"__WORDSIZE 32"
.LASF585:
	.string	"SCNuMAX __PRI64_PREFIX \"u\""
.LASF558:
	.string	"SCNo8 \"hho\""
.LASF797:
	.string	"irq13_start"
.LASF168:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF849:
	.string	"_segment_descriptor"
.LASF728:
	.string	"type"
.LASF668:
	.ascii	"TASK_START(name,init_func) void __TASK_END_ ##name(); void _"
	.ascii	"_TASK_START_ ##name(){} segment_descriptor name ##_ldt_segme"
	.ascii	"nts[3]; ldt_t ldt_ ##name; uint16_t task_id_ ##name; struct "
	.ascii	"tss name ##_tss = { .link_r = 0x3 << 3, .ss0_r = DATA_SELECT"
	.ascii	"OR, .eip = (uintptr_t) init_func, .esp = 0x3000, .eflags = 0"
	.ascii	"x87, .cr3 = 0x2000, .es_r = VIDEO_SELECTOR, .cs_r = CODE_SEL"
	.ascii	"ECTOR, .ds_r = DATA_SELECTOR, .ss_r = DATA_SELECTOR, .fs_r ="
	.ascii	" DATA_SELECTOR, .gs_r = DATA_SELECTOR, }; void name ##_init("
	.ascii	") { uint16_t ldt_id; ldt_ ##name.base = name ##_ldt_segments"
	.ascii	"; ldt_ ##name.size = DESCRIPTOR_SIZE * 3; ldt_ ##name.free_i"
	.ascii	"d = 0; task_id_ ##name = gdt_add_segment((uintptr_t) &name #"
	.ascii	"#_tss, 0x067, SEG1B | SEG_AVAILABLE_1 | SEG_LIMIT_16_19(0x0)"
	.ascii	" | SEG_PRESENT | SEG_RING0 | SEG_SYSTEM | SEG_TSS32_AVAILABL"
	.ascii	"E); ldt_id = gdt_add_segment((uintptr_t) &name ##_ldt_segmen"
	.ascii	"ts, ldt_ ##name.size, SEG1B | SEG32 | SEG64_0 | SEG_LIMIT_16"
	.ascii	"_19(0x0) | SEG_PRESENT | SEG_RING0 | SEG_SYSTEM | SEG_LDT); "
	.ascii	"name ##_tss.esp0 = TASK_DATA_ADDRESS(task_id_ ##name); name "
	.ascii	"##_tss.esp = TASK_DATA_ADDRESS(task_id_ ##name); name ##_tss"
	.ascii	".ldt_r = ldt_id << 3; ldt_add_segment(&ldt_ ##name, 0, 0, 0)"
	.ascii	"; ldt_add_segment(&ldt_ ##name, (uintptr_t) __TASK_START_ ##"
	.ascii	"name, __TASK_END_ ##name - __TASK_START_ ##name, SEG4K | SEG"
	.ascii	"_AVAILABLE_1 | SEG32 | SEG64_0 | SEG_LIMIT_16_19(0xf) | SEG_"
	.ascii	"PRESENT | SEG_RING0 | SEG_CODE_DATA | SEG_XR); ldt_add_segme"
	.ascii	"nt(&ldt_ ##nam"
	.string	"e, TASK_DATA_ADDRESS(task_id_ ##name), 0xFFFF, SEG4K | SEG_AVAILABLE_1 | SEG32 | SEG64_0 | SEG_LIMIT_16_19(0xf) | SEG_PRESENT | SEG_RING0 | SEG_CODE_DATA | SEG_RWE); } void name ##_start() { asm(\"pushw 0xa0\"); asm(\"pushd 0x0\"); asm(\"jmp FAR PTR  [esp]\"); }"
.LASF308:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF369:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF354:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF628:
	.string	"SEG_CALLGATE16 (0x4 << 8)"
.LASF371:
	.string	"__uint32_t_defined "
.LASF546:
	.string	"SCNu8 \"hhu\""
.LASF387:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF74:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF734:
	.string	"free_id"
.LASF533:
	.string	"SCNdFAST64 __PRI64_PREFIX \"d\""
.LASF596:
	.string	"iret() asm(\"add esp, 0x4\"); asm(\"leave\"); asm(\"pop eax\"); asm(\"iret\")"
.LASF384:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF783:
	.string	"__TASK_START_irq10"
.LASF789:
	.string	"__TASK_START_irq11"
.LASF788:
	.string	"__TASK_END_irq10"
.LASF794:
	.string	"__TASK_END_irq11"
.LASF159:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF799:
	.string	"__TASK_END_irq13"
.LASF142:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF439:
	.string	"PRId16 \"d\""
.LASF43:
	.string	"__INT32_TYPE__ int"
.LASF589:
	.string	"SCNoPTR __PRIPTR_PREFIX \"o\""
.LASF839:
	.string	"irq32_ldt_segments"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF243:
	.string	"__USE_ISOC95"
.LASF499:
	.string	"PRIX16 \"X\""
.LASF136:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF242:
	.string	"__USE_ISOC99"
.LASF313:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF557:
	.string	"SCNuFAST64 __PRI64_PREFIX \"u\""
.LASF250:
	.string	"__USE_XOPEN_EXTENDED"
.LASF165:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF337:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF460:
	.string	"PRIiFAST32 __PRIPTR_PREFIX \"i\""
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF563:
	.string	"SCNoLEAST16 \"ho\""
.LASF699:
	.string	"VECTOR(v) v"
.LASF306:
	.string	"__BEGIN_DECLS "
.LASF110:
	.string	"__UINT64_C(c) c ## ULL"
.LASF525:
	.string	"SCNd64 __PRI64_PREFIX \"d\""
.LASF736:
	.string	"gdt_t"
.LASF396:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF109:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL"
.LASF689:
	.string	"TIMER_DIV_8 0x2"
.LASF118:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL"
.LASF810:
	.string	"__TASK_END_irq20"
.LASF372:
	.string	"__intptr_t_defined "
.LASF26:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF732:
	.string	"size"
.LASF175:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF503:
	.string	"PRIXLEAST16 \"X\""
.LASF677:
	.string	"TIMER_REG LAPIC_BASE + 0x0320"
.LASF505:
	.string	"PRIXLEAST64 __PRI64_PREFIX \"X\""
.LASF71:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF586:
	.string	"SCNxMAX __PRI64_PREFIX \"x\""
.LASF244:
	.string	"__USE_ISOCXX11"
.LASF705:
	.string	"IDT_SIZE 256"
.LASF77:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF610:
	.string	"SEG_RA (0x1 << 8)"
.LASF502:
	.string	"PRIXLEAST8 \"X\""
.LASF715:
	.string	"uint16_t"
.LASF791:
	.string	"irq11_start"
.LASF466:
	.string	"PRIoLEAST8 \"o\""
.LASF309:
	.string	"__END_NAMESPACE_STD "
.LASF393:
	.string	"UINT_LEAST8_MAX (255)"
.LASF58:
	.string	"__INT_FAST16_TYPE__ int"
.LASF641:
	.string	"SEG_RING2 (0x2 << 13)"
.LASF54:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF38:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF708:
	.string	"idt_add_gate(t,access,id) add_segment(&idt, t, 0x0000, ISEG_ACCESS(access), id, 0)"
.LASF471:
	.string	"PRIoFAST16 __PRIPTR_PREFIX \"o\""
.LASF629:
	.string	"SEG_TASKGATE (0x5 << 8)"
.LASF831:
	.string	"ldt_irq10"
.LASF834:
	.string	"ldt_irq11"
.LASF248:
	.string	"__USE_POSIX199506"
.LASF837:
	.string	"ldt_irq13"
.LASF559:
	.string	"SCNo16 \"ho\""
.LASF800:
	.string	"__TASK_START_irq32"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF664:
	.string	"ldt_add_segment(name,base,limit,access) add_segment(name, base, limit, access, 0x0, 1)"
.LASF805:
	.string	"__TASK_END_irq32"
.LASF793:
	.string	"segment_not_present"
.LASF665:
	.string	"TASK_REGISTER(name) void name ## _start(); void name ## _init(); extern uint16_t task_id_ ##name"
.LASF590:
	.string	"SCNuPTR __PRIPTR_PREFIX \"u\""
.LASF829:
	.string	"irq8_tss"
.LASF603:
	.string	"ltr(gdt_index) asm(\"mov edx, \"#gdt_index\"\\n\\t\" \"ltr dx\")"
.LASF365:
	.string	"__stub_stty "
.LASF836:
	.string	"irq13_ldt_segments"
.LASF592:
	.string	"bit_mask(start,end) ((~(~0 << (end - start + 1))) << start)"
.LASF659:
	.string	"VIDEO_SELECTOR ((0x4 << 3))"
.LASF317:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF796:
	.string	"irq13_init"
.LASF830:
	.string	"irq10_ldt_segments"
.LASF315:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF249:
	.string	"__USE_XOPEN"
.LASF614:
	.string	"SEG_REA (0x5 << 8)"
.LASF787:
	.string	"error_code"
.LASF511:
	.string	"PRIiMAX __PRI64_PREFIX \"i\""
.LASF311:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF221:
	.string	"__i686__ 1"
.LASF465:
	.string	"PRIo64 __PRI64_PREFIX \"o\""
.LASF34:
	.string	"__WCHAR_TYPE__ long int"
.LASF363:
	.string	"__stub_sigreturn "
.LASF421:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF40:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF367:
	.string	"_BITS_WCHAR_H 1"
.LASF770:
	.string	"divide_by_zero_handler"
.LASF649:
	.string	"SEG64_1 (1 << 21)"
.LASF286:
	.string	"__USE_ATFILE 1"
.LASF623:
	.string	"SEG_XRC (0xE << 8)"
.LASF364:
	.string	"__stub_sstk "
.LASF619:
	.string	"SEG_XR (0xA << 8)"
.LASF467:
	.string	"PRIoLEAST16 \"o\""
.LASF162:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF51:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF150:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF157:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF663:
	.string	"gdt_add_segment(base,limit,access) add_segment(&gdt, base, limit, access, 0x0, 1)"
.LASF36:
	.string	"__INTMAX_TYPE__ long long int"
.LASF666:
	.string	"TASK_SELECTOR(name) (task_id_ ##name << 3)"
.LASF203:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF355:
	.string	"__stub_chflags "
.LASF626:
	.string	"SEG_LDT (0x2 << 8)"
.LASF582:
	.string	"SCNdMAX __PRI64_PREFIX \"d\""
.LASF490:
	.string	"PRIxLEAST8 \"x\""
.LASF153:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF474:
	.string	"PRIu8 \"u\""
.LASF458:
	.string	"PRIiFAST8 \"i\""
.LASF674:
	.string	"LAPIC_VERSION_REG LAPIC_BASE + 0x0030"
.LASF813:
	.string	"task_id_irq0"
.LASF814:
	.string	"task_id_irq1"
.LASF65:
	.string	"__INTPTR_TYPE__ int"
.LASF353:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF340:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF189:
	.string	"__REGISTER_PREFIX__ "
.LASF188:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF141:
	.string	"__DBL_DIG__ 15"
.LASF333:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF23:
	.string	"__SIZEOF_SIZE_T__ 4"
.LASF835:
	.string	"irq11_tss"
.LASF185:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF102:
	.string	"__INT64_C(c) c ## LL"
.LASF405:
	.string	"UINT_FAST8_MAX (255)"
.LASF514:
	.string	"PRIxMAX __PRI64_PREFIX \"x\""
.LASF233:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF513:
	.string	"PRIuMAX __PRI64_PREFIX \"u\""
.LASF622:
	.string	"SEG_XCA (0xD << 8)"
.LASF219:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF488:
	.string	"PRIx32 \"x\""
.LASF61:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF826:
	.string	"irq1_tss"
.LASF216:
	.string	"__SIZEOF_FLOAT80__ 12"
.LASF312:
	.string	"__END_NAMESPACE_C99 "
.LASF636:
	.string	"SEG_TRAPGATE32 (0xF << 8)"
.LASF711:
	.string	"short int"
.LASF293:
	.string	"_SYS_CDEFS_H 1"
.LASF755:
	.string	"ss_h"
.LASF106:
	.string	"__UINT16_C(c) c"
.LASF403:
	.string	"INT_FAST32_MAX (2147483647)"
.LASF719:
	.string	"uint64_t"
.LASF754:
	.string	"ss_r"
.LASF192:
	.string	"__NO_INLINE__ 1"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF324:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF598:
	.string	"set_cs(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov cs, dx\")"
.LASF152:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF85:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF440:
	.string	"PRId32 \"d\""
.LASF510:
	.string	"PRIdMAX __PRI64_PREFIX \"d\""
.LASF450:
	.string	"PRIi8 \"i\""
.LASF542:
	.string	"SCNiFAST8 \"hhi\""
.LASF20:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF178:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF781:
	.string	"irq8_start"
.LASF146:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF550:
	.string	"SCNuLEAST8 \"hhu\""
.LASF322:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF684:
	.string	"TIMER_ONE_SHOT 0x0"
.LASF844:
	.string	"ldt_irq20"
.LASF356:
	.string	"__stub_fattach "
.LASF88:
	.string	"__INT16_MAX__ 0x7fff"
.LASF325:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF573:
	.string	"SCNx64 __PRI64_PREFIX \"x\""
.LASF549:
	.string	"SCNu64 __PRI64_PREFIX \"u\""
.LASF331:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF838:
	.string	"irq13_tss"
.LASF388:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF667:
	.string	"TASK_DATA_ADDRESS(id) 0x35000 + id * 0x1000"
.LASF277:
	.string	"__USE_POSIX 1"
.LASF414:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF486:
	.string	"PRIx8 \"x\""
.LASF518:
	.string	"PRIoPTR __PRIPTR_PREFIX \"o\""
.LASF840:
	.string	"ldt_irq32"
.LASF710:
	.string	"signed char"
.LASF498:
	.string	"PRIX8 \"X\""
.LASF211:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF411:
	.string	"UINTPTR_MAX (4294967295U)"
.LASF335:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF338:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF169:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF497:
	.string	"PRIxFAST64 __PRI64_PREFIX \"x\""
.LASF22:
	.string	"__SIZEOF_LONG_DOUBLE__ 12"
.LASF730:
	.string	"base_24_31"
.LASF508:
	.string	"PRIXFAST32 __PRIPTR_PREFIX \"X\""
.LASF632:
	.string	"SEG_TSS32_AVAILABLE (0x9 << 8)"
.LASF351:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF548:
	.string	"SCNu32 \"u\""
.LASF263:
	.string	"__USE_FORTIFY_LEVEL"
.LASF376:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF537:
	.string	"SCNi64 __PRI64_PREFIX \"i\""
.LASF647:
	.string	"SEG_AVAILABLE_1 (1 << 20)"
.LASF688:
	.string	"TIMER_DIV_4 0x1"
.LASF463:
	.string	"PRIo16 \"o\""
.LASF536:
	.string	"SCNi32 \"i\""
.LASF267:
	.string	"_DEFAULT_SOURCE"
.LASF588:
	.string	"SCNiPTR __PRIPTR_PREFIX \"i\""
.LASF580:
	.string	"SCNxFAST32 __PRIPTR_PREFIX \"x\""
.LASF441:
	.string	"PRId64 __PRI64_PREFIX \"d\""
.LASF763:
	.string	"ldt_h"
.LASF239:
	.string	"_INTTYPES_H 1"
.LASF801:
	.string	"irq32_init"
.LASF648:
	.string	"SEG64_0 0"
.LASF16:
	.string	"__SIZEOF_INT__ 4"
.LASF391:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF737:
	.string	"ldt_t"
.LASF767:
	.string	"setup_irq"
.LASF717:
	.string	"uint32_t"
.LASF386:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF224:
	.string	"__code_model_32__ 1"
.LASF530:
	.string	"SCNdFAST8 \"hhd\""
.LASF775:
	.string	"ldt_id"
.LASF217:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF314:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF538:
	.string	"SCNiLEAST8 \"hhi\""
.LASF274:
	.string	"_POSIX_SOURCE 1"
.LASF578:
	.string	"SCNxFAST8 \"hhx\""
.LASF230:
	.string	"__unix__ 1"
.LASF62:
	.string	"__UINT_FAST16_TYPE__ unsigned int"
.LASF191:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF624:
	.string	"SEG_XRCA (0xF << 8)"
.LASF816:
	.string	"task_id_irq10"
.LASF378:
	.string	"INT16_MAX (32767)"
.LASF848:
	.string	"/media/sf_Dropbox_home/books/os-c/kernel"
.LASF155:
	.string	"__LDBL_DIG__ 18"
.LASF552:
	.string	"SCNuLEAST32 \"u\""
.LASF757:
	.string	"ds_h"
.LASF78:
	.string	"__WINT_MIN__ 0U"
.LASF495:
	.string	"PRIxFAST16 __PRIPTR_PREFIX \"x\""
.LASF481:
	.string	"PRIuLEAST64 __PRI64_PREFIX \"u\""
.LASF180:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF756:
	.string	"ds_r"
.LASF305:
	.string	"__long_double_t long double"
.LASF843:
	.string	"irq20_ldt_segments"
.LASF163:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF231:
	.string	"unix 1"
.LASF759:
	.string	"fs_h"
.LASF426:
	.string	"INT32_C(c) c"
.LASF428:
	.string	"UINT8_C(c) c"
.LASF790:
	.string	"irq11_init"
.LASF773:
	.string	"irq0_init"
.LASF758:
	.string	"fs_r"
.LASF227:
	.string	"__linux__ 1"
.LASF287:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF733:
	.string	"base"
.LASF156:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF482:
	.string	"PRIuFAST8 \"u\""
.LASF285:
	.string	"__USE_MISC 1"
.LASF579:
	.string	"SCNxFAST16 __PRIPTR_PREFIX \"x\""
.LASF468:
	.string	"PRIoLEAST32 \"o\""
.LASF368:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF729:
	.string	"granularity"
.LASF80:
	.string	"__SIZE_MAX__ 0xffffffffU"
.LASF616:
	.string	"SEG_RWEA (0x7 << 8)"
.LASF749:
	.string	"eflags"
.LASF602:
	.string	"write_mem_es(offset,value) asm(\"mov edx, \"#value\"\\n\\t\" \"mov word [es:\"#offset\"], edx\")"
.LASF517:
	.string	"PRIiPTR __PRIPTR_PREFIX \"i\""
.LASF725:
	.string	"limit_0_15"
.LASF262:
	.string	"__USE_REENTRANT"
.LASF73:
	.string	"__LONG_MAX__ 0x7fffffffL"
.LASF75:
	.string	"__WCHAR_MAX__ 0x7fffffffL"
.LASF318:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF416:
	.string	"PTRDIFF_MAX (2147483647)"
.LASF743:
	.string	"esp1"
.LASF133:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF620:
	.string	"SEG_XRA (0xB << 8)"
.LASF487:
	.string	"PRIx16 \"x\""
.LASF375:
	.string	"INT32_MIN (-2147483647-1)"
.LASF625:
	.string	"SEG_TSS16_AVAILABLE (0x1 << 8)"
.LASF264:
	.string	"__KERNEL_STRICT_NAMES"
.LASF564:
	.string	"SCNoLEAST32 \"o\""
.LASF752:
	.string	"cs_r"
.LASF541:
	.string	"SCNiLEAST64 __PRI64_PREFIX \"i\""
.LASF257:
	.string	"__USE_LARGEFILE64"
.LASF605:
	.string	"SEG_LIMIT_0_15(limit) bit_value(limit, 0, 15)"
.LASF98:
	.string	"__INT16_C(c) c"
.LASF823:
	.string	"irq0_tss"
.LASF238:
	.string	"__STDC_NO_THREADS__ 1"
.LASF164:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF50:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF570:
	.string	"SCNx8 \"hhx\""
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF226:
	.string	"__linux 1"
.LASF143:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF639:
	.string	"SEG_RING0 (0x0 << 13)"
.LASF454:
	.string	"PRIiLEAST8 \"i\""
.LASF704:
	.string	"lapic_isr_complete(num) ; defpointer(uint32_t, eoi, LAPIC_EIO_REG); *eoi = 1;"
.LASF635:
	.string	"SEG_INTGATE32 (0xE << 8)"
.LASF640:
	.string	"SEG_RING1 (0x1 << 13)"
.LASF615:
	.string	"SEG_RWE (0x6 << 8)"
.LASF432:
	.string	"INTMAX_C(c) c ## LL"
.LASF83:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffULL"
.LASF140:
	.string	"__DBL_MANT_DIG__ 53"
.LASF631:
	.string	"SEG_TRAPGATE16 (0x7 << 8)"
.LASF804:
	.string	"_start"
.LASF618:
	.string	"SEG_XA (0x9 << 8)"
.LASF345:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF72:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF111:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF8:
	.string	"__VERSION__ \"5.4.0 20160609\""
.LASF682:
	.string	"LAPIC_EIO_REG LAPIC_BASE + 0x00b0"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
