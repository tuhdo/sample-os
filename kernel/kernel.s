	.file	"kernel.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	task1_tss,104,32
	.globl	init_tss
	.data
	.align 32
	.type	init_tss, @object
	.size	init_tss, 104
init_tss:
	.zero	4
	.long	65536
	.value	16
	.zero	2
	.long	65536
	.value	16
	.zero	2
	.long	65536
	.value	16
	.zero	6
	.long	0
	.long	135
	.zero	16
	.long	65536
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
	.globl	_start
	.type	_start, @function
_start:
.LFB0:
	.file 1 "kernel.c"
	.loc 1 29 0
	.cfi_startproc
	push	ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
.LCFI1:
	.cfi_def_cfa_register 5
	sub	esp, 8
	.loc 1 30 0
	sub	esp, 12
	push	OFFSET FLAT:init_tss
	call	setup_gdt
	add	esp, 16
	.loc 1 31 0
	call	setup_irq
	.loc 1 32 0
#APP
# 32 "kernel.c" 1
	mov edx, 0x10
	mov ds, dx
# 0 "" 2
	.loc 1 33 0
# 33 "kernel.c" 1
	mov edx, 0x10
	mov ss, dx
# 0 "" 2
	.loc 1 34 0
# 34 "kernel.c" 1
	mov edx, 0x28
	mov gs, dx
# 0 "" 2
	.loc 1 35 0
#NO_APP
	sub	esp, 8
	push	15
	push	99
	call	putc
	add	esp, 16
	.loc 1 41 0
	push	32
	push	10
	push	256
	push	1
	call	lapic_enable_timer
	add	esp, 16
.L2:
	.loc 1 42 0 discriminator 1
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	_start, .-_start
.Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "task.h"
	.file 4 "task1.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2d5
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF750
	.byte	0xc
	.long	.LASF751
	.long	.LASF752
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF713
	.uleb128 0x4
	.long	.LASF715
	.byte	0x2
	.byte	0x31
	.long	0x57
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF714
	.uleb128 0x4
	.long	.LASF716
	.byte	0x2
	.byte	0x33
	.long	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF717
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF718
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF719
	.uleb128 0x5
	.string	"tss"
	.byte	0x68
	.byte	0x3
	.byte	0x7
	.long	0x29f
	.uleb128 0x6
	.long	.LASF720
	.byte	0x3
	.byte	0x8
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF721
	.byte	0x3
	.byte	0x9
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.long	.LASF722
	.byte	0x3
	.byte	0xa
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF723
	.byte	0x3
	.byte	0xb
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF724
	.byte	0x3
	.byte	0xc
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x6
	.long	.LASF725
	.byte	0x3
	.byte	0xd
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.long	.LASF726
	.byte	0x3
	.byte	0xe
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF727
	.byte	0x3
	.byte	0xf
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x6
	.long	.LASF728
	.byte	0x3
	.byte	0x10
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.long	.LASF729
	.byte	0x3
	.byte	0x11
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.long	.LASF730
	.byte	0x3
	.byte	0x12
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x7
	.string	"cr3"
	.byte	0x3
	.byte	0x13
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.string	"eip"
	.byte	0x3
	.byte	0x14
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF731
	.byte	0x3
	.byte	0x15
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.string	"eax"
	.byte	0x3
	.byte	0x16
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x7
	.string	"ecx"
	.byte	0x3
	.byte	0x17
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x7
	.string	"edx"
	.byte	0x3
	.byte	0x18
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x7
	.string	"ebx"
	.byte	0x3
	.byte	0x19
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x7
	.string	"esp"
	.byte	0x3
	.byte	0x1a
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x7
	.string	"ebp"
	.byte	0x3
	.byte	0x1b
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x7
	.string	"esi"
	.byte	0x3
	.byte	0x1c
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x7
	.string	"edi"
	.byte	0x3
	.byte	0x1d
	.long	0x5e
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.long	.LASF732
	.byte	0x3
	.byte	0x1e
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.long	.LASF733
	.byte	0x3
	.byte	0x1f
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x6
	.long	.LASF734
	.byte	0x3
	.byte	0x20
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x6
	.long	.LASF735
	.byte	0x3
	.byte	0x21
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x6
	.long	.LASF736
	.byte	0x3
	.byte	0x22
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x6
	.long	.LASF737
	.byte	0x3
	.byte	0x23
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x6
	.long	.LASF738
	.byte	0x3
	.byte	0x24
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x6
	.long	.LASF739
	.byte	0x3
	.byte	0x25
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x6
	.long	.LASF740
	.byte	0x3
	.byte	0x26
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x6
	.long	.LASF741
	.byte	0x3
	.byte	0x27
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x6
	.long	.LASF742
	.byte	0x3
	.byte	0x28
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x6
	.long	.LASF743
	.byte	0x3
	.byte	0x29
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x6
	.long	.LASF744
	.byte	0x3
	.byte	0x2a
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x6
	.long	.LASF745
	.byte	0x3
	.byte	0x2b
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x6
	.long	.LASF746
	.byte	0x3
	.byte	0x2c
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x6
	.long	.LASF747
	.byte	0x3
	.byte	0x2d
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF753
	.byte	0x1
	.byte	0x1d
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.uleb128 0x9
	.long	.LASF748
	.byte	0x1
	.byte	0xb
	.long	0x7e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	init_tss
	.uleb128 0x9
	.long	.LASF749
	.byte	0x4
	.byte	0x6
	.long	0x7e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	task1_tss
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
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
	.file 5 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x5
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x4
	.file 6 "io.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x6
	.file 7 "asm.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x4
	.file 8 "irq.h"
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x8
	.file 9 "gdt.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x9
	.file 10 "/usr/include/inttypes.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0xa
	.byte	0x5
	.uleb128 0x17
	.long	.LASF249
	.file 11 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro3
	.file 12 "/usr/include/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x16f
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro4
	.file 13 "/usr/include/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x19a
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x6
	.long	.LASF357
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 14 "/usr/include/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x187
	.uleb128 0xe
	.file 15 "/usr/include/gnu/stubs-32.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 16 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x10
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x17
	.long	.LASF376
	.file 17 "/usr/include/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x6
	.long	.LASF357
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF444
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.file 18 "bitmanip.h"
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x3
	.uleb128 0x3
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.file 19 "lapic.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.byte	0x4
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x13
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
	.section	.debug_macro,"G",@progbits,wm4.asm.h.1.e42e6677973ed44f9f9cedbd4a75f30f,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1
	.long	.LASF239
	.byte	0x5
	.uleb128 0x2
	.long	.LASF240
	.byte	0x5
	.uleb128 0x3
	.long	.LASF241
	.byte	0x5
	.uleb128 0x9
	.long	.LASF242
	.byte	0x5
	.uleb128 0xd
	.long	.LASF243
	.byte	0x5
	.uleb128 0x11
	.long	.LASF244
	.byte	0x5
	.uleb128 0x15
	.long	.LASF245
	.byte	0x5
	.uleb128 0x19
	.long	.LASF246
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF247
	.byte	0x5
	.uleb128 0x21
	.long	.LASF248
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.c1be7345a20e74daf6be67323b7aa6e6,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF250
	.byte	0x6
	.uleb128 0x61
	.long	.LASF251
	.byte	0x6
	.uleb128 0x62
	.long	.LASF252
	.byte	0x6
	.uleb128 0x63
	.long	.LASF253
	.byte	0x6
	.uleb128 0x64
	.long	.LASF254
	.byte	0x6
	.uleb128 0x65
	.long	.LASF255
	.byte	0x6
	.uleb128 0x66
	.long	.LASF256
	.byte	0x6
	.uleb128 0x67
	.long	.LASF257
	.byte	0x6
	.uleb128 0x68
	.long	.LASF258
	.byte	0x6
	.uleb128 0x69
	.long	.LASF259
	.byte	0x6
	.uleb128 0x6a
	.long	.LASF260
	.byte	0x6
	.uleb128 0x6b
	.long	.LASF261
	.byte	0x6
	.uleb128 0x6c
	.long	.LASF262
	.byte	0x6
	.uleb128 0x6d
	.long	.LASF263
	.byte	0x6
	.uleb128 0x6e
	.long	.LASF264
	.byte	0x6
	.uleb128 0x6f
	.long	.LASF265
	.byte	0x6
	.uleb128 0x70
	.long	.LASF266
	.byte	0x6
	.uleb128 0x71
	.long	.LASF267
	.byte	0x6
	.uleb128 0x72
	.long	.LASF268
	.byte	0x6
	.uleb128 0x73
	.long	.LASF269
	.byte	0x6
	.uleb128 0x74
	.long	.LASF270
	.byte	0x6
	.uleb128 0x75
	.long	.LASF271
	.byte	0x6
	.uleb128 0x76
	.long	.LASF272
	.byte	0x6
	.uleb128 0x77
	.long	.LASF273
	.byte	0x6
	.uleb128 0x78
	.long	.LASF274
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF275
	.byte	0x5
	.uleb128 0x88
	.long	.LASF276
	.byte	0x6
	.uleb128 0xbb
	.long	.LASF277
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF278
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF279
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF280
	.byte	0x5
	.uleb128 0xce
	.long	.LASF281
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF282
	.byte	0x6
	.uleb128 0xe1
	.long	.LASF283
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF284
	.byte	0x6
	.uleb128 0xe3
	.long	.LASF285
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF286
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF287
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF288
	.byte	0x5
	.uleb128 0x101
	.long	.LASF289
	.byte	0x5
	.uleb128 0x105
	.long	.LASF290
	.byte	0x5
	.uleb128 0x109
	.long	.LASF291
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF253
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF281
	.byte	0x6
	.uleb128 0x10c
	.long	.LASF252
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF280
	.byte	0x5
	.uleb128 0x111
	.long	.LASF292
	.byte	0x6
	.uleb128 0x112
	.long	.LASF293
	.byte	0x5
	.uleb128 0x113
	.long	.LASF294
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF295
	.byte	0x5
	.uleb128 0x141
	.long	.LASF296
	.byte	0x5
	.uleb128 0x154
	.long	.LASF297
	.byte	0x6
	.uleb128 0x161
	.long	.LASF298
	.byte	0x5
	.uleb128 0x162
	.long	.LASF299
	.byte	0x5
	.uleb128 0x166
	.long	.LASF300
	.byte	0x5
	.uleb128 0x167
	.long	.LASF301
	.byte	0x5
	.uleb128 0x169
	.long	.LASF302
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.19.e107c3371efa9ef36ee8ae09396d7011,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF303
	.byte	0x2
	.uleb128 0x22
	.string	"__P"
	.byte	0x6
	.uleb128 0x23
	.long	.LASF304
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF305
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF306
	.byte	0x5
	.uleb128 0x37
	.long	.LASF307
	.byte	0x5
	.uleb128 0x38
	.long	.LASF308
	.byte	0x5
	.uleb128 0x39
	.long	.LASF309
	.byte	0x5
	.uleb128 0x52
	.long	.LASF310
	.byte	0x5
	.uleb128 0x53
	.long	.LASF311
	.byte	0x5
	.uleb128 0x58
	.long	.LASF312
	.byte	0x5
	.uleb128 0x59
	.long	.LASF313
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF314
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF315
	.byte	0x5
	.uleb128 0x65
	.long	.LASF316
	.byte	0x5
	.uleb128 0x66
	.long	.LASF317
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF318
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF319
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF320
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF321
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF322
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF323
	.byte	0x5
	.uleb128 0x84
	.long	.LASF324
	.byte	0x5
	.uleb128 0x85
	.long	.LASF325
	.byte	0x5
	.uleb128 0x88
	.long	.LASF326
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF327
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF328
	.byte	0x5
	.uleb128 0x96
	.long	.LASF329
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF330
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF331
	.byte	0x5
	.uleb128 0xba
	.long	.LASF332
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF333
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF334
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF335
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF336
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF337
	.byte	0x5
	.uleb128 0xec
	.long	.LASF338
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF339
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF340
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF341
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF342
	.byte	0x5
	.uleb128 0x114
	.long	.LASF343
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF344
	.byte	0x5
	.uleb128 0x125
	.long	.LASF345
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF346
	.byte	0x5
	.uleb128 0x133
	.long	.LASF347
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF348
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF349
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF350
	.byte	0x5
	.uleb128 0x157
	.long	.LASF351
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF352
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF353
	.byte	0x5
	.uleb128 0x172
	.long	.LASF354
	.byte	0x5
	.uleb128 0x181
	.long	.LASF355
	.byte	0x5
	.uleb128 0x182
	.long	.LASF356
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.432.619afd0aac7c4b439843706c1b28ddea,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF358
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF359
	.byte	0x5
	.uleb128 0x1b2
	.long	.LASF360
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF361
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF362
	.byte	0x5
	.uleb128 0x1b6
	.long	.LASF363
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF364
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs32.h.10.16e057f848ed2f3683567e3da4309c47,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF365
	.byte	0x5
	.uleb128 0xb
	.long	.LASF366
	.byte	0x5
	.uleb128 0xc
	.long	.LASF367
	.byte	0x5
	.uleb128 0xd
	.long	.LASF368
	.byte	0x5
	.uleb128 0xe
	.long	.LASF369
	.byte	0x5
	.uleb128 0xf
	.long	.LASF370
	.byte	0x5
	.uleb128 0x10
	.long	.LASF371
	.byte	0x5
	.uleb128 0x11
	.long	.LASF372
	.byte	0x5
	.uleb128 0x12
	.long	.LASF373
	.byte	0x5
	.uleb128 0x13
	.long	.LASF374
	.byte	0x5
	.uleb128 0x14
	.long	.LASF375
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF377
	.byte	0x5
	.uleb128 0x22
	.long	.LASF378
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF379
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.35.8a6edafb73695aeb474ec9e9bf7f7153,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF380
	.byte	0x5
	.uleb128 0x34
	.long	.LASF381
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF382
	.byte	0x5
	.uleb128 0x94
	.long	.LASF102
	.byte	0x5
	.uleb128 0x95
	.long	.LASF110
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF383
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF384
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF385
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF386
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF387
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF388
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF389
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF390
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF391
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF392
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF393
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF394
	.byte	0x5
	.uleb128 0xad
	.long	.LASF395
	.byte	0x5
	.uleb128 0xae
	.long	.LASF396
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF397
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF398
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF399
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF400
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF401
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF402
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF403
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF404
	.byte	0x5
	.uleb128 0xba
	.long	.LASF405
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF406
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF407
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF408
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF409
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF410
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF411
	.byte	0x5
	.uleb128 0xce
	.long	.LASF412
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF413
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF414
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF415
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF416
	.byte	0x5
	.uleb128 0xda
	.long	.LASF417
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF418
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF419
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF420
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF421
	.byte	0x5
	.uleb128 0xec
	.long	.LASF422
	.byte	0x5
	.uleb128 0xee
	.long	.LASF423
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF424
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF425
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF426
	.byte	0x5
	.uleb128 0x100
	.long	.LASF427
	.byte	0x5
	.uleb128 0x101
	.long	.LASF428
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF429
	.byte	0x5
	.uleb128 0x111
	.long	.LASF430
	.byte	0x5
	.uleb128 0x112
	.long	.LASF431
	.byte	0x5
	.uleb128 0x116
	.long	.LASF432
	.byte	0x5
	.uleb128 0x117
	.long	.LASF433
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF434
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF435
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF436
	.byte	0x5
	.uleb128 0x120
	.long	.LASF437
	.byte	0x5
	.uleb128 0x124
	.long	.LASF438
	.byte	0x5
	.uleb128 0x125
	.long	.LASF439
	.byte	0x5
	.uleb128 0x126
	.long	.LASF440
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF441
	.byte	0x5
	.uleb128 0x132
	.long	.LASF442
	.byte	0x5
	.uleb128 0x133
	.long	.LASF443
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.inttypes.h.40.616c6bc004e0dde7925f1f045323df77,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF445
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF446
	.byte	0x5
	.uleb128 0x30
	.long	.LASF447
	.byte	0x5
	.uleb128 0x36
	.long	.LASF448
	.byte	0x5
	.uleb128 0x37
	.long	.LASF449
	.byte	0x5
	.uleb128 0x38
	.long	.LASF450
	.byte	0x5
	.uleb128 0x39
	.long	.LASF451
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF452
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF453
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF454
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF455
	.byte	0x5
	.uleb128 0x40
	.long	.LASF456
	.byte	0x5
	.uleb128 0x41
	.long	.LASF457
	.byte	0x5
	.uleb128 0x42
	.long	.LASF458
	.byte	0x5
	.uleb128 0x43
	.long	.LASF459
	.byte	0x5
	.uleb128 0x46
	.long	.LASF460
	.byte	0x5
	.uleb128 0x47
	.long	.LASF461
	.byte	0x5
	.uleb128 0x48
	.long	.LASF462
	.byte	0x5
	.uleb128 0x49
	.long	.LASF463
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF464
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF465
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF466
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF467
	.byte	0x5
	.uleb128 0x50
	.long	.LASF468
	.byte	0x5
	.uleb128 0x51
	.long	.LASF469
	.byte	0x5
	.uleb128 0x52
	.long	.LASF470
	.byte	0x5
	.uleb128 0x53
	.long	.LASF471
	.byte	0x5
	.uleb128 0x56
	.long	.LASF472
	.byte	0x5
	.uleb128 0x57
	.long	.LASF473
	.byte	0x5
	.uleb128 0x58
	.long	.LASF474
	.byte	0x5
	.uleb128 0x59
	.long	.LASF475
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF476
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF477
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF478
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF479
	.byte	0x5
	.uleb128 0x60
	.long	.LASF480
	.byte	0x5
	.uleb128 0x61
	.long	.LASF481
	.byte	0x5
	.uleb128 0x62
	.long	.LASF482
	.byte	0x5
	.uleb128 0x63
	.long	.LASF483
	.byte	0x5
	.uleb128 0x66
	.long	.LASF484
	.byte	0x5
	.uleb128 0x67
	.long	.LASF485
	.byte	0x5
	.uleb128 0x68
	.long	.LASF486
	.byte	0x5
	.uleb128 0x69
	.long	.LASF487
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF488
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF489
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF490
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF491
	.byte	0x5
	.uleb128 0x70
	.long	.LASF492
	.byte	0x5
	.uleb128 0x71
	.long	.LASF493
	.byte	0x5
	.uleb128 0x72
	.long	.LASF494
	.byte	0x5
	.uleb128 0x73
	.long	.LASF495
	.byte	0x5
	.uleb128 0x76
	.long	.LASF496
	.byte	0x5
	.uleb128 0x77
	.long	.LASF497
	.byte	0x5
	.uleb128 0x78
	.long	.LASF498
	.byte	0x5
	.uleb128 0x79
	.long	.LASF499
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF500
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF501
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF502
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF503
	.byte	0x5
	.uleb128 0x80
	.long	.LASF504
	.byte	0x5
	.uleb128 0x81
	.long	.LASF505
	.byte	0x5
	.uleb128 0x82
	.long	.LASF506
	.byte	0x5
	.uleb128 0x83
	.long	.LASF507
	.byte	0x5
	.uleb128 0x86
	.long	.LASF508
	.byte	0x5
	.uleb128 0x87
	.long	.LASF509
	.byte	0x5
	.uleb128 0x88
	.long	.LASF510
	.byte	0x5
	.uleb128 0x89
	.long	.LASF511
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF512
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF513
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF514
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF515
	.byte	0x5
	.uleb128 0x90
	.long	.LASF516
	.byte	0x5
	.uleb128 0x91
	.long	.LASF517
	.byte	0x5
	.uleb128 0x92
	.long	.LASF518
	.byte	0x5
	.uleb128 0x93
	.long	.LASF519
	.byte	0x5
	.uleb128 0x97
	.long	.LASF520
	.byte	0x5
	.uleb128 0x98
	.long	.LASF521
	.byte	0x5
	.uleb128 0x99
	.long	.LASF522
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF523
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF524
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF525
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF526
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF527
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF528
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF529
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF530
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF531
	.byte	0x5
	.uleb128 0xab
	.long	.LASF532
	.byte	0x5
	.uleb128 0xac
	.long	.LASF533
	.byte	0x5
	.uleb128 0xad
	.long	.LASF534
	.byte	0x5
	.uleb128 0xae
	.long	.LASF535
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF536
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF537
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF538
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF539
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF540
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF541
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF542
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF543
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF544
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF545
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF546
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF547
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF548
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF549
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF550
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF551
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF552
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF553
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF554
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF555
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF556
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF557
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF558
	.byte	0x5
	.uleb128 0xce
	.long	.LASF559
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF560
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF561
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF562
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF563
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF564
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF565
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF566
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF567
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF568
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF569
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF570
	.byte	0x5
	.uleb128 0xde
	.long	.LASF571
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF572
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF573
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF574
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF575
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF576
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF577
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF578
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF579
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF580
	.byte	0x5
	.uleb128 0xec
	.long	.LASF581
	.byte	0x5
	.uleb128 0xed
	.long	.LASF582
	.byte	0x5
	.uleb128 0xee
	.long	.LASF583
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF584
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF585
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF586
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF587
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF588
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF589
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF590
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF591
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF592
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF593
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF594
	.byte	0x5
	.uleb128 0xff
	.long	.LASF595
	.byte	0x5
	.uleb128 0x100
	.long	.LASF596
	.byte	0x5
	.uleb128 0x103
	.long	.LASF597
	.byte	0x5
	.uleb128 0x104
	.long	.LASF598
	.byte	0x5
	.uleb128 0x105
	.long	.LASF599
	.byte	0x5
	.uleb128 0x106
	.long	.LASF600
	.byte	0x5
	.uleb128 0x107
	.long	.LASF601
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.bitmanip.h.1.168232c1c6081d939487bc690acf9059,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1
	.long	.LASF602
	.byte	0x5
	.uleb128 0x2
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
.LASF389:
	.string	"INT32_MAX (2147483647)"
.LASF483:
	.string	"PRIoFAST64 __PRI64_PREFIX \"o\""
.LASF720:
	.string	"link_r"
.LASF690:
	.string	"TIMER_DIV_16 0x3"
.LASF393:
	.string	"UINT32_MAX (4294967295U)"
.LASF723:
	.string	"ss0_r"
.LASF47:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF201:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF93:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF120:
	.string	"__UINTPTR_MAX__ 0xffffffffU"
.LASF279:
	.string	"__USE_ISOC11 1"
.LASF379:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF244:
	.string	"set_ds(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov ds, dx\")"
.LASF79:
	.string	"__PTRDIFF_MAX__ 0x7fffffff"
.LASF82:
	.string	"__INTMAX_C(c) c ## LL"
.LASF81:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffLL"
.LASF174:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF265:
	.string	"__USE_XOPEN2K8XSI"
.LASF561:
	.string	"SCNuLEAST16 \"hu\""
.LASF482:
	.string	"PRIoFAST32 __PRIPTR_PREFIX \"o\""
.LASF607:
	.string	"SEG_BASE_16_23(base) bit_value(base, 16, 23)"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF533:
	.string	"SCNd16 \"hd\""
.LASF468:
	.string	"PRIiFAST8 \"i\""
.LASF270:
	.string	"__USE_ATFILE"
.LASF329:
	.string	"__flexarr []"
.LASF627:
	.string	"SEG_TSS16_BUSY (0x3 << 8)"
.LASF435:
	.string	"INT16_C(c) c"
.LASF673:
	.string	"LAPIC_BASE 0xfee00000"
.LASF298:
	.string	"__GNU_LIBRARY__"
.LASF145:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF337:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF692:
	.string	"TIMER_DIV_64 0x9"
.LASF171:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF578:
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
.LASF472:
	.string	"PRIo8 \"o\""
.LASF557:
	.string	"SCNu16 \"hu\""
.LASF576:
	.string	"SCNoFAST8 \"hho\""
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF104:
	.string	"__UINT8_C(c) c"
.LASF429:
	.string	"SIZE_MAX (4294967295U)"
.LASF42:
	.string	"__INT16_TYPE__ short int"
.LASF228:
	.string	"linux 1"
.LASF581:
	.string	"SCNx16 \"hx\""
.LASF161:
	.string	"__LDBL_MAX__ 1.18973149535723176502e+4932L"
.LASF420:
	.string	"INTPTR_MAX (2147483647)"
.LASF474:
	.string	"PRIo32 \"o\""
.LASF493:
	.string	"PRIuFAST16 __PRIPTR_PREFIX \"u\""
.LASF340:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF193:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF499:
	.string	"PRIx64 __PRI64_PREFIX \"x\""
.LASF487:
	.string	"PRIu64 __PRI64_PREFIX \"u\""
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF471:
	.string	"PRIiFAST64 __PRI64_PREFIX \"i\""
.LASF134:
	.string	"__FLT_MIN__ 1.17549435082228750797e-38F"
.LASF414:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF60:
	.string	"__INT_FAST64_TYPE__ long long int"
.LASF661:
	.string	"gdt_get_segment(index) get_segment(gdt, index)"
.LASF565:
	.string	"SCNuFAST16 __PRIPTR_PREFIX \"u\""
.LASF490:
	.string	"PRIuLEAST32 \"u\""
.LASF154:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF300:
	.string	"__GLIBC__ 2"
.LASF456:
	.string	"PRIdFAST8 \"d\""
.LASF418:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF408:
	.string	"INT_FAST16_MIN (-2147483647-1)"
.LASF749:
	.string	"task1_tss"
.LASF439:
	.string	"UINT16_C(c) c"
.LASF383:
	.string	"INT8_MIN (-128)"
.LASF246:
	.string	"set_gs(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov gs, dx\")"
.LASF503:
	.string	"PRIxLEAST64 __PRI64_PREFIX \"x\""
.LASF733:
	.string	"es_h"
.LASF302:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF330:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF27:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF612:
	.string	"SEG_RWA (0x3 << 8)"
.LASF392:
	.string	"UINT16_MAX (65535)"
.LASF160:
	.string	"__DECIMAL_DIG__ 21"
.LASF531:
	.string	"PRIXPTR __PRIPTR_PREFIX \"X\""
.LASF610:
	.string	"SEG_RA (0x1 << 8)"
.LASF587:
	.string	"SCNxLEAST64 __PRI64_PREFIX \"x\""
.LASF255:
	.string	"__USE_POSIX"
.LASF333:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF173:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF52:
	.string	"__INT_LEAST64_TYPE__ long long int"
.LASF517:
	.string	"PRIXFAST16 __PRIPTR_PREFIX \"X\""
.LASF119:
	.string	"__INTPTR_MAX__ 0x7fffffff"
.LASF367:
	.string	"__stub_fchflags "
.LASF116:
	.string	"__UINT_FAST16_MAX__ 0xffffffffU"
.LASF455:
	.string	"PRIdLEAST64 __PRI64_PREFIX \"d\""
.LASF135:
	.string	"__FLT_EPSILON__ 1.19209289550781250000e-7F"
.LASF276:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF259:
	.string	"__USE_XOPEN"
.LASF115:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF446:
	.string	"__PRI64_PREFIX \"ll\""
.LASF523:
	.string	"PRIuMAX __PRI64_PREFIX \"u\""
.LASF264:
	.string	"__USE_XOPEN2K8"
.LASF634:
	.string	"SEG_CALLGATE32 (0xC << 8)"
.LASF53:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF480:
	.string	"PRIoFAST8 \"o\""
.LASF404:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF218:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF512:
	.string	"PRIXLEAST8 \"X\""
.LASF719:
	.string	"long int"
.LASF114:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL"
.LASF660:
	.string	"GDT_OFFSET(index) (index * 8)"
.LASF441:
	.string	"UINT64_C(c) c ## ULL"
.LASF292:
	.string	"__USE_XOPEN2K8 1"
.LASF534:
	.string	"SCNd32 \"d\""
.LASF183:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF84:
	.string	"__UINTMAX_C(c) c ## ULL"
.LASF31:
	.string	"__SIZEOF_POINTER__ 4"
.LASF49:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF197:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF380:
	.string	"__int8_t_defined "
.LASF356:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF263:
	.string	"__USE_XOPEN2KXSI"
.LASF669:
	.string	"INIT_TASK(name) name ## _init()"
.LASF714:
	.string	"short unsigned int"
.LASF687:
	.string	"TIMER_DIV_2 0x0"
.LASF312:
	.string	"__CONCAT(x,y) x ## y"
.LASF363:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF286:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF117:
	.string	"__UINT_FAST32_MAX__ 0xffffffffU"
.LASF691:
	.string	"TIMER_DIV_32 0x8"
.LASF130:
	.string	"__FLT_MAX_EXP__ 128"
.LASF17:
	.string	"__SIZEOF_LONG__ 4"
.LASF516:
	.string	"PRIXFAST8 \"X\""
.LASF685:
	.string	"TIMER_PERIODIC 0x1"
.LASF235:
	.string	"__STDC_IEC_559__ 1"
.LASF445:
	.string	"____gwchar_t_defined 1"
.LASF427:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF21:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF678:
	.string	"TIMER_INIT_COUNT_REG LAPIC_BASE + 0x0380"
.LASF665:
	.string	"TASK_REGISTER(name) void name ## _start(); void name ## _init(); extern uint16_t task_id_ ##name"
.LASF234:
	.string	"_STDC_PREDEF_H 1"
.LASF148:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309e-308L)"
.LASF721:
	.string	"link_h"
.LASF706:
	.string	"IDT_ENTRY_SIZE GDT_ENTRY_SIZE"
.LASF179:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF331:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF129:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF132:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF245:
	.string	"set_ss(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov ss, dx\")"
.LASF416:
	.string	"UINT_FAST16_MAX (4294967295U)"
.LASF48:
	.string	"__UINT64_TYPE__ long long unsigned int"
.LASF645:
	.string	"SEG_LIMIT_16_19(lim) (lim << 16)"
.LASF314:
	.string	"__ptr_t void *"
.LASF726:
	.string	"ss1_r"
.LASF529:
	.string	"PRIuPTR __PRIPTR_PREFIX \"u\""
.LASF139:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF467:
	.string	"PRIiLEAST64 __PRI64_PREFIX \"i\""
.LASF417:
	.string	"UINT_FAST32_MAX (4294967295U)"
.LASF105:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF222:
	.string	"__pentiumpro 1"
.LASF107:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF220:
	.string	"__i686 1"
.LASF537:
	.string	"SCNdLEAST16 \"hd\""
.LASF63:
	.string	"__UINT_FAST32_TYPE__ unsigned int"
.LASF713:
	.string	"unsigned char"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF280:
	.string	"__USE_ISOC99 1"
.LASF240:
	.string	"lgdt(gdt) asm(\"lgdt \"#gdt)"
.LASF311:
	.string	"__PMT(args) args"
.LASF285:
	.string	"_POSIX_C_SOURCE"
.LASF184:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF489:
	.string	"PRIuLEAST16 \"u\""
.LASF405:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF113:
	.string	"__INT_FAST32_MAX__ 0x7fffffff"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF268:
	.string	"__USE_FILE_OFFSET64"
.LASF677:
	.string	"TIMER_REG LAPIC_BASE + 0x0320"
.LASF92:
	.string	"__UINT16_MAX__ 0xffff"
.LASF697:
	.string	"DELIVERY_STATUS(s) (s << 12)"
.LASF462:
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
.LASF495:
	.string	"PRIuFAST64 __PRI64_PREFIX \"u\""
.LASF384:
	.string	"INT16_MIN (-32767-1)"
.LASF19:
	.string	"__SIZEOF_SHORT__ 2"
.LASF511:
	.string	"PRIX64 __PRI64_PREFIX \"X\""
.LASF310:
	.string	"__P(args) args"
.LASF239:
	.string	"lidt(idt) asm(\"lidt \"#idt)"
.LASF593:
	.string	"SCNiMAX __PRI64_PREFIX \"i\""
.LASF326:
	.string	"__warndecl(name,msg) extern void name (void) __attribute__((__warning__ (msg)))"
.LASF646:
	.string	"SEG_AVAILABLE_0 0"
.LASF271:
	.string	"__USE_GNU"
.LASF209:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF400:
	.string	"INT_LEAST16_MAX (32767)"
.LASF70:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF338:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF194:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF237:
	.string	"__STDC_ISO_10646__ 201505L"
.LASF149:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308085e-16L)"
.LASF732:
	.string	"es_r"
.LASF64:
	.string	"__UINT_FAST64_TYPE__ long long unsigned int"
.LASF69:
	.string	"__GXX_ABI_VERSION 1009"
.LASF457:
	.string	"PRIdFAST16 __PRIPTR_PREFIX \"d\""
.LASF469:
	.string	"PRIiFAST16 __PRIPTR_PREFIX \"i\""
.LASF485:
	.string	"PRIu16 \"u\""
.LASF274:
	.string	"__KERNEL_STRICT_NAMES"
.LASF25:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF351:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF229:
	.string	"__unix 1"
.LASF444:
	.string	"_GCC_WRAP_STDINT_H "
.LASF544:
	.string	"SCNi8 \"hhi\""
.LASF301:
	.string	"__GLIBC_MINOR__ 23"
.LASF262:
	.string	"__USE_XOPEN2K"
.LASF370:
	.string	"__stub_lchmod "
.LASF91:
	.string	"__UINT8_MAX__ 0xff"
.LASF718:
	.string	"long long unsigned int"
.LASF541:
	.string	"SCNdFAST16 __PRIPTR_PREFIX \"d\""
.LASF644:
	.string	"SEG_PRESENT (1 << 15)"
.LASF349:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF151:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF453:
	.string	"PRIdLEAST16 \"d\""
.LASF289:
	.string	"__USE_POSIX199309 1"
.LASF465:
	.string	"PRIiLEAST16 \"i\""
.LASF700:
	.string	"CONCATENATE_DETAILS(x,y) x ## y"
.LASF411:
	.string	"INT_FAST8_MAX (127)"
.LASF412:
	.string	"INT_FAST16_MAX (2147483647)"
.LASF399:
	.string	"INT_LEAST8_MAX (127)"
.LASF501:
	.string	"PRIxLEAST16 \"x\""
.LASF97:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF686:
	.string	"TIMER_TSC_DEADLINE 0x2"
.LASF440:
	.string	"UINT32_C(c) c ## U"
.LASF257:
	.string	"__USE_POSIX199309"
.LASF390:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF651:
	.string	"SEG32 (1 << 22)"
.LASF68:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF591:
	.string	"SCNxFAST64 __PRI64_PREFIX \"x\""
.LASF447:
	.string	"__PRIPTR_PREFIX "
.LASF679:
	.string	"TIMER_CURRENT_COUNT_REG LAPIC_BASE + 0x0390"
.LASF549:
	.string	"SCNiLEAST16 \"hi\""
.LASF422:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF261:
	.string	"__USE_UNIX98"
.LASF57:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF33:
	.string	"__PTRDIFF_TYPE__ int"
.LASF275:
	.string	"__KERNEL_STRICT_NAMES "
.LASF725:
	.string	"esp1"
.LASF728:
	.string	"esp2"
.LASF448:
	.string	"PRId8 \"d\""
.LASF675:
	.string	"CMICI_REG LAPIC_BASE + 0x02F0"
.LASF536:
	.string	"SCNdLEAST8 \"hhd\""
.LASF202:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF638:
	.string	"SEG_CODE_DATA (0x1 << 12)"
.LASF215:
	.string	"i386 1"
.LASF206:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF670:
	.string	"RUN_TASK(name) name ## _start()"
.LASF232:
	.string	"__ELF__ 1"
.LASF694:
	.string	"TIMER_DIV_1 0xB"
.LASF76:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF704:
	.string	"lapic_isr_complete(num) ; defpointer(uint32_t, eoi, LAPIC_EIO_REG); *eoi = 1;"
.LASF166:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF372:
	.string	"__stub_setlogin "
.LASF172:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF213:
	.string	"__i386 1"
.LASF617:
	.string	"SEG_X (0x8 << 8)"
.LASF621:
	.string	"SEG_XC (0xC << 8)"
.LASF86:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF103:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF693:
	.string	"TIMER_DIV_128 0xA"
.LASF710:
	.string	"signed char"
.LASF609:
	.string	"SEG_R (0x0 << 8)"
.LASF267:
	.string	"__USE_LARGEFILE64"
.LASF563:
	.string	"SCNuLEAST64 __PRI64_PREFIX \"u\""
.LASF730:
	.string	"ss2_h"
.LASF475:
	.string	"PRIo64 __PRI64_PREFIX \"o\""
.LASF611:
	.string	"SEG_RW (0x2 << 8)"
.LASF410:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF553:
	.string	"SCNiFAST16 __PRIPTR_PREFIX \"i\""
.LASF181:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF494:
	.string	"PRIuFAST32 __PRIPTR_PREFIX \"u\""
.LASF729:
	.string	"ss2_r"
.LASF352:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF225:
	.string	"__gnu_linux__ 1"
.LASF290:
	.string	"__USE_POSIX199506 1"
.LASF94:
	.string	"__UINT64_MAX__ 0xffffffffffffffffULL"
.LASF430:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF570:
	.string	"SCNo32 \"o\""
.LASF293:
	.string	"_ATFILE_SOURCE"
.LASF1:
	.string	"__STDC_VERSION__ 201112L"
.LASF95:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF746:
	.string	"trap_r"
.LASF207:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF461:
	.string	"PRIi16 \"i\""
.LASF676:
	.string	"THERMAL_MONITOR_REG LAPIC_BASE + 0x0330"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF680:
	.string	"TIMER_DIVIDE_CONFIG_REG LAPIC_BASE + 0x03E0"
.LASF251:
	.string	"__USE_ISOC11"
.LASF566:
	.string	"SCNuFAST32 __PRIPTR_PREFIX \"u\""
.LASF223:
	.string	"__pentiumpro__ 1"
.LASF67:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF409:
	.string	"INT_FAST32_MIN (-2147483647-1)"
.LASF138:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF236:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF87:
	.string	"__INT8_MAX__ 0x7f"
.LASF423:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF208:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF735:
	.string	"cs_h"
.LASF391:
	.string	"UINT8_MAX (255)"
.LASF242:
	.string	"set_es(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov es, dx\" :: \"r\"(var))"
.LASF428:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF306:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF5:
	.string	"__GNUC__ 5"
.LASF122:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF46:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF283:
	.string	"_POSIX_SOURCE"
.LASF488:
	.string	"PRIuLEAST8 \"u\""
.LASF281:
	.string	"__USE_ISOC95 1"
.LASF371:
	.string	"__stub_revoke "
.LASF170:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF515:
	.string	"PRIXLEAST64 __PRI64_PREFIX \"X\""
.LASF463:
	.string	"PRIi64 __PRI64_PREFIX \"i\""
.LASF320:
	.string	"__USING_NAMESPACE_STD(name) "
.LASF616:
	.string	"SEG_RWEA (0x7 << 8)"
.LASF672:
	.string	"TASK_START_ADDRESS(name) (uintptr_t) &name ##_start"
.LASF606:
	.string	"SEG_BASE_0_15(base) (bit_value(base, 0, 15) << 16)"
.LASF722:
	.string	"esp0"
.LASF522:
	.string	"PRIoMAX __PRI64_PREFIX \"o\""
.LASF101:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL"
.LASF307:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF579:
	.string	"SCNoFAST64 __PRI64_PREFIX \"o\""
.LASF250:
	.string	"_FEATURES_H 1"
.LASF278:
	.string	"_DEFAULT_SOURCE 1"
.LASF186:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF432:
	.string	"WINT_MIN (0u)"
.LASF701:
	.string	"CONCATENATE(x,y) CONCATENATE_DETAILS(x, y)"
.LASF305:
	.string	"__LEAF , __leaf__"
.LASF56:
	.string	"__UINT_LEAST64_TYPE__ long long unsigned int"
.LASF187:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF339:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF519:
	.string	"PRIXFAST64 __PRI64_PREFIX \"X\""
.LASF419:
	.string	"INTPTR_MIN (-2147483647-1)"
.LASF144:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF288:
	.string	"__USE_POSIX2 1"
.LASF126:
	.string	"__FLT_MANT_DIG__ 24"
.LASF59:
	.string	"__INT_FAST32_TYPE__ int"
.LASF642:
	.string	"SEG_RING3 (0x3 << 13)"
.LASF689:
	.string	"TIMER_DIV_8 0x2"
.LASF282:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF437:
	.string	"INT64_C(c) c ## LL"
.LASF368:
	.string	"__stub_fdetach "
.LASF90:
	.string	"__INT64_MAX__ 0x7fffffffffffffffLL"
.LASF459:
	.string	"PRIdFAST64 __PRI64_PREFIX \"d\""
.LASF504:
	.string	"PRIxFAST8 \"x\""
.LASF747:
	.string	"io_base"
.LASF454:
	.string	"PRIdLEAST32 \"d\""
.LASF630:
	.string	"SEG_INTGATE16 (0x6 << 8)"
.LASF466:
	.string	"PRIiLEAST32 \"i\""
.LASF502:
	.string	"PRIxLEAST32 \"x\""
.LASF196:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF99:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF360:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF256:
	.string	"__USE_POSIX2"
.LASF655:
	.string	"GDT_ENTRY_SIZE 8"
.LASF204:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF317:
	.string	"__END_DECLS "
.LASF538:
	.string	"SCNdLEAST32 \"d\""
.LASF125:
	.string	"__FLT_RADIX__ 2"
.LASF550:
	.string	"SCNiLEAST32 \"i\""
.LASF712:
	.string	"long long int"
.LASF656:
	.string	"GDT_SIZE 8192"
.LASF586:
	.string	"SCNxLEAST32 \"x\""
.LASF39:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF707:
	.string	"ISEG_ACCESS(access) (access << 8)"
.LASF167:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF702:
	.string	"MAKE_UNIQE(x) CONCATENATE(x,__COUNTER__)"
.LASF539:
	.string	"SCNdLEAST64 __PRI64_PREFIX \"d\""
.LASF376:
	.string	"_STDINT_H 1"
.LASF671:
	.string	"TASK_END(name) void __TASK_END_ ##name() {}"
.LASF555:
	.string	"SCNiFAST64 __PRI64_PREFIX \"i\""
.LASF205:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF344:
	.string	"__nonnull(params) __attribute__ ((__nonnull__ params))"
.LASF510:
	.string	"PRIX32 \"X\""
.LASF604:
	.string	"DESCRIPTOR_SIZE 8"
.LASF564:
	.string	"SCNuFAST8 \"hhu\""
.LASF662:
	.string	"remove_segment(index) (gdt.base[index].raw = 0)"
.LASF44:
	.string	"__INT64_TYPE__ long long int"
.LASF24:
	.string	"__CHAR_BIT__ 8"
.LASF342:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF210:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF601:
	.string	"SCNxPTR __PRIPTR_PREFIX \"x\""
.LASF304:
	.string	"__PMT"
.LASF585:
	.string	"SCNxLEAST16 \"hx\""
.LASF554:
	.string	"SCNiFAST32 __PRIPTR_PREFIX \"i\""
.LASF571:
	.string	"SCNo64 __PRI64_PREFIX \"o\""
.LASF43:
	.string	"__INT32_TYPE__ int"
.LASF425:
	.string	"PTRDIFF_MIN (-2147483647-1)"
.LASF653:
	.string	"SEG4K (1 << 23)"
.LASF294:
	.string	"_ATFILE_SOURCE 1"
.LASF29:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF407:
	.string	"INT_FAST8_MIN (-128)"
.LASF100:
	.string	"__INT32_C(c) c"
.LASF514:
	.string	"PRIXLEAST32 \"X\""
.LASF698:
	.string	"DELIVERY_MODE(s) (s << 8)"
.LASF190:
	.string	"__USER_LABEL_PREFIX__ "
.LASF35:
	.string	"__WINT_TYPE__ unsigned int"
.LASF605:
	.string	"SEG_LIMIT_0_15(limit) bit_value(limit, 0, 15)"
.LASF387:
	.string	"INT8_MAX (127)"
.LASF744:
	.string	"ldt_r"
.LASF696:
	.string	"MASK(m) (m << 16)"
.LASF506:
	.string	"PRIxFAST32 __PRIPTR_PREFIX \"x\""
.LASF18:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF55:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF717:
	.string	"unsigned int"
.LASF724:
	.string	"ss0_h"
.LASF486:
	.string	"PRIu32 \"u\""
.LASF128:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF124:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF633:
	.string	"SEG_TSS32_BUSY (0xB << 8)"
.LASF750:
	.string	"GNU C11 5.4.0 20160609 -masm=intel -m32 -mtune=generic -march=i686 -gdwarf-2 -ggdb3 -fno-stack-protector -fno-omit-frame-pointer -fno-asynchronous-unwind-tables -fno-builtin"
.LASF479:
	.string	"PRIoLEAST64 __PRI64_PREFIX \"o\""
.LASF269:
	.string	"__USE_MISC"
.LASF266:
	.string	"__USE_LARGEFILE"
.LASF127:
	.string	"__FLT_DIG__ 6"
.LASF37:
	.string	"__UINTMAX_TYPE__ long long unsigned int"
.LASF743:
	.string	"gs_h"
.LASF291:
	.string	"__USE_XOPEN2K 1"
.LASF597:
	.string	"SCNdPTR __PRIPTR_PREFIX \"d\""
.LASF123:
	.string	"__FLT_EVAL_METHOD__ 2"
.LASF530:
	.string	"PRIxPTR __PRIPTR_PREFIX \"x\""
.LASF336:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF742:
	.string	"gs_r"
.LASF572:
	.string	"SCNoLEAST8 \"hho\""
.LASF176:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF121:
	.string	"__GCC_IEC_559 2"
.LASF575:
	.string	"SCNoLEAST64 __PRI64_PREFIX \"o\""
.LASF212:
	.string	"__SIZEOF_PTRDIFF_T__ 4"
.LASF369:
	.string	"__stub_gtty "
.LASF0:
	.string	"__STDC__ 1"
.LASF402:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF452:
	.string	"PRIdLEAST8 \"d\""
.LASF458:
	.string	"PRIdFAST32 __PRIPTR_PREFIX \"d\""
.LASF395:
	.string	"INT_LEAST8_MIN (-128)"
.LASF30:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF147:
	.string	"__DBL_MAX__ ((double)1.79769313486231570815e+308L)"
.LASF45:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF346:
	.string	"__wur "
.LASF214:
	.string	"__i386__ 1"
.LASF545:
	.string	"SCNi16 \"hi\""
.LASF182:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF434:
	.string	"INT8_C(c) c"
.LASF603:
	.string	"bit_value(v,start,end) ((bit_mask(start, end) & v) >> start)"
.LASF299:
	.string	"__GNU_LIBRARY__ 6"
.LASF542:
	.string	"SCNdFAST32 __PRIPTR_PREFIX \"d\""
.LASF198:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF354:
	.string	"__restrict_arr __restrict"
.LASF584:
	.string	"SCNxLEAST8 \"hhx\""
.LASF308:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF359:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF89:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF358:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF313:
	.string	"__STRING(x) #x"
.LASF532:
	.string	"SCNd8 \"hhd\""
.LASF357:
	.string	"__WORDSIZE 32"
.LASF681:
	.string	"LAPIC_ISR_BASE LAPIC_BASE + 0x0100"
.LASF568:
	.string	"SCNo8 \"hho\""
.LASF526:
	.string	"PRIdPTR __PRIPTR_PREFIX \"d\""
.LASF168:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF643:
	.string	"SEG_NOT_PRESENT 0"
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
.LASF318:
	.string	"__BEGIN_NAMESPACE_STD "
.LASF362:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF309:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF364:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF628:
	.string	"SEG_CALLGATE16 (0x4 << 8)"
.LASF381:
	.string	"__uint32_t_defined "
.LASF556:
	.string	"SCNu8 \"hhu\""
.LASF74:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF543:
	.string	"SCNdFAST64 __PRI64_PREFIX \"d\""
.LASF241:
	.string	"iret() asm(\"add esp, 0x4\"); asm(\"leave\"); asm(\"pop eax\"); asm(\"iret\")"
.LASF394:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF159:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF96:
	.string	"__INT8_C(c) c"
.LASF142:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF449:
	.string	"PRId16 \"d\""
.LASF683:
	.string	"LAPIC_ERROR_REG LAPIC_BASE + 0x0280"
.LASF200:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF253:
	.string	"__USE_ISOC95"
.LASF509:
	.string	"PRIX16 \"X\""
.LASF136:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092e-45F"
.LASF252:
	.string	"__USE_ISOC99"
.LASF323:
	.string	"__USING_NAMESPACE_C99(name) "
.LASF567:
	.string	"SCNuFAST64 __PRI64_PREFIX \"u\""
.LASF260:
	.string	"__USE_XOPEN_EXTENDED"
.LASF165:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF347:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF470:
	.string	"PRIiFAST32 __PRIPTR_PREFIX \"i\""
.LASF195:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF573:
	.string	"SCNoLEAST16 \"ho\""
.LASF699:
	.string	"VECTOR(v) v"
.LASF316:
	.string	"__BEGIN_DECLS "
.LASF110:
	.string	"__UINT64_C(c) c ## ULL"
.LASF657:
	.string	"CODE_SELECTOR (0x1 << 3)"
.LASF535:
	.string	"SCNd64 __PRI64_PREFIX \"d\""
.LASF406:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF109:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL"
.LASF118:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL"
.LASF382:
	.string	"__intptr_t_defined "
.LASF26:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF175:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF513:
	.string	"PRIXLEAST16 \"X\""
.LASF71:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF254:
	.string	"__USE_ISOCXX11"
.LASF705:
	.string	"IDT_SIZE 256"
.LASF77:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF715:
	.string	"uint16_t"
.LASF476:
	.string	"PRIoLEAST8 \"o\""
.LASF319:
	.string	"__END_NAMESPACE_STD "
.LASF403:
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
.LASF481:
	.string	"PRIoFAST16 __PRIPTR_PREFIX \"o\""
.LASF649:
	.string	"SEG64_1 (1 << 21)"
.LASF258:
	.string	"__USE_POSIX199506"
.LASF569:
	.string	"SCNo16 \"ho\""
.LASF436:
	.string	"INT32_C(c) c"
.LASF216:
	.string	"__SIZEOF_FLOAT80__ 12"
.LASF15:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF112:
	.string	"__INT_FAST16_MAX__ 0x7fffffff"
.LASF748:
	.string	"init_tss"
.LASF600:
	.string	"SCNuPTR __PRIPTR_PREFIX \"u\""
.LASF248:
	.string	"ltr(gdt_index) asm(\"mov edx, \"#gdt_index\"\\n\\t\" \"ltr dx\")"
.LASF375:
	.string	"__stub_stty "
.LASF577:
	.string	"SCNoFAST16 __PRIPTR_PREFIX \"o\""
.LASF415:
	.string	"UINT_FAST8_MAX (255)"
.LASF602:
	.string	"bit_mask(start,end) ((~(~0 << (end - start + 1))) << start)"
.LASF659:
	.string	"VIDEO_SELECTOR ((0x4 << 3))"
.LASF327:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF325:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF497:
	.string	"PRIx16 \"x\""
.LASF614:
	.string	"SEG_REA (0x5 << 8)"
.LASF751:
	.string	"kernel.c"
.LASF521:
	.string	"PRIiMAX __PRI64_PREFIX \"i\""
.LASF321:
	.string	"__BEGIN_NAMESPACE_C99 "
.LASF221:
	.string	"__i686__ 1"
.LASF620:
	.string	"SEG_XRA (0xB << 8)"
.LASF34:
	.string	"__WCHAR_TYPE__ long int"
.LASF373:
	.string	"__stub_sigreturn "
.LASF431:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF40:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF377:
	.string	"_BITS_WCHAR_H 1"
.LASF296:
	.string	"__USE_ATFILE 1"
.LASF623:
	.string	"SEG_XRC (0xE << 8)"
.LASF374:
	.string	"__stub_sstk "
.LASF619:
	.string	"SEG_XR (0xA << 8)"
.LASF477:
	.string	"PRIoLEAST16 \"o\""
.LASF162:
	.string	"__LDBL_MIN__ 3.36210314311209350626e-4932L"
.LASF51:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF150:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544177e-324L)"
.LASF131:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF157:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF663:
	.string	"gdt_add_segment(base,limit,access) add_segment(&gdt, base, limit, access, 0x0, 1)"
.LASF664:
	.string	"ldt_add_segment(name,base,limit,access) add_segment(name, base, limit, access, 0x0, 1)"
.LASF666:
	.string	"TASK_SELECTOR(name) (task_id_ ##name << 3)"
.LASF203:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF365:
	.string	"__stub_chflags "
.LASF626:
	.string	"SEG_LDT (0x2 << 8)"
.LASF592:
	.string	"SCNdMAX __PRI64_PREFIX \"d\""
.LASF753:
	.string	"_start"
.LASF500:
	.string	"PRIxLEAST8 \"x\""
.LASF153:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF484:
	.string	"PRIu8 \"u\""
.LASF674:
	.string	"LAPIC_VERSION_REG LAPIC_BASE + 0x0030"
.LASF65:
	.string	"__INTPTR_TYPE__ int"
.LASF66:
	.string	"__UINTPTR_TYPE__ unsigned int"
.LASF350:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF189:
	.string	"__REGISTER_PREFIX__ "
.LASF188:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF141:
	.string	"__DBL_DIG__ 15"
.LASF443:
	.string	"UINTMAX_C(c) c ## ULL"
.LASF343:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF23:
	.string	"__SIZEOF_SIZE_T__ 4"
.LASF185:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF102:
	.string	"__INT64_C(c) c ## LL"
.LASF524:
	.string	"PRIxMAX __PRI64_PREFIX \"x\""
.LASF233:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF599:
	.string	"SCNoPTR __PRIPTR_PREFIX \"o\""
.LASF622:
	.string	"SEG_XCA (0xD << 8)"
.LASF219:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF498:
	.string	"PRIx32 \"x\""
.LASF61:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF199:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF322:
	.string	"__END_NAMESPACE_C99 "
.LASF636:
	.string	"SEG_TRAPGATE32 (0xF << 8)"
.LASF711:
	.string	"short int"
.LASF303:
	.string	"_SYS_CDEFS_H 1"
.LASF737:
	.string	"ss_h"
.LASF106:
	.string	"__UINT16_C(c) c"
.LASF413:
	.string	"INT_FAST32_MAX (2147483647)"
.LASF353:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF192:
	.string	"__NO_INLINE__ 1"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF334:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF243:
	.string	"set_cs(var) asm(\"mov edx, \"#var\"\\n\\t\" \"mov cs, dx\")"
.LASF152:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF85:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF450:
	.string	"PRId32 \"d\""
.LASF520:
	.string	"PRIdMAX __PRI64_PREFIX \"d\""
.LASF460:
	.string	"PRIi8 \"i\""
.LASF525:
	.string	"PRIXMAX __PRI64_PREFIX \"X\""
.LASF552:
	.string	"SCNiFAST8 \"hhi\""
.LASF20:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF178:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF146:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF560:
	.string	"SCNuLEAST8 \"hhu\""
.LASF332:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF684:
	.string	"TIMER_ONE_SHOT 0x0"
.LASF366:
	.string	"__stub_fattach "
.LASF88:
	.string	"__INT16_MAX__ 0x7fff"
.LASF335:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF583:
	.string	"SCNx64 __PRI64_PREFIX \"x\""
.LASF559:
	.string	"SCNu64 __PRI64_PREFIX \"u\""
.LASF341:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF398:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF667:
	.string	"TASK_DATA_ADDRESS(id) 0x35000 + id * 0x1000"
.LASF287:
	.string	"__USE_POSIX 1"
.LASF424:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF496:
	.string	"PRIx8 \"x\""
.LASF528:
	.string	"PRIoPTR __PRIPTR_PREFIX \"o\""
.LASF688:
	.string	"TIMER_DIV_4 0x1"
.LASF508:
	.string	"PRIX8 \"X\""
.LASF211:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF433:
	.string	"WINT_MAX (4294967295u)"
.LASF421:
	.string	"UINTPTR_MAX (4294967295U)"
.LASF345:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF348:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF169:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF507:
	.string	"PRIxFAST64 __PRI64_PREFIX \"x\""
.LASF22:
	.string	"__SIZEOF_LONG_DOUBLE__ 12"
.LASF658:
	.string	"DATA_SELECTOR ((0x2 << 3))"
.LASF518:
	.string	"PRIXFAST32 __PRIPTR_PREFIX \"X\""
.LASF632:
	.string	"SEG_TSS32_AVAILABLE (0x9 << 8)"
.LASF361:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF629:
	.string	"SEG_TASKGATE (0x5 << 8)"
.LASF558:
	.string	"SCNu32 \"u\""
.LASF273:
	.string	"__USE_FORTIFY_LEVEL"
.LASF386:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF547:
	.string	"SCNi64 __PRI64_PREFIX \"i\""
.LASF647:
	.string	"SEG_AVAILABLE_1 (1 << 20)"
.LASF473:
	.string	"PRIo16 \"o\""
.LASF546:
	.string	"SCNi32 \"i\""
.LASF277:
	.string	"_DEFAULT_SOURCE"
.LASF598:
	.string	"SCNiPTR __PRIPTR_PREFIX \"i\""
.LASF590:
	.string	"SCNxFAST32 __PRIPTR_PREFIX \"x\""
.LASF451:
	.string	"PRId64 __PRI64_PREFIX \"d\""
.LASF745:
	.string	"ldt_h"
.LASF249:
	.string	"_INTTYPES_H 1"
.LASF397:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF648:
	.string	"SEG64_0 0"
.LASF16:
	.string	"__SIZEOF_INT__ 4"
.LASF401:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF716:
	.string	"uint32_t"
.LASF396:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF224:
	.string	"__code_model_32__ 1"
.LASF540:
	.string	"SCNdFAST8 \"hhd\""
.LASF217:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF324:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF548:
	.string	"SCNiLEAST8 \"hhi\""
.LASF284:
	.string	"_POSIX_SOURCE 1"
.LASF588:
	.string	"SCNxFAST8 \"hhx\""
.LASF230:
	.string	"__unix__ 1"
.LASF62:
	.string	"__UINT_FAST16_TYPE__ unsigned int"
.LASF191:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF624:
	.string	"SEG_XRCA (0xF << 8)"
.LASF388:
	.string	"INT16_MAX (32767)"
.LASF752:
	.string	"/media/sf_Dropbox_home/books/os-c/kernel"
.LASF155:
	.string	"__LDBL_DIG__ 18"
.LASF562:
	.string	"SCNuLEAST32 \"u\""
.LASF739:
	.string	"ds_h"
.LASF78:
	.string	"__WINT_MIN__ 0U"
.LASF505:
	.string	"PRIxFAST16 __PRIPTR_PREFIX \"x\""
.LASF491:
	.string	"PRIuLEAST64 __PRI64_PREFIX \"u\""
.LASF180:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF738:
	.string	"ds_r"
.LASF315:
	.string	"__long_double_t long double"
.LASF50:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF163:
	.string	"__LDBL_EPSILON__ 1.08420217248550443401e-19L"
.LASF231:
	.string	"unix 1"
.LASF741:
	.string	"fs_h"
.LASF594:
	.string	"SCNoMAX __PRI64_PREFIX \"o\""
.LASF438:
	.string	"UINT8_C(c) c"
.LASF709:
	.string	"init_irq(irq_name,id) INIT_TASK(irq_name); idt_add_gate(TASK_SELECTOR(irq_name), 0x85, id)"
.LASF740:
	.string	"fs_r"
.LASF227:
	.string	"__linux__ 1"
.LASF297:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF637:
	.string	"SEG_SYSTEM 0"
.LASF156:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF492:
	.string	"PRIuFAST8 \"u\""
.LASF295:
	.string	"__USE_MISC 1"
.LASF736:
	.string	"ss_r"
.LASF589:
	.string	"SCNxFAST16 __PRIPTR_PREFIX \"x\""
.LASF478:
	.string	"PRIoLEAST32 \"o\""
.LASF378:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF80:
	.string	"__SIZE_MAX__ 0xffffffffU"
.LASF731:
	.string	"eflags"
.LASF247:
	.string	"write_mem_es(offset,value) asm(\"mov edx, \"#value\"\\n\\t\" \"mov word [es:\"#offset\"], edx\")"
.LASF527:
	.string	"PRIiPTR __PRIPTR_PREFIX \"i\""
.LASF272:
	.string	"__USE_REENTRANT"
.LASF73:
	.string	"__LONG_MAX__ 0x7fffffffL"
.LASF75:
	.string	"__WCHAR_MAX__ 0x7fffffffL"
.LASF328:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF426:
	.string	"PTRDIFF_MAX (2147483647)"
.LASF703:
	.string	"defpointer(type,name,address) type* name = (type *)((uintptr_t) address);"
.LASF133:
	.string	"__FLT_MAX__ 3.40282346638528859812e+38F"
.LASF650:
	.string	"SEG16 0"
.LASF385:
	.string	"INT32_MIN (-2147483647-1)"
.LASF625:
	.string	"SEG_TSS16_AVAILABLE (0x1 << 8)"
.LASF36:
	.string	"__INTMAX_TYPE__ long long int"
.LASF574:
	.string	"SCNoLEAST32 \"o\""
.LASF734:
	.string	"cs_r"
.LASF551:
	.string	"SCNiLEAST64 __PRI64_PREFIX \"i\""
.LASF727:
	.string	"ss1_h"
.LASF98:
	.string	"__INT16_C(c) c"
.LASF238:
	.string	"__STDC_NO_THREADS__ 1"
.LASF164:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460253e-4951L"
.LASF596:
	.string	"SCNxMAX __PRI64_PREFIX \"x\""
.LASF580:
	.string	"SCNx8 \"hhx\""
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF226:
	.string	"__linux 1"
.LASF143:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF639:
	.string	"SEG_RING0 (0x0 << 13)"
.LASF464:
	.string	"PRIiLEAST8 \"i\""
.LASF635:
	.string	"SEG_INTGATE32 (0xE << 8)"
.LASF640:
	.string	"SEG_RING1 (0x1 << 13)"
.LASF582:
	.string	"SCNx32 \"x\""
.LASF615:
	.string	"SEG_RWE (0x6 << 8)"
.LASF442:
	.string	"INTMAX_C(c) c ## LL"
.LASF83:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffULL"
.LASF140:
	.string	"__DBL_MANT_DIG__ 53"
.LASF631:
	.string	"SEG_TRAPGATE16 (0x7 << 8)"
.LASF613:
	.string	"SEG_RE (0x4 << 8)"
.LASF618:
	.string	"SEG_XA (0x9 << 8)"
.LASF595:
	.string	"SCNuMAX __PRI64_PREFIX \"u\""
.LASF355:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF72:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF111:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF608:
	.string	"SEG_BASE_24_31(base) (bit_value(base, 24, 31) << 24)"
.LASF8:
	.string	"__VERSION__ \"5.4.0 20160609\""
.LASF682:
	.string	"LAPIC_EIO_REG LAPIC_BASE + 0x00b0"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
