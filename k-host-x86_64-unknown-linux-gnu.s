	.att_syntax
	.file	"k.hip"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function main
.LCPI0_0:
	.long	65536                           # 0x10000
	.long	4096                            # 0x1000
	.long	16384                           # 0x4000
	.long	14336                           # 0x3800
.LCPI0_3:
	.byte	15                              # 0xf
	.byte	15                              # 0xf
	.byte	15                              # 0xf
	.byte	15                              # 0xf
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
.LCPI0_4:
	.zero	16,7
.LCPI0_5:
	.long	4294967280                      # 0xfffffff0
	.long	4294967280                      # 0xfffffff0
	.long	4294967280                      # 0xfffffff0
	.long	4294967280                      # 0xfffffff0
.LCPI0_6:
	.zero	16,15
.LCPI0_7:
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
	.long	0x7fffffff                      # float NaN
.LCPI0_8:
	.quad	0x3eb0c6f7a0b5ed8d              # double 9.9999999999999995E-7
	.quad	0x3eb0c6f7a0b5ed8d              # double 9.9999999999999995E-7
.LCPI0_9:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI0_1:
	.quad	0x4083b80000000000              # double 631
.LCPI0_2:
	.quad	0x3eb0000000000000              # double 9.5367431640625E-7
.LCPI0_10:
	.quad	0x3eb0c6f7a0b5ed8d              # double 9.9999999999999995E-7
.LCPI0_11:
	.quad	0x3ff0000000000000              # double 1
.LCPI0_12:
	.quad	0x3f50624dd2f1a9fc              # double 0.001
.LCPI0_14:
	.quad	0x412e848000000000              # double 1.0E+6
.LCPI0_15:
	.quad	0x4050000000000000              # double 64
.LCPI0_16:
	.quad	0x4059000000000000              # double 100
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI0_13:
	.long	0x42c80000                      # float 100
	.text
	.globl	main
	.prefalign	4, .Lfunc_end0, nop
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception0
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$5400, %rsp                     # imm = 0x1518
	.cfi_def_cfa_offset 5456
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movl	%edi, %r14d
	.cfi_escape 0x2e, 0x00
	movl	$16, %edi
	callq	_Znwm@PLT
	movq	%rax, %rbp
	movaps	.LCPI0_0(%rip), %xmm0           # xmm0 = [65536,4096,16384,14336]
	movups	%xmm0, (%rax)
	cmpl	$3, %r14d
	jne	.LBB0_2
# %bb.1:                                # %.lr.ph.i.i.i.i.i.i
	addq	$8, %rax
	movq	%rax, 336(%rsp)                 # 8-byte Spill
	movq	8(%rbx), %rdi
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	movl	$10, %edx
	callq	__isoc23_strtol@PLT
	movq	%rax, %r14
	movq	16(%rbx), %rdi
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	movl	$10, %edx
	callq	__isoc23_strtol@PLT
	movl	%r14d, (%rbp)
	movl	%eax, 4(%rbp)
	jmp	.LBB0_3
.LBB0_2:
	addq	$16, %rax
	movq	%rax, 336(%rsp)                 # 8-byte Spill
.LBB0_3:
	.cfi_escape 0x2e, 0x00
	leaq	.Lstr(%rip), %rdi
	callq	puts@PLT
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.1(%rip), %rdi
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = [6.31E+2,0.0E+0]
	movb	$1, %al
	callq	printf@PLT
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.2(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	.cfi_escape 0x2e, 0x00
	leaq	.Lstr.1(%rip), %rdi
	callq	puts@PLT
	movq	$1, 400(%rsp)
	movl	$1, %ecx
	movl	$2, %eax
	.p2align	4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movq	%rcx, %rdx
	shrq	$30, %rdx
	xorq	%rcx, %rdx
	imulq	$1812433253, %rdx, %rcx         # imm = 0x6C078965
	addq	%rax, %rcx
	decq	%rcx
	movl	%ecx, %edx
	movq	%rdx, 392(%rsp,%rax,8)
	cmpq	$624, %rax                      # imm = 0x270
	je	.LBB0_6
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	shrl	$30, %edx
	xorl	%edx, %ecx
	imull	$1812433253, %ecx, %ecx         # imm = 0x6C078965
	addl	%eax, %ecx
	movq	%rcx, 400(%rsp,%rax,8)
	addq	$2, %rax
	jmp	.LBB0_4
.LBB0_6:                                # %.lr.ph678
	movq	$624, 5392(%rsp)                # imm = 0x270
	movabsq	$1095216660480, %rax            # imm = 0xFF00000000
	movq	%rax, 392(%rsp)
	movq	$0, 328(%rsp)                   # 8-byte Folded Spill
	leaq	392(%rsp), %r15
	movq	%rbp, %rbx
	movq	%rbp, 192(%rsp)                 # 8-byte Spill
	jmp	.LBB0_8
	.p2align	4
.LBB0_7:                                # %_ZNSt6vectorI9block_iu4SaIS0_EED2Ev.exit266
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	376(%rsp), %rbx                 # 8-byte Reload
	addq	$8, %rbx
	cmpq	336(%rsp), %rbx                 # 8-byte Folded Reload
	movq	192(%rsp), %rbp                 # 8-byte Reload
	je	.LBB0_163
.LBB0_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
                                        #     Child Loop BB0_21 Depth 2
                                        #     Child Loop BB0_23 Depth 2
                                        #     Child Loop BB0_41 Depth 2
                                        #     Child Loop BB0_90 Depth 2
                                        #       Child Loop BB0_91 Depth 3
                                        #     Child Loop BB0_100 Depth 2
                                        #     Child Loop BB0_97 Depth 2
                                        #     Child Loop BB0_141 Depth 2
	movslq	(%rbx), %rcx
	movl	4(%rbx), %r13d
	leal	31(%r13), %eax
	testl	%r13d, %r13d
	cmovnsl	%r13d, %eax
	sarl	$5, %eax
	movslq	%eax, %r14
	movq	%r14, 136(%rsp)                 # 8-byte Spill
	movq	%rcx, 288(%rsp)                 # 8-byte Spill
	imulq	%rcx, %r14
	leaq	(%r14,%r14), %rax
	leaq	(%rax,%rax,8), %rdi
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rdi, %xmm0
	movsd	%xmm0, 368(%rsp)                # 8-byte Spill
	mulsd	.LCPI0_2(%rip), %xmm0
	movsd	%xmm0, 360(%rsp)                # 8-byte Spill
	movabsq	$512409557603043100, %rax       # imm = 0x71C71C71C71C71C
	cmpq	%rax, %r14
	ja	.LBB0_164
# %bb.9:                                # %_ZNSt6vectorI9block_iu4SaIS0_EE17_S_check_init_lenEmRKS1_.exit.i
                                        #   in Loop: Header=BB0_8 Depth=1
	testq	%r14, %r14
	je	.LBB0_14
# %bb.10:                               #   in Loop: Header=BB0_8 Depth=1
.Ltmp0:                                 # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%rdi, %r12
	callq	_Znwm@PLT
.Ltmp1:                                 # EH_LABEL
# %bb.11:                               # %.noexc192
                                        #   in Loop: Header=BB0_8 Depth=1
	leaq	(%r14,%r14,8), %rcx
	leaq	(%rax,%rcx,2), %rcx
	movq	%rcx, 264(%rsp)                 # 8-byte Spill
	xorpd	%xmm0, %xmm0
	movupd	%xmm0, (%rax)
	movw	$0, 16(%rax)
	movq	%rax, %rbp
	addq	$18, %rbp
	decq	%r14
	je	.LBB0_111
# %bb.12:                               #   in Loop: Header=BB0_8 Depth=1
	leaq	(%r14,%r14,8), %rcx
	leaq	(%rbp,%rcx,2), %rbp
	movl	$18, %edx
	movq	%r12, %rdi
	.p2align	4
.LBB0_13:                               # %.lr.ph.i.i.i.i.i.i.i.i.i
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzwl	16(%rax), %ecx
	movw	%cx, 16(%rax,%rdx)
	movupd	(%rax), %xmm0
	movupd	%xmm0, (%rax,%rdx)
	addq	$18, %rdx
	cmpq	%rdx, %rdi
	jne	.LBB0_13
# %bb.15:                               # %_ZNSt6vectorI9block_iu4SaIS0_EEC2EmRKS1_.exit
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	%rax, 200(%rsp)                 # 8-byte Spill
	cmpl	$-32, %r13d
	jg	.LBB0_16
	jmp	.LBB0_166
	.p2align	4
.LBB0_14:                               #   in Loop: Header=BB0_8 Depth=1
	movq	$0, 264(%rsp)                   # 8-byte Folded Spill
	xorl	%eax, %eax
	xorl	%ebp, %ebp
	movq	%rax, 200(%rsp)                 # 8-byte Spill
	cmpl	$-32, %r13d
	jg	.LBB0_16
	jmp	.LBB0_166
	.p2align	4
.LBB0_111:                              #   in Loop: Header=BB0_8 Depth=1
	movq	%r12, %rdi
	movq	%rax, 200(%rsp)                 # 8-byte Spill
	cmpl	$-32, %r13d
	jle	.LBB0_166
.LBB0_16:                               # %_ZNSt6vectorI9block_iu4SaIS0_EE17_S_check_init_lenEmRKS1_.exit.i193
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	%rdi, 96(%rsp)                  # 8-byte Spill
	cmpl	$32, %r13d
	movq	%rbx, 376(%rsp)                 # 8-byte Spill
	movq	%r13, 280(%rsp)                 # 8-byte Spill
	jge	.LBB0_18
# %bb.17:                               #   in Loop: Header=BB0_8 Depth=1
	movq	$0, 256(%rsp)                   # 8-byte Folded Spill
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	jmp	.LBB0_22
	.p2align	4
.LBB0_18:                               #   in Loop: Header=BB0_8 Depth=1
	movq	136(%rsp), %rbx                 # 8-byte Reload
	leaq	(%rbx,%rbx), %rax
	leaq	(%rax,%rax,8), %r14
.Ltmp3:                                 # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_Znwm@PLT
.Ltmp4:                                 # EH_LABEL
# %bb.19:                               # %.noexc202
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	%rax, %r12
	leaq	(%rbx,%rbx,8), %rax
	leaq	(%r12,%rax,2), %rax
	movq	%rax, 256(%rsp)                 # 8-byte Spill
	xorpd	%xmm0, %xmm0
	movupd	%xmm0, (%r12)
	movw	$0, 16(%r12)
	movq	%r12, %r13
	addq	$18, %r13
	movq	%rbx, %rax
	decq	%rax
	je	.LBB0_22
# %bb.20:                               #   in Loop: Header=BB0_8 Depth=1
	leaq	(%rax,%rax,8), %rax
	leaq	(%r13,%rax,2), %r13
	movl	$18, %eax
	.p2align	4
.LBB0_21:                               # %.lr.ph.i.i.i.i.i.i.i.i.i196
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzwl	16(%r12), %ecx
	movw	%cx, 16(%r12,%rax)
	movupd	(%r12), %xmm0
	movupd	%xmm0, (%r12,%rax)
	addq	$18, %rax
	cmpq	%rax, %r14
	jne	.LBB0_21
.LBB0_22:                               # %_ZNSt6vectorI9block_iu4SaIS0_EEC2EmRKS1_.exit203
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	200(%rsp), %rax                 # 8-byte Reload
	movq	%rax, %r14
	cmpq	%rbp, %rax
	je	.LBB0_40
	.p2align	4
.LBB0_23:                               # %.lr.ph
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movw	$8479, (%r14)                   # imm = 0x211F
.Ltmp6:                                 # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	leaq	400(%rsp), %rbx
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp7:                                 # EH_LABEL
# %bb.24:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 2(%r14)
.Ltmp8:                                 # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp9:                                 # EH_LABEL
# %bb.25:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.1
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 3(%r14)
.Ltmp10:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp11:                                # EH_LABEL
# %bb.26:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.2
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 4(%r14)
.Ltmp12:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp13:                                # EH_LABEL
# %bb.27:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.3
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 5(%r14)
.Ltmp14:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp15:                                # EH_LABEL
# %bb.28:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.4
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 6(%r14)
.Ltmp16:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp17:                                # EH_LABEL
# %bb.29:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.5
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 7(%r14)
.Ltmp18:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp19:                                # EH_LABEL
# %bb.30:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.6
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 8(%r14)
.Ltmp20:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp21:                                # EH_LABEL
# %bb.31:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.7
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 9(%r14)
.Ltmp22:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp23:                                # EH_LABEL
# %bb.32:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.8
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 10(%r14)
.Ltmp24:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp25:                                # EH_LABEL
# %bb.33:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.9
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 11(%r14)
.Ltmp26:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp27:                                # EH_LABEL
# %bb.34:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.10
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 12(%r14)
.Ltmp28:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp29:                                # EH_LABEL
# %bb.35:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.11
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 13(%r14)
.Ltmp30:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp31:                                # EH_LABEL
# %bb.36:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.12
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 14(%r14)
.Ltmp32:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp33:                                # EH_LABEL
# %bb.37:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.13
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 15(%r14)
.Ltmp34:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp35:                                # EH_LABEL
# %bb.38:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.14
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 16(%r14)
.Ltmp36:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp37:                                # EH_LABEL
# %bb.39:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit.15
                                        #   in Loop: Header=BB0_23 Depth=2
	movb	%al, 17(%r14)
	addq	$18, %r14
	cmpq	%rbp, %r14
	jne	.LBB0_23
.LBB0_40:                               # %.preheader398
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	%r12, %r14
	cmpq	%r13, %r12
	je	.LBB0_58
	.p2align	4
.LBB0_41:                               # %.lr.ph667
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movw	$8479, (%r14)                   # imm = 0x211F
.Ltmp39:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	leaq	400(%rsp), %rbx
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp40:                                # EH_LABEL
# %bb.42:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 2(%r14)
.Ltmp41:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp42:                                # EH_LABEL
# %bb.43:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.1
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 3(%r14)
.Ltmp43:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp44:                                # EH_LABEL
# %bb.44:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.2
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 4(%r14)
.Ltmp45:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp46:                                # EH_LABEL
# %bb.45:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.3
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 5(%r14)
.Ltmp47:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp48:                                # EH_LABEL
# %bb.46:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.4
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 6(%r14)
.Ltmp49:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp50:                                # EH_LABEL
# %bb.47:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.5
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 7(%r14)
.Ltmp51:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp52:                                # EH_LABEL
# %bb.48:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.6
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 8(%r14)
.Ltmp53:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp54:                                # EH_LABEL
# %bb.49:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.7
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 9(%r14)
.Ltmp55:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp56:                                # EH_LABEL
# %bb.50:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.8
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 10(%r14)
.Ltmp57:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp58:                                # EH_LABEL
# %bb.51:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.9
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 11(%r14)
.Ltmp59:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp60:                                # EH_LABEL
# %bb.52:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.10
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 12(%r14)
.Ltmp61:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp62:                                # EH_LABEL
# %bb.53:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.11
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 13(%r14)
.Ltmp63:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp64:                                # EH_LABEL
# %bb.54:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.12
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 14(%r14)
.Ltmp65:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp66:                                # EH_LABEL
# %bb.55:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.13
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 15(%r14)
.Ltmp67:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp68:                                # EH_LABEL
# %bb.56:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.14
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 16(%r14)
.Ltmp69:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp70:                                # EH_LABEL
# %bb.57:                               # %_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_.exit207.15
                                        #   in Loop: Header=BB0_41 Depth=2
	movb	%al, 17(%r14)
	addq	$18, %r14
	cmpq	%r13, %r14
	jne	.LBB0_41
.LBB0_58:                               # %._crit_edge
                                        #   in Loop: Header=BB0_8 Depth=1
.Ltmp72:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	120(%rsp), %rdi
	movq	96(%rsp), %rsi                  # 8-byte Reload
	callq	hipMalloc@PLT
.Ltmp73:                                # EH_LABEL
	movq	136(%rsp), %rbx                 # 8-byte Reload
	movq	288(%rsp), %r14                 # 8-byte Reload
# %bb.59:                               # %_ZL9hipMallocIcE10hipError_tPPT_m.exit
                                        #   in Loop: Header=BB0_8 Depth=1
	leaq	(%rbx,%rbx), %rax
	leaq	(%rax,%rax,8), %rsi
.Ltmp74:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	112(%rsp), %rdi
	movq	%rsi, 128(%rsp)                 # 8-byte Spill
	callq	hipMalloc@PLT
.Ltmp75:                                # EH_LABEL
# %bb.60:                               # %_ZL9hipMallocI9block_iu4E10hipError_tPPT_m.exit
                                        #   in Loop: Header=BB0_8 Depth=1
	leaq	(,%r14,4), %rbp
.Ltmp76:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	104(%rsp), %rdi
	movq	%rbp, %rsi
	callq	hipMalloc@PLT
.Ltmp77:                                # EH_LABEL
# %bb.61:                               # %_ZL9hipMallocIfE10hipError_tPPT_m.exit
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	120(%rsp), %rdi
.Ltmp78:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	200(%rsp), %rsi                 # 8-byte Reload
	movq	96(%rsp), %rdx                  # 8-byte Reload
	movl	$1, %ecx
	callq	hipMemcpy@PLT
.Ltmp79:                                # EH_LABEL
# %bb.62:                               #   in Loop: Header=BB0_8 Depth=1
	movq	112(%rsp), %rdi
.Ltmp80:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r12, %rsi
	movq	128(%rsp), %rdx                 # 8-byte Reload
	movl	$1, %ecx
	callq	hipMemcpy@PLT
.Ltmp81:                                # EH_LABEL
# %bb.63:                               #   in Loop: Header=BB0_8 Depth=1
	movl	%r14d, %ecx
	movabsq	$4294967296, %rax               # imm = 0x100000000
	movq	%rcx, 224(%rsp)                 # 8-byte Spill
	leaq	(%rcx,%rax), %rdi
.Ltmp83:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movl	$256, %r8d                      # imm = 0x100
	movq	%rdi, 216(%rsp)                 # 8-byte Spill
	movl	$1, %esi
	movabsq	$4294967360, %rdx               # imm = 0x100000040
	movl	$1, %ecx
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration@PLT
.Ltmp84:                                # EH_LABEL
# %bb.64:                               #   in Loop: Header=BB0_8 Depth=1
	testl	%eax, %eax
	jne	.LBB0_67
# %bb.65:                               #   in Loop: Header=BB0_8 Depth=1
	movq	120(%rsp), %rax
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rbx, 64(%rsp)
	movq	128(%rsp), %rax                 # 8-byte Reload
	movq	%rax, 56(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 144(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 152(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 160(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 168(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 176(%rsp)
.Ltmp85:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration@PLT
.Ltmp86:                                # EH_LABEL
# %bb.66:                               # %.noexc210
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
.Ltmp87:                                # EH_LABEL
	.cfi_escape 0x2e, 0x10
	leaq	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll(%rip), %rdi
	leaq	144(%rsp), %r9
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.Ltmp88:                                # EH_LABEL
.LBB0_67:                               #   in Loop: Header=BB0_8 Depth=1
.Ltmp89:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	callq	hipDeviceSynchronize@PLT
.Ltmp90:                                # EH_LABEL
# %bb.68:                               #   in Loop: Header=BB0_8 Depth=1
	cmpl	$0, 224(%rsp)                   # 4-byte Folded Reload
	js	.LBB0_168
# %bb.69:                               # %_ZNSt6vectorIfSaIfEE17_S_check_init_lenEmRKS0_.exit.i
                                        #   in Loop: Header=BB0_8 Depth=1
	testl	%r14d, %r14d
	je	.LBB0_77
# %bb.70:                               #   in Loop: Header=BB0_8 Depth=1
.Ltmp92:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%rbp, %rdi
	callq	_Znwm@PLT
.Ltmp93:                                # EH_LABEL
# %bb.71:                               # %.noexc216
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	%rax, %r13
	movq	%rbp, 96(%rsp)                  # 8-byte Spill
	movl	$0, (%rax)
	movq	%r14, %rbx
	decq	%rbx
	je	.LBB0_73
# %bb.72:                               # %_ZSt6fill_nIPfmfET_S1_T0_RKT1_.exit.loopexit.i.i.i.i.i
                                        #   in Loop: Header=BB0_8 Depth=1
	leaq	4(%r13), %rdi
	leaq	(,%rbx,4), %rdx
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	callq	memset@PLT
.LBB0_73:                               #   in Loop: Header=BB0_8 Depth=1
.Ltmp95:                                # EH_LABEL
	movq	%r13, %r14
	movq	288(%rsp), %rbp                 # 8-byte Reload
	leaq	(%r13,%rbp,4), %r13
	.cfi_escape 0x2e, 0x00
	movq	96(%rsp), %rdi                  # 8-byte Reload
	callq	_Znwm@PLT
.Ltmp96:                                # EH_LABEL
# %bb.74:                               # %.noexc224
                                        #   in Loop: Header=BB0_8 Depth=1
	leaq	(%rax,%rbp,4), %rcx
	movq	%rcx, 248(%rsp)                 # 8-byte Spill
	movl	$0, (%rax)
	testq	%rbx, %rbx
	movq	%rax, 272(%rsp)                 # 8-byte Spill
	je	.LBB0_76
# %bb.75:                               # %_ZSt6fill_nIPfmfET_S1_T0_RKT1_.exit.loopexit.i.i.i.i.i219
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	%rax, %rdi
	addq	$4, %rdi
	shlq	$2, %rbx
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset@PLT
.LBB0_76:                               # %_ZNSt6vectorIfSaIfEEC2EmRKS0_.exit225
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	136(%rsp), %rbx                 # 8-byte Reload
	movq	%r14, %rdi
	movq	96(%rsp), %rbp                  # 8-byte Reload
	jmp	.LBB0_78
	.p2align	4
.LBB0_77:                               #   in Loop: Header=BB0_8 Depth=1
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	movq	$0, 272(%rsp)                   # 8-byte Folded Spill
	movq	$0, 248(%rsp)                   # 8-byte Folded Spill
.LBB0_78:                               # %_ZNSt6vectorIfSaIfEEC2EmRKS0_.exit225
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	104(%rsp), %rsi
.Ltmp98:                                # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%rdi, 208(%rsp)                 # 8-byte Spill
	movq	%rbp, %rdx
	movl	$2, %ecx
	callq	hipMemcpy@PLT
.Ltmp99:                                # EH_LABEL
# %bb.79:                               #   in Loop: Header=BB0_8 Depth=1
	movq	224(%rsp), %rax                 # 8-byte Reload
	cmpl	$512, %eax                      # imm = 0x200
	movl	$512, %ecx                      # imm = 0x200
	cmovbl	%eax, %ecx
	movq	%rbx, %r14
	movq	%rcx, 184(%rsp)                 # 8-byte Spill
	imulq	%rcx, %r14
	movabsq	$512409557603043100, %rax       # imm = 0x71C71C71C71C71C
	cmpq	%rax, %r14
	ja	.LBB0_170
# %bb.80:                               # %_ZNSt6vectorI9block_iu4SaIS0_EE17_S_check_init_lenEmRKS1_.exit.i.i
                                        #   in Loop: Header=BB0_8 Depth=1
	leaq	(%r14,%r14), %rax
	leaq	(%rax,%rax,8), %rbx
	testq	%r14, %r14
	je	.LBB0_84
# %bb.81:                               # %_ZNSt12_Vector_baseI9block_iu4SaIS0_EE11_M_allocateEm.exit.i.i
                                        #   in Loop: Header=BB0_8 Depth=1
.Ltmp101:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Znwm@PLT
.Ltmp102:                               # EH_LABEL
# %bb.82:                               # %.noexc6.i
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	%rax, %rbp
	addq	%rbx, %rax
	movq	%rax, 240(%rsp)                 # 8-byte Spill
	cmpq	$1, %r14
	je	.LBB0_113
# %bb.83:                               #   in Loop: Header=BB0_8 Depth=1
	.cfi_escape 0x2e, 0x00
	movq	%rbp, %rdi
	movq	200(%rsp), %rsi                 # 8-byte Reload
	movq	%rbx, %rdx
	callq	memcpy@PLT
	cmpq	$0, 224(%rsp)                   # 8-byte Folded Reload
	movq	136(%rsp), %rbx                 # 8-byte Reload
	je	.LBB0_114
.LBB0_85:                               #   in Loop: Header=BB0_8 Depth=1
	movq	%r13, 232(%rsp)                 # 8-byte Spill
	movq	184(%rsp), %rbx                 # 8-byte Reload
	leaq	(,%rbx,4), %r13
.Ltmp104:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rdi
	callq	_Znwm@PLT
.Ltmp105:                               # EH_LABEL
# %bb.86:                               # %.noexc234
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	%rax, %r14
	movl	$0, (%rax)
	movq	%rbx, %rdx
	decq	%rdx
	je	.LBB0_88
# %bb.87:                               # %_ZSt6fill_nIPfmfET_S1_T0_RKT1_.exit.loopexit.i.i.i.i.i229
                                        #   in Loop: Header=BB0_8 Depth=1
	leaq	4(%r14), %rdi
	shlq	$2, %rdx
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	callq	memset@PLT
.LBB0_88:                               # %.lr.ph.i
                                        #   in Loop: Header=BB0_8 Depth=1
	cmpl	$32, 280(%rsp)                  # 4-byte Folded Reload
	movq	%rbp, 344(%rsp)                 # 8-byte Spill
	jl	.LBB0_98
# %bb.89:                               # %.preheader.lr.ph.us.i.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	leaq	14(%rbp), %r13
	xorl	%ebx, %ebx
	movq	%r14, 384(%rsp)                 # 8-byte Spill
	.p2align	4
.LBB0_90:                               # %.preheader.lr.ph.us.i
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_91 Depth 3
	xorps	%xmm1, %xmm1
	xorl	%r14d, %r14d
	movq	136(%rsp), %rbp                 # 8-byte Reload
	.p2align	4
.LBB0_91:                               # %.preheader.us.i
                                        #   Parent Loop BB0_8 Depth=1
                                        #     Parent Loop BB0_90 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movsd	%xmm1, 96(%rsp)                 # 8-byte Spill
	movd	-12(%r13,%r14), %xmm3           # xmm3 = mem[0],zero,zero,zero
	movd	-8(%r13,%r14), %xmm2            # xmm2 = mem[0],zero,zero,zero
	movdqa	%xmm3, %xmm1
	movdqa	.LCPI0_3(%rip), %xmm13          # xmm13 = [15,15,15,15,u,u,u,u,u,u,u,u,u,u,u,u]
	pand	%xmm13, %xmm1
	movdqa	%xmm2, %xmm0
	pand	%xmm13, %xmm0
	movdqa	%xmm1, %xmm7
	pxor	%xmm15, %xmm15
	punpcklbw	%xmm15, %xmm7           # xmm7 = xmm7[0],xmm15[0],xmm7[1],xmm15[1],xmm7[2],xmm15[2],xmm7[3],xmm15[3],xmm7[4],xmm15[4],xmm7[5],xmm15[5],xmm7[6],xmm15[6],xmm7[7],xmm15[7]
	punpcklwd	%xmm15, %xmm7           # xmm7 = xmm7[0],xmm15[0],xmm7[1],xmm15[1],xmm7[2],xmm15[2],xmm7[3],xmm15[3]
	movdqa	%xmm0, %xmm6
	punpcklbw	%xmm15, %xmm6           # xmm6 = xmm6[0],xmm15[0],xmm6[1],xmm15[1],xmm6[2],xmm15[2],xmm6[3],xmm15[3],xmm6[4],xmm15[4],xmm6[5],xmm15[5],xmm6[6],xmm15[6],xmm6[7],xmm15[7]
	punpcklwd	%xmm15, %xmm6           # xmm6 = xmm6[0],xmm15[0],xmm6[1],xmm15[1],xmm6[2],xmm15[2],xmm6[3],xmm15[3]
	punpcklbw	%xmm1, %xmm1            # xmm1 = xmm1[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm1, %xmm1            # xmm1 = xmm1[0,0,1,1,2,2,3,3]
	movdqa	.LCPI0_4(%rip), %xmm12          # xmm12 = [1799,1799,1799,1799,1799,1799,1799,1799]
	pcmpgtb	%xmm12, %xmm1
	punpcklbw	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1,2,2,3,3]
	pcmpgtb	%xmm12, %xmm0
	movdqa	%xmm1, %xmm4
	pandn	%xmm7, %xmm4
	movdqa	.LCPI0_5(%rip), %xmm14          # xmm14 = [4294967280,4294967280,4294967280,4294967280]
	por	%xmm14, %xmm7
	pand	%xmm1, %xmm7
	por	%xmm4, %xmm7
	packssdw	%xmm7, %xmm7
	movdqa	%xmm0, %xmm1
	pandn	%xmm6, %xmm1
	por	%xmm14, %xmm6
	pand	%xmm0, %xmm6
	por	%xmm1, %xmm6
	packssdw	%xmm6, %xmm6
	movd	2(%r12,%r14), %xmm5             # xmm5 = mem[0],zero,zero,zero
	movd	6(%r12,%r14), %xmm4             # xmm4 = mem[0],zero,zero,zero
	movdqa	%xmm5, %xmm9
	pand	%xmm13, %xmm9
	movdqa	%xmm4, %xmm8
	pand	%xmm13, %xmm8
	movdqa	%xmm9, %xmm1
	punpcklbw	%xmm15, %xmm1           # xmm1 = xmm1[0],xmm15[0],xmm1[1],xmm15[1],xmm1[2],xmm15[2],xmm1[3],xmm15[3],xmm1[4],xmm15[4],xmm1[5],xmm15[5],xmm1[6],xmm15[6],xmm1[7],xmm15[7]
	punpcklwd	%xmm15, %xmm1           # xmm1 = xmm1[0],xmm15[0],xmm1[1],xmm15[1],xmm1[2],xmm15[2],xmm1[3],xmm15[3]
	movdqa	%xmm8, %xmm0
	punpcklbw	%xmm15, %xmm0           # xmm0 = xmm0[0],xmm15[0],xmm0[1],xmm15[1],xmm0[2],xmm15[2],xmm0[3],xmm15[3],xmm0[4],xmm15[4],xmm0[5],xmm15[5],xmm0[6],xmm15[6],xmm0[7],xmm15[7]
	punpcklwd	%xmm15, %xmm0           # xmm0 = xmm0[0],xmm15[0],xmm0[1],xmm15[1],xmm0[2],xmm15[2],xmm0[3],xmm15[3]
	punpcklbw	%xmm9, %xmm9            # xmm9 = xmm9[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm9, %xmm9            # xmm9 = xmm9[0,0,1,1,2,2,3,3]
	pcmpgtb	%xmm12, %xmm9
	punpcklbw	%xmm8, %xmm8            # xmm8 = xmm8[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm8, %xmm8            # xmm8 = xmm8[0,0,1,1,2,2,3,3]
	pcmpgtb	%xmm12, %xmm8
	movdqa	%xmm9, %xmm10
	pandn	%xmm1, %xmm10
	por	%xmm14, %xmm1
	pand	%xmm9, %xmm1
	por	%xmm10, %xmm1
	packssdw	%xmm1, %xmm1
	pmullw	%xmm7, %xmm1
	movdqa	%xmm8, %xmm7
	pandn	%xmm0, %xmm7
	por	%xmm14, %xmm0
	pand	%xmm8, %xmm0
	por	%xmm7, %xmm0
	packssdw	%xmm0, %xmm0
	pmullw	%xmm6, %xmm0
	movdqa	%xmm3, %xmm7
	psrlw	$4, %xmm7
	movdqa	.LCPI0_6(%rip), %xmm9           # xmm9 = [15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15]
	pand	%xmm9, %xmm7
	movdqa	%xmm2, %xmm6
	psrlw	$4, %xmm6
	pand	%xmm9, %xmm6
	punpcklbw	%xmm15, %xmm7           # xmm7 = xmm7[0],xmm15[0],xmm7[1],xmm15[1],xmm7[2],xmm15[2],xmm7[3],xmm15[3],xmm7[4],xmm15[4],xmm7[5],xmm15[5],xmm7[6],xmm15[6],xmm7[7],xmm15[7]
	punpcklwd	%xmm15, %xmm7           # xmm7 = xmm7[0],xmm15[0],xmm7[1],xmm15[1],xmm7[2],xmm15[2],xmm7[3],xmm15[3]
	punpcklbw	%xmm15, %xmm6           # xmm6 = xmm6[0],xmm15[0],xmm6[1],xmm15[1],xmm6[2],xmm15[2],xmm6[3],xmm15[3],xmm6[4],xmm15[4],xmm6[5],xmm15[5],xmm6[6],xmm15[6],xmm6[7],xmm15[7]
	punpcklwd	%xmm15, %xmm6           # xmm6 = xmm6[0],xmm15[0],xmm6[1],xmm15[1],xmm6[2],xmm15[2],xmm6[3],xmm15[3]
	punpcklbw	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1,2,2,3,3]
	pxor	%xmm8, %xmm8
	pcmpgtb	%xmm3, %xmm8
	punpcklbw	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1,2,2,3,3]
	pxor	%xmm3, %xmm3
	pcmpgtb	%xmm2, %xmm3
	movdqa	%xmm8, %xmm2
	pandn	%xmm7, %xmm2
	por	%xmm14, %xmm7
	pand	%xmm8, %xmm7
	por	%xmm2, %xmm7
	packssdw	%xmm7, %xmm7
	movdqa	%xmm3, %xmm2
	pandn	%xmm6, %xmm2
	por	%xmm14, %xmm6
	pand	%xmm3, %xmm6
	por	%xmm2, %xmm6
	packssdw	%xmm6, %xmm6
	movdqa	%xmm5, %xmm2
	psrlw	$4, %xmm2
	pand	%xmm9, %xmm2
	movdqa	%xmm4, %xmm3
	psrlw	$4, %xmm3
	pand	%xmm9, %xmm3
	punpcklbw	%xmm15, %xmm2           # xmm2 = xmm2[0],xmm15[0],xmm2[1],xmm15[1],xmm2[2],xmm15[2],xmm2[3],xmm15[3],xmm2[4],xmm15[4],xmm2[5],xmm15[5],xmm2[6],xmm15[6],xmm2[7],xmm15[7]
	punpcklwd	%xmm15, %xmm2           # xmm2 = xmm2[0],xmm15[0],xmm2[1],xmm15[1],xmm2[2],xmm15[2],xmm2[3],xmm15[3]
	punpcklbw	%xmm15, %xmm3           # xmm3 = xmm3[0],xmm15[0],xmm3[1],xmm15[1],xmm3[2],xmm15[2],xmm3[3],xmm15[3],xmm3[4],xmm15[4],xmm3[5],xmm15[5],xmm3[6],xmm15[6],xmm3[7],xmm15[7]
	punpcklwd	%xmm15, %xmm3           # xmm3 = xmm3[0],xmm15[0],xmm3[1],xmm15[1],xmm3[2],xmm15[2],xmm3[3],xmm15[3]
	punpcklbw	%xmm5, %xmm5            # xmm5 = xmm5[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm5, %xmm5            # xmm5 = xmm5[0,0,1,1,2,2,3,3]
	pxor	%xmm8, %xmm8
	pcmpgtb	%xmm5, %xmm8
	punpcklbw	%xmm4, %xmm4            # xmm4 = xmm4[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm4, %xmm4            # xmm4 = xmm4[0,0,1,1,2,2,3,3]
	pxor	%xmm5, %xmm5
	pcmpgtb	%xmm4, %xmm5
	movdqa	%xmm8, %xmm4
	pandn	%xmm2, %xmm4
	por	%xmm14, %xmm2
	pand	%xmm8, %xmm2
	por	%xmm4, %xmm2
	packssdw	%xmm2, %xmm2
	pmullw	%xmm7, %xmm2
	movdqa	%xmm5, %xmm4
	pandn	%xmm3, %xmm4
	por	%xmm14, %xmm3
	pand	%xmm5, %xmm3
	por	%xmm4, %xmm3
	packssdw	%xmm3, %xmm3
	pmullw	%xmm6, %xmm3
	movd	-4(%r13,%r14), %xmm7            # xmm7 = mem[0],zero,zero,zero
	movd	(%r13,%r14), %xmm5              # xmm5 = mem[0],zero,zero,zero
	movdqa	%xmm7, %xmm6
	pand	%xmm13, %xmm6
	movdqa	%xmm5, %xmm4
	pand	%xmm13, %xmm4
	movdqa	%xmm6, %xmm9
	punpcklbw	%xmm15, %xmm9           # xmm9 = xmm9[0],xmm15[0],xmm9[1],xmm15[1],xmm9[2],xmm15[2],xmm9[3],xmm15[3],xmm9[4],xmm15[4],xmm9[5],xmm15[5],xmm9[6],xmm15[6],xmm9[7],xmm15[7]
	punpcklwd	%xmm15, %xmm9           # xmm9 = xmm9[0],xmm15[0],xmm9[1],xmm15[1],xmm9[2],xmm15[2],xmm9[3],xmm15[3]
	movdqa	%xmm4, %xmm8
	punpcklbw	%xmm15, %xmm8           # xmm8 = xmm8[0],xmm15[0],xmm8[1],xmm15[1],xmm8[2],xmm15[2],xmm8[3],xmm15[3],xmm8[4],xmm15[4],xmm8[5],xmm15[5],xmm8[6],xmm15[6],xmm8[7],xmm15[7]
	punpcklwd	%xmm15, %xmm8           # xmm8 = xmm8[0],xmm15[0],xmm8[1],xmm15[1],xmm8[2],xmm15[2],xmm8[3],xmm15[3]
	punpcklbw	%xmm6, %xmm6            # xmm6 = xmm6[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm6, %xmm6            # xmm6 = xmm6[0,0,1,1,2,2,3,3]
	pcmpgtb	%xmm12, %xmm6
	punpcklbw	%xmm4, %xmm4            # xmm4 = xmm4[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm4, %xmm4            # xmm4 = xmm4[0,0,1,1,2,2,3,3]
	pcmpgtb	%xmm12, %xmm4
	movdqa	%xmm6, %xmm10
	pandn	%xmm9, %xmm10
	por	%xmm14, %xmm9
	pand	%xmm6, %xmm9
	por	%xmm10, %xmm9
	packssdw	%xmm9, %xmm9
	movdqa	%xmm4, %xmm6
	pandn	%xmm8, %xmm6
	por	%xmm14, %xmm8
	pand	%xmm4, %xmm8
	por	%xmm6, %xmm8
	movd	10(%r12,%r14), %xmm6            # xmm6 = mem[0],zero,zero,zero
	movd	14(%r12,%r14), %xmm4            # xmm4 = mem[0],zero,zero,zero
	movdqa	%xmm6, %xmm11
	pand	%xmm13, %xmm11
	movdqa	%xmm11, %xmm10
	punpcklbw	%xmm15, %xmm10          # xmm10 = xmm10[0],xmm15[0],xmm10[1],xmm15[1],xmm10[2],xmm15[2],xmm10[3],xmm15[3],xmm10[4],xmm15[4],xmm10[5],xmm15[5],xmm10[6],xmm15[6],xmm10[7],xmm15[7]
	punpcklwd	%xmm15, %xmm10          # xmm10 = xmm10[0],xmm15[0],xmm10[1],xmm15[1],xmm10[2],xmm15[2],xmm10[3],xmm15[3]
	punpcklbw	%xmm11, %xmm11          # xmm11 = xmm11[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm11, %xmm11          # xmm11 = xmm11[0,0,1,1,2,2,3,3]
	pcmpgtb	%xmm12, %xmm11
	movdqa	%xmm11, %xmm12
	pandn	%xmm10, %xmm12
	por	%xmm14, %xmm10
	pand	%xmm11, %xmm10
	movdqa	%xmm4, %xmm13
	pand	.LCPI0_3(%rip), %xmm13
	por	%xmm12, %xmm10
	movdqa	%xmm13, %xmm11
	punpcklbw	%xmm15, %xmm11          # xmm11 = xmm11[0],xmm15[0],xmm11[1],xmm15[1],xmm11[2],xmm15[2],xmm11[3],xmm15[3],xmm11[4],xmm15[4],xmm11[5],xmm15[5],xmm11[6],xmm15[6],xmm11[7],xmm15[7]
	punpcklwd	%xmm15, %xmm11          # xmm11 = xmm11[0],xmm15[0],xmm11[1],xmm15[1],xmm11[2],xmm15[2],xmm11[3],xmm15[3]
	punpcklbw	%xmm13, %xmm13          # xmm13 = xmm13[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm13, %xmm13          # xmm13 = xmm13[0,0,1,1,2,2,3,3]
	pcmpgtb	.LCPI0_4(%rip), %xmm13
	packssdw	%xmm10, %xmm10
	pmullw	%xmm9, %xmm10
	movdqa	%xmm13, %xmm9
	pandn	%xmm11, %xmm9
	por	%xmm14, %xmm11
	pand	%xmm13, %xmm11
	por	%xmm9, %xmm11
	packssdw	%xmm8, %xmm8
	packssdw	%xmm11, %xmm11
	pmullw	%xmm8, %xmm11
	punpcklwd	%xmm1, %xmm8            # xmm8 = xmm8[0],xmm1[0],xmm8[1],xmm1[1],xmm8[2],xmm1[2],xmm8[3],xmm1[3]
	psrad	$16, %xmm8
	punpcklwd	%xmm10, %xmm1           # xmm1 = xmm1[0],xmm10[0],xmm1[1],xmm10[1],xmm1[2],xmm10[2],xmm1[3],xmm10[3]
	psrad	$16, %xmm1
	paddd	%xmm8, %xmm1
	punpcklwd	%xmm0, %xmm8            # xmm8 = xmm8[0],xmm0[0],xmm8[1],xmm0[1],xmm8[2],xmm0[2],xmm8[3],xmm0[3]
	psrad	$16, %xmm8
	punpcklwd	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1,2,2,3,3]
	punpcklwd	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1,2,2,3,3]
	psrad	$16, %xmm2
	psrad	$16, %xmm3
	punpcklwd	%xmm11, %xmm0           # xmm0 = xmm0[0],xmm11[0],xmm0[1],xmm11[1],xmm0[2],xmm11[2],xmm0[3],xmm11[3]
	paddd	%xmm2, %xmm1
	psrad	$16, %xmm0
	paddd	%xmm8, %xmm0
	paddd	%xmm3, %xmm0
	movdqa	%xmm7, %xmm3
	psrlw	$4, %xmm3
	movdqa	.LCPI0_6(%rip), %xmm9           # xmm9 = [15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15]
	pand	%xmm9, %xmm3
	movdqa	%xmm5, %xmm2
	psrlw	$4, %xmm2
	pand	%xmm9, %xmm2
	punpcklbw	%xmm15, %xmm3           # xmm3 = xmm3[0],xmm15[0],xmm3[1],xmm15[1],xmm3[2],xmm15[2],xmm3[3],xmm15[3],xmm3[4],xmm15[4],xmm3[5],xmm15[5],xmm3[6],xmm15[6],xmm3[7],xmm15[7]
	punpcklwd	%xmm15, %xmm3           # xmm3 = xmm3[0],xmm15[0],xmm3[1],xmm15[1],xmm3[2],xmm15[2],xmm3[3],xmm15[3]
	punpcklbw	%xmm15, %xmm2           # xmm2 = xmm2[0],xmm15[0],xmm2[1],xmm15[1],xmm2[2],xmm15[2],xmm2[3],xmm15[3],xmm2[4],xmm15[4],xmm2[5],xmm15[5],xmm2[6],xmm15[6],xmm2[7],xmm15[7]
	punpcklwd	%xmm15, %xmm2           # xmm2 = xmm2[0],xmm15[0],xmm2[1],xmm15[1],xmm2[2],xmm15[2],xmm2[3],xmm15[3]
	punpcklbw	%xmm7, %xmm7            # xmm7 = xmm7[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm7, %xmm7            # xmm7 = xmm7[0,0,1,1,2,2,3,3]
	pxor	%xmm8, %xmm8
	pcmpgtb	%xmm7, %xmm8
	punpcklbw	%xmm5, %xmm5            # xmm5 = xmm5[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm5, %xmm5            # xmm5 = xmm5[0,0,1,1,2,2,3,3]
	pxor	%xmm7, %xmm7
	pcmpgtb	%xmm5, %xmm7
	movdqa	%xmm8, %xmm5
	pandn	%xmm3, %xmm5
	por	%xmm14, %xmm3
	pand	%xmm8, %xmm3
	por	%xmm5, %xmm3
	movdqa	%xmm7, %xmm5
	pandn	%xmm2, %xmm5
	por	%xmm14, %xmm2
	pand	%xmm7, %xmm2
	por	%xmm5, %xmm2
	movdqa	%xmm6, %xmm7
	psrlw	$4, %xmm7
	pand	%xmm9, %xmm7
	movdqa	%xmm4, %xmm5
	punpcklbw	%xmm15, %xmm7           # xmm7 = xmm7[0],xmm15[0],xmm7[1],xmm15[1],xmm7[2],xmm15[2],xmm7[3],xmm15[3],xmm7[4],xmm15[4],xmm7[5],xmm15[5],xmm7[6],xmm15[6],xmm7[7],xmm15[7]
	punpcklwd	%xmm15, %xmm7           # xmm7 = xmm7[0],xmm15[0],xmm7[1],xmm15[1],xmm7[2],xmm15[2],xmm7[3],xmm15[3]
	punpcklbw	%xmm6, %xmm6            # xmm6 = xmm6[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm6, %xmm6            # xmm6 = xmm6[0,0,1,1,2,2,3,3]
	pxor	%xmm8, %xmm8
	pcmpgtb	%xmm6, %xmm8
	punpcklbw	%xmm4, %xmm4            # xmm4 = xmm4[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
	punpcklwd	%xmm4, %xmm4            # xmm4 = xmm4[0,0,1,1,2,2,3,3]
	pxor	%xmm6, %xmm6
	pcmpgtb	%xmm4, %xmm6
	movdqa	%xmm8, %xmm4
	pandn	%xmm7, %xmm4
	por	%xmm14, %xmm7
	pand	%xmm8, %xmm7
	por	%xmm4, %xmm7
	packssdw	%xmm3, %xmm3
	psrlw	$4, %xmm5
	pand	%xmm9, %xmm5
	punpcklbw	%xmm15, %xmm5           # xmm5 = xmm5[0],xmm15[0],xmm5[1],xmm15[1],xmm5[2],xmm15[2],xmm5[3],xmm15[3],xmm5[4],xmm15[4],xmm5[5],xmm15[5],xmm5[6],xmm15[6],xmm5[7],xmm15[7]
	punpcklwd	%xmm15, %xmm5           # xmm5 = xmm5[0],xmm15[0],xmm5[1],xmm15[1],xmm5[2],xmm15[2],xmm5[3],xmm15[3]
	packssdw	%xmm7, %xmm7
	pmullw	%xmm3, %xmm7
	movdqa	%xmm6, %xmm3
	pandn	%xmm5, %xmm3
	por	%xmm14, %xmm5
	pand	%xmm6, %xmm5
	por	%xmm3, %xmm5
	packssdw	%xmm2, %xmm2
	packssdw	%xmm5, %xmm5
	pmullw	%xmm2, %xmm5
	punpcklwd	%xmm7, %xmm2            # xmm2 = xmm2[0],xmm7[0],xmm2[1],xmm7[1],xmm2[2],xmm7[2],xmm2[3],xmm7[3]
	psrad	$16, %xmm2
	paddd	%xmm1, %xmm2
	punpcklwd	%xmm5, %xmm1            # xmm1 = xmm1[0],xmm5[0],xmm1[1],xmm5[1],xmm1[2],xmm5[2],xmm1[3],xmm5[3]
	psrad	$16, %xmm1
	paddd	%xmm0, %xmm1
	paddd	%xmm2, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, 304(%rsp)                # 8-byte Spill
	pinsrw	$0, -14(%r13,%r14), %xmm0
	.cfi_escape 0x2e, 0x00
	callq	__extendhfsf2@PLT
	cvtss2sd	%xmm0, %xmm0
	mulsd	304(%rsp), %xmm0                # 8-byte Folded Reload
	movsd	%xmm0, 304(%rsp)                # 8-byte Spill
	pinsrw	$0, (%r12,%r14), %xmm0
	.cfi_escape 0x2e, 0x00
	callq	__extendhfsf2@PLT
	movsd	96(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	cvtss2sd	%xmm0, %xmm0
	mulsd	304(%rsp), %xmm0                # 8-byte Folded Reload
	addsd	%xmm0, %xmm1
	addq	$18, %r14
	decq	%rbp
	jne	.LBB0_91
# %bb.92:                               # %._crit_edge.us.i
                                        #   in Loop: Header=BB0_90 Depth=2
	xorps	%xmm0, %xmm0
	cvtsd2ss	%xmm1, %xmm0
	movq	384(%rsp), %r14                 # 8-byte Reload
	movss	%xmm0, (%r14,%rbx,4)
	incq	%rbx
	addq	128(%rsp), %r13                 # 8-byte Folded Reload
	cmpq	184(%rsp), %rbx                 # 8-byte Folded Reload
	jne	.LBB0_90
# %bb.93:                               # %.lr.ph670.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	288(%rsp), %rsi                 # 8-byte Reload
	cmpl	$4, %esi
	jae	.LBB0_99
.LBB0_94:                               #   in Loop: Header=BB0_8 Depth=1
	pxor	%xmm7, %xmm7
	xorl	%r9d, %r9d
	movaps	.LCPI0_7(%rip), %xmm4           # xmm4 = [NaN,NaN,NaN,NaN]
	movsd	.LCPI0_10(%rip), %xmm5          # xmm5 = [9.9999999999999995E-7,0.0E+0]
	movsd	.LCPI0_11(%rip), %xmm6          # xmm6 = [1.0E+0,0.0E+0]
	movq	136(%rsp), %rbx                 # 8-byte Reload
	movq	208(%rsp), %rax                 # 8-byte Reload
	movq	232(%rsp), %r13                 # 8-byte Reload
	movq	344(%rsp), %rbp                 # 8-byte Reload
.LBB0_95:                               # %.lr.ph670.preheader1409
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	184(%rsp), %rcx                 # 8-byte Reload
.LBB0_96:                               # %.lr.ph670.preheader1409
                                        #   in Loop: Header=BB0_8 Depth=1
	movapd	%xmm7, %xmm0
	.p2align	4
.LBB0_97:                               # %.lr.ph670
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%r14,%r9,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	movss	(%rax,%r9,4), %xmm2             # xmm2 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm2
	andps	%xmm4, %xmm1
	cvtss2sd	%xmm1, %xmm1
	movapd	%xmm5, %xmm3
	cmpltsd	%xmm1, %xmm3
	andpd	%xmm3, %xmm1
	andnpd	%xmm6, %xmm3
	orpd	%xmm1, %xmm3
	andps	%xmm4, %xmm2
	xorps	%xmm1, %xmm1
	cvtss2sd	%xmm2, %xmm1
	divsd	%xmm3, %xmm1
	cmpunordsd	%xmm7, %xmm7
	movapd	%xmm7, %xmm2
	andpd	%xmm1, %xmm2
	maxsd	%xmm0, %xmm1
	andnpd	%xmm1, %xmm7
	orpd	%xmm2, %xmm7
	incq	%r9
	movapd	%xmm7, %xmm0
	cmpq	%r9, %rcx
	jne	.LBB0_97
	jmp	.LBB0_106
	.p2align	4
.LBB0_84:                               # %.thread.i.i
                                        #   in Loop: Header=BB0_8 Depth=1
	xorl	%ebp, %ebp
	movq	%rbx, 240(%rsp)                 # 8-byte Spill
	cmpq	$0, 224(%rsp)                   # 8-byte Folded Reload
	movq	136(%rsp), %rbx                 # 8-byte Reload
	jne	.LBB0_85
.LBB0_114:                              #   in Loop: Header=BB0_8 Depth=1
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, 304(%rsp)                # 16-byte Spill
	movq	$0, 96(%rsp)                    # 8-byte Folded Spill
	xorl	%r14d, %r14d
	jmp	.LBB0_115
	.p2align	4
.LBB0_98:                               # %_ZL7cpu_refRKSt6vectorI9block_iu4SaIS0_EES4_RS_IfSaIfEEil.exit.thread936
                                        #   in Loop: Header=BB0_8 Depth=1
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	xorl	%esi, %esi
	movq	%r13, %rdx
	callq	memset@PLT
	movq	288(%rsp), %rsi                 # 8-byte Reload
	cmpl	$4, %esi
	jb	.LBB0_94
.LBB0_99:                               # %vector.ph
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	184(%rsp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax def $rax
	andl	$1020, %eax                     # imm = 0x3FC
	movl	$4, %edx
	subq	%rax, %rdx
	xorpd	%xmm1, %xmm1
	movq	$-4, %r8
	pxor	%xmm2, %xmm2
	movq	136(%rsp), %rbx                 # 8-byte Reload
	movq	232(%rsp), %r13                 # 8-byte Reload
	.p2align	4
.LBB0_100:                              # %vector.body
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	%xmm2, %xmm0
	movsd	16(%r14,%r8,4), %xmm3           # xmm3 = mem[0],zero
	movsd	24(%r14,%r8,4), %xmm4           # xmm4 = mem[0],zero
	movq	208(%rsp), %rcx                 # 8-byte Reload
	movsd	16(%rcx,%r8,4), %xmm5           # xmm5 = mem[0],zero
	subps	%xmm3, %xmm5
	movaps	.LCPI0_7(%rip), %xmm10          # xmm10 = [NaN,NaN,NaN,NaN]
	andps	%xmm10, %xmm3
	movsd	24(%rcx,%r8,4), %xmm6           # xmm6 = mem[0],zero
	subps	%xmm4, %xmm6
	andps	%xmm10, %xmm4
	cvtps2pd	%xmm3, %xmm7
	cvtps2pd	%xmm4, %xmm4
	movapd	%xmm1, %xmm3
	movapd	.LCPI0_8(%rip), %xmm9           # xmm9 = [9.9999999999999995E-7,9.9999999999999995E-7]
	movapd	%xmm9, %xmm8
	cmpltpd	%xmm7, %xmm8
	cmpltpd	%xmm4, %xmm9
	andpd	%xmm8, %xmm7
	movapd	.LCPI0_9(%rip), %xmm11          # xmm11 = [1.0E+0,1.0E+0]
	andnpd	%xmm11, %xmm8
	orpd	%xmm7, %xmm8
	andpd	%xmm9, %xmm4
	andnpd	%xmm11, %xmm9
	orpd	%xmm4, %xmm9
	andps	%xmm10, %xmm5
	andps	%xmm10, %xmm6
	cvtps2pd	%xmm5, %xmm4
	divpd	%xmm8, %xmm4
	cvtps2pd	%xmm6, %xmm5
	divpd	%xmm9, %xmm5
	cmpunordpd	%xmm1, %xmm1
	movapd	%xmm4, %xmm6
	andpd	%xmm1, %xmm6
	movapd	%xmm4, %xmm7
	maxpd	%xmm3, %xmm7
	andnpd	%xmm7, %xmm1
	orpd	%xmm6, %xmm1
	cmpunordpd	%xmm2, %xmm2
	movapd	%xmm5, %xmm6
	andpd	%xmm2, %xmm6
	cmpunordpd	%xmm5, %xmm4
	maxpd	%xmm0, %xmm5
	andnpd	%xmm5, %xmm2
	orpd	%xmm6, %xmm2
	movmskpd	%xmm4, %edi
	leaq	4(%r8), %r9
	testl	%edi, %edi
	jne	.LBB0_102
# %bb.101:                              # %vector.body
                                        #   in Loop: Header=BB0_100 Depth=2
	addq	%rdx, %r8
	cmpq	$-4, %r8
	movq	%r9, %r8
	jne	.LBB0_100
.LBB0_102:                              # %middle.block
                                        #   in Loop: Header=BB0_8 Depth=1
	testb	%dil, %dil
	jne	.LBB0_104
# %bb.103:                              # %middle.block
                                        #   in Loop: Header=BB0_8 Depth=1
	movapd	%xmm1, %xmm3
	movapd	%xmm2, %xmm0
.LBB0_104:                              # %middle.block
                                        #   in Loop: Header=BB0_8 Depth=1
	cmoveq	%rax, %r9
	movapd	%xmm0, %xmm1
	maxpd	%xmm3, %xmm1
	cmpunordpd	%xmm3, %xmm3
	andpd	%xmm3, %xmm0
	andnpd	%xmm1, %xmm3
	orpd	%xmm0, %xmm3
	pshufd	$238, %xmm3, %xmm0              # xmm0 = xmm3[2,3,2,3]
	movapd	%xmm3, %xmm7
	cmpunordsd	%xmm3, %xmm7
	movapd	%xmm7, %xmm1
	andpd	%xmm0, %xmm1
	maxsd	%xmm3, %xmm0
	andnpd	%xmm0, %xmm7
	orpd	%xmm1, %xmm7
	cmpq	184(%rsp), %rax                 # 8-byte Folded Reload
	movq	344(%rsp), %rbp                 # 8-byte Reload
	jne	.LBB0_112
# %bb.105:                              # %middle.block
                                        #   in Loop: Header=BB0_8 Depth=1
	testb	%dil, %dil
	movaps	.LCPI0_7(%rip), %xmm4           # xmm4 = [NaN,NaN,NaN,NaN]
	movsd	.LCPI0_10(%rip), %xmm5          # xmm5 = [9.9999999999999995E-7,0.0E+0]
	movsd	.LCPI0_11(%rip), %xmm6          # xmm6 = [1.0E+0,0.0E+0]
	movq	208(%rsp), %rax                 # 8-byte Reload
	movq	184(%rsp), %rcx                 # 8-byte Reload
	jne	.LBB0_96
.LBB0_106:                              # %._crit_edge671
                                        #   in Loop: Header=BB0_8 Depth=1
	leaq	(%r14,%rcx,4), %rax
	movq	%rax, 96(%rsp)                  # 8-byte Spill
	movsd	.LCPI0_12(%rip), %xmm0          # xmm0 = [1.0E-3,0.0E+0]
	ucomisd	%xmm7, %xmm0
	jbe	.LBB0_108
# %bb.107:                              #   in Loop: Header=BB0_8 Depth=1
	movapd	%xmm7, 304(%rsp)                # 16-byte Spill
.LBB0_115:                              # %.preheader397.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
.Ltmp113:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movl	$256, %r8d                      # imm = 0x100
	movq	216(%rsp), %rdi                 # 8-byte Reload
	movl	$1, %esi
	movabsq	$4294967360, %rdx               # imm = 0x100000040
	movl	$1, %ecx
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration@PLT
.Ltmp114:                               # EH_LABEL
# %bb.116:                              #   in Loop: Header=BB0_8 Depth=1
	testl	%eax, %eax
	jne	.LBB0_119
# %bb.117:                              #   in Loop: Header=BB0_8 Depth=1
	movq	120(%rsp), %rax
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rbx, 64(%rsp)
	movq	128(%rsp), %rax                 # 8-byte Reload
	movq	%rax, 56(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 144(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 152(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 160(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 168(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 176(%rsp)
.Ltmp115:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration@PLT
.Ltmp116:                               # EH_LABEL
# %bb.118:                              # %.noexc242
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
.Ltmp117:                               # EH_LABEL
	.cfi_escape 0x2e, 0x10
	leaq	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll(%rip), %rdi
	leaq	144(%rsp), %r9
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.Ltmp118:                               # EH_LABEL
.LBB0_119:                              # %.preheader397.1
                                        #   in Loop: Header=BB0_8 Depth=1
.Ltmp119:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movl	$256, %r8d                      # imm = 0x100
	movq	216(%rsp), %rdi                 # 8-byte Reload
	movl	$1, %esi
	movabsq	$4294967360, %rdx               # imm = 0x100000040
	movl	$1, %ecx
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration@PLT
.Ltmp120:                               # EH_LABEL
# %bb.120:                              #   in Loop: Header=BB0_8 Depth=1
	testl	%eax, %eax
	jne	.LBB0_123
# %bb.121:                              #   in Loop: Header=BB0_8 Depth=1
	movq	120(%rsp), %rax
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rbx, 64(%rsp)
	movq	128(%rsp), %rax                 # 8-byte Reload
	movq	%rax, 56(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 144(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 152(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 160(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 168(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 176(%rsp)
.Ltmp121:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration@PLT
.Ltmp122:                               # EH_LABEL
# %bb.122:                              # %.noexc242.1
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
.Ltmp123:                               # EH_LABEL
	.cfi_escape 0x2e, 0x10
	leaq	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll(%rip), %rdi
	leaq	144(%rsp), %r9
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.Ltmp124:                               # EH_LABEL
.LBB0_123:                              # %.preheader397.2
                                        #   in Loop: Header=BB0_8 Depth=1
.Ltmp125:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movl	$256, %r8d                      # imm = 0x100
	movq	216(%rsp), %rdi                 # 8-byte Reload
	movl	$1, %esi
	movabsq	$4294967360, %rdx               # imm = 0x100000040
	movl	$1, %ecx
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration@PLT
.Ltmp126:                               # EH_LABEL
# %bb.124:                              #   in Loop: Header=BB0_8 Depth=1
	testl	%eax, %eax
	jne	.LBB0_127
# %bb.125:                              #   in Loop: Header=BB0_8 Depth=1
	movq	120(%rsp), %rax
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rbx, 64(%rsp)
	movq	128(%rsp), %rax                 # 8-byte Reload
	movq	%rax, 56(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 144(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 152(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 160(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 168(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 176(%rsp)
.Ltmp127:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration@PLT
.Ltmp128:                               # EH_LABEL
# %bb.126:                              # %.noexc242.2
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
.Ltmp129:                               # EH_LABEL
	.cfi_escape 0x2e, 0x10
	leaq	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll(%rip), %rdi
	leaq	144(%rsp), %r9
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.Ltmp130:                               # EH_LABEL
.LBB0_127:                              # %.preheader397.3
                                        #   in Loop: Header=BB0_8 Depth=1
.Ltmp131:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movl	$256, %r8d                      # imm = 0x100
	movq	216(%rsp), %rdi                 # 8-byte Reload
	movl	$1, %esi
	movabsq	$4294967360, %rdx               # imm = 0x100000040
	movl	$1, %ecx
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration@PLT
.Ltmp132:                               # EH_LABEL
# %bb.128:                              #   in Loop: Header=BB0_8 Depth=1
	testl	%eax, %eax
	jne	.LBB0_131
# %bb.129:                              #   in Loop: Header=BB0_8 Depth=1
	movq	120(%rsp), %rax
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rbx, 64(%rsp)
	movq	128(%rsp), %rax                 # 8-byte Reload
	movq	%rax, 56(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 144(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 152(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 160(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 168(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 176(%rsp)
.Ltmp133:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration@PLT
.Ltmp134:                               # EH_LABEL
# %bb.130:                              # %.noexc242.3
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
.Ltmp135:                               # EH_LABEL
	.cfi_escape 0x2e, 0x10
	leaq	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll(%rip), %rdi
	leaq	144(%rsp), %r9
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.Ltmp136:                               # EH_LABEL
.LBB0_131:                              # %.preheader397.4
                                        #   in Loop: Header=BB0_8 Depth=1
.Ltmp137:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movl	$256, %r8d                      # imm = 0x100
	movq	216(%rsp), %rdi                 # 8-byte Reload
	movl	$1, %esi
	movabsq	$4294967360, %rdx               # imm = 0x100000040
	movl	$1, %ecx
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration@PLT
.Ltmp138:                               # EH_LABEL
# %bb.132:                              #   in Loop: Header=BB0_8 Depth=1
	testl	%eax, %eax
	jne	.LBB0_135
# %bb.133:                              #   in Loop: Header=BB0_8 Depth=1
	movq	120(%rsp), %rax
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rbx, 64(%rsp)
	movq	128(%rsp), %rax                 # 8-byte Reload
	movq	%rax, 56(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 144(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 152(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 160(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 168(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 176(%rsp)
.Ltmp139:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration@PLT
.Ltmp140:                               # EH_LABEL
# %bb.134:                              # %.noexc242.4
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
.Ltmp141:                               # EH_LABEL
	.cfi_escape 0x2e, 0x10
	leaq	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll(%rip), %rdi
	leaq	144(%rsp), %r9
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.Ltmp142:                               # EH_LABEL
.LBB0_135:                              #   in Loop: Header=BB0_8 Depth=1
.Ltmp144:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	callq	hipDeviceSynchronize@PLT
.Ltmp145:                               # EH_LABEL
# %bb.136:                              #   in Loop: Header=BB0_8 Depth=1
.Ltmp147:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	352(%rsp), %rdi
	callq	hipEventCreate@PLT
.Ltmp148:                               # EH_LABEL
# %bb.137:                              #   in Loop: Header=BB0_8 Depth=1
.Ltmp149:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	296(%rsp), %rdi
	callq	hipEventCreate@PLT
.Ltmp150:                               # EH_LABEL
# %bb.138:                              #   in Loop: Header=BB0_8 Depth=1
	movq	352(%rsp), %rdi
.Ltmp152:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	callq	hipEventRecord@PLT
.Ltmp153:                               # EH_LABEL
# %bb.139:                              # %.preheader.preheader
                                        #   in Loop: Header=BB0_8 Depth=1
	movl	$100, %ebx
	jmp	.LBB0_141
	.p2align	4
.LBB0_140:                              #   in Loop: Header=BB0_141 Depth=2
	decl	%ebx
	je	.LBB0_145
.LBB0_141:                              # %.preheader
                                        #   Parent Loop BB0_8 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp154:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	movl	$256, %r8d                      # imm = 0x100
	movq	216(%rsp), %rdi                 # 8-byte Reload
	movl	$1, %esi
	movabsq	$4294967360, %rdx               # imm = 0x100000040
	movl	$1, %ecx
	xorl	%r9d, %r9d
	callq	__hipPushCallConfiguration@PLT
.Ltmp155:                               # EH_LABEL
# %bb.142:                              #   in Loop: Header=BB0_141 Depth=2
	testl	%eax, %eax
	jne	.LBB0_140
# %bb.143:                              #   in Loop: Header=BB0_141 Depth=2
	movq	120(%rsp), %rax
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	%rax, 88(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rdx, 72(%rsp)
	movq	136(%rsp), %rax                 # 8-byte Reload
	movq	%rax, 64(%rsp)
	movq	128(%rsp), %rax                 # 8-byte Reload
	movq	%rax, 56(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 144(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 152(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 160(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 168(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 176(%rsp)
.Ltmp156:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration@PLT
.Ltmp157:                               # EH_LABEL
# %bb.144:                              # %.noexc251
                                        #   in Loop: Header=BB0_141 Depth=2
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
.Ltmp158:                               # EH_LABEL
	.cfi_escape 0x2e, 0x10
	leaq	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll(%rip), %rdi
	leaq	144(%rsp), %r9
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
.Ltmp159:                               # EH_LABEL
	jmp	.LBB0_140
	.p2align	4
.LBB0_145:                              #   in Loop: Header=BB0_8 Depth=1
	movq	296(%rsp), %rdi
.Ltmp161:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	xorl	%esi, %esi
	callq	hipEventRecord@PLT
.Ltmp162:                               # EH_LABEL
# %bb.146:                              #   in Loop: Header=BB0_8 Depth=1
	movq	296(%rsp), %rdi
.Ltmp163:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	callq	hipEventSynchronize@PLT
.Ltmp164:                               # EH_LABEL
# %bb.147:                              #   in Loop: Header=BB0_8 Depth=1
	movl	$0, 144(%rsp)
	movq	352(%rsp), %rsi
	movq	296(%rsp), %rdx
.Ltmp166:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	144(%rsp), %rdi
	callq	hipEventElapsedTime@PLT
.Ltmp167:                               # EH_LABEL
# %bb.148:                              #   in Loop: Header=BB0_8 Depth=1
	movss	144(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	divss	.LCPI0_13(%rip), %xmm0
	movss	%xmm0, 144(%rsp)
	cvtss2sd	%xmm0, %xmm1
	movaps	%xmm1, %xmm3
	mulsd	.LCPI0_14(%rip), %xmm3
	movsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	ucomisd	.LCPI0_15(%rip), %xmm0
	leaq	.L.str.7(%rip), %rcx
	leaq	.L.str.6(%rip), %rax
	cmovaq	%rax, %rcx
	movsd	368(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	divsd	%xmm3, %xmm2
	movapd	%xmm2, %xmm3
	mulsd	.LCPI0_16(%rip), %xmm3
	divsd	.LCPI0_1(%rip), %xmm3
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.5(%rip), %rdi
	movq	224(%rsp), %rsi                 # 8-byte Reload
                                        # kill: def $esi killed $esi killed $rsi
	movq	280(%rsp), %rdx                 # 8-byte Reload
                                        # kill: def $edx killed $edx killed $rdx
	movaps	304(%rsp), %xmm4                # 16-byte Reload
	movb	$5, %al
	callq	printf@PLT
	movq	120(%rsp), %rdi
.Ltmp169:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	callq	hipFree@PLT
.Ltmp170:                               # EH_LABEL
# %bb.149:                              #   in Loop: Header=BB0_8 Depth=1
	movq	112(%rsp), %rdi
.Ltmp171:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	callq	hipFree@PLT
.Ltmp172:                               # EH_LABEL
# %bb.150:                              #   in Loop: Header=BB0_8 Depth=1
	movq	104(%rsp), %rdi
.Ltmp173:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	callq	hipFree@PLT
.Ltmp174:                               # EH_LABEL
# %bb.151:                              #   in Loop: Header=BB0_8 Depth=1
	testq	%r14, %r14
	jne	.LBB0_152
# %bb.153:                              # %_ZNSt6vectorIfSaIfEED2Ev.exit
                                        #   in Loop: Header=BB0_8 Depth=1
	testq	%rbp, %rbp
	je	.LBB0_155
.LBB0_154:                              #   in Loop: Header=BB0_8 Depth=1
	movq	240(%rsp), %rsi                 # 8-byte Reload
	subq	%rbp, %rsi
	.cfi_escape 0x2e, 0x00
	movq	%rbp, %rdi
	callq	_ZdlPvm@PLT
.LBB0_155:                              # %_ZNSt6vectorI9block_iu4SaIS0_EED2Ev.exit
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	272(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_157
# %bb.156:                              #   in Loop: Header=BB0_8 Depth=1
	movq	248(%rsp), %rsi                 # 8-byte Reload
	subq	%rdi, %rsi
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPvm@PLT
.LBB0_157:                              # %_ZNSt6vectorIfSaIfEED2Ev.exit258
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	208(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_159
# %bb.158:                              #   in Loop: Header=BB0_8 Depth=1
	subq	%rdi, %r13
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rsi
	callq	_ZdlPvm@PLT
.LBB0_159:                              # %_ZNSt6vectorIfSaIfEED2Ev.exit260
                                        #   in Loop: Header=BB0_8 Depth=1
	testq	%r12, %r12
	je	.LBB0_161
# %bb.160:                              #   in Loop: Header=BB0_8 Depth=1
	movq	256(%rsp), %rsi                 # 8-byte Reload
	subq	%r12, %rsi
	.cfi_escape 0x2e, 0x00
	movq	%r12, %rdi
	callq	_ZdlPvm@PLT
.LBB0_161:                              # %_ZNSt6vectorI9block_iu4SaIS0_EED2Ev.exit263
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	200(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_7
# %bb.162:                              #   in Loop: Header=BB0_8 Depth=1
	movq	264(%rsp), %rsi                 # 8-byte Reload
	subq	%rdi, %rsi
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPvm@PLT
	jmp	.LBB0_7
	.p2align	4
.LBB0_108:                              #   in Loop: Header=BB0_8 Depth=1
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.4(%rip), %rdi
                                        # kill: def $esi killed $esi killed $rsi
	movq	280(%rsp), %rdx                 # 8-byte Reload
                                        # kill: def $edx killed $edx killed $rdx
	movapd	%xmm7, %xmm0
                                        # kill: def $ecx killed $ecx killed $rcx
	movb	$1, %al
	callq	printf@PLT
	movq	120(%rsp), %rdi
.Ltmp107:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	callq	hipFree@PLT
.Ltmp108:                               # EH_LABEL
# %bb.109:                              #   in Loop: Header=BB0_8 Depth=1
	movq	112(%rsp), %rdi
.Ltmp109:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	callq	hipFree@PLT
.Ltmp110:                               # EH_LABEL
# %bb.110:                              #   in Loop: Header=BB0_8 Depth=1
	movl	$1, %eax
	movq	%rax, 328(%rsp)                 # 8-byte Spill
	movq	104(%rsp), %rdi
.Ltmp111:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	callq	hipFree@PLT
.Ltmp112:                               # EH_LABEL
.LBB0_152:                              # %.thread
                                        #   in Loop: Header=BB0_8 Depth=1
	movq	96(%rsp), %rsi                  # 8-byte Reload
	subq	%r14, %rsi
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_ZdlPvm@PLT
	testq	%rbp, %rbp
	jne	.LBB0_154
	jmp	.LBB0_155
.LBB0_112:                              #   in Loop: Header=BB0_8 Depth=1
	movaps	.LCPI0_7(%rip), %xmm4           # xmm4 = [NaN,NaN,NaN,NaN]
	movsd	.LCPI0_10(%rip), %xmm5          # xmm5 = [9.9999999999999995E-7,0.0E+0]
	movsd	.LCPI0_11(%rip), %xmm6          # xmm6 = [1.0E+0,0.0E+0]
	movq	208(%rsp), %rax                 # 8-byte Reload
	jmp	.LBB0_95
.LBB0_113:                              #   in Loop: Header=BB0_8 Depth=1
	movq	200(%rsp), %rcx                 # 8-byte Reload
	movzwl	16(%rcx), %eax
	movw	%ax, 16(%rbp)
	movupd	(%rcx), %xmm0
	movupd	%xmm0, (%rbp)
	cmpq	$0, 224(%rsp)                   # 8-byte Folded Reload
	movq	136(%rsp), %rbx                 # 8-byte Reload
	jne	.LBB0_85
	jmp	.LBB0_114
.LBB0_163:                              # %_ZNSt6vectorISt4pairIiiESaIS1_EED2Ev.exit
	.cfi_escape 0x2e, 0x00
	movl	$16, %esi
	movq	%rbp, %rdi
	callq	_ZdlPvm@PLT
	movq	328(%rsp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	addq	$5400, %rsp                     # imm = 0x1518
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_164:
	.cfi_def_cfa_offset 5456
.Ltmp185:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.8(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Ltmp186:                               # EH_LABEL
# %bb.165:                              # %.noexc
.LBB0_166:
.Ltmp182:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.8(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Ltmp183:                               # EH_LABEL
# %bb.167:                              # %.noexc201
.LBB0_168:
.Ltmp179:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.8(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Ltmp180:                               # EH_LABEL
# %bb.169:                              # %.noexc215
.LBB0_170:
.Ltmp176:                               # EH_LABEL
	.cfi_escape 0x2e, 0x00
	leaq	.L.str.8(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Ltmp177:                               # EH_LABEL
# %bb.171:                              # %.noexc.i
.LBB0_172:                              # %.loopexit399
.Ltmp5:                                 # EH_LABEL
	jmp	.LBB0_173
.LBB0_174:                              # %.loopexit404
.Ltmp94:                                # EH_LABEL
	movq	%rax, %rbx
	testq	%r12, %r12
	je	.LBB0_198
	jmp	.LBB0_207
.LBB0_175:                              # %_ZNSt12_Vector_baseI9block_iu4SaIS0_EED2Ev.exit.i.loopexit
.Ltmp103:                               # EH_LABEL
	movq	%rax, %rbx
	movq	272(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_196
	jmp	.LBB0_203
.LBB0_176:                              # %_ZNSt6vectorIfSaIfEED2Ev.exit273.thread
.Ltmp97:                                # EH_LABEL
	movq	%rax, %rbx
	movq	%r14, %rdi
	jmp	.LBB0_204
.LBB0_177:
.Ltmp106:                               # EH_LABEL
	movq	%rax, %rbx
	movq	232(%rsp), %r13                 # 8-byte Reload
	testq	%rbp, %rbp
	je	.LBB0_195
	jmp	.LBB0_202
.LBB0_178:                              # %.loopexit
.Ltmp2:                                 # EH_LABEL
	movq	%rax, %rbx
	jmp	.LBB0_200
.LBB0_179:
.Ltmp168:                               # EH_LABEL
	jmp	.LBB0_193
.LBB0_180:
.Ltmp100:                               # EH_LABEL
	movq	%rax, %rbx
	movq	272(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_196
	jmp	.LBB0_203
.LBB0_181:                              # %_ZNSt12_Vector_baseI9block_iu4SaIS0_EED2Ev.exit.i.loopexit.split-lp
.Ltmp178:                               # EH_LABEL
	movq	%rax, %rbx
	movq	272(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_196
	jmp	.LBB0_203
.LBB0_182:                              # %.loopexit.split-lp405
.Ltmp181:                               # EH_LABEL
	movq	%rax, %rbx
	testq	%r12, %r12
	je	.LBB0_198
	jmp	.LBB0_207
.LBB0_183:                              # %.loopexit.split-lp400
.Ltmp184:                               # EH_LABEL
.LBB0_173:                              # %.loopexit399
	movq	%rax, %rbx
	movq	192(%rsp), %rbp                 # 8-byte Reload
	movq	200(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	jne	.LBB0_199
	jmp	.LBB0_200
.LBB0_184:                              # %.loopexit.split-lp
.Ltmp187:                               # EH_LABEL
	movq	%rax, %rbx
	movq	192(%rsp), %rbp                 # 8-byte Reload
	jmp	.LBB0_200
.LBB0_185:
.Ltmp151:                               # EH_LABEL
	jmp	.LBB0_193
.LBB0_186:
.Ltmp146:                               # EH_LABEL
	jmp	.LBB0_193
.LBB0_187:
.Ltmp175:                               # EH_LABEL
	jmp	.LBB0_193
.LBB0_188:
.Ltmp165:                               # EH_LABEL
	jmp	.LBB0_193
.LBB0_189:
.Ltmp91:                                # EH_LABEL
	movq	%rax, %rbx
	testq	%r12, %r12
	je	.LBB0_198
	jmp	.LBB0_207
.LBB0_190:
.Ltmp82:                                # EH_LABEL
	movq	%rax, %rbx
	testq	%r12, %r12
	je	.LBB0_198
	jmp	.LBB0_207
.LBB0_191:
.Ltmp143:                               # EH_LABEL
	jmp	.LBB0_193
.LBB0_192:
.Ltmp160:                               # EH_LABEL
.LBB0_193:
	movq	%rax, %rbx
	testq	%r14, %r14
	jne	.LBB0_201
# %bb.194:                              # %_ZNSt6vectorIfSaIfEED2Ev.exit268
	testq	%rbp, %rbp
	jne	.LBB0_202
.LBB0_195:                              # %.body
	movq	272(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	jne	.LBB0_203
.LBB0_196:                              # %_ZNSt6vectorIfSaIfEED2Ev.exit273
	movq	208(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	jne	.LBB0_204
.LBB0_197:
	testq	%r12, %r12
	jne	.LBB0_207
.LBB0_198:                              # %_ZNSt6vectorI9block_iu4SaIS0_EED2Ev.exit278
	movq	192(%rsp), %rbp                 # 8-byte Reload
	movq	200(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_200
.LBB0_199:
	movq	264(%rsp), %rsi                 # 8-byte Reload
	subq	%rdi, %rsi
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPvm@PLT
.LBB0_200:                              # %_ZNSt6vectorI9block_iu4SaIS0_EED2Ev.exit281
	.cfi_escape 0x2e, 0x00
	movl	$16, %esi
	movq	%rbp, %rdi
	callq	_ZdlPvm@PLT
	.cfi_escape 0x2e, 0x00
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.LBB0_201:
	movq	96(%rsp), %rsi                  # 8-byte Reload
	subq	%r14, %rsi
	.cfi_escape 0x2e, 0x00
	movq	%r14, %rdi
	callq	_ZdlPvm@PLT
	testq	%rbp, %rbp
	je	.LBB0_195
.LBB0_202:
	movq	240(%rsp), %rsi                 # 8-byte Reload
	subq	%rbp, %rsi
	.cfi_escape 0x2e, 0x00
	movq	%rbp, %rdi
	callq	_ZdlPvm@PLT
	movq	272(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_196
.LBB0_203:
	movq	248(%rsp), %rsi                 # 8-byte Reload
	subq	%rdi, %rsi
	.cfi_escape 0x2e, 0x00
	callq	_ZdlPvm@PLT
	movq	208(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	je	.LBB0_197
.LBB0_204:
	subq	%rdi, %r13
	.cfi_escape 0x2e, 0x00
	movq	%r13, %rsi
	callq	_ZdlPvm@PLT
	testq	%r12, %r12
	je	.LBB0_198
	jmp	.LBB0_207
.LBB0_205:
.Ltmp71:                                # EH_LABEL
	movq	%rax, %rbx
	testq	%r12, %r12
	je	.LBB0_198
	jmp	.LBB0_207
.LBB0_206:
.Ltmp38:                                # EH_LABEL
	movq	%rax, %rbx
	testq	%r12, %r12
	je	.LBB0_198
.LBB0_207:
	movq	256(%rsp), %rsi                 # 8-byte Reload
	subq	%r12, %rsi
	.cfi_escape 0x2e, 0x00
	movq	%r12, %rdi
	callq	_ZdlPvm@PLT
	movq	192(%rsp), %rbp                 # 8-byte Reload
	movq	200(%rsp), %rdi                 # 8-byte Reload
	testq	%rdi, %rdi
	jne	.LBB0_199
	jmp	.LBB0_200
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2, 0x0
GCC_except_table0:
.Lexception0:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end0-.Lcst_begin0
.Lcst_begin0:
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    # >> Call Site 1 <<
	.uleb128 .Ltmp0-.Lfunc_begin0           #   Call between .Lfunc_begin0 and .Ltmp0
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp0-.Lfunc_begin0           # >> Call Site 2 <<
	.uleb128 .Ltmp1-.Ltmp0                  #   Call between .Ltmp0 and .Ltmp1
	.uleb128 .Ltmp2-.Lfunc_begin0           #     jumps to .Ltmp2
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp3-.Lfunc_begin0           # >> Call Site 3 <<
	.uleb128 .Ltmp4-.Ltmp3                  #   Call between .Ltmp3 and .Ltmp4
	.uleb128 .Ltmp5-.Lfunc_begin0           #     jumps to .Ltmp5
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp6-.Lfunc_begin0           # >> Call Site 4 <<
	.uleb128 .Ltmp37-.Ltmp6                 #   Call between .Ltmp6 and .Ltmp37
	.uleb128 .Ltmp38-.Lfunc_begin0          #     jumps to .Ltmp38
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp39-.Lfunc_begin0          # >> Call Site 5 <<
	.uleb128 .Ltmp70-.Ltmp39                #   Call between .Ltmp39 and .Ltmp70
	.uleb128 .Ltmp71-.Lfunc_begin0          #     jumps to .Ltmp71
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp72-.Lfunc_begin0          # >> Call Site 6 <<
	.uleb128 .Ltmp81-.Ltmp72                #   Call between .Ltmp72 and .Ltmp81
	.uleb128 .Ltmp82-.Lfunc_begin0          #     jumps to .Ltmp82
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp83-.Lfunc_begin0          # >> Call Site 7 <<
	.uleb128 .Ltmp90-.Ltmp83                #   Call between .Ltmp83 and .Ltmp90
	.uleb128 .Ltmp91-.Lfunc_begin0          #     jumps to .Ltmp91
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp92-.Lfunc_begin0          # >> Call Site 8 <<
	.uleb128 .Ltmp93-.Ltmp92                #   Call between .Ltmp92 and .Ltmp93
	.uleb128 .Ltmp94-.Lfunc_begin0          #     jumps to .Ltmp94
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp93-.Lfunc_begin0          # >> Call Site 9 <<
	.uleb128 .Ltmp95-.Ltmp93                #   Call between .Ltmp93 and .Ltmp95
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp95-.Lfunc_begin0          # >> Call Site 10 <<
	.uleb128 .Ltmp96-.Ltmp95                #   Call between .Ltmp95 and .Ltmp96
	.uleb128 .Ltmp97-.Lfunc_begin0          #     jumps to .Ltmp97
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp96-.Lfunc_begin0          # >> Call Site 11 <<
	.uleb128 .Ltmp98-.Ltmp96                #   Call between .Ltmp96 and .Ltmp98
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp98-.Lfunc_begin0          # >> Call Site 12 <<
	.uleb128 .Ltmp99-.Ltmp98                #   Call between .Ltmp98 and .Ltmp99
	.uleb128 .Ltmp100-.Lfunc_begin0         #     jumps to .Ltmp100
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp101-.Lfunc_begin0         # >> Call Site 13 <<
	.uleb128 .Ltmp102-.Ltmp101              #   Call between .Ltmp101 and .Ltmp102
	.uleb128 .Ltmp103-.Lfunc_begin0         #     jumps to .Ltmp103
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp102-.Lfunc_begin0         # >> Call Site 14 <<
	.uleb128 .Ltmp104-.Ltmp102              #   Call between .Ltmp102 and .Ltmp104
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp104-.Lfunc_begin0         # >> Call Site 15 <<
	.uleb128 .Ltmp105-.Ltmp104              #   Call between .Ltmp104 and .Ltmp105
	.uleb128 .Ltmp106-.Lfunc_begin0         #     jumps to .Ltmp106
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp105-.Lfunc_begin0         # >> Call Site 16 <<
	.uleb128 .Ltmp113-.Ltmp105              #   Call between .Ltmp105 and .Ltmp113
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp113-.Lfunc_begin0         # >> Call Site 17 <<
	.uleb128 .Ltmp142-.Ltmp113              #   Call between .Ltmp113 and .Ltmp142
	.uleb128 .Ltmp143-.Lfunc_begin0         #     jumps to .Ltmp143
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp144-.Lfunc_begin0         # >> Call Site 18 <<
	.uleb128 .Ltmp145-.Ltmp144              #   Call between .Ltmp144 and .Ltmp145
	.uleb128 .Ltmp146-.Lfunc_begin0         #     jumps to .Ltmp146
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp147-.Lfunc_begin0         # >> Call Site 19 <<
	.uleb128 .Ltmp150-.Ltmp147              #   Call between .Ltmp147 and .Ltmp150
	.uleb128 .Ltmp151-.Lfunc_begin0         #     jumps to .Ltmp151
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp152-.Lfunc_begin0         # >> Call Site 20 <<
	.uleb128 .Ltmp153-.Ltmp152              #   Call between .Ltmp152 and .Ltmp153
	.uleb128 .Ltmp165-.Lfunc_begin0         #     jumps to .Ltmp165
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp154-.Lfunc_begin0         # >> Call Site 21 <<
	.uleb128 .Ltmp159-.Ltmp154              #   Call between .Ltmp154 and .Ltmp159
	.uleb128 .Ltmp160-.Lfunc_begin0         #     jumps to .Ltmp160
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp161-.Lfunc_begin0         # >> Call Site 22 <<
	.uleb128 .Ltmp164-.Ltmp161              #   Call between .Ltmp161 and .Ltmp164
	.uleb128 .Ltmp165-.Lfunc_begin0         #     jumps to .Ltmp165
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp166-.Lfunc_begin0         # >> Call Site 23 <<
	.uleb128 .Ltmp167-.Ltmp166              #   Call between .Ltmp166 and .Ltmp167
	.uleb128 .Ltmp168-.Lfunc_begin0         #     jumps to .Ltmp168
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp169-.Lfunc_begin0         # >> Call Site 24 <<
	.uleb128 .Ltmp174-.Ltmp169              #   Call between .Ltmp169 and .Ltmp174
	.uleb128 .Ltmp175-.Lfunc_begin0         #     jumps to .Ltmp175
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp107-.Lfunc_begin0         # >> Call Site 25 <<
	.uleb128 .Ltmp112-.Ltmp107              #   Call between .Ltmp107 and .Ltmp112
	.uleb128 .Ltmp146-.Lfunc_begin0         #     jumps to .Ltmp146
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp185-.Lfunc_begin0         # >> Call Site 26 <<
	.uleb128 .Ltmp186-.Ltmp185              #   Call between .Ltmp185 and .Ltmp186
	.uleb128 .Ltmp187-.Lfunc_begin0         #     jumps to .Ltmp187
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp182-.Lfunc_begin0         # >> Call Site 27 <<
	.uleb128 .Ltmp183-.Ltmp182              #   Call between .Ltmp182 and .Ltmp183
	.uleb128 .Ltmp184-.Lfunc_begin0         #     jumps to .Ltmp184
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp179-.Lfunc_begin0         # >> Call Site 28 <<
	.uleb128 .Ltmp180-.Ltmp179              #   Call between .Ltmp179 and .Ltmp180
	.uleb128 .Ltmp181-.Lfunc_begin0         #     jumps to .Ltmp181
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp176-.Lfunc_begin0         # >> Call Site 29 <<
	.uleb128 .Ltmp177-.Ltmp176              #   Call between .Ltmp176 and .Ltmp177
	.uleb128 .Ltmp178-.Lfunc_begin0         #     jumps to .Ltmp178
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp177-.Lfunc_begin0         # >> Call Site 30 <<
	.uleb128 .Lfunc_end0-.Ltmp177           #   Call between .Ltmp177 and .Lfunc_end0
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end0:
	.p2align	2, 0x0
                                        # -- End function
	.text
	.prefalign	4, .Lfunc_end1, nop     # -- Begin function _ZL30__device_stub__k_mmvq_dot8_iu4PKcPK9block_iu4Pfll
	.type	_ZL30__device_stub__k_mmvq_dot8_iu4PKcPK9block_iu4Pfll,@function
_ZL30__device_stub__k_mmvq_dot8_iu4PKcPK9block_iu4Pfll: # @_ZL30__device_stub__k_mmvq_dot8_iu4PKcPK9block_iu4Pfll
	.cfi_startproc
# %bb.0:
	subq	$136, %rsp
	.cfi_def_cfa_offset 144
	movq	%rdi, 88(%rsp)
	movq	%rsi, 80(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rcx, 64(%rsp)
	movq	%r8, 56(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 96(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 104(%rsp)
	leaq	72(%rsp), %rax
	movq	%rax, 112(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 120(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 128(%rsp)
	leaq	40(%rsp), %rdi
	leaq	24(%rsp), %rsi
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rcx
	callq	__hipPopCallConfiguration@PLT
	movq	40(%rsp), %rsi
	movl	48(%rsp), %edx
	movq	24(%rsp), %rcx
	movl	32(%rsp), %r8d
	leaq	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll(%rip), %rdi
	leaq	96(%rsp), %r9
	pushq	8(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	24(%rsp)
	.cfi_adjust_cfa_offset 8
	callq	hipLaunchKernel@PLT
	addq	$152, %rsp
	.cfi_adjust_cfa_offset -152
	retq
.Lfunc_end1:
	.size	_ZL30__device_stub__k_mmvq_dot8_iu4PKcPK9block_iu4Pfll, .Lfunc_end1-_ZL30__device_stub__k_mmvq_dot8_iu4PKcPK9block_iu4Pfll
	.cfi_endproc
                                        # -- End function
	.section	.text._ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE,"axG",@progbits,_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE,comdat
	.weak	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE # -- Begin function _ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
	.p2align	1
	.prefalign	4, .Lfunc_end2, nop
	.type	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE,@function
_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE: # @_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movslq	4(%rdx), %r15
	movq	%rdx, 8(%rsp)                   # 8-byte Spill
	movslq	(%rdx), %rax
	subq	%rax, %r15
	movl	$4294967294, %eax               # imm = 0xFFFFFFFE
	cmpq	%rax, %r15
	ja	.LBB2_6
# %bb.1:
	leal	1(%r15), %r12d
	movq	%r14, %rdi
	callq	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	imulq	%r12, %rax
	cmpl	%eax, %r15d
	jb	.LBB2_5
# %bb.2:
	notl	%r15d
	movq	%rax, %rcx
	movl	%r15d, %eax
	xorl	%edx, %edx
	divl	%r12d
	movq	%rcx, %rax
	cmpl	%eax, %edx
	jbe	.LBB2_5
# %bb.3:                                # %.lr.ph.i.preheader
	movl	%edx, %ebp
	.p2align	4
.LBB2_4:                                # %.lr.ph.i
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	callq	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	imulq	%r12, %rax
	cmpl	%eax, %ebp
	ja	.LBB2_4
.LBB2_5:                                # %_ZNSt24uniform_int_distributionIiE5_S_ndImSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEjEET1_RT0_S4_.exit
	shrq	$32, %rax
	jmp	.LBB2_10
.LBB2_6:
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpq	%rax, %r15
	jne	.LBB2_7
# %bb.9:
	movq	%r14, %rdi
	callq	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	jmp	.LBB2_10
.LBB2_7:                                # %.preheader
	movq	%rdi, %r12
	movabsq	$-4294967296, %rbx              # imm = 0xFFFFFFFF00000000
	leaq	16(%rsp), %r13
	.p2align	4
.LBB2_8:                                # =>This Inner Loop Header: Depth=1
	movq	%rbx, 16(%rsp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r13, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
	movl	%eax, %ebp
	shlq	$32, %rbp
	movq	%r14, %rdi
	callq	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	addq	%rbp, %rax
	setb	%cl
	cmpq	%r15, %rax
	seta	%dl
	orb	%cl, %dl
	jne	.LBB2_8
.LBB2_10:                               # %.loopexit
	movq	8(%rsp), %rcx                   # 8-byte Reload
	addl	(%rcx), %eax
                                        # kill: def $eax killed $eax killed $rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE, .Lfunc_end2-_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          # -- Begin function _ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
.LCPI3_0:
	.quad	-2147483648                     # 0xffffffff80000000
	.quad	-2147483648                     # 0xffffffff80000000
.LCPI3_1:
	.quad	2147483646                      # 0x7ffffffe
	.quad	2147483646                      # 0x7ffffffe
.LCPI3_2:
	.quad	2567483615                      # 0x9908b0df
	.quad	2567483615                      # 0x9908b0df
	.section	.text._ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv,comdat
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	.p2align	1
	.prefalign	4, .Lfunc_end3, nop
	.type	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv,@function
_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv: # @_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	.cfi_startproc
# %bb.0:
	movq	4992(%rdi), %rax
	cmpq	$624, %rax                      # imm = 0x270
	jb	.LBB3_6
# %bb.1:                                # %vector.ph
	movq	(%rdi), %xmm0                   # xmm0 = mem[0],zero
	pshufd	$68, %xmm0, %xmm3               # xmm3 = xmm0[0,1,0,1]
	xorl	%eax, %eax
	movaps	.LCPI3_0(%rip), %xmm0           # xmm0 = [18446744071562067968,18446744071562067968]
	movaps	.LCPI3_1(%rip), %xmm1           # xmm1 = [2147483646,2147483646]
	movdqa	.LCPI3_2(%rip), %xmm2           # xmm2 = [2567483615,2567483615]
	.p2align	4
.LBB3_2:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movdqa	%xmm3, %xmm4
	movups	8(%rdi,%rax,8), %xmm3
	shufps	$78, %xmm3, %xmm4               # xmm4 = xmm4[2,3],xmm3[0,1]
	andps	%xmm0, %xmm4
	movaps	%xmm3, %xmm5
	andps	%xmm1, %xmm5
	orps	%xmm4, %xmm5
	movdqu	3176(%rdi,%rax,8), %xmm4
	psrlq	$1, %xmm5
	pxor	%xmm4, %xmm5
	pshufd	$160, %xmm3, %xmm4              # xmm4 = xmm3[0,0,2,2]
	pslld	$31, %xmm4
	psrad	$31, %xmm4
	pand	%xmm2, %xmm4
	pxor	%xmm5, %xmm4
	movdqu	%xmm4, (%rdi,%rax,8)
	addq	$2, %rax
	cmpq	$226, %rax
	jne	.LBB3_2
# %bb.3:                                # %vector.ph11
	movl	$2567483615, %eax               # imm = 0x9908B0DF
	pshufd	$238, %xmm3, %xmm3              # xmm3 = xmm3[2,3,2,3]
	movq	%xmm3, %rcx
	andq	$-2147483648, %rcx              # imm = 0x80000000
	movq	1816(%rdi), %rdx
	movl	%edx, %esi
	movq	%rdx, %xmm3
                                        # kill: def $edx killed $edx killed $rdx def $rdx
	andl	$2147483646, %edx               # imm = 0x7FFFFFFE
	orq	%rcx, %rdx
	shrq	%rdx
	xorq	4984(%rdi), %rdx
	andl	$1, %esi
	negl	%esi
	movl	$2567483615, %ecx               # imm = 0x9908B0DF
	andl	%esi, %ecx
	xorq	%rdx, %rcx
	movq	%rcx, 1808(%rdi)
	pshufd	$68, %xmm3, %xmm3               # xmm3 = xmm3[0,1,0,1]
	movl	$228, %ecx
	.p2align	4
.LBB3_4:                                # %vector.body12
                                        # =>This Inner Loop Header: Depth=1
	movups	(%rdi,%rcx,8), %xmm4
	shufps	$78, %xmm4, %xmm3               # xmm3 = xmm3[2,3],xmm4[0,1]
	andps	%xmm0, %xmm3
	movaps	%xmm4, %xmm5
	andps	%xmm1, %xmm5
	orps	%xmm3, %xmm5
	movdqu	-1824(%rdi,%rcx,8), %xmm3
	psrlq	$1, %xmm5
	pxor	%xmm3, %xmm5
	pshufd	$160, %xmm4, %xmm3              # xmm3 = xmm4[0,0,2,2]
	pslld	$31, %xmm3
	psrad	$31, %xmm3
	pand	%xmm2, %xmm3
	pxor	%xmm5, %xmm3
	movdqu	%xmm3, -8(%rdi,%rcx,8)
	addq	$2, %rcx
	movdqa	%xmm4, %xmm3
	cmpq	$624, %rcx                      # imm = 0x270
	jne	.LBB3_4
# %bb.5:                                # %_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv.exit
	movq	$-2147483648, %rcx              # imm = 0x80000000
	andq	4984(%rdi), %rcx
	movq	(%rdi), %rdx
	movl	%edx, %esi
	andl	$2147483646, %esi               # imm = 0x7FFFFFFE
	orq	%rcx, %rsi
	shrq	%rsi
	xorq	3168(%rdi), %rsi
	andl	$1, %edx
	negl	%edx
	andl	%eax, %edx
	xorq	%rsi, %rdx
	movq	%rdx, 4984(%rdi)
	xorl	%eax, %eax
.LBB3_6:
	leaq	1(%rax), %rcx
	movq	%rcx, 4992(%rdi)
	movq	(%rdi,%rax,8), %rax
	movq	%rax, %rcx
	shrq	$11, %rcx
	movl	%ecx, %ecx
	xorq	%rax, %rcx
	movl	%ecx, %eax
	shll	$7, %eax
	andl	$-1658038656, %eax              # imm = 0x9D2C5680
	xorq	%rcx, %rax
	movl	%eax, %ecx
	shll	$15, %ecx
	andl	$-272236544, %ecx               # imm = 0xEFC60000
	xorq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$18, %rax
	xorq	%rcx, %rax
	retq
.Lfunc_end3:
	.size	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv, .Lfunc_end3-_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	.cfi_endproc
                                        # -- End function
	.text
	.prefalign	4, .Lfunc_end4, nop     # -- Begin function __hip_module_ctor
	.type	__hip_module_ctor,@function
__hip_module_ctor:                      # @__hip_module_ctor
	.cfi_startproc
# %bb.0:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	__hip_gpubin_handle_491e1b2d025fd0c8(%rip), %rdi
	testq	%rdi, %rdi
	jne	.LBB4_2
# %bb.1:
	leaq	__hip_fatbin_wrapper(%rip), %rdi
	callq	__hipRegisterFatBinary@PLT
	movq	%rax, %rdi
	movq	%rax, __hip_gpubin_handle_491e1b2d025fd0c8(%rip)
.LBB4_2:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rsp)
	movups	%xmm0, (%rsp)
	leaq	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll(%rip), %rsi
	leaq	.L__unnamed_1(%rip), %rcx
	movq	%rcx, %rdx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	__hipRegisterFunction@PLT
	leaq	__hip_module_dtor(%rip), %rdi
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	jmp	atexit@PLT                      # TAILCALL
.Lfunc_end4:
	.size	__hip_module_ctor, .Lfunc_end4-__hip_module_ctor
	.cfi_endproc
                                        # -- End function
	.prefalign	4, .Lfunc_end5, nop     # -- Begin function __hip_module_dtor
	.type	__hip_module_dtor,@function
__hip_module_dtor:                      # @__hip_module_dtor
	.cfi_startproc
# %bb.0:
	movq	__hip_gpubin_handle_491e1b2d025fd0c8(%rip), %rdi
	testq	%rdi, %rdi
	je	.LBB5_2
# %bb.1:
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__hipUnregisterFatBinary@PLT
	movq	$0, __hip_gpubin_handle_491e1b2d025fd0c8(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
.LBB5_2:
	retq
.Lfunc_end5:
	.size	__hip_module_dtor, .Lfunc_end5-__hip_module_dtor
	.cfi_endproc
                                        # -- End function
	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"    roofline reference: %.0f GB/s measured streaming DRAM\n"
	.size	.L.str.1, 59

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"    NOTE: >100%% of roofline means the working set fit in cache,\n"
	.size	.L.str.2, 66

	.type	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll,@object # @_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll
	.section	.data.rel.ro,"aw",@progbits
	.p2align	3, 0x0
_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll:
	.quad	_ZL30__device_stub__k_mmvq_dot8_iu4PKcPK9block_iu4Pfll
	.size	_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll, 8

	.type	.L.str.4,@object                # @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"N=%-6d K=%-6d | CORRECTNESS FAIL (max_rel_err=%.3e over %d rows)\n"
	.size	.L.str.4, 66

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"N=%-6d K=%-6d | %7.1f MiB %-14s | %.4f ms | %3.0f GB/s | %2.0f%% of roofline | max_rel_err=%.1e PASS\n"
	.size	.L.str.5, 102

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"(DRAM-honest)"
	.size	.L.str.6, 14

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"(CACHE-RESIDENT!)"
	.size	.L.str.7, 18

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"cannot create std::vector larger than max_size()"
	.size	.L.str.8, 49

	.type	.L__unnamed_1,@object           # @0
.L__unnamed_1:
	.asciz	"_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll"
	.size	.L__unnamed_1, 40

	.type	.L__unnamed_2,@object           # @1
	.section	.hip_fatbin,"a",@progbits
	.p2align	12, 0x0
.L__unnamed_2:
	.asciz	"__CLANG_OFFLOAD_BUNDLE__\002\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\036\000\000\000\000\000\000\000host-x86_64-unknown-linux-gnu-\000\020\000\000\000\000\000\000\350\024\000\000\000\000\000\000 \000\000\000\000\000\000\000hipv4-amdgcn-amd-amdhsa--gfx1201\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\177ELF\002\001\001@\004\000\000\000\000\000\000\000\003\000\340\000\001\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\250\020\000\000\000\000\000\000N\000\000\000@\0008\000\t\000@\000\021\000\017\000\006\000\000\000\004\000\000\000@\000\000\000\000\000\000\000@\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\370\001\000\000\000\000\000\000\370\001\000\000\000\000\000\000\b\000\000\000\000\000\000\000\001\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\n\000\000\000\000\000\000\000\n\000\000\000\000\000\000\000\020\000\000\000\000\000\000\001\000\000\000\005\000\000\000\000\n\000\000\000\000\000\000\000\032\000\000\000\000\000\000\000\032\000\000\000\000\000\000\254\002\000\000\000\000\000\000\254\002\000\000\000\000\000\000\000\020\000\000\000\000\000\000\001\000\000\000\006\000\000\000\260\f\000\000\000\000\000\000\260,\000\000\000\000\000\000\260,\000\000\000\000\000\000p\000\000\000\000\000\000\000P\003\000\000\000\000\000\000\000\020\000\000\000\000\000\000\001\000\000\000\006\000\000\000 \r\000\000\000\000\000\000 =\000\000\000\000\000\000 =\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\002\000\000\000\006\000\000\000\260\f\000\000\000\000\000\000\260,\000\000\000\000\000\000\260,\000\000\000\000\000\000p\000\000\000\000\000\000\000p\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000R\345td\004\000\000\000\260\f\000\000\000\000\000\000\260,\000\000\000\000\000\000\260,\000\000\000\000\000\000p\000\000\000\000\000\000\000P\003\000\000\000\000\000\000\001\000\000\000\000\000\000\000Q\345td\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\004\000\000\0008\002\000\000\000\000\000\0008\002\000\000\000\000\000\0008\002\000\000\000\000\000\000@\006\000\000\000\000\000\000@\006\000\000\000\000\000\000\004\000\000\000\000\000\000\000\007\000\000\000,\006\000\000 \000\000\000AMDGPU\000\000\203\256amdhsa.kernels\221\336\000\023\245.args\334\000\023\205\256.actual_access\251read_only\256.address_space\246global\247.offset\000\245.size\b\253.value_kind\255global_buffer\205\256.actual_access\251read_only\256.address_space\246global\247.offset\b\245.size\b\253.value_kind\255global_buffer\205\256.actual_access\252write_only\256.address_space\246global\247.offset\020\245.size\b\253.value_kind\255global_buffer\203\247.offset\030\245.size\b\253.value_kind\250by_value\203\247.offset \245.size\b\253.value_kind\250by_value\203\247.offset(\245.size\004\253.value_kind\264hidden_block_count_x\203\247.offset,\245.size\004\253.value_kind\264hidden_block_count_y\203\247.offset0\245.size\004\253.value_kind\264hidden_block_count_z\203\247.offset4\245.size\002\253.value_kind\263hidden_group_size_x\203\247.offset6\245.size\002\253.value_kind\263hidden_group_size_y\203\247.offset8\245.size\002\253.value_kind\263hidden_group_size_z\203\247.offset:\245.size\002\253.value_kind\262hidden_remainder_x\203\247.offset<\245.size\002\253.value_kind\262hidden_remainder_y\203\247.offset>\245.size\002\253.value_kind\262hidden_remainder_z\203\247.offsetP\245.size\b\253.value_kind\266hidden_global_offset_x\203\247.offsetX\245.size\b\253.value_kind\266hidden_global_offset_y\203\247.offset`\245.size\b\253.value_kind\266hidden_global_offset_z\203\247.offseth\245.size\002\253.value_kind\260hidden_grid_dims\203\247.offset\314\240\245.size\004\253.value_kind\267hidden_dynamic_lds_size\261.gfx1250_revision\242B0\271.group_segment_fixed_size\000\266.kernarg_segment_align\b\265.kernarg_segment_size\315\001(\251.language\250OpenCL C\261.language_version\222\002\000\270.max_flat_workgroup_size\315\004\000\245.name\331'_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll\273.private_segment_fixed_size\000\253.sgpr_count\022\261.sgpr_spill_count\000\247.symbol\331*_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll.kd\270.uniform_work_group_size\001\263.uses_dynamic_stack\302\253.vgpr_count\022\261.vgpr_spill_count\000\257.wavefront_size \271.workgroup_processor_mode\001\255amdhsa.target\272amdgcn-amd-amdhsa--gfx1201\256amdhsa.version\222\001\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\022\003\007\000\000\032\000\000\000\000\000\000\254\002\000\000\000\000\000\000)\000\000\000\021\000\006\000\300\t\000\000\000\000\000\000@\000\000\000\000\000\000\000T\000\000\000\021\000\n\000 =\000\000\000\000\000\000\001\000\000\000\000\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\032\000\000\000\030\000\000\200@P\000\000\001\000\000\000\246\374@\020\302T\313\262\237/[\271\004\000\000\000\004\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\002\000\000\000\000_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll\000_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll.kd\000__hip_cuid_491e1b2d025fd0c8\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000(\001\000\000\000\000\000\000@\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000`\000\000\000\002\000\017\340\204\000\000\000\b\004\000\000\000\000\000\000\001\000\205\277\000a\000\364\000\000\000\370\000#\000\364 \000\000\370\200\002\002~u\000\202\276\200\000\203\276\000\250\200\251~\000\216\276\000\000\307\277~\000\323\324\n\000\002\002~\016\016\215\300\003\000\364\f\000\000\370\016\"\216\276\000\000\307\277\0178\004~~\016~\215U\000\245\277@\000\000\364\f\000\000\370\002|\376\326\000%\031\000\f\002\206\252\200\000\020\312\001\001\006\b\236\377\210\277\004\006\206\251\000\003\f~\236\377\210\277\004|\376\326\000%\031\000\200\000\205\276\002j\000\327\002\005\001\002\001\000\207\277\003| \325\200\006\252\001\004j\000\327\004\005\001\002\235\377\210\277\005| \325\200\n\252\001\000\000\307\277\001\377\004\213\377\377\000\000\t\000\207\277\004\222\206\252|\300\005\356\t\000\000\000\002\000\000\000\001\000\205\277|\300\005\356\r\000\000\000\004\000\000\000|\000\b\356\001\000\000\000\004\376\377\377|\000\b\356\021\000\000\000\002\376\377\377\006j\000\327\006\t\000\002\235\377\210\277\007| \325\200\016\252\001\236\377\210\277\002j\000\327\002\r\000\002\235\377\210\277\003| \325\007\006\252\001\n\f\246|\004\000\000\327\004\r\000\002\237\361\210\277\005| \325\007\n\002\000j\005\005\214\002\000\300\277\t@\030\314\r\023\002z\221\000\207\277\t@\030\314\016\025&|\t@\030\314\017\027&|\221\000\207\277\t@\030\314\020\031&|\t\013\022~\001\000\300\277\241\000\207\277\001\000 \314\001\023\002\212\000\000\300\277\b\000 \314\001#\"\024\236\377\210\277~\005~\221\313\377\246\277~\005~\214\0018\004~\b\003\002~~\016~\214\003\000F\326\000\005\001\002\200\000\200\276~\000\201\276\000\0004\330\003\001\000\000\000\000\306\277\301N\200\276\001\0009\327\201\004\002\002\2008\002\177\377\377\224\277|\300\n\356\000\000\004\000\000\000\000\000\200\002z} \000\246\277\236\377\210\277~\001~\214\t\000\207\277~\000\200\276\200\000\224}\n\000\245\277\200\002\000~\002\202\200\204\236\377\210\277\b\000\200\251\000\000\330\330\000\000\000\001\000\000\306\277\000\200\006\356\000\000\200\000\000\000\000\000\000\000\260\277\236\377\210\277~\004~\214\000\000\310\277\301N\200\276\201\002\0022\001\000\207\277\200\002\224|j\000\000\214\377\377\224\277|\300\n\356\000\000\004\000\000\000\000\000\236\377\210\277~\000~\221\340\377\245\277~\000\204\276~\000\311\324\000\003\002\002\355\377\245\277\002\000F\326\001\005\r\004\000\000\330\330\002\000\000\002\000\000\330\330\003\000\000\004\000\000\306\277\002\t\004\006\000\0004\330\003\002\000\000\342\377\240\277\000\000\000\000\006\000\000\000\000\000\000\000x\b\000\000\000\000\000\000\013\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\005\000\000\000\000\000\000\000(\t\000\000\000\000\000\000\n\000\000\000\000\000\000\000p\000\000\000\000\000\000\000\365\376\377o\000\000\000\000\330\b\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\t\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000AMD clang version 23.0.0git (https://github.com/ROCm/llvm-project.git 52226beb248fcdd136d084307a12207d2fc00220+PATCHED:440716f8b87be9d8e20ed910e10e5b6d14d57cf6)\000Linker: AMD LLD 23.0.0 (https://github.com/ROCm/llvm-project.git 52226beb248fcdd136d084307a12207d2fc00220+PATCHED:440716f8b87be9d8e20ed910e10e5b6d14d57cf6)\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\361\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\025\000\000\000\000\000\361\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000)\000\000\000\000\000\361\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000=\000\000\000\000\000\361\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\311\000\000\000\000\002\b\000\260,\000\000\000\000\000\000\000\000\000\000\000\000\000\000Z\000\000\000\022\003\007\000\000\032\000\000\000\000\000\000\254\002\000\000\000\000\000\000\202\000\000\000\021\000\006\000\300\t\000\000\000\000\000\000@\000\000\000\000\000\000\000\255\000\000\000\021\000\n\000 =\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000.note\000.dynsym\000.gnu.hash\000.hash\000.dynstr\000.rodata\000.text\000.dynamic\000.relro_padding\000.bss\000.AMDGPU.csdata\000.AMDGPU.gpr_maximums\000.comment\000.symtab\000.shstrtab\000.strtab\000\000amdgpu.max_num_vgpr\000amdgpu.max_num_agpr\000amdgpu.max_num_sgpr\000amdgpu.max_num_named_barrier\000_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll\000_ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll.kd\000__hip_cuid_491e1b2d025fd0c8\000_DYNAMIC\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\007\000\000\000\002\000\000\000\000\000\000\0008\002\000\000\000\000\000\0008\002\000\000\000\000\000\000@\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\000\000\013\000\000\000\002\000\000\000\000\000\000\000x\b\000\000\000\000\000\000x\b\000\000\000\000\000\000`\000\000\000\000\000\000\000\005\000\000\000\001\000\000\000\b\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\017\000\000\000\366\377\377o\002\000\000\000\000\000\000\000\330\b\000\000\000\000\000\000\330\b\000\000\000\000\000\000(\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\031\000\000\000\005\000\000\000\002\000\000\000\000\000\000\000\000\t\000\000\000\000\000\000\000\t\000\000\000\000\000\000(\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\037\000\000\000\003\000\000\000\002\000\000\000\000\000\000\000(\t\000\000\000\000\000\000(\t\000\000\000\000\000\000p\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000'\000\000\000\001\000\000\000\002\000\000\000\000\000\000\000\300\t\000\000\000\000\000\000\300\t\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000/\000\000\000\001\000\000\000\006\000\000\000\000\000\000\000\000\032\000\000\000\000\000\000\000\n\000\000\000\000\000\000\254\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\0005\000\000\000\006\000\000\000\003\000\000\000\000\000\000\000\260,\000\000\000\000\000\000\260\f\000\000\000\000\000\000p\000\000\000\000\000\000\000\005\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000>\000\000\000\b\000\000\000\003\000\000\000\000\000\000\000 -\000\000\000\000\000\000 \r\000\000\000\000\000\000\340\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000M\000\000\000\b\000\000\000\003\000\000\000\000\000\000\000 =\000\000\000\000\000\000 \r\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000R\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \r\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000a\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \r\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000v\000\000\000\001\000\000\0000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \r\000\000\000\000\000\000>\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\177\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000`\016\000\000\000\000\000\000\330\000\000\000\000\000\000\000\020\000\000\000\006\000\000\000\b\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\207\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0008\017\000\000\000\000\000\000\231\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\221\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\321\017\000\000\000\000\000\000\322\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	.L__unnamed_2, 9448

	.type	__hip_fatbin_wrapper,@object    # @__hip_fatbin_wrapper
	.section	.hipFatBinSegment,"aw",@progbits
	.p2align	3, 0x0
__hip_fatbin_wrapper:
	.long	1212764230                      # 0x48495046
	.long	1                               # 0x1
	.quad	.L__unnamed_2
	.quad	0
	.size	__hip_fatbin_wrapper, 24

	.type	__hip_gpubin_handle_491e1b2d025fd0c8,@object # @__hip_gpubin_handle_491e1b2d025fd0c8
	.local	__hip_gpubin_handle_491e1b2d025fd0c8
	.comm	__hip_gpubin_handle_491e1b2d025fd0c8,8,8
	.section	.init_array,"aw",@init_array
	.p2align	3, 0x0
	.quad	__hip_module_ctor
	.type	__hip_cuid_491e1b2d025fd0c8,@object # @__hip_cuid_491e1b2d025fd0c8
	.bss
	.globl	__hip_cuid_491e1b2d025fd0c8
__hip_cuid_491e1b2d025fd0c8:
	.byte	0                               # 0x0
	.size	__hip_cuid_491e1b2d025fd0c8, 1

	.type	.Lstr,@object                   # @str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"=== PRODUCTION k_mmvq_dot8_iu4 (block-per-row + shared-mem reduction) ==="
	.size	.Lstr, 74

	.type	.Lstr.1,@object                 # @str.1
.Lstr.1:
	.asciz	"          not that the kernel beat DRAM. Check the MiB column.\n"
	.size	.Lstr.1, 64

	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.p2align	3, 0x0
	.type	DW.ref.__gxx_personality_v0,@object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"AMD clang version 23.0.0git (https://github.com/ROCm/llvm-project.git 52226beb248fcdd136d084307a12207d2fc00220+PATCHED:440716f8b87be9d8e20ed910e10e5b6d14d57cf6)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __gxx_personality_v0
	.addrsig_sym _ZL30__device_stub__k_mmvq_dot8_iu4PKcPK9block_iu4Pfll
	.addrsig_sym __hip_module_ctor
	.addrsig_sym __hip_module_dtor
	.addrsig_sym _Unwind_Resume
	.addrsig_sym _ZL15k_mmvq_dot8_iu4PKcPK9block_iu4Pfll
	.addrsig_sym .L__unnamed_2
	.addrsig_sym __hip_fatbin_wrapper
	.addrsig_sym __hip_cuid_491e1b2d025fd0c8
