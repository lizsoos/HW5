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
	.file	"myLib.c"
	.text
	.align	2
	.global	loadPalette
	.syntax unified
	.arm
	.fpu softvfp
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	mov	r1, #83886080
	ldr	r3, .L3
	ldr	r2, .L3+4
	ldr	r3, [r3]
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.word	-2147483392
	.size	loadPalette, .-loadPalette
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	rsb	r0, r0, r0, lsl #4
	ldr	ip, [r3, #4]
	add	r0, r1, r0, lsl #4
	bic	r0, r0, #1
	ldrsh	r3, [ip, r0]
	tst	r1, #1
	andne	r3, r3, #255
	biceq	r3, r3, #255
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r0]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	lr, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	lsl	r3, r3, #16
	ldrb	r1, [sp, #7]	@ zero_extendqisi2
	orr	r3, r3, lr, lsl #24
	orr	r3, r3, r1
	ldr	r1, .L12
	add	r2, sp, #16
	orr	r3, r3, r0, lsl #8
	str	r3, [r2, #-4]!
	ldr	r0, [r1, #4]
	ldr	r3, [r1]
	ldr	r1, .L12+4
	str	ip, [r3, #44]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	-2063587968
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #12
	ldrb	ip, [sp, #48]	@ zero_extendqisi2
	ldrb	lr, [sp, #48]	@ zero_extendqisi2
	ands	r6, r1, #1
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #6]	@ movhi
	and	r4, r3, #1
	beq	.L15
	cmp	r4, #0
	beq	.L37
	cmp	r2, #0
	ble	.L14
	mov	lr, #0
	ldr	r4, .L39
	add	r2, r0, r2
	rsb	r2, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	asr	r5, r3, #1
	ldm	r4, {r4, ip}
	add	r2, r1, r2, lsl #4
	orr	r5, r5, #-2130706432
	add	r1, r1, r0, lsl #4
	add	r6, sp, #6
.L20:
	bic	r7, r1, #1
	ldrb	r0, [ip, r7]	@ zero_extendqisi2
	ldrh	r8, [sp, #6]
	cmp	r3, #1
	orr	r0, r0, r8, lsl #8
	strh	r0, [ip, r7]	@ movhi
	ble	.L19
	add	r0, r1, #1
	add	r0, r0, r0, lsr #31
	bic	r0, r0, #1
	add	r0, ip, r0
	str	lr, [r4, #44]
	str	r6, [r4, #36]
	str	r0, [r4, #40]
	str	r5, [r4, #44]
.L19:
	add	r1, r1, #240
	cmp	r2, r1
	bne	.L20
.L14:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L15:
	cmp	r4, #0
	beq	.L38
	cmp	r2, #0
	ble	.L14
	add	r2, r0, r2
	ldr	lr, .L39
	add	ip, r1, r3
	rsb	r2, r2, r2, lsl #4
	sub	r7, ip, #1
	rsb	r0, r0, r0, lsl #4
	add	r2, ip, r2, lsl #4
	add	r1, r1, #1
	asr	r8, r3, #1
	ldr	r4, [lr, #4]
	ldr	r5, [lr]
	add	r0, r7, r0, lsl #4
	sub	r2, r2, #1
	sub	r1, r1, ip
	and	r7, r7, #1
	orr	r8, r8, #-2130706432
	add	r9, sp, #6
.L30:
	cmp	r3, #1
	bic	lr, r0, #1
	ble	.L27
	add	ip, r1, r0
	add	ip, ip, ip, lsr #31
	bic	ip, ip, #1
	add	ip, r4, ip
	str	r6, [r5, #44]
	str	r9, [r5, #36]
	str	ip, [r5, #40]
	str	r8, [r5, #44]
.L27:
	ldrh	ip, [sp, #6]
	mov	r10, ip
	ldrsh	ip, [r4, lr]
	cmp	r7, #0
	and	fp, ip, #255
	biceq	ip, ip, #255
	orreq	ip, ip, r10
	orr	fp, fp, r10, lsl #8
	add	r0, r0, #240
	strhne	fp, [r4, lr]	@ movhi
	strheq	ip, [r4, lr]	@ movhi
	cmp	r2, r0
	bne	.L30
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L38:
	cmp	r2, #0
	ble	.L14
	ldr	ip, .L39
	add	r2, r0, r2
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	rsb	r2, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r5, [ip, #4]
	ldr	ip, [ip]
	add	r2, r1, r2, lsl #4
	orr	r3, r3, #-2130706432
	add	r1, r1, r0, lsl #4
	add	lr, sp, #6
.L31:
	add	r0, r1, r1, lsr #31
	bic	r0, r0, #1
	add	r1, r1, #240
	add	r0, r5, r0
	cmp	r1, r2
	str	r4, [ip, #44]
	str	lr, [ip, #36]
	str	r0, [ip, #40]
	str	r3, [ip, #44]
	bne	.L31
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L37:
	cmp	r2, #0
	ble	.L14
	ldr	lr, .L39
	add	r2, r0, r2
	add	r6, r1, r3
	rsb	r2, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	sub	r6, r6, #1
	asr	r7, r3, #1
	ldm	lr, {r5, ip}
	add	r2, r1, r2, lsl #4
	and	r6, r6, #1
	add	r1, r1, r0, lsl #4
	orr	r7, r7, #-2130706432
	sub	r8, r3, #1
	add	r9, sp, #6
.L24:
	bic	r10, r1, #1
	ldrb	lr, [ip, r10]	@ zero_extendqisi2
	ldrh	fp, [sp, #6]
	add	r0, r8, r1
	orr	lr, lr, fp, lsl #8
	cmp	r3, #2
	bic	r0, r0, #1
	strh	lr, [ip, r10]	@ movhi
	ble	.L21
	add	lr, r1, #1
	add	lr, lr, lr, lsr #31
	bic	lr, lr, #1
	add	lr, ip, lr
	str	r4, [r5, #44]
	str	r9, [r5, #36]
	str	lr, [r5, #40]
	str	r7, [r5, #44]
.L21:
	ldrh	lr, [sp, #6]
	mov	r10, lr
	ldrsh	lr, [ip, r0]
	cmp	r6, #0
	and	fp, lr, #255
	biceq	lr, lr, #255
	orreq	lr, lr, r10
	orr	fp, fp, r10, lsl #8
	add	r1, r1, #240
	strhne	fp, [ip, r0]	@ movhi
	strheq	lr, [ip, r0]	@ movhi
	cmp	r2, r1
	bne	.L24
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r2, #0
	ldr	r6, [sp, #24]
	ble	.L41
	mov	ip, #0
	mov	r8, ip
	ldr	lr, .L46
	add	r4, r0, r2
	add	r5, r3, r3, lsr #31
	rsb	r4, r4, r4, lsl #4
	rsb	r0, r0, r0, lsl #4
	asr	r5, r5, #1
	ldr	r7, [lr, #4]
	ldr	lr, [lr]
	add	r4, r1, r4, lsl #4
	orr	r5, r5, #-2147483648
	add	r1, r1, r0, lsl #4
.L43:
	add	r0, ip, ip, lsr #31
	add	r2, r1, r1, lsr #31
	bic	r0, r0, #1
	bic	r2, r2, #1
	add	r1, r1, #240
	add	r0, r6, r0
	add	r2, r7, r2
	cmp	r4, r1
	str	r8, [lr, #44]
	add	ip, ip, r3
	str	r0, [lr, #36]
	str	r2, [lr, #40]
	str	r5, [lr, #44]
	bne	.L43
.L41:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullScreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullScreenImage4, %function
drawFullScreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L49
	ldr	r1, .L49+4
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullScreenImage4, .-drawFullScreenImage4
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L53
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L56:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L56
	mov	r2, #67108864
.L57:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L57
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r3, [r3]
	tst	r3, #16
	moveq	r1, #100663296
	ldrne	r2, .L64
	ldreq	r2, .L64
	ldrne	r1, .L64+4
	str	r1, [r2, #4]
	mov	r2, #67108864
	eor	r3, r3, #16
	strh	r3, [r2]	@ movhi
	bx	lr
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.word	100704256
	.size	flipPage, .-flipPage
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L70
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, lr
	bgt	.L72
.L70:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L72:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L70
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 47) 7.1.0"
