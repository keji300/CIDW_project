
test_iic:     file format elf32-littlearm


Disassembly of section .init:

000103a4 <_init>:
   103a4:	e92d4008 	push	{r3, lr}
   103a8:	eb000035 	bl	10484 <call_weak_fn>
   103ac:	e8bd8008 	pop	{r3, pc}

Disassembly of section .plt:

000103b0 <.plt>:
   103b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   103b4:	e59fe004 	ldr	lr, [pc, #4]	; 103c0 <.plt+0x10>
   103b8:	e08fe00e 	add	lr, pc, lr
   103bc:	e5bef008 	ldr	pc, [lr, #8]!
   103c0:	00012078 	.word	0x00012078

000103c4 <printf@plt>:
   103c4:	e28fc600 	add	ip, pc, #0, 12
   103c8:	e28cca12 	add	ip, ip, #73728	; 0x12000
   103cc:	e5bcf078 	ldr	pc, [ip, #120]!	; 0x78

000103d0 <read@plt>:
   103d0:	e28fc600 	add	ip, pc, #0, 12
   103d4:	e28cca12 	add	ip, ip, #73728	; 0x12000
   103d8:	e5bcf070 	ldr	pc, [ip, #112]!	; 0x70

000103dc <memcpy@plt>:
   103dc:	e28fc600 	add	ip, pc, #0, 12
   103e0:	e28cca12 	add	ip, ip, #73728	; 0x12000
   103e4:	e5bcf068 	ldr	pc, [ip, #104]!	; 0x68

000103e8 <ioctl@plt>:
   103e8:	e28fc600 	add	ip, pc, #0, 12
   103ec:	e28cca12 	add	ip, ip, #73728	; 0x12000
   103f0:	e5bcf060 	ldr	pc, [ip, #96]!	; 0x60

000103f4 <usleep@plt>:
   103f4:	e28fc600 	add	ip, pc, #0, 12
   103f8:	e28cca12 	add	ip, ip, #73728	; 0x12000
   103fc:	e5bcf058 	ldr	pc, [ip, #88]!	; 0x58

00010400 <puts@plt>:
   10400:	e28fc600 	add	ip, pc, #0, 12
   10404:	e28cca12 	add	ip, ip, #73728	; 0x12000
   10408:	e5bcf050 	ldr	pc, [ip, #80]!	; 0x50

0001040c <__libc_start_main@plt>:
   1040c:	e28fc600 	add	ip, pc, #0, 12
   10410:	e28cca12 	add	ip, ip, #73728	; 0x12000
   10414:	e5bcf048 	ldr	pc, [ip, #72]!	; 0x48

00010418 <__gmon_start__@plt>:
   10418:	e28fc600 	add	ip, pc, #0, 12
   1041c:	e28cca12 	add	ip, ip, #73728	; 0x12000
   10420:	e5bcf040 	ldr	pc, [ip, #64]!	; 0x40

00010424 <open@plt>:
   10424:	e28fc600 	add	ip, pc, #0, 12
   10428:	e28cca12 	add	ip, ip, #73728	; 0x12000
   1042c:	e5bcf038 	ldr	pc, [ip, #56]!	; 0x38

00010430 <write@plt>:
   10430:	e28fc600 	add	ip, pc, #0, 12
   10434:	e28cca12 	add	ip, ip, #73728	; 0x12000
   10438:	e5bcf030 	ldr	pc, [ip, #48]!	; 0x30

0001043c <abort@plt>:
   1043c:	e28fc600 	add	ip, pc, #0, 12
   10440:	e28cca12 	add	ip, ip, #73728	; 0x12000
   10444:	e5bcf028 	ldr	pc, [ip, #40]!	; 0x28

Disassembly of section .text:

00010448 <_start>:
   10448:	e3a0b000 	mov	fp, #0
   1044c:	e3a0e000 	mov	lr, #0
   10450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
   10454:	e1a0200d 	mov	r2, sp
   10458:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
   1045c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
   10460:	e59fc010 	ldr	ip, [pc, #16]	; 10478 <_start+0x30>
   10464:	e52dc004 	push	{ip}		; (str ip, [sp, #-4]!)
   10468:	e59f000c 	ldr	r0, [pc, #12]	; 1047c <_start+0x34>
   1046c:	e59f300c 	ldr	r3, [pc, #12]	; 10480 <_start+0x38>
   10470:	ebffffe5 	bl	1040c <__libc_start_main@plt>
   10474:	ebfffff0 	bl	1043c <abort@plt>
   10478:	00011e38 	.word	0x00011e38
   1047c:	00011968 	.word	0x00011968
   10480:	00011dcc 	.word	0x00011dcc

00010484 <call_weak_fn>:
   10484:	e59f3014 	ldr	r3, [pc, #20]	; 104a0 <call_weak_fn+0x1c>
   10488:	e59f2014 	ldr	r2, [pc, #20]	; 104a4 <call_weak_fn+0x20>
   1048c:	e08f3003 	add	r3, pc, r3
   10490:	e7932002 	ldr	r2, [r3, r2]
   10494:	e3520000 	cmp	r2, #0
   10498:	012fff1e 	bxeq	lr
   1049c:	eaffffdd 	b	10418 <__gmon_start__@plt>
   104a0:	00011fa4 	.word	0x00011fa4
   104a4:	00000038 	.word	0x00000038

000104a8 <deregister_tm_clones>:
   104a8:	e59f3024 	ldr	r3, [pc, #36]	; 104d4 <deregister_tm_clones+0x2c>
   104ac:	e3020488 	movw	r0, #9352	; 0x2488
   104b0:	e3400002 	movt	r0, #2
   104b4:	e0433000 	sub	r3, r3, r0
   104b8:	e3530006 	cmp	r3, #6
   104bc:	912fff1e 	bxls	lr
   104c0:	e3003000 	movw	r3, #0
   104c4:	e3403000 	movt	r3, #0
   104c8:	e3530000 	cmp	r3, #0
   104cc:	012fff1e 	bxeq	lr
   104d0:	e12fff13 	bx	r3
   104d4:	0002248b 	.word	0x0002248b

000104d8 <register_tm_clones>:
   104d8:	e3023488 	movw	r3, #9352	; 0x2488
   104dc:	e3020488 	movw	r0, #9352	; 0x2488
   104e0:	e3403002 	movt	r3, #2
   104e4:	e3400002 	movt	r0, #2
   104e8:	e0431000 	sub	r1, r3, r0
   104ec:	e1a01141 	asr	r1, r1, #2
   104f0:	e0811fa1 	add	r1, r1, r1, lsr #31
   104f4:	e1b010c1 	asrs	r1, r1, #1
   104f8:	012fff1e 	bxeq	lr
   104fc:	e3003000 	movw	r3, #0
   10500:	e3403000 	movt	r3, #0
   10504:	e3530000 	cmp	r3, #0
   10508:	012fff1e 	bxeq	lr
   1050c:	e12fff13 	bx	r3

00010510 <__do_global_dtors_aux>:
   10510:	e92d4010 	push	{r4, lr}
   10514:	e3024488 	movw	r4, #9352	; 0x2488
   10518:	e3404002 	movt	r4, #2
   1051c:	e5d43000 	ldrb	r3, [r4]
   10520:	e3530000 	cmp	r3, #0
   10524:	18bd8010 	popne	{r4, pc}
   10528:	ebffffde 	bl	104a8 <deregister_tm_clones>
   1052c:	e3a03001 	mov	r3, #1
   10530:	e5c43000 	strb	r3, [r4]
   10534:	e8bd8010 	pop	{r4, pc}

00010538 <frame_dummy>:
   10538:	e302034c 	movw	r0, #9036	; 0x234c
   1053c:	e3400002 	movt	r0, #2
   10540:	e5903000 	ldr	r3, [r0]
   10544:	e3530000 	cmp	r3, #0
   10548:	1a000000 	bne	10550 <frame_dummy+0x18>
   1054c:	eaffffe1 	b	104d8 <register_tm_clones>
   10550:	e3003000 	movw	r3, #0
   10554:	e3403000 	movt	r3, #0
   10558:	e3530000 	cmp	r3, #0
   1055c:	0afffffa 	beq	1054c <frame_dummy+0x14>
   10560:	e92d4010 	push	{r4, lr}
   10564:	e12fff33 	blx	r3
   10568:	e8bd4010 	pop	{r4, lr}
   1056c:	eaffffd9 	b	104d8 <register_tm_clones>

00010570 <iic_read>:
   10570:	e92d4800 	push	{fp, lr}
   10574:	e28db004 	add	fp, sp, #4
   10578:	e24dd018 	sub	sp, sp, #24
   1057c:	e50b0010 	str	r0, [fp, #-16]
   10580:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10584:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
   10588:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
   1058c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10590:	e6ef3073 	uxtb	r3, r3
   10594:	e54b300c 	strb	r3, [fp, #-12]
   10598:	e24b300c 	sub	r3, fp, #12
   1059c:	e3a02001 	mov	r2, #1
   105a0:	e1a01003 	mov	r1, r3
   105a4:	e51b0010 	ldr	r0, [fp, #-16]
   105a8:	ebffffa0 	bl	10430 <write@plt>
   105ac:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   105b0:	e1a02003 	mov	r2, r3
   105b4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
   105b8:	e51b0010 	ldr	r0, [fp, #-16]
   105bc:	ebffff83 	bl	103d0 <read@plt>
   105c0:	e50b0008 	str	r0, [fp, #-8]
   105c4:	e51b3008 	ldr	r3, [fp, #-8]
   105c8:	e1a00003 	mov	r0, r3
   105cc:	e24bd004 	sub	sp, fp, #4
   105d0:	e8bd8800 	pop	{fp, pc}

000105d4 <iic_write>:
   105d4:	e92d4800 	push	{fp, lr}
   105d8:	e28db004 	add	fp, sp, #4
   105dc:	e24dd018 	sub	sp, sp, #24
   105e0:	e50b0010 	str	r0, [fp, #-16]
   105e4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   105e8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
   105ec:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
   105f0:	e59f0050 	ldr	r0, [pc, #80]	; 10648 <iic_write+0x74>
   105f4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   105f8:	e1a02003 	mov	r2, r3
   105fc:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
   10600:	ebffff75 	bl	103dc <memcpy@plt>
   10604:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10608:	e6ef2073 	uxtb	r2, r3
   1060c:	e302348c 	movw	r3, #9356	; 0x248c
   10610:	e3403002 	movt	r3, #2
   10614:	e5c32000 	strb	r2, [r3]
   10618:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1061c:	e2833001 	add	r3, r3, #1
   10620:	e1a02003 	mov	r2, r3
   10624:	e302148c 	movw	r1, #9356	; 0x248c
   10628:	e3401002 	movt	r1, #2
   1062c:	e51b0010 	ldr	r0, [fp, #-16]
   10630:	ebffff7e 	bl	10430 <write@plt>
   10634:	e50b0008 	str	r0, [fp, #-8]
   10638:	e51b3008 	ldr	r3, [fp, #-8]
   1063c:	e1a00003 	mov	r0, r3
   10640:	e24bd004 	sub	sp, fp, #4
   10644:	e8bd8800 	pop	{fp, pc}
   10648:	0002248d 	.word	0x0002248d

0001064c <Board_type>:
   1064c:	e92d4800 	push	{fp, lr}
   10650:	e28db004 	add	fp, sp, #4
   10654:	e24dd010 	sub	sp, sp, #16
   10658:	e50b0010 	str	r0, [fp, #-16]
   1065c:	e1a03001 	mov	r3, r1
   10660:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   10664:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10668:	e3530009 	cmp	r3, #9
   1066c:	9a000004 	bls	10684 <Board_type+0x38>
   10670:	e3010e48 	movw	r0, #7752	; 0x1e48
   10674:	e3400001 	movt	r0, #1
   10678:	ebffff60 	bl	10400 <puts@plt>
   1067c:	e3a03000 	mov	r3, #0
   10680:	ea000023 	b	10714 <Board_type+0xc8>
   10684:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10688:	e30a249c 	movw	r2, #42140	; 0xa49c
   1068c:	e3402002 	movt	r2, #2
   10690:	e1a03283 	lsl	r3, r3, #5
   10694:	e0823003 	add	r3, r2, r3
   10698:	e593300c 	ldr	r3, [r3, #12]
   1069c:	e3530001 	cmp	r3, #1
   106a0:	1a000004 	bne	106b8 <Board_type+0x6c>
   106a4:	e3010e58 	movw	r0, #7768	; 0x1e58
   106a8:	e3400001 	movt	r0, #1
   106ac:	ebffff53 	bl	10400 <puts@plt>
   106b0:	e3a03000 	mov	r3, #0
   106b4:	ea000016 	b	10714 <Board_type+0xc8>
   106b8:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   106bc:	e302347c 	movw	r3, #9340	; 0x247c
   106c0:	e3403002 	movt	r3, #2
   106c4:	e7d33002 	ldrb	r3, [r3, r2]
   106c8:	e1a02003 	mov	r2, r3
   106cc:	e3001703 	movw	r1, #1795	; 0x703
   106d0:	e51b0010 	ldr	r0, [fp, #-16]
   106d4:	ebffff43 	bl	103e8 <ioctl@plt>
   106d8:	e50b0008 	str	r0, [fp, #-8]
   106dc:	e24b1009 	sub	r1, fp, #9
   106e0:	e3a03001 	mov	r3, #1
   106e4:	e3a02000 	mov	r2, #0
   106e8:	e51b0010 	ldr	r0, [fp, #-16]
   106ec:	ebffff9f 	bl	10570 <iic_read>
   106f0:	e1a03000 	mov	r3, r0
   106f4:	e3530000 	cmp	r3, #0
   106f8:	aa000004 	bge	10710 <Board_type+0xc4>
   106fc:	e3010e7c 	movw	r0, #7804	; 0x1e7c
   10700:	e3400001 	movt	r0, #1
   10704:	ebffff3d 	bl	10400 <puts@plt>
   10708:	e3a03000 	mov	r3, #0
   1070c:	ea000000 	b	10714 <Board_type+0xc8>
   10710:	e55b3009 	ldrb	r3, [fp, #-9]
   10714:	e1a00003 	mov	r0, r3
   10718:	e24bd004 	sub	sp, fp, #4
   1071c:	e8bd8800 	pop	{fp, pc}

00010720 <Status_ack>:
   10720:	e92d4800 	push	{fp, lr}
   10724:	e28db004 	add	fp, sp, #4
   10728:	e24dd010 	sub	sp, sp, #16
   1072c:	e50b0010 	str	r0, [fp, #-16]
   10730:	e1a03001 	mov	r3, r1
   10734:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   10738:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   1073c:	e3530009 	cmp	r3, #9
   10740:	9a000004 	bls	10758 <Status_ack+0x38>
   10744:	e3010e48 	movw	r0, #7752	; 0x1e48
   10748:	e3400001 	movt	r0, #1
   1074c:	ebffff2b 	bl	10400 <puts@plt>
   10750:	e3a03000 	mov	r3, #0
   10754:	ea000023 	b	107e8 <Status_ack+0xc8>
   10758:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   1075c:	e30a249c 	movw	r2, #42140	; 0xa49c
   10760:	e3402002 	movt	r2, #2
   10764:	e1a03283 	lsl	r3, r3, #5
   10768:	e0823003 	add	r3, r2, r3
   1076c:	e593300c 	ldr	r3, [r3, #12]
   10770:	e3530001 	cmp	r3, #1
   10774:	1a000004 	bne	1078c <Status_ack+0x6c>
   10778:	e3010e58 	movw	r0, #7768	; 0x1e58
   1077c:	e3400001 	movt	r0, #1
   10780:	ebffff1e 	bl	10400 <puts@plt>
   10784:	e3a03000 	mov	r3, #0
   10788:	ea000016 	b	107e8 <Status_ack+0xc8>
   1078c:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   10790:	e302347c 	movw	r3, #9340	; 0x247c
   10794:	e3403002 	movt	r3, #2
   10798:	e7d33002 	ldrb	r3, [r3, r2]
   1079c:	e1a02003 	mov	r2, r3
   107a0:	e3001703 	movw	r1, #1795	; 0x703
   107a4:	e51b0010 	ldr	r0, [fp, #-16]
   107a8:	ebffff0e 	bl	103e8 <ioctl@plt>
   107ac:	e50b0008 	str	r0, [fp, #-8]
   107b0:	e24b1009 	sub	r1, fp, #9
   107b4:	e3a03001 	mov	r3, #1
   107b8:	e3a02001 	mov	r2, #1
   107bc:	e51b0010 	ldr	r0, [fp, #-16]
   107c0:	ebffff6a 	bl	10570 <iic_read>
   107c4:	e1a03000 	mov	r3, r0
   107c8:	e3530000 	cmp	r3, #0
   107cc:	aa000004 	bge	107e4 <Status_ack+0xc4>
   107d0:	e3010e94 	movw	r0, #7828	; 0x1e94
   107d4:	e3400001 	movt	r0, #1
   107d8:	ebffff08 	bl	10400 <puts@plt>
   107dc:	e3a03000 	mov	r3, #0
   107e0:	ea000000 	b	107e8 <Status_ack+0xc8>
   107e4:	e55b3009 	ldrb	r3, [fp, #-9]
   107e8:	e1a00003 	mov	r0, r3
   107ec:	e24bd004 	sub	sp, fp, #4
   107f0:	e8bd8800 	pop	{fp, pc}

000107f4 <Project_version>:
   107f4:	e92d4800 	push	{fp, lr}
   107f8:	e28db004 	add	fp, sp, #4
   107fc:	e24dd010 	sub	sp, sp, #16
   10800:	e50b0010 	str	r0, [fp, #-16]
   10804:	e1a03001 	mov	r3, r1
   10808:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   1080c:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10810:	e3530009 	cmp	r3, #9
   10814:	9a000004 	bls	1082c <Project_version+0x38>
   10818:	e3010e48 	movw	r0, #7752	; 0x1e48
   1081c:	e3400001 	movt	r0, #1
   10820:	ebfffef6 	bl	10400 <puts@plt>
   10824:	e3a03000 	mov	r3, #0
   10828:	ea000022 	b	108b8 <Project_version+0xc4>
   1082c:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10830:	e30a249c 	movw	r2, #42140	; 0xa49c
   10834:	e3402002 	movt	r2, #2
   10838:	e1a03283 	lsl	r3, r3, #5
   1083c:	e0823003 	add	r3, r2, r3
   10840:	e593300c 	ldr	r3, [r3, #12]
   10844:	e3530001 	cmp	r3, #1
   10848:	1a000004 	bne	10860 <Project_version+0x6c>
   1084c:	e3010e58 	movw	r0, #7768	; 0x1e58
   10850:	e3400001 	movt	r0, #1
   10854:	ebfffee9 	bl	10400 <puts@plt>
   10858:	e3a03000 	mov	r3, #0
   1085c:	ea000015 	b	108b8 <Project_version+0xc4>
   10860:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   10864:	e302347c 	movw	r3, #9340	; 0x247c
   10868:	e3403002 	movt	r3, #2
   1086c:	e7d33002 	ldrb	r3, [r3, r2]
   10870:	e1a02003 	mov	r2, r3
   10874:	e3001703 	movw	r1, #1795	; 0x703
   10878:	e51b0010 	ldr	r0, [fp, #-16]
   1087c:	ebfffed9 	bl	103e8 <ioctl@plt>
   10880:	e24b1005 	sub	r1, fp, #5
   10884:	e3a03001 	mov	r3, #1
   10888:	e3a02002 	mov	r2, #2
   1088c:	e51b0010 	ldr	r0, [fp, #-16]
   10890:	ebffff36 	bl	10570 <iic_read>
   10894:	e1a03000 	mov	r3, r0
   10898:	e3530000 	cmp	r3, #0
   1089c:	aa000004 	bge	108b4 <Project_version+0xc0>
   108a0:	e3010e94 	movw	r0, #7828	; 0x1e94
   108a4:	e3400001 	movt	r0, #1
   108a8:	ebfffed4 	bl	10400 <puts@plt>
   108ac:	e3a03000 	mov	r3, #0
   108b0:	ea000000 	b	108b8 <Project_version+0xc4>
   108b4:	e55b3005 	ldrb	r3, [fp, #-5]
   108b8:	e1a00003 	mov	r0, r3
   108bc:	e24bd004 	sub	sp, fp, #4
   108c0:	e8bd8800 	pop	{fp, pc}

000108c4 <eeprom_is_switch>:
   108c4:	e92d4800 	push	{fp, lr}
   108c8:	e28db004 	add	fp, sp, #4
   108cc:	e24dd018 	sub	sp, sp, #24
   108d0:	e50b0010 	str	r0, [fp, #-16]
   108d4:	e1a03001 	mov	r3, r1
   108d8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
   108dc:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   108e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   108e4:	e6ef3073 	uxtb	r3, r3
   108e8:	e54b3005 	strb	r3, [fp, #-5]
   108ec:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   108f0:	e3530009 	cmp	r3, #9
   108f4:	9a000004 	bls	1090c <eeprom_is_switch+0x48>
   108f8:	e3010e48 	movw	r0, #7752	; 0x1e48
   108fc:	e3400001 	movt	r0, #1
   10900:	ebfffebe 	bl	10400 <puts@plt>
   10904:	e3a03000 	mov	r3, #0
   10908:	ea000025 	b	109a4 <eeprom_is_switch+0xe0>
   1090c:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10910:	e30a249c 	movw	r2, #42140	; 0xa49c
   10914:	e3402002 	movt	r2, #2
   10918:	e1a03283 	lsl	r3, r3, #5
   1091c:	e0823003 	add	r3, r2, r3
   10920:	e593300c 	ldr	r3, [r3, #12]
   10924:	e3530001 	cmp	r3, #1
   10928:	1a000007 	bne	1094c <eeprom_is_switch+0x88>
   1092c:	e55b3005 	ldrb	r3, [fp, #-5]
   10930:	e3530001 	cmp	r3, #1
   10934:	1a000004 	bne	1094c <eeprom_is_switch+0x88>
   10938:	e3010eac 	movw	r0, #7852	; 0x1eac
   1093c:	e3400001 	movt	r0, #1
   10940:	ebfffeae 	bl	10400 <puts@plt>
   10944:	e3a03001 	mov	r3, #1
   10948:	ea000015 	b	109a4 <eeprom_is_switch+0xe0>
   1094c:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   10950:	e302347c 	movw	r3, #9340	; 0x247c
   10954:	e3403002 	movt	r3, #2
   10958:	e7d33002 	ldrb	r3, [r3, r2]
   1095c:	e1a02003 	mov	r2, r3
   10960:	e3001703 	movw	r1, #1795	; 0x703
   10964:	e51b0010 	ldr	r0, [fp, #-16]
   10968:	ebfffe9e 	bl	103e8 <ioctl@plt>
   1096c:	e24b1005 	sub	r1, fp, #5
   10970:	e3a03001 	mov	r3, #1
   10974:	e3a02003 	mov	r2, #3
   10978:	e51b0010 	ldr	r0, [fp, #-16]
   1097c:	ebffff14 	bl	105d4 <iic_write>
   10980:	e1a03000 	mov	r3, r0
   10984:	e3530000 	cmp	r3, #0
   10988:	aa000004 	bge	109a0 <eeprom_is_switch+0xdc>
   1098c:	e3010ecc 	movw	r0, #7884	; 0x1ecc
   10990:	e3400001 	movt	r0, #1
   10994:	ebfffe99 	bl	10400 <puts@plt>
   10998:	e3a03000 	mov	r3, #0
   1099c:	ea000000 	b	109a4 <eeprom_is_switch+0xe0>
   109a0:	e3a03001 	mov	r3, #1
   109a4:	e1a00003 	mov	r0, r3
   109a8:	e24bd004 	sub	sp, fp, #4
   109ac:	e8bd8800 	pop	{fp, pc}

000109b0 <eeprom_test>:
   109b0:	e92d4800 	push	{fp, lr}
   109b4:	e28db004 	add	fp, sp, #4
   109b8:	e24dd010 	sub	sp, sp, #16
   109bc:	e50b0010 	str	r0, [fp, #-16]
   109c0:	e1a03001 	mov	r3, r1
   109c4:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   109c8:	e3a03001 	mov	r3, #1
   109cc:	e54b3005 	strb	r3, [fp, #-5]
   109d0:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   109d4:	e3530009 	cmp	r3, #9
   109d8:	9a000004 	bls	109f0 <eeprom_test+0x40>
   109dc:	e3010e48 	movw	r0, #7752	; 0x1e48
   109e0:	e3400001 	movt	r0, #1
   109e4:	ebfffe85 	bl	10400 <puts@plt>
   109e8:	e3a03000 	mov	r3, #0
   109ec:	ea000022 	b	10a7c <eeprom_test+0xcc>
   109f0:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   109f4:	e30a249c 	movw	r2, #42140	; 0xa49c
   109f8:	e3402002 	movt	r2, #2
   109fc:	e1a03283 	lsl	r3, r3, #5
   10a00:	e0823003 	add	r3, r2, r3
   10a04:	e593300c 	ldr	r3, [r3, #12]
   10a08:	e3530001 	cmp	r3, #1
   10a0c:	0a000004 	beq	10a24 <eeprom_test+0x74>
   10a10:	e3010ef0 	movw	r0, #7920	; 0x1ef0
   10a14:	e3400001 	movt	r0, #1
   10a18:	ebfffe78 	bl	10400 <puts@plt>
   10a1c:	e3a03001 	mov	r3, #1
   10a20:	ea000015 	b	10a7c <eeprom_test+0xcc>
   10a24:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   10a28:	e302347c 	movw	r3, #9340	; 0x247c
   10a2c:	e3403002 	movt	r3, #2
   10a30:	e7d33002 	ldrb	r3, [r3, r2]
   10a34:	e1a02003 	mov	r2, r3
   10a38:	e3001703 	movw	r1, #1795	; 0x703
   10a3c:	e51b0010 	ldr	r0, [fp, #-16]
   10a40:	ebfffe68 	bl	103e8 <ioctl@plt>
   10a44:	e24b1005 	sub	r1, fp, #5
   10a48:	e3a03001 	mov	r3, #1
   10a4c:	e3a02003 	mov	r2, #3
   10a50:	e51b0010 	ldr	r0, [fp, #-16]
   10a54:	ebfffede 	bl	105d4 <iic_write>
   10a58:	e1a03000 	mov	r3, r0
   10a5c:	e3530000 	cmp	r3, #0
   10a60:	aa000004 	bge	10a78 <eeprom_test+0xc8>
   10a64:	e3010e7c 	movw	r0, #7804	; 0x1e7c
   10a68:	e3400001 	movt	r0, #1
   10a6c:	ebfffe63 	bl	10400 <puts@plt>
   10a70:	e3a03000 	mov	r3, #0
   10a74:	ea000000 	b	10a7c <eeprom_test+0xcc>
   10a78:	e3a03001 	mov	r3, #1
   10a7c:	e1a00003 	mov	r0, r3
   10a80:	e24bd004 	sub	sp, fp, #4
   10a84:	e8bd8800 	pop	{fp, pc}

00010a88 <bus_test>:
   10a88:	e92d4800 	push	{fp, lr}
   10a8c:	e28db004 	add	fp, sp, #4
   10a90:	e24dd010 	sub	sp, sp, #16
   10a94:	e50b0010 	str	r0, [fp, #-16]
   10a98:	e1a03001 	mov	r3, r1
   10a9c:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   10aa0:	e3a03000 	mov	r3, #0
   10aa4:	e14b30b8 	strh	r3, [fp, #-8]
   10aa8:	e3e0305a 	mvn	r3, #90	; 0x5a
   10aac:	e54b3008 	strb	r3, [fp, #-8]
   10ab0:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10ab4:	e3530009 	cmp	r3, #9
   10ab8:	9a000004 	bls	10ad0 <bus_test+0x48>
   10abc:	e3010e48 	movw	r0, #7752	; 0x1e48
   10ac0:	e3400001 	movt	r0, #1
   10ac4:	ebfffe4d 	bl	10400 <puts@plt>
   10ac8:	e3a03000 	mov	r3, #0
   10acc:	ea00002a 	b	10b7c <bus_test+0xf4>
   10ad0:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10ad4:	e30a249c 	movw	r2, #42140	; 0xa49c
   10ad8:	e3402002 	movt	r2, #2
   10adc:	e1a03283 	lsl	r3, r3, #5
   10ae0:	e0823003 	add	r3, r2, r3
   10ae4:	e593300c 	ldr	r3, [r3, #12]
   10ae8:	e3530001 	cmp	r3, #1
   10aec:	1a000004 	bne	10b04 <bus_test+0x7c>
   10af0:	e3010e58 	movw	r0, #7768	; 0x1e58
   10af4:	e3400001 	movt	r0, #1
   10af8:	ebfffe40 	bl	10400 <puts@plt>
   10afc:	e3a03000 	mov	r3, #0
   10b00:	ea00001d 	b	10b7c <bus_test+0xf4>
   10b04:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   10b08:	e302347c 	movw	r3, #9340	; 0x247c
   10b0c:	e3403002 	movt	r3, #2
   10b10:	e7d33002 	ldrb	r3, [r3, r2]
   10b14:	e1a02003 	mov	r2, r3
   10b18:	e3001703 	movw	r1, #1795	; 0x703
   10b1c:	e51b0010 	ldr	r0, [fp, #-16]
   10b20:	ebfffe30 	bl	103e8 <ioctl@plt>
   10b24:	e24b1008 	sub	r1, fp, #8
   10b28:	e3a03001 	mov	r3, #1
   10b2c:	e3a02004 	mov	r2, #4
   10b30:	e51b0010 	ldr	r0, [fp, #-16]
   10b34:	ebfffea6 	bl	105d4 <iic_write>
   10b38:	e24b3008 	sub	r3, fp, #8
   10b3c:	e2831001 	add	r1, r3, #1
   10b40:	e3a03001 	mov	r3, #1
   10b44:	e3a02004 	mov	r2, #4
   10b48:	e51b0010 	ldr	r0, [fp, #-16]
   10b4c:	ebfffe87 	bl	10570 <iic_read>
   10b50:	e1a03000 	mov	r3, r0
   10b54:	e3530000 	cmp	r3, #0
   10b58:	aa000001 	bge	10b64 <bus_test+0xdc>
   10b5c:	e3a03000 	mov	r3, #0
   10b60:	ea000005 	b	10b7c <bus_test+0xf4>
   10b64:	e55b2008 	ldrb	r2, [fp, #-8]
   10b68:	e55b3007 	ldrb	r3, [fp, #-7]
   10b6c:	e1520003 	cmp	r2, r3
   10b70:	1a000001 	bne	10b7c <bus_test+0xf4>
   10b74:	e3a03001 	mov	r3, #1
   10b78:	eaffffff 	b	10b7c <bus_test+0xf4>
   10b7c:	e1a00003 	mov	r0, r3
   10b80:	e24bd004 	sub	sp, fp, #4
   10b84:	e8bd8800 	pop	{fp, pc}

00010b88 <frequency>:
   10b88:	e92d4800 	push	{fp, lr}
   10b8c:	e28db004 	add	fp, sp, #4
   10b90:	e24dd010 	sub	sp, sp, #16
   10b94:	e50b0010 	str	r0, [fp, #-16]
   10b98:	e1a00001 	mov	r0, r1
   10b9c:	e1a01002 	mov	r1, r2
   10ba0:	e1a02003 	mov	r2, r3
   10ba4:	e1a03000 	mov	r3, r0
   10ba8:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   10bac:	e1a03001 	mov	r3, r1
   10bb0:	e54b3012 	strb	r3, [fp, #-18]	; 0xffffffee
   10bb4:	e1a03002 	mov	r3, r2
   10bb8:	e54b3013 	strb	r3, [fp, #-19]	; 0xffffffed
   10bbc:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10bc0:	e3530009 	cmp	r3, #9
   10bc4:	9a000004 	bls	10bdc <frequency+0x54>
   10bc8:	e3010e48 	movw	r0, #7752	; 0x1e48
   10bcc:	e3400001 	movt	r0, #1
   10bd0:	ebfffe0a 	bl	10400 <puts@plt>
   10bd4:	e3e03000 	mvn	r3, #0
   10bd8:	ea00006b 	b	10d8c <frequency+0x204>
   10bdc:	e55b3012 	ldrb	r3, [fp, #-18]	; 0xffffffee
   10be0:	e3530007 	cmp	r3, #7
   10be4:	9a000004 	bls	10bfc <frequency+0x74>
   10be8:	e3010f20 	movw	r0, #7968	; 0x1f20
   10bec:	e3400001 	movt	r0, #1
   10bf0:	ebfffe02 	bl	10400 <puts@plt>
   10bf4:	e3e03000 	mvn	r3, #0
   10bf8:	ea000063 	b	10d8c <frequency+0x204>
   10bfc:	e55b3013 	ldrb	r3, [fp, #-19]	; 0xffffffed
   10c00:	e3530003 	cmp	r3, #3
   10c04:	9a000004 	bls	10c1c <frequency+0x94>
   10c08:	e3010f38 	movw	r0, #7992	; 0x1f38
   10c0c:	e3400001 	movt	r0, #1
   10c10:	ebfffdfa 	bl	10400 <puts@plt>
   10c14:	e3e03000 	mvn	r3, #0
   10c18:	ea00005b 	b	10d8c <frequency+0x204>
   10c1c:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10c20:	e30a249c 	movw	r2, #42140	; 0xa49c
   10c24:	e3402002 	movt	r2, #2
   10c28:	e1a03283 	lsl	r3, r3, #5
   10c2c:	e0823003 	add	r3, r2, r3
   10c30:	e5933004 	ldr	r3, [r3, #4]
   10c34:	e3530003 	cmp	r3, #3
   10c38:	1a000009 	bne	10c64 <frequency+0xdc>
   10c3c:	e55b3012 	ldrb	r3, [fp, #-18]	; 0xffffffee
   10c40:	e3530000 	cmp	r3, #0
   10c44:	0a000006 	beq	10c64 <frequency+0xdc>
   10c48:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10c4c:	e1a01003 	mov	r1, r3
   10c50:	e3010f4c 	movw	r0, #8012	; 0x1f4c
   10c54:	e3400001 	movt	r0, #1
   10c58:	ebfffdd9 	bl	103c4 <printf@plt>
   10c5c:	e3e03000 	mvn	r3, #0
   10c60:	ea000049 	b	10d8c <frequency+0x204>
   10c64:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10c68:	e30a249c 	movw	r2, #42140	; 0xa49c
   10c6c:	e3402002 	movt	r2, #2
   10c70:	e1a03283 	lsl	r3, r3, #5
   10c74:	e0823003 	add	r3, r2, r3
   10c78:	e593300c 	ldr	r3, [r3, #12]
   10c7c:	e3530001 	cmp	r3, #1
   10c80:	1a000004 	bne	10c98 <frequency+0x110>
   10c84:	e3010e58 	movw	r0, #7768	; 0x1e58
   10c88:	e3400001 	movt	r0, #1
   10c8c:	ebfffddb 	bl	10400 <puts@plt>
   10c90:	e3e03000 	mvn	r3, #0
   10c94:	ea00003c 	b	10d8c <frequency+0x204>
   10c98:	e55b1011 	ldrb	r1, [fp, #-17]	; 0xffffffef
   10c9c:	e55b2012 	ldrb	r2, [fp, #-18]	; 0xffffffee
   10ca0:	e30a349c 	movw	r3, #42140	; 0xa49c
   10ca4:	e3403002 	movt	r3, #2
   10ca8:	e1a01281 	lsl	r1, r1, #5
   10cac:	e0833001 	add	r3, r3, r1
   10cb0:	e0833002 	add	r3, r3, r2
   10cb4:	e2833014 	add	r3, r3, #20
   10cb8:	e5d32000 	ldrb	r2, [r3]
   10cbc:	e55b3013 	ldrb	r3, [fp, #-19]	; 0xffffffed
   10cc0:	e1520003 	cmp	r2, r3
   10cc4:	1a000006 	bne	10ce4 <frequency+0x15c>
   10cc8:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10ccc:	e1a01003 	mov	r1, r3
   10cd0:	e3010f80 	movw	r0, #8064	; 0x1f80
   10cd4:	e3400001 	movt	r0, #1
   10cd8:	ebfffdb9 	bl	103c4 <printf@plt>
   10cdc:	e55b3013 	ldrb	r3, [fp, #-19]	; 0xffffffed
   10ce0:	ea000029 	b	10d8c <frequency+0x204>
   10ce4:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   10ce8:	e302347c 	movw	r3, #9340	; 0x247c
   10cec:	e3403002 	movt	r3, #2
   10cf0:	e7d33002 	ldrb	r3, [r3, r2]
   10cf4:	e1a02003 	mov	r2, r3
   10cf8:	e3001703 	movw	r1, #1795	; 0x703
   10cfc:	e51b0010 	ldr	r0, [fp, #-16]
   10d00:	ebfffdb8 	bl	103e8 <ioctl@plt>
   10d04:	e55b3012 	ldrb	r3, [fp, #-18]	; 0xffffffee
   10d08:	e2832010 	add	r2, r3, #16
   10d0c:	e24b1013 	sub	r1, fp, #19
   10d10:	e3a03001 	mov	r3, #1
   10d14:	e51b0010 	ldr	r0, [fp, #-16]
   10d18:	ebfffe2d 	bl	105d4 <iic_write>
   10d1c:	e1a03000 	mov	r3, r0
   10d20:	e3530000 	cmp	r3, #0
   10d24:	aa000004 	bge	10d3c <frequency+0x1b4>
   10d28:	e3010fa0 	movw	r0, #8096	; 0x1fa0
   10d2c:	e3400001 	movt	r0, #1
   10d30:	ebfffdb2 	bl	10400 <puts@plt>
   10d34:	e3e03000 	mvn	r3, #0
   10d38:	ea000013 	b	10d8c <frequency+0x204>
   10d3c:	e55b3012 	ldrb	r3, [fp, #-18]	; 0xffffffee
   10d40:	e2832010 	add	r2, r3, #16
   10d44:	e24b1005 	sub	r1, fp, #5
   10d48:	e3a03001 	mov	r3, #1
   10d4c:	e51b0010 	ldr	r0, [fp, #-16]
   10d50:	ebfffe06 	bl	10570 <iic_read>
   10d54:	e1a03000 	mov	r3, r0
   10d58:	e3530000 	cmp	r3, #0
   10d5c:	aa000004 	bge	10d74 <frequency+0x1ec>
   10d60:	e3010fa0 	movw	r0, #8096	; 0x1fa0
   10d64:	e3400001 	movt	r0, #1
   10d68:	ebfffda4 	bl	10400 <puts@plt>
   10d6c:	e3e03000 	mvn	r3, #0
   10d70:	ea000005 	b	10d8c <frequency+0x204>
   10d74:	e55b2013 	ldrb	r2, [fp, #-19]	; 0xffffffed
   10d78:	e55b3005 	ldrb	r3, [fp, #-5]
   10d7c:	e1520003 	cmp	r2, r3
   10d80:	1a000001 	bne	10d8c <frequency+0x204>
   10d84:	e55b3013 	ldrb	r3, [fp, #-19]	; 0xffffffed
   10d88:	eaffffff 	b	10d8c <frequency+0x204>
   10d8c:	e1a00003 	mov	r0, r3
   10d90:	e24bd004 	sub	sp, fp, #4
   10d94:	e8bd8800 	pop	{fp, pc}

00010d98 <set_led>:
   10d98:	e92d4800 	push	{fp, lr}
   10d9c:	e28db004 	add	fp, sp, #4
   10da0:	e24dd010 	sub	sp, sp, #16
   10da4:	e50b0010 	str	r0, [fp, #-16]
   10da8:	e1a03001 	mov	r3, r1
   10dac:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   10db0:	e1a03002 	mov	r3, r2
   10db4:	e54b3012 	strb	r3, [fp, #-18]	; 0xffffffee
   10db8:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10dbc:	e3530009 	cmp	r3, #9
   10dc0:	9a000004 	bls	10dd8 <set_led+0x40>
   10dc4:	e3010e48 	movw	r0, #7752	; 0x1e48
   10dc8:	e3400001 	movt	r0, #1
   10dcc:	ebfffd8b 	bl	10400 <puts@plt>
   10dd0:	e3e03000 	mvn	r3, #0
   10dd4:	ea000034 	b	10eac <set_led+0x114>
   10dd8:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10ddc:	e30a249c 	movw	r2, #42140	; 0xa49c
   10de0:	e3402002 	movt	r2, #2
   10de4:	e1a03283 	lsl	r3, r3, #5
   10de8:	e0823003 	add	r3, r2, r3
   10dec:	e593300c 	ldr	r3, [r3, #12]
   10df0:	e3530001 	cmp	r3, #1
   10df4:	1a000004 	bne	10e0c <set_led+0x74>
   10df8:	e3010e58 	movw	r0, #7768	; 0x1e58
   10dfc:	e3400001 	movt	r0, #1
   10e00:	ebfffd7e 	bl	10400 <puts@plt>
   10e04:	e3a03000 	mov	r3, #0
   10e08:	ea000027 	b	10eac <set_led+0x114>
   10e0c:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   10e10:	e302347c 	movw	r3, #9340	; 0x247c
   10e14:	e3403002 	movt	r3, #2
   10e18:	e7d33002 	ldrb	r3, [r3, r2]
   10e1c:	e1a02003 	mov	r2, r3
   10e20:	e3001703 	movw	r1, #1795	; 0x703
   10e24:	e51b0010 	ldr	r0, [fp, #-16]
   10e28:	ebfffd6e 	bl	103e8 <ioctl@plt>
   10e2c:	e24b1012 	sub	r1, fp, #18
   10e30:	e3a03001 	mov	r3, #1
   10e34:	e3a02020 	mov	r2, #32
   10e38:	e51b0010 	ldr	r0, [fp, #-16]
   10e3c:	ebfffde4 	bl	105d4 <iic_write>
   10e40:	e1a03000 	mov	r3, r0
   10e44:	e3530000 	cmp	r3, #0
   10e48:	aa000004 	bge	10e60 <set_led+0xc8>
   10e4c:	e3010fc0 	movw	r0, #8128	; 0x1fc0
   10e50:	e3400001 	movt	r0, #1
   10e54:	ebfffd69 	bl	10400 <puts@plt>
   10e58:	e3a03000 	mov	r3, #0
   10e5c:	ea000012 	b	10eac <set_led+0x114>
   10e60:	e24b1005 	sub	r1, fp, #5
   10e64:	e3a03001 	mov	r3, #1
   10e68:	e3a02020 	mov	r2, #32
   10e6c:	e51b0010 	ldr	r0, [fp, #-16]
   10e70:	ebfffdbe 	bl	10570 <iic_read>
   10e74:	e1a03000 	mov	r3, r0
   10e78:	e3530000 	cmp	r3, #0
   10e7c:	aa000004 	bge	10e94 <set_led+0xfc>
   10e80:	e3010fd4 	movw	r0, #8148	; 0x1fd4
   10e84:	e3400001 	movt	r0, #1
   10e88:	ebfffd5c 	bl	10400 <puts@plt>
   10e8c:	e3a03000 	mov	r3, #0
   10e90:	ea000005 	b	10eac <set_led+0x114>
   10e94:	e55b2012 	ldrb	r2, [fp, #-18]	; 0xffffffee
   10e98:	e55b3005 	ldrb	r3, [fp, #-5]
   10e9c:	e1520003 	cmp	r2, r3
   10ea0:	1a000001 	bne	10eac <set_led+0x114>
   10ea4:	e3a03001 	mov	r3, #1
   10ea8:	eaffffff 	b	10eac <set_led+0x114>
   10eac:	e1a00003 	mov	r0, r3
   10eb0:	e24bd004 	sub	sp, fp, #4
   10eb4:	e8bd8800 	pop	{fp, pc}

00010eb8 <Self_calibration>:
   10eb8:	e92d4800 	push	{fp, lr}
   10ebc:	e28db004 	add	fp, sp, #4
   10ec0:	e24dd010 	sub	sp, sp, #16
   10ec4:	e50b0010 	str	r0, [fp, #-16]
   10ec8:	e1a03001 	mov	r3, r1
   10ecc:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   10ed0:	e3a03000 	mov	r3, #0
   10ed4:	e54b3005 	strb	r3, [fp, #-5]
   10ed8:	e3e03000 	mvn	r3, #0
   10edc:	e54b3006 	strb	r3, [fp, #-6]
   10ee0:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10ee4:	e3530009 	cmp	r3, #9
   10ee8:	9a000004 	bls	10f00 <Self_calibration+0x48>
   10eec:	e3010e48 	movw	r0, #7752	; 0x1e48
   10ef0:	e3400001 	movt	r0, #1
   10ef4:	ebfffd41 	bl	10400 <puts@plt>
   10ef8:	e3e03000 	mvn	r3, #0
   10efc:	ea00003e 	b	10ffc <Self_calibration+0x144>
   10f00:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10f04:	e30a249c 	movw	r2, #42140	; 0xa49c
   10f08:	e3402002 	movt	r2, #2
   10f0c:	e1a03283 	lsl	r3, r3, #5
   10f10:	e0823003 	add	r3, r2, r3
   10f14:	e5933004 	ldr	r3, [r3, #4]
   10f18:	e3530003 	cmp	r3, #3
   10f1c:	1a000006 	bne	10f3c <Self_calibration+0x84>
   10f20:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10f24:	e1a01003 	mov	r1, r3
   10f28:	e3010fe8 	movw	r0, #8168	; 0x1fe8
   10f2c:	e3400001 	movt	r0, #1
   10f30:	ebfffd23 	bl	103c4 <printf@plt>
   10f34:	e3a03000 	mov	r3, #0
   10f38:	ea00002f 	b	10ffc <Self_calibration+0x144>
   10f3c:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   10f40:	e30a249c 	movw	r2, #42140	; 0xa49c
   10f44:	e3402002 	movt	r2, #2
   10f48:	e1a03283 	lsl	r3, r3, #5
   10f4c:	e0823003 	add	r3, r2, r3
   10f50:	e593300c 	ldr	r3, [r3, #12]
   10f54:	e3530001 	cmp	r3, #1
   10f58:	1a000004 	bne	10f70 <Self_calibration+0xb8>
   10f5c:	e3020000 	movw	r0, #8192	; 0x2000
   10f60:	e3400001 	movt	r0, #1
   10f64:	ebfffd25 	bl	10400 <puts@plt>
   10f68:	e3a03000 	mov	r3, #0
   10f6c:	ea000022 	b	10ffc <Self_calibration+0x144>
   10f70:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   10f74:	e302347c 	movw	r3, #9340	; 0x247c
   10f78:	e3403002 	movt	r3, #2
   10f7c:	e7d33002 	ldrb	r3, [r3, r2]
   10f80:	e1a02003 	mov	r2, r3
   10f84:	e3001703 	movw	r1, #1795	; 0x703
   10f88:	e51b0010 	ldr	r0, [fp, #-16]
   10f8c:	ebfffd15 	bl	103e8 <ioctl@plt>
   10f90:	e24b1005 	sub	r1, fp, #5
   10f94:	e3a03001 	mov	r3, #1
   10f98:	e3a02021 	mov	r2, #33	; 0x21
   10f9c:	e51b0010 	ldr	r0, [fp, #-16]
   10fa0:	ebfffd8b 	bl	105d4 <iic_write>
   10fa4:	e1a03000 	mov	r3, r0
   10fa8:	e3530000 	cmp	r3, #0
   10fac:	aa000004 	bge	10fc4 <Self_calibration+0x10c>
   10fb0:	e3010fc0 	movw	r0, #8128	; 0x1fc0
   10fb4:	e3400001 	movt	r0, #1
   10fb8:	ebfffd10 	bl	10400 <puts@plt>
   10fbc:	e3a03000 	mov	r3, #0
   10fc0:	ea00000d 	b	10ffc <Self_calibration+0x144>
   10fc4:	e24b1006 	sub	r1, fp, #6
   10fc8:	e3a03001 	mov	r3, #1
   10fcc:	e3a02021 	mov	r2, #33	; 0x21
   10fd0:	e51b0010 	ldr	r0, [fp, #-16]
   10fd4:	ebfffd7e 	bl	105d4 <iic_write>
   10fd8:	e1a03000 	mov	r3, r0
   10fdc:	e3530000 	cmp	r3, #0
   10fe0:	aa000004 	bge	10ff8 <Self_calibration+0x140>
   10fe4:	e3010fc0 	movw	r0, #8128	; 0x1fc0
   10fe8:	e3400001 	movt	r0, #1
   10fec:	ebfffd03 	bl	10400 <puts@plt>
   10ff0:	e3a03000 	mov	r3, #0
   10ff4:	ea000000 	b	10ffc <Self_calibration+0x144>
   10ff8:	e3a03001 	mov	r3, #1
   10ffc:	e1a00003 	mov	r0, r3
   11000:	e24bd004 	sub	sp, fp, #4
   11004:	e8bd8800 	pop	{fp, pc}

00011008 <Relay_control>:
   11008:	e92d4800 	push	{fp, lr}
   1100c:	e28db004 	add	fp, sp, #4
   11010:	e24dd010 	sub	sp, sp, #16
   11014:	e50b0010 	str	r0, [fp, #-16]
   11018:	e1a03001 	mov	r3, r1
   1101c:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
   11020:	e1a03002 	mov	r3, r2
   11024:	e54b3012 	strb	r3, [fp, #-18]	; 0xffffffee
   11028:	e3a03000 	mov	r3, #0
   1102c:	e54b3005 	strb	r3, [fp, #-5]
   11030:	e3e03000 	mvn	r3, #0
   11034:	e54b3006 	strb	r3, [fp, #-6]
   11038:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   1103c:	e3530009 	cmp	r3, #9
   11040:	9a000004 	bls	11058 <Relay_control+0x50>
   11044:	e3010e48 	movw	r0, #7752	; 0x1e48
   11048:	e3400001 	movt	r0, #1
   1104c:	ebfffceb 	bl	10400 <puts@plt>
   11050:	e3e03000 	mvn	r3, #0
   11054:	ea00003e 	b	11154 <Relay_control+0x14c>
   11058:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   1105c:	e30a249c 	movw	r2, #42140	; 0xa49c
   11060:	e3402002 	movt	r2, #2
   11064:	e1a03283 	lsl	r3, r3, #5
   11068:	e0823003 	add	r3, r2, r3
   1106c:	e5933004 	ldr	r3, [r3, #4]
   11070:	e3530003 	cmp	r3, #3
   11074:	1a000006 	bne	11094 <Relay_control+0x8c>
   11078:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   1107c:	e1a01003 	mov	r1, r3
   11080:	e3020024 	movw	r0, #8228	; 0x2024
   11084:	e3400001 	movt	r0, #1
   11088:	ebfffccd 	bl	103c4 <printf@plt>
   1108c:	e3a03000 	mov	r3, #0
   11090:	ea00002f 	b	11154 <Relay_control+0x14c>
   11094:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
   11098:	e30a249c 	movw	r2, #42140	; 0xa49c
   1109c:	e3402002 	movt	r2, #2
   110a0:	e1a03283 	lsl	r3, r3, #5
   110a4:	e0823003 	add	r3, r2, r3
   110a8:	e593300c 	ldr	r3, [r3, #12]
   110ac:	e3530001 	cmp	r3, #1
   110b0:	1a000004 	bne	110c8 <Relay_control+0xc0>
   110b4:	e3020000 	movw	r0, #8192	; 0x2000
   110b8:	e3400001 	movt	r0, #1
   110bc:	ebfffccf 	bl	10400 <puts@plt>
   110c0:	e3a03000 	mov	r3, #0
   110c4:	ea000022 	b	11154 <Relay_control+0x14c>
   110c8:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
   110cc:	e302347c 	movw	r3, #9340	; 0x247c
   110d0:	e3403002 	movt	r3, #2
   110d4:	e7d33002 	ldrb	r3, [r3, r2]
   110d8:	e1a02003 	mov	r2, r3
   110dc:	e3001703 	movw	r1, #1795	; 0x703
   110e0:	e51b0010 	ldr	r0, [fp, #-16]
   110e4:	ebfffcbf 	bl	103e8 <ioctl@plt>
   110e8:	e24b1005 	sub	r1, fp, #5
   110ec:	e3a03001 	mov	r3, #1
   110f0:	e3a02022 	mov	r2, #34	; 0x22
   110f4:	e51b0010 	ldr	r0, [fp, #-16]
   110f8:	ebfffd35 	bl	105d4 <iic_write>
   110fc:	e1a03000 	mov	r3, r0
   11100:	e3530000 	cmp	r3, #0
   11104:	aa000004 	bge	1111c <Relay_control+0x114>
   11108:	e3010fc0 	movw	r0, #8128	; 0x1fc0
   1110c:	e3400001 	movt	r0, #1
   11110:	ebfffcba 	bl	10400 <puts@plt>
   11114:	e3a03000 	mov	r3, #0
   11118:	ea00000d 	b	11154 <Relay_control+0x14c>
   1111c:	e24b1006 	sub	r1, fp, #6
   11120:	e3a03001 	mov	r3, #1
   11124:	e3a02022 	mov	r2, #34	; 0x22
   11128:	e51b0010 	ldr	r0, [fp, #-16]
   1112c:	ebfffd0f 	bl	10570 <iic_read>
   11130:	e1a03000 	mov	r3, r0
   11134:	e3530000 	cmp	r3, #0
   11138:	aa000004 	bge	11150 <Relay_control+0x148>
   1113c:	e3010fd4 	movw	r0, #8148	; 0x1fd4
   11140:	e3400001 	movt	r0, #1
   11144:	ebfffcad 	bl	10400 <puts@plt>
   11148:	e3a03000 	mov	r3, #0
   1114c:	ea000000 	b	11154 <Relay_control+0x14c>
   11150:	e3a03001 	mov	r3, #1
   11154:	e1a00003 	mov	r0, r3
   11158:	e24bd004 	sub	sp, fp, #4
   1115c:	e8bd8800 	pop	{fp, pc}

00011160 <eeprom_page_read>:
   11160:	e92d4800 	push	{fp, lr}
   11164:	e28db004 	add	fp, sp, #4
   11168:	e24dd018 	sub	sp, sp, #24
   1116c:	e50b0010 	str	r0, [fp, #-16]
   11170:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   11174:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
   11178:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
   1117c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11180:	e3530000 	cmp	r3, #0
   11184:	ba000002 	blt	11194 <eeprom_page_read+0x34>
   11188:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   1118c:	e3530009 	cmp	r3, #9
   11190:	da000004 	ble	111a8 <eeprom_page_read+0x48>
   11194:	e3010e48 	movw	r0, #7752	; 0x1e48
   11198:	e3400001 	movt	r0, #1
   1119c:	ebfffc97 	bl	10400 <puts@plt>
   111a0:	e3a03000 	mov	r3, #0
   111a4:	ea00007e 	b	113a4 <eeprom_page_read+0x244>
   111a8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   111ac:	e3530c02 	cmp	r3, #512	; 0x200
   111b0:	ba000004 	blt	111c8 <eeprom_page_read+0x68>
   111b4:	e3020048 	movw	r0, #8264	; 0x2048
   111b8:	e3400001 	movt	r0, #1
   111bc:	ebfffc8f 	bl	10400 <puts@plt>
   111c0:	e3a03000 	mov	r3, #0
   111c4:	ea000076 	b	113a4 <eeprom_page_read+0x244>
   111c8:	e59b3004 	ldr	r3, [fp, #4]
   111cc:	e3530c02 	cmp	r3, #512	; 0x200
   111d0:	da000004 	ble	111e8 <eeprom_page_read+0x88>
   111d4:	e3020064 	movw	r0, #8292	; 0x2064
   111d8:	e3400001 	movt	r0, #1
   111dc:	ebfffc87 	bl	10400 <puts@plt>
   111e0:	e3a03000 	mov	r3, #0
   111e4:	ea00006e 	b	113a4 <eeprom_page_read+0x244>
   111e8:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   111ec:	e59b3004 	ldr	r3, [fp, #4]
   111f0:	e0823003 	add	r3, r2, r3
   111f4:	e3530c02 	cmp	r3, #512	; 0x200
   111f8:	da000004 	ble	11210 <eeprom_page_read+0xb0>
   111fc:	e3020074 	movw	r0, #8308	; 0x2074
   11200:	e3400001 	movt	r0, #1
   11204:	ebfffc7d 	bl	10400 <puts@plt>
   11208:	e3a03000 	mov	r3, #0
   1120c:	ea000064 	b	113a4 <eeprom_page_read+0x244>
   11210:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11214:	e6ef3073 	uxtb	r3, r3
   11218:	e3a02001 	mov	r2, #1
   1121c:	e1a01003 	mov	r1, r3
   11220:	e51b0010 	ldr	r0, [fp, #-16]
   11224:	ebfffda6 	bl	108c4 <eeprom_is_switch>
   11228:	e1a03000 	mov	r3, r0
   1122c:	e3530001 	cmp	r3, #1
   11230:	1a00000d 	bne	1126c <eeprom_page_read+0x10c>
   11234:	e30a249c 	movw	r2, #42140	; 0xa49c
   11238:	e3402002 	movt	r2, #2
   1123c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11240:	e1a03283 	lsl	r3, r3, #5
   11244:	e0823003 	add	r3, r2, r3
   11248:	e3a02001 	mov	r2, #1
   1124c:	e583200c 	str	r2, [r3, #12]
   11250:	e3a02050 	mov	r2, #80	; 0x50
   11254:	e3001703 	movw	r1, #1795	; 0x703
   11258:	e51b0010 	ldr	r0, [fp, #-16]
   1125c:	ebfffc61 	bl	103e8 <ioctl@plt>
   11260:	e3a03000 	mov	r3, #0
   11264:	e50b3008 	str	r3, [fp, #-8]
   11268:	ea000033 	b	1133c <eeprom_page_read+0x1dc>
   1126c:	e3020088 	movw	r0, #8328	; 0x2088
   11270:	e3400001 	movt	r0, #1
   11274:	ebfffc61 	bl	10400 <puts@plt>
   11278:	e3a03000 	mov	r3, #0
   1127c:	ea000048 	b	113a4 <eeprom_page_read+0x244>
   11280:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   11284:	e51b3008 	ldr	r3, [fp, #-8]
   11288:	e0823003 	add	r3, r2, r3
   1128c:	e1a03303 	lsl	r3, r3, #6
   11290:	e1a03443 	asr	r3, r3, #8
   11294:	e6ef3073 	uxtb	r3, r3
   11298:	e54b300c 	strb	r3, [fp, #-12]
   1129c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   112a0:	e51b3008 	ldr	r3, [fp, #-8]
   112a4:	e0823003 	add	r3, r2, r3
   112a8:	e6ef3073 	uxtb	r3, r3
   112ac:	e1a03303 	lsl	r3, r3, #6
   112b0:	e6ef3073 	uxtb	r3, r3
   112b4:	e54b300b 	strb	r3, [fp, #-11]
   112b8:	e24b300c 	sub	r3, fp, #12
   112bc:	e3a02002 	mov	r2, #2
   112c0:	e1a01003 	mov	r1, r3
   112c4:	e51b0010 	ldr	r0, [fp, #-16]
   112c8:	ebfffc58 	bl	10430 <write@plt>
   112cc:	e1a03000 	mov	r3, r0
   112d0:	e3530000 	cmp	r3, #0
   112d4:	aa000004 	bge	112ec <eeprom_page_read+0x18c>
   112d8:	e30200a0 	movw	r0, #8352	; 0x20a0
   112dc:	e3400001 	movt	r0, #1
   112e0:	ebfffc46 	bl	10400 <puts@plt>
   112e4:	e3a03000 	mov	r3, #0
   112e8:	ea00002d 	b	113a4 <eeprom_page_read+0x244>
   112ec:	e51b3008 	ldr	r3, [fp, #-8]
   112f0:	e1a03303 	lsl	r3, r3, #6
   112f4:	e1a02003 	mov	r2, r3
   112f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   112fc:	e0833002 	add	r3, r3, r2
   11300:	e3a02040 	mov	r2, #64	; 0x40
   11304:	e1a01003 	mov	r1, r3
   11308:	e51b0010 	ldr	r0, [fp, #-16]
   1130c:	ebfffc2f 	bl	103d0 <read@plt>
   11310:	e1a03000 	mov	r3, r0
   11314:	e3530000 	cmp	r3, #0
   11318:	aa000004 	bge	11330 <eeprom_page_read+0x1d0>
   1131c:	e30200b8 	movw	r0, #8376	; 0x20b8
   11320:	e3400001 	movt	r0, #1
   11324:	ebfffc35 	bl	10400 <puts@plt>
   11328:	e3a03000 	mov	r3, #0
   1132c:	ea00001c 	b	113a4 <eeprom_page_read+0x244>
   11330:	e51b3008 	ldr	r3, [fp, #-8]
   11334:	e2833001 	add	r3, r3, #1
   11338:	e50b3008 	str	r3, [fp, #-8]
   1133c:	e51b2008 	ldr	r2, [fp, #-8]
   11340:	e59b3004 	ldr	r3, [fp, #4]
   11344:	e1520003 	cmp	r2, r3
   11348:	baffffcc 	blt	11280 <eeprom_page_read+0x120>
   1134c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11350:	e6ef3073 	uxtb	r3, r3
   11354:	e3a02002 	mov	r2, #2
   11358:	e1a01003 	mov	r1, r3
   1135c:	e51b0010 	ldr	r0, [fp, #-16]
   11360:	ebfffd57 	bl	108c4 <eeprom_is_switch>
   11364:	e1a03000 	mov	r3, r0
   11368:	e3530001 	cmp	r3, #1
   1136c:	1a000008 	bne	11394 <eeprom_page_read+0x234>
   11370:	e30a249c 	movw	r2, #42140	; 0xa49c
   11374:	e3402002 	movt	r2, #2
   11378:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   1137c:	e1a03283 	lsl	r3, r3, #5
   11380:	e0823003 	add	r3, r2, r3
   11384:	e3a02002 	mov	r2, #2
   11388:	e583200c 	str	r2, [r3, #12]
   1138c:	e3a03001 	mov	r3, #1
   11390:	ea000003 	b	113a4 <eeprom_page_read+0x244>
   11394:	e30200d0 	movw	r0, #8400	; 0x20d0
   11398:	e3400001 	movt	r0, #1
   1139c:	ebfffc17 	bl	10400 <puts@plt>
   113a0:	e3a03000 	mov	r3, #0
   113a4:	e1a00003 	mov	r0, r3
   113a8:	e24bd004 	sub	sp, fp, #4
   113ac:	e8bd8800 	pop	{fp, pc}

000113b0 <eeprom_page_write>:
   113b0:	e92d4800 	push	{fp, lr}
   113b4:	e28db004 	add	fp, sp, #4
   113b8:	e24dd060 	sub	sp, sp, #96	; 0x60
   113bc:	e50b0058 	str	r0, [fp, #-88]	; 0xffffffa8
   113c0:	e50b105c 	str	r1, [fp, #-92]	; 0xffffffa4
   113c4:	e50b2060 	str	r2, [fp, #-96]	; 0xffffffa0
   113c8:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
   113cc:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
   113d0:	e3530000 	cmp	r3, #0
   113d4:	ba000002 	blt	113e4 <eeprom_page_write+0x34>
   113d8:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
   113dc:	e3530009 	cmp	r3, #9
   113e0:	da000004 	ble	113f8 <eeprom_page_write+0x48>
   113e4:	e3010e48 	movw	r0, #7752	; 0x1e48
   113e8:	e3400001 	movt	r0, #1
   113ec:	ebfffc03 	bl	10400 <puts@plt>
   113f0:	e3a03000 	mov	r3, #0
   113f4:	ea00007b 	b	115e8 <eeprom_page_write+0x238>
   113f8:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
   113fc:	e3530c02 	cmp	r3, #512	; 0x200
   11400:	ba000004 	blt	11418 <eeprom_page_write+0x68>
   11404:	e30200ec 	movw	r0, #8428	; 0x20ec
   11408:	e3400001 	movt	r0, #1
   1140c:	ebfffbfb 	bl	10400 <puts@plt>
   11410:	e3a03000 	mov	r3, #0
   11414:	ea000073 	b	115e8 <eeprom_page_write+0x238>
   11418:	e59b3004 	ldr	r3, [fp, #4]
   1141c:	e3530c02 	cmp	r3, #512	; 0x200
   11420:	da000004 	ble	11438 <eeprom_page_write+0x88>
   11424:	e3020108 	movw	r0, #8456	; 0x2108
   11428:	e3400001 	movt	r0, #1
   1142c:	ebfffbf3 	bl	10400 <puts@plt>
   11430:	e3a03000 	mov	r3, #0
   11434:	ea00006b 	b	115e8 <eeprom_page_write+0x238>
   11438:	e51b2064 	ldr	r2, [fp, #-100]	; 0xffffff9c
   1143c:	e59b3004 	ldr	r3, [fp, #4]
   11440:	e0823003 	add	r3, r2, r3
   11444:	e3530c02 	cmp	r3, #512	; 0x200
   11448:	da000004 	ble	11460 <eeprom_page_write+0xb0>
   1144c:	e3020120 	movw	r0, #8480	; 0x2120
   11450:	e3400001 	movt	r0, #1
   11454:	ebfffbe9 	bl	10400 <puts@plt>
   11458:	e3a03000 	mov	r3, #0
   1145c:	ea000061 	b	115e8 <eeprom_page_write+0x238>
   11460:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
   11464:	e6ef3073 	uxtb	r3, r3
   11468:	e3a02001 	mov	r2, #1
   1146c:	e1a01003 	mov	r1, r3
   11470:	e51b0058 	ldr	r0, [fp, #-88]	; 0xffffffa8
   11474:	ebfffd12 	bl	108c4 <eeprom_is_switch>
   11478:	e1a03000 	mov	r3, r0
   1147c:	e3530001 	cmp	r3, #1
   11480:	1a00000d 	bne	114bc <eeprom_page_write+0x10c>
   11484:	e30a249c 	movw	r2, #42140	; 0xa49c
   11488:	e3402002 	movt	r2, #2
   1148c:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
   11490:	e1a03283 	lsl	r3, r3, #5
   11494:	e0823003 	add	r3, r2, r3
   11498:	e3a02001 	mov	r2, #1
   1149c:	e583200c 	str	r2, [r3, #12]
   114a0:	e3a02050 	mov	r2, #80	; 0x50
   114a4:	e3001703 	movw	r1, #1795	; 0x703
   114a8:	e51b0058 	ldr	r0, [fp, #-88]	; 0xffffffa8
   114ac:	ebfffbcd 	bl	103e8 <ioctl@plt>
   114b0:	e3a03000 	mov	r3, #0
   114b4:	e50b3008 	str	r3, [fp, #-8]
   114b8:	ea000030 	b	11580 <eeprom_page_write+0x1d0>
   114bc:	e3020088 	movw	r0, #8328	; 0x2088
   114c0:	e3400001 	movt	r0, #1
   114c4:	ebfffbcd 	bl	10400 <puts@plt>
   114c8:	e3a03000 	mov	r3, #0
   114cc:	ea000045 	b	115e8 <eeprom_page_write+0x238>
   114d0:	e51b2064 	ldr	r2, [fp, #-100]	; 0xffffff9c
   114d4:	e51b3008 	ldr	r3, [fp, #-8]
   114d8:	e0823003 	add	r3, r2, r3
   114dc:	e1a03303 	lsl	r3, r3, #6
   114e0:	e1a03443 	asr	r3, r3, #8
   114e4:	e6ef3073 	uxtb	r3, r3
   114e8:	e54b3054 	strb	r3, [fp, #-84]	; 0xffffffac
   114ec:	e51b2064 	ldr	r2, [fp, #-100]	; 0xffffff9c
   114f0:	e51b3008 	ldr	r3, [fp, #-8]
   114f4:	e0823003 	add	r3, r2, r3
   114f8:	e6ef3073 	uxtb	r3, r3
   114fc:	e1a03303 	lsl	r3, r3, #6
   11500:	e6ef3073 	uxtb	r3, r3
   11504:	e54b3053 	strb	r3, [fp, #-83]	; 0xffffffad
   11508:	e24b3054 	sub	r3, fp, #84	; 0x54
   1150c:	e2833002 	add	r3, r3, #2
   11510:	e51b2008 	ldr	r2, [fp, #-8]
   11514:	e1a02302 	lsl	r2, r2, #6
   11518:	e1a01002 	mov	r1, r2
   1151c:	e51b2060 	ldr	r2, [fp, #-96]	; 0xffffffa0
   11520:	e0821001 	add	r1, r2, r1
   11524:	e3a02040 	mov	r2, #64	; 0x40
   11528:	e1a00003 	mov	r0, r3
   1152c:	ebfffbaa 	bl	103dc <memcpy@plt>
   11530:	e24b3054 	sub	r3, fp, #84	; 0x54
   11534:	e3a02042 	mov	r2, #66	; 0x42
   11538:	e1a01003 	mov	r1, r3
   1153c:	e51b0058 	ldr	r0, [fp, #-88]	; 0xffffffa8
   11540:	ebfffbba 	bl	10430 <write@plt>
   11544:	e50b000c 	str	r0, [fp, #-12]
   11548:	e51b300c 	ldr	r3, [fp, #-12]
   1154c:	e3530000 	cmp	r3, #0
   11550:	aa000005 	bge	1156c <eeprom_page_write+0x1bc>
   11554:	e51b100c 	ldr	r1, [fp, #-12]
   11558:	e3020134 	movw	r0, #8500	; 0x2134
   1155c:	e3400001 	movt	r0, #1
   11560:	ebfffb97 	bl	103c4 <printf@plt>
   11564:	e3a03000 	mov	r3, #0
   11568:	ea00001e 	b	115e8 <eeprom_page_write+0x238>
   1156c:	e3010388 	movw	r0, #5000	; 0x1388
   11570:	ebfffb9f 	bl	103f4 <usleep@plt>
   11574:	e51b3008 	ldr	r3, [fp, #-8]
   11578:	e2833001 	add	r3, r3, #1
   1157c:	e50b3008 	str	r3, [fp, #-8]
   11580:	e51b2008 	ldr	r2, [fp, #-8]
   11584:	e59b3004 	ldr	r3, [fp, #4]
   11588:	e1520003 	cmp	r2, r3
   1158c:	baffffcf 	blt	114d0 <eeprom_page_write+0x120>
   11590:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
   11594:	e6ef3073 	uxtb	r3, r3
   11598:	e3a02002 	mov	r2, #2
   1159c:	e1a01003 	mov	r1, r3
   115a0:	e51b0058 	ldr	r0, [fp, #-88]	; 0xffffffa8
   115a4:	ebfffcc6 	bl	108c4 <eeprom_is_switch>
   115a8:	e1a03000 	mov	r3, r0
   115ac:	e3530001 	cmp	r3, #1
   115b0:	1a000008 	bne	115d8 <eeprom_page_write+0x228>
   115b4:	e30a249c 	movw	r2, #42140	; 0xa49c
   115b8:	e3402002 	movt	r2, #2
   115bc:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
   115c0:	e1a03283 	lsl	r3, r3, #5
   115c4:	e0823003 	add	r3, r2, r3
   115c8:	e3a02002 	mov	r2, #2
   115cc:	e583200c 	str	r2, [r3, #12]
   115d0:	e3a03001 	mov	r3, #1
   115d4:	ea000003 	b	115e8 <eeprom_page_write+0x238>
   115d8:	e30200d0 	movw	r0, #8400	; 0x20d0
   115dc:	e3400001 	movt	r0, #1
   115e0:	ebfffb86 	bl	10400 <puts@plt>
   115e4:	e3a03000 	mov	r3, #0
   115e8:	e1a00003 	mov	r0, r3
   115ec:	e24bd004 	sub	sp, fp, #4
   115f0:	e8bd8800 	pop	{fp, pc}

000115f4 <eeprom_byte_read>:
   115f4:	e92d4800 	push	{fp, lr}
   115f8:	e28db004 	add	fp, sp, #4
   115fc:	e24dd018 	sub	sp, sp, #24
   11600:	e50b0010 	str	r0, [fp, #-16]
   11604:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   11608:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
   1160c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
   11610:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11614:	e3530000 	cmp	r3, #0
   11618:	ba000002 	blt	11628 <eeprom_byte_read+0x34>
   1161c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11620:	e3530009 	cmp	r3, #9
   11624:	da000004 	ble	1163c <eeprom_byte_read+0x48>
   11628:	e3010e48 	movw	r0, #7752	; 0x1e48
   1162c:	e3400001 	movt	r0, #1
   11630:	ebfffb72 	bl	10400 <puts@plt>
   11634:	e3a03000 	mov	r3, #0
   11638:	ea00005c 	b	117b0 <eeprom_byte_read+0x1bc>
   1163c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   11640:	e3072fe1 	movw	r2, #32737	; 0x7fe1
   11644:	e1530002 	cmp	r3, r2
   11648:	da000004 	ble	11660 <eeprom_byte_read+0x6c>
   1164c:	e302015c 	movw	r0, #8540	; 0x215c
   11650:	e3400001 	movt	r0, #1
   11654:	ebfffb69 	bl	10400 <puts@plt>
   11658:	e3a03000 	mov	r3, #0
   1165c:	ea000053 	b	117b0 <eeprom_byte_read+0x1bc>
   11660:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11664:	e6ef3073 	uxtb	r3, r3
   11668:	e3a02001 	mov	r2, #1
   1166c:	e1a01003 	mov	r1, r3
   11670:	e51b0010 	ldr	r0, [fp, #-16]
   11674:	ebfffc92 	bl	108c4 <eeprom_is_switch>
   11678:	e1a03000 	mov	r3, r0
   1167c:	e3530001 	cmp	r3, #1
   11680:	1a00001a 	bne	116f0 <eeprom_byte_read+0xfc>
   11684:	e30a249c 	movw	r2, #42140	; 0xa49c
   11688:	e3402002 	movt	r2, #2
   1168c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11690:	e1a03283 	lsl	r3, r3, #5
   11694:	e0823003 	add	r3, r2, r3
   11698:	e3a02001 	mov	r2, #1
   1169c:	e583200c 	str	r2, [r3, #12]
   116a0:	e3a02050 	mov	r2, #80	; 0x50
   116a4:	e3001703 	movw	r1, #1795	; 0x703
   116a8:	e51b0010 	ldr	r0, [fp, #-16]
   116ac:	ebfffb4d 	bl	103e8 <ioctl@plt>
   116b0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   116b4:	e1a03443 	asr	r3, r3, #8
   116b8:	e6ef3073 	uxtb	r3, r3
   116bc:	e54b3008 	strb	r3, [fp, #-8]
   116c0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   116c4:	e6ef3073 	uxtb	r3, r3
   116c8:	e54b3007 	strb	r3, [fp, #-7]
   116cc:	e24b3008 	sub	r3, fp, #8
   116d0:	e3a02002 	mov	r2, #2
   116d4:	e1a01003 	mov	r1, r3
   116d8:	e51b0010 	ldr	r0, [fp, #-16]
   116dc:	ebfffb53 	bl	10430 <write@plt>
   116e0:	e1a03000 	mov	r3, r0
   116e4:	e3530000 	cmp	r3, #0
   116e8:	aa00000a 	bge	11718 <eeprom_byte_read+0x124>
   116ec:	ea000004 	b	11704 <eeprom_byte_read+0x110>
   116f0:	e3020088 	movw	r0, #8328	; 0x2088
   116f4:	e3400001 	movt	r0, #1
   116f8:	ebfffb40 	bl	10400 <puts@plt>
   116fc:	e3a03000 	mov	r3, #0
   11700:	ea00002a 	b	117b0 <eeprom_byte_read+0x1bc>
   11704:	e30200a0 	movw	r0, #8352	; 0x20a0
   11708:	e3400001 	movt	r0, #1
   1170c:	ebfffb3b 	bl	10400 <puts@plt>
   11710:	e3a03000 	mov	r3, #0
   11714:	ea000025 	b	117b0 <eeprom_byte_read+0x1bc>
   11718:	e24b300c 	sub	r3, fp, #12
   1171c:	e3a02001 	mov	r2, #1
   11720:	e1a01003 	mov	r1, r3
   11724:	e51b0010 	ldr	r0, [fp, #-16]
   11728:	ebfffb28 	bl	103d0 <read@plt>
   1172c:	e1a03000 	mov	r3, r0
   11730:	e3530000 	cmp	r3, #0
   11734:	aa000004 	bge	1174c <eeprom_byte_read+0x158>
   11738:	e30200b8 	movw	r0, #8376	; 0x20b8
   1173c:	e3400001 	movt	r0, #1
   11740:	ebfffb2e 	bl	10400 <puts@plt>
   11744:	e3a03000 	mov	r3, #0
   11748:	ea000018 	b	117b0 <eeprom_byte_read+0x1bc>
   1174c:	e55b200c 	ldrb	r2, [fp, #-12]
   11750:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   11754:	e5c32000 	strb	r2, [r3]
   11758:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   1175c:	e6ef3073 	uxtb	r3, r3
   11760:	e3a02002 	mov	r2, #2
   11764:	e1a01003 	mov	r1, r3
   11768:	e51b0010 	ldr	r0, [fp, #-16]
   1176c:	ebfffc54 	bl	108c4 <eeprom_is_switch>
   11770:	e1a03000 	mov	r3, r0
   11774:	e3530001 	cmp	r3, #1
   11778:	1a000008 	bne	117a0 <eeprom_byte_read+0x1ac>
   1177c:	e30a249c 	movw	r2, #42140	; 0xa49c
   11780:	e3402002 	movt	r2, #2
   11784:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11788:	e1a03283 	lsl	r3, r3, #5
   1178c:	e0823003 	add	r3, r2, r3
   11790:	e3a02002 	mov	r2, #2
   11794:	e583200c 	str	r2, [r3, #12]
   11798:	e3a03001 	mov	r3, #1
   1179c:	ea000003 	b	117b0 <eeprom_byte_read+0x1bc>
   117a0:	e30200d0 	movw	r0, #8400	; 0x20d0
   117a4:	e3400001 	movt	r0, #1
   117a8:	ebfffb14 	bl	10400 <puts@plt>
   117ac:	e3a03000 	mov	r3, #0
   117b0:	e1a00003 	mov	r0, r3
   117b4:	e24bd004 	sub	sp, fp, #4
   117b8:	e8bd8800 	pop	{fp, pc}

000117bc <eeprom_byte_write>:
   117bc:	e92d4800 	push	{fp, lr}
   117c0:	e28db004 	add	fp, sp, #4
   117c4:	e24dd018 	sub	sp, sp, #24
   117c8:	e50b0010 	str	r0, [fp, #-16]
   117cc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   117d0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
   117d4:	e1a03002 	mov	r3, r2
   117d8:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
   117dc:	e3a03000 	mov	r3, #0
   117e0:	e50b3008 	str	r3, [fp, #-8]
   117e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   117e8:	e3530000 	cmp	r3, #0
   117ec:	ba000002 	blt	117fc <eeprom_byte_write+0x40>
   117f0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   117f4:	e3530009 	cmp	r3, #9
   117f8:	da000004 	ble	11810 <eeprom_byte_write+0x54>
   117fc:	e3010e48 	movw	r0, #7752	; 0x1e48
   11800:	e3400001 	movt	r0, #1
   11804:	ebfffafd 	bl	10400 <puts@plt>
   11808:	e3a03000 	mov	r3, #0
   1180c:	ea000052 	b	1195c <eeprom_byte_write+0x1a0>
   11810:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   11814:	e3072fe1 	movw	r2, #32737	; 0x7fe1
   11818:	e1530002 	cmp	r3, r2
   1181c:	da000004 	ble	11834 <eeprom_byte_write+0x78>
   11820:	e3020174 	movw	r0, #8564	; 0x2174
   11824:	e3400001 	movt	r0, #1
   11828:	ebfffaf4 	bl	10400 <puts@plt>
   1182c:	e3a03000 	mov	r3, #0
   11830:	ea000049 	b	1195c <eeprom_byte_write+0x1a0>
   11834:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11838:	e6ef3073 	uxtb	r3, r3
   1183c:	e3a02001 	mov	r2, #1
   11840:	e1a01003 	mov	r1, r3
   11844:	e51b0010 	ldr	r0, [fp, #-16]
   11848:	ebfffc1d 	bl	108c4 <eeprom_is_switch>
   1184c:	e1a03000 	mov	r3, r0
   11850:	e3530001 	cmp	r3, #1
   11854:	1a00001d 	bne	118d0 <eeprom_byte_write+0x114>
   11858:	e30a249c 	movw	r2, #42140	; 0xa49c
   1185c:	e3402002 	movt	r2, #2
   11860:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11864:	e1a03283 	lsl	r3, r3, #5
   11868:	e0823003 	add	r3, r2, r3
   1186c:	e3a02001 	mov	r2, #1
   11870:	e583200c 	str	r2, [r3, #12]
   11874:	e3a02050 	mov	r2, #80	; 0x50
   11878:	e3001703 	movw	r1, #1795	; 0x703
   1187c:	e51b0010 	ldr	r0, [fp, #-16]
   11880:	ebfffad8 	bl	103e8 <ioctl@plt>
   11884:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   11888:	e1a03443 	asr	r3, r3, #8
   1188c:	e6ef3073 	uxtb	r3, r3
   11890:	e54b300c 	strb	r3, [fp, #-12]
   11894:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   11898:	e6ef3073 	uxtb	r3, r3
   1189c:	e54b300b 	strb	r3, [fp, #-11]
   118a0:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   118a4:	e54b300a 	strb	r3, [fp, #-10]
   118a8:	e24b300c 	sub	r3, fp, #12
   118ac:	e3a02003 	mov	r2, #3
   118b0:	e1a01003 	mov	r1, r3
   118b4:	e51b0010 	ldr	r0, [fp, #-16]
   118b8:	ebfffadc 	bl	10430 <write@plt>
   118bc:	e50b0008 	str	r0, [fp, #-8]
   118c0:	e51b3008 	ldr	r3, [fp, #-8]
   118c4:	e3530000 	cmp	r3, #0
   118c8:	aa00000b 	bge	118fc <eeprom_byte_write+0x140>
   118cc:	ea000004 	b	118e4 <eeprom_byte_write+0x128>
   118d0:	e3020088 	movw	r0, #8328	; 0x2088
   118d4:	e3400001 	movt	r0, #1
   118d8:	ebfffac8 	bl	10400 <puts@plt>
   118dc:	e3a03000 	mov	r3, #0
   118e0:	ea00001d 	b	1195c <eeprom_byte_write+0x1a0>
   118e4:	e51b1008 	ldr	r1, [fp, #-8]
   118e8:	e3020134 	movw	r0, #8500	; 0x2134
   118ec:	e3400001 	movt	r0, #1
   118f0:	ebfffab3 	bl	103c4 <printf@plt>
   118f4:	e3a03000 	mov	r3, #0
   118f8:	ea000017 	b	1195c <eeprom_byte_write+0x1a0>
   118fc:	e3010388 	movw	r0, #5000	; 0x1388
   11900:	ebfffabb 	bl	103f4 <usleep@plt>
   11904:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11908:	e6ef3073 	uxtb	r3, r3
   1190c:	e3a02002 	mov	r2, #2
   11910:	e1a01003 	mov	r1, r3
   11914:	e51b0010 	ldr	r0, [fp, #-16]
   11918:	ebfffbe9 	bl	108c4 <eeprom_is_switch>
   1191c:	e1a03000 	mov	r3, r0
   11920:	e3530001 	cmp	r3, #1
   11924:	1a000008 	bne	1194c <eeprom_byte_write+0x190>
   11928:	e30a249c 	movw	r2, #42140	; 0xa49c
   1192c:	e3402002 	movt	r2, #2
   11930:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11934:	e1a03283 	lsl	r3, r3, #5
   11938:	e0823003 	add	r3, r2, r3
   1193c:	e3a02002 	mov	r2, #2
   11940:	e583200c 	str	r2, [r3, #12]
   11944:	e3a03001 	mov	r3, #1
   11948:	ea000003 	b	1195c <eeprom_byte_write+0x1a0>
   1194c:	e30200d0 	movw	r0, #8400	; 0x20d0
   11950:	e3400001 	movt	r0, #1
   11954:	ebfffaa9 	bl	10400 <puts@plt>
   11958:	e3a03000 	mov	r3, #0
   1195c:	e1a00003 	mov	r0, r3
   11960:	e24bd004 	sub	sp, fp, #4
   11964:	e8bd8800 	pop	{fp, pc}

00011968 <main>:
   11968:	e92d4800 	push	{fp, lr}
   1196c:	e28db004 	add	fp, sp, #4
   11970:	e24ddf46 	sub	sp, sp, #280	; 0x118
   11974:	e3a03055 	mov	r3, #85	; 0x55
   11978:	e54b3018 	strb	r3, [fp, #-24]	; 0xffffffe8
   1197c:	e3a03000 	mov	r3, #0
   11980:	e54b3017 	strb	r3, [fp, #-23]	; 0xffffffe9
   11984:	e3a01002 	mov	r1, #2
   11988:	e302018c 	movw	r0, #8588	; 0x218c
   1198c:	e3400001 	movt	r0, #1
   11990:	ebfffaa3 	bl	10424 <open@plt>
   11994:	e50b0010 	str	r0, [fp, #-16]
   11998:	e51b3010 	ldr	r3, [fp, #-16]
   1199c:	e3530000 	cmp	r3, #0
   119a0:	aa000004 	bge	119b8 <main+0x50>
   119a4:	e3020198 	movw	r0, #8600	; 0x2198
   119a8:	e3400001 	movt	r0, #1
   119ac:	ebfffa93 	bl	10400 <puts@plt>
   119b0:	e3e03000 	mvn	r3, #0
   119b4:	ea000101 	b	11dc0 <main+0x458>
   119b8:	e3a02000 	mov	r2, #0
   119bc:	e3001704 	movw	r1, #1796	; 0x704
   119c0:	e51b0010 	ldr	r0, [fp, #-16]
   119c4:	ebfffa87 	bl	103e8 <ioctl@plt>
   119c8:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
   119cc:	e3a03000 	mov	r3, #0
   119d0:	e50b3008 	str	r3, [fp, #-8]
   119d4:	ea000014 	b	11a2c <main+0xc4>
   119d8:	e3a03000 	mov	r3, #0
   119dc:	e50b300c 	str	r3, [fp, #-12]
   119e0:	ea00000b 	b	11a14 <main+0xac>
   119e4:	e51b3008 	ldr	r3, [fp, #-8]
   119e8:	e1a02303 	lsl	r2, r3, #6
   119ec:	e51b300c 	ldr	r3, [fp, #-12]
   119f0:	e0822003 	add	r2, r2, r3
   119f4:	e51b300c 	ldr	r3, [fp, #-12]
   119f8:	e6ef1073 	uxtb	r1, r3
   119fc:	e30a35dc 	movw	r3, #42460	; 0xa5dc
   11a00:	e3403002 	movt	r3, #2
   11a04:	e7c31002 	strb	r1, [r3, r2]
   11a08:	e51b300c 	ldr	r3, [fp, #-12]
   11a0c:	e2833001 	add	r3, r3, #1
   11a10:	e50b300c 	str	r3, [fp, #-12]
   11a14:	e51b300c 	ldr	r3, [fp, #-12]
   11a18:	e353003f 	cmp	r3, #63	; 0x3f
   11a1c:	dafffff0 	ble	119e4 <main+0x7c>
   11a20:	e51b3008 	ldr	r3, [fp, #-8]
   11a24:	e2833001 	add	r3, r3, #1
   11a28:	e50b3008 	str	r3, [fp, #-8]
   11a2c:	e51b3008 	ldr	r3, [fp, #-8]
   11a30:	e3530c02 	cmp	r3, #512	; 0x200
   11a34:	baffffe7 	blt	119d8 <main+0x70>
   11a38:	e3a03000 	mov	r3, #0
   11a3c:	e50b3008 	str	r3, [fp, #-8]
   11a40:	ea000013 	b	11a94 <main+0x12c>
   11a44:	e51b3008 	ldr	r3, [fp, #-8]
   11a48:	e6ef3073 	uxtb	r3, r3
   11a4c:	e1a01003 	mov	r1, r3
   11a50:	e51b0010 	ldr	r0, [fp, #-16]
   11a54:	ebfffc0b 	bl	10a88 <bus_test>
   11a58:	e1a03000 	mov	r3, r0
   11a5c:	e3530000 	cmp	r3, #0
   11a60:	0a000008 	beq	11a88 <main+0x120>
   11a64:	e30a349c 	movw	r3, #42140	; 0xa49c
   11a68:	e3403002 	movt	r3, #2
   11a6c:	e51b2008 	ldr	r2, [fp, #-8]
   11a70:	e3a01001 	mov	r1, #1
   11a74:	e7831282 	str	r1, [r3, r2, lsl #5]
   11a78:	e51b1008 	ldr	r1, [fp, #-8]
   11a7c:	e30201bc 	movw	r0, #8636	; 0x21bc
   11a80:	e3400001 	movt	r0, #1
   11a84:	ebfffa4e 	bl	103c4 <printf@plt>
   11a88:	e51b3008 	ldr	r3, [fp, #-8]
   11a8c:	e2833001 	add	r3, r3, #1
   11a90:	e50b3008 	str	r3, [fp, #-8]
   11a94:	e51b3008 	ldr	r3, [fp, #-8]
   11a98:	e3530009 	cmp	r3, #9
   11a9c:	daffffe8 	ble	11a44 <main+0xdc>
   11aa0:	e3a03000 	mov	r3, #0
   11aa4:	e50b3008 	str	r3, [fp, #-8]
   11aa8:	ea0000c0 	b	11db0 <main+0x448>
   11aac:	e30a349c 	movw	r3, #42140	; 0xa49c
   11ab0:	e3403002 	movt	r3, #2
   11ab4:	e51b2008 	ldr	r2, [fp, #-8]
   11ab8:	e7933282 	ldr	r3, [r3, r2, lsl #5]
   11abc:	e3530000 	cmp	r3, #0
   11ac0:	0a0000b6 	beq	11da0 <main+0x438>
   11ac4:	e51b1008 	ldr	r1, [fp, #-8]
   11ac8:	e30201d8 	movw	r0, #8664	; 0x21d8
   11acc:	e3400001 	movt	r0, #1
   11ad0:	ebfffa3b 	bl	103c4 <printf@plt>
   11ad4:	e51b3008 	ldr	r3, [fp, #-8]
   11ad8:	e6ef3073 	uxtb	r3, r3
   11adc:	e1a01003 	mov	r1, r3
   11ae0:	e51b0010 	ldr	r0, [fp, #-16]
   11ae4:	ebfffad8 	bl	1064c <Board_type>
   11ae8:	e1a01000 	mov	r1, r0
   11aec:	e30a249c 	movw	r2, #42140	; 0xa49c
   11af0:	e3402002 	movt	r2, #2
   11af4:	e51b3008 	ldr	r3, [fp, #-8]
   11af8:	e1a03283 	lsl	r3, r3, #5
   11afc:	e0823003 	add	r3, r2, r3
   11b00:	e5831004 	str	r1, [r3, #4]
   11b04:	e30a249c 	movw	r2, #42140	; 0xa49c
   11b08:	e3402002 	movt	r2, #2
   11b0c:	e51b3008 	ldr	r3, [fp, #-8]
   11b10:	e1a03283 	lsl	r3, r3, #5
   11b14:	e0823003 	add	r3, r2, r3
   11b18:	e5933004 	ldr	r3, [r3, #4]
   11b1c:	e1a01003 	mov	r1, r3
   11b20:	e30201f8 	movw	r0, #8696	; 0x21f8
   11b24:	e3400001 	movt	r0, #1
   11b28:	ebfffa25 	bl	103c4 <printf@plt>
   11b2c:	e51b3008 	ldr	r3, [fp, #-8]
   11b30:	e6ef3073 	uxtb	r3, r3
   11b34:	e1a01003 	mov	r1, r3
   11b38:	e51b0010 	ldr	r0, [fp, #-16]
   11b3c:	ebfffb2c 	bl	107f4 <Project_version>
   11b40:	e1a01000 	mov	r1, r0
   11b44:	e30a249c 	movw	r2, #42140	; 0xa49c
   11b48:	e3402002 	movt	r2, #2
   11b4c:	e51b3008 	ldr	r3, [fp, #-8]
   11b50:	e1a03283 	lsl	r3, r3, #5
   11b54:	e0823003 	add	r3, r2, r3
   11b58:	e5831008 	str	r1, [r3, #8]
   11b5c:	e30a249c 	movw	r2, #42140	; 0xa49c
   11b60:	e3402002 	movt	r2, #2
   11b64:	e51b3008 	ldr	r3, [fp, #-8]
   11b68:	e1a03283 	lsl	r3, r3, #5
   11b6c:	e0823003 	add	r3, r2, r3
   11b70:	e5933008 	ldr	r3, [r3, #8]
   11b74:	e1a01003 	mov	r1, r3
   11b78:	e302020c 	movw	r0, #8716	; 0x220c
   11b7c:	e3400001 	movt	r0, #1
   11b80:	ebfffa0f 	bl	103c4 <printf@plt>
   11b84:	e51b3008 	ldr	r3, [fp, #-8]
   11b88:	e6ef3073 	uxtb	r3, r3
   11b8c:	e1a01003 	mov	r1, r3
   11b90:	e51b0010 	ldr	r0, [fp, #-16]
   11b94:	ebfffae1 	bl	10720 <Status_ack>
   11b98:	e1a01000 	mov	r1, r0
   11b9c:	e30a249c 	movw	r2, #42140	; 0xa49c
   11ba0:	e3402002 	movt	r2, #2
   11ba4:	e51b3008 	ldr	r3, [fp, #-8]
   11ba8:	e1a03283 	lsl	r3, r3, #5
   11bac:	e0823003 	add	r3, r2, r3
   11bb0:	e5831010 	str	r1, [r3, #16]
   11bb4:	e30a249c 	movw	r2, #42140	; 0xa49c
   11bb8:	e3402002 	movt	r2, #2
   11bbc:	e51b3008 	ldr	r3, [fp, #-8]
   11bc0:	e1a03283 	lsl	r3, r3, #5
   11bc4:	e0823003 	add	r3, r2, r3
   11bc8:	e5933010 	ldr	r3, [r3, #16]
   11bcc:	e3530001 	cmp	r3, #1
   11bd0:	1a000003 	bne	11be4 <main+0x27c>
   11bd4:	e3020224 	movw	r0, #8740	; 0x2224
   11bd8:	e3400001 	movt	r0, #1
   11bdc:	ebfffa07 	bl	10400 <puts@plt>
   11be0:	ea000016 	b	11c40 <main+0x2d8>
   11be4:	e30a249c 	movw	r2, #42140	; 0xa49c
   11be8:	e3402002 	movt	r2, #2
   11bec:	e51b3008 	ldr	r3, [fp, #-8]
   11bf0:	e1a03283 	lsl	r3, r3, #5
   11bf4:	e0823003 	add	r3, r2, r3
   11bf8:	e5933010 	ldr	r3, [r3, #16]
   11bfc:	e3530001 	cmp	r3, #1
   11c00:	1a000003 	bne	11c14 <main+0x2ac>
   11c04:	e302024c 	movw	r0, #8780	; 0x224c
   11c08:	e3400001 	movt	r0, #1
   11c0c:	ebfff9fb 	bl	10400 <puts@plt>
   11c10:	ea00000a 	b	11c40 <main+0x2d8>
   11c14:	e30a249c 	movw	r2, #42140	; 0xa49c
   11c18:	e3402002 	movt	r2, #2
   11c1c:	e51b3008 	ldr	r3, [fp, #-8]
   11c20:	e1a03283 	lsl	r3, r3, #5
   11c24:	e0823003 	add	r3, r2, r3
   11c28:	e5933010 	ldr	r3, [r3, #16]
   11c2c:	e3530001 	cmp	r3, #1
   11c30:	1a000002 	bne	11c40 <main+0x2d8>
   11c34:	e3020274 	movw	r0, #8820	; 0x2274
   11c38:	e3400001 	movt	r0, #1
   11c3c:	ebfff9ef 	bl	10400 <puts@plt>
   11c40:	e51b3008 	ldr	r3, [fp, #-8]
   11c44:	e6ef3073 	uxtb	r3, r3
   11c48:	e3a02055 	mov	r2, #85	; 0x55
   11c4c:	e1a01003 	mov	r1, r3
   11c50:	e51b0010 	ldr	r0, [fp, #-16]
   11c54:	ebfffc4f 	bl	10d98 <set_led>
   11c58:	e1a03000 	mov	r3, r0
   11c5c:	e3530000 	cmp	r3, #0
   11c60:	0a000009 	beq	11c8c <main+0x324>
   11c64:	e30a249c 	movw	r2, #42140	; 0xa49c
   11c68:	e3402002 	movt	r2, #2
   11c6c:	e51b3008 	ldr	r3, [fp, #-8]
   11c70:	e1a03283 	lsl	r3, r3, #5
   11c74:	e0823003 	add	r3, r2, r3
   11c78:	e3a02055 	mov	r2, #85	; 0x55
   11c7c:	e5c3201c 	strb	r2, [r3, #28]
   11c80:	e3020294 	movw	r0, #8852	; 0x2294
   11c84:	e3400001 	movt	r0, #1
   11c88:	ebfff9dc 	bl	10400 <puts@plt>
   11c8c:	e51b3008 	ldr	r3, [fp, #-8]
   11c90:	e6ef3073 	uxtb	r3, r3
   11c94:	e1a01003 	mov	r1, r3
   11c98:	e51b0010 	ldr	r0, [fp, #-16]
   11c9c:	ebfffc85 	bl	10eb8 <Self_calibration>
   11ca0:	e1a03000 	mov	r3, r0
   11ca4:	e3530000 	cmp	r3, #0
   11ca8:	0a000002 	beq	11cb8 <main+0x350>
   11cac:	e30202ac 	movw	r0, #8876	; 0x22ac
   11cb0:	e3400001 	movt	r0, #1
   11cb4:	ebfff9d1 	bl	10400 <puts@plt>
   11cb8:	e51b3008 	ldr	r3, [fp, #-8]
   11cbc:	e6ef3073 	uxtb	r3, r3
   11cc0:	e3a020aa 	mov	r2, #170	; 0xaa
   11cc4:	e1a01003 	mov	r1, r3
   11cc8:	e51b0010 	ldr	r0, [fp, #-16]
   11ccc:	ebfffccd 	bl	11008 <Relay_control>
   11cd0:	e1a03000 	mov	r3, r0
   11cd4:	e3530000 	cmp	r3, #0
   11cd8:	0a000009 	beq	11d04 <main+0x39c>
   11cdc:	e30a249c 	movw	r2, #42140	; 0xa49c
   11ce0:	e3402002 	movt	r2, #2
   11ce4:	e51b3008 	ldr	r3, [fp, #-8]
   11ce8:	e1a03283 	lsl	r3, r3, #5
   11cec:	e0823003 	add	r3, r2, r3
   11cf0:	e3a02055 	mov	r2, #85	; 0x55
   11cf4:	e5c3201d 	strb	r2, [r3, #29]
   11cf8:	e30202d0 	movw	r0, #8912	; 0x22d0
   11cfc:	e3400001 	movt	r0, #1
   11d00:	ebfff9be 	bl	10400 <puts@plt>
   11d04:	e51b3008 	ldr	r3, [fp, #-8]
   11d08:	e6ef1073 	uxtb	r1, r3
   11d0c:	e3a03003 	mov	r3, #3
   11d10:	e3a02000 	mov	r2, #0
   11d14:	e51b0010 	ldr	r0, [fp, #-16]
   11d18:	ebfffb9a 	bl	10b88 <frequency>
   11d1c:	e1a03000 	mov	r3, r0
   11d20:	e3530000 	cmp	r3, #0
   11d24:	da000009 	ble	11d50 <main+0x3e8>
   11d28:	e30a249c 	movw	r2, #42140	; 0xa49c
   11d2c:	e3402002 	movt	r2, #2
   11d30:	e51b3008 	ldr	r3, [fp, #-8]
   11d34:	e1a03283 	lsl	r3, r3, #5
   11d38:	e0823003 	add	r3, r2, r3
   11d3c:	e3a02002 	mov	r2, #2
   11d40:	e5c32014 	strb	r2, [r3, #20]
   11d44:	e30202f0 	movw	r0, #8944	; 0x22f0
   11d48:	e3400001 	movt	r0, #1
   11d4c:	ebfff9ab 	bl	10400 <puts@plt>
   11d50:	e51b3008 	ldr	r3, [fp, #-8]
   11d54:	e6ef1073 	uxtb	r1, r3
   11d58:	e3a03002 	mov	r3, #2
   11d5c:	e3a02001 	mov	r2, #1
   11d60:	e51b0010 	ldr	r0, [fp, #-16]
   11d64:	ebfffb87 	bl	10b88 <frequency>
   11d68:	e1a03000 	mov	r3, r0
   11d6c:	e3530000 	cmp	r3, #0
   11d70:	da00000b 	ble	11da4 <main+0x43c>
   11d74:	e30a249c 	movw	r2, #42140	; 0xa49c
   11d78:	e3402002 	movt	r2, #2
   11d7c:	e51b3008 	ldr	r3, [fp, #-8]
   11d80:	e1a03283 	lsl	r3, r3, #5
   11d84:	e0823003 	add	r3, r2, r3
   11d88:	e3a02003 	mov	r2, #3
   11d8c:	e5c32015 	strb	r2, [r3, #21]
   11d90:	e3020314 	movw	r0, #8980	; 0x2314
   11d94:	e3400001 	movt	r0, #1
   11d98:	ebfff998 	bl	10400 <puts@plt>
   11d9c:	ea000000 	b	11da4 <main+0x43c>
   11da0:	e320f000 	nop	{0}
   11da4:	e51b3008 	ldr	r3, [fp, #-8]
   11da8:	e2833001 	add	r3, r3, #1
   11dac:	e50b3008 	str	r3, [fp, #-8]
   11db0:	e51b3008 	ldr	r3, [fp, #-8]
   11db4:	e3530009 	cmp	r3, #9
   11db8:	daffff3b 	ble	11aac <main+0x144>
   11dbc:	e3a03000 	mov	r3, #0
   11dc0:	e1a00003 	mov	r0, r3
   11dc4:	e24bd004 	sub	sp, fp, #4
   11dc8:	e8bd8800 	pop	{fp, pc}

00011dcc <__libc_csu_init>:
   11dcc:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
   11dd0:	e1a06000 	mov	r6, r0
   11dd4:	e1a07001 	mov	r7, r1
   11dd8:	e1a08002 	mov	r8, r2
   11ddc:	e59f5048 	ldr	r5, [pc, #72]	; 11e2c <__libc_csu_init+0x60>
   11de0:	ebfff96f 	bl	103a4 <_init>
   11de4:	e59f3044 	ldr	r3, [pc, #68]	; 11e30 <__libc_csu_init+0x64>
   11de8:	e08f5005 	add	r5, pc, r5
   11dec:	e08f3003 	add	r3, pc, r3
   11df0:	e0455003 	sub	r5, r5, r3
   11df4:	e1b05145 	asrs	r5, r5, #2
   11df8:	08bd87f0 	popeq	{r4, r5, r6, r7, r8, r9, sl, pc}
   11dfc:	e59f9030 	ldr	r9, [pc, #48]	; 11e34 <__libc_csu_init+0x68>
   11e00:	e3a04000 	mov	r4, #0
   11e04:	e08f9009 	add	r9, pc, r9
   11e08:	e7993104 	ldr	r3, [r9, r4, lsl #2]
   11e0c:	e1a02008 	mov	r2, r8
   11e10:	e2844001 	add	r4, r4, #1
   11e14:	e1a01007 	mov	r1, r7
   11e18:	e1a00006 	mov	r0, r6
   11e1c:	e12fff33 	blx	r3
   11e20:	e1540005 	cmp	r4, r5
   11e24:	1afffff7 	bne	11e08 <__libc_csu_init+0x3c>
   11e28:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
   11e2c:	00010558 	.word	0x00010558
   11e30:	00010550 	.word	0x00010550
   11e34:	00010538 	.word	0x00010538

00011e38 <__libc_csu_fini>:
   11e38:	e12fff1e 	bx	lr

Disassembly of section .fini:

00011e3c <_fini>:
   11e3c:	e92d4008 	push	{r3, lr}
   11e40:	e8bd8008 	pop	{r3, pc}
