	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"text.c"
	.text
	.align	2
	.global	drawChar4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar4, %function
drawChar4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r1
	mov	r6, r0
	ldr	ip, .L13
	sub	sp, sp, #12
	add	r2, r2, r2, lsl #1
	lsl	r3, r3, #16
	lsl	r2, r2, #4
	add	r10, ip, #48
	str	r3, [sp, #4]
	ldr	r8, .L13+4
	add	fp, r2, ip
	add	r10, r10, r2
.L2:
	ldr	r3, [sp, #4]
	mov	r5, fp
	mov	r4, #0
	lsr	r7, r3, #16
	b	.L4
.L3:
	add	r4, r4, #1
	cmp	r4, #6
	beq	.L12
.L4:
	ldrb	r2, [r5], #1	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L3
	add	r1, r9, r4
	mov	r2, r7
	mov	r0, r6
	add	r4, r4, #1
	mov	lr, pc
	bx	r8
	cmp	r4, #6
	bne	.L4
.L12:
	add	fp, fp, #6
	cmp	fp, r10
	add	r6, r6, #1
	bne	.L2
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	fontdata_6x8
	.word	setPixel4
	.size	drawChar4, .-drawChar4
	.align	2
	.global	drawString4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString4, %function
drawString4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L15
	mov	r7, r0
	mov	r4, r1
	mov	r6, r3
.L17:
	mov	r1, r4
	mov	r3, r6
	mov	r0, r7
	bl	drawChar4
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L17
.L15:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString4, .-drawString4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
