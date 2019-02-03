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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #120
	mov	r7, #10
	mov	r6, #251
	mov	r5, #2
	mov	r0, #30
	mov	lr, #24
	mov	ip, #28
	mov	r1, #1
	ldr	r2, .L6
	mov	r4, r3
	str	r3, [r2, #24]
	ldr	r3, .L6+4
	str	r8, [r2]
	str	r7, [r2, #8]
	strh	r6, [r2, #16]	@ movhi
	str	r5, [r2, #20]
	str	r0, [r2, #4]
	str	r0, [r2, #12]
	add	r0, r3, #280
.L2:
	ldr	r2, [r3, #8]
	rsb	r2, r2, #0
	str	r4, [r3, #4]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r4, [r3, #24]
	str	r2, [r3]
	str	lr, [r3, #8]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L2
	ldr	r1, .L6+8
	ldr	r2, .L6+12
	ldr	r0, .L6+16
	ldr	r3, .L6+20
	str	r4, [r1]
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L6+24
	ldr	r2, .L6+28
	strh	lr, [r3, #246]	@ movhi
	strh	r4, [r3, #244]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	basket
	.word	apples
	.word	applesCollected
	.word	applesMissed
	.word	applePal
	.word	loadPalette
	.word	83886336
	.word	15855
	.size	initGame, .-initGame
	.align	2
	.global	initBasket
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBasket, %function
initBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #30
	mov	r4, #120
	mov	lr, #10
	mov	ip, #251
	mov	r0, #2
	mov	r1, #0
	ldr	r3, .L10
	str	r4, [r3]
	str	lr, [r3, #8]
	strh	ip, [r3, #16]	@ movhi
	str	r0, [r3, #20]
	str	r1, [r3, #24]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	basket
	.size	initBasket, .-initBasket
	.align	2
	.global	updateBasket
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBasket, %function
updateBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L13
	ldr	r3, .L16+4
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #20]
	cmp	r2, r1
	bge	.L15
.L13:
	ldr	r3, .L16
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L16+4
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #20]
	ldr	r2, [r3, #12]
	rsb	ip, r0, #240
	add	r2, r1, r2
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	bx	lr
.L15:
	sub	r2, r2, r1
	str	r2, [r3, #4]
	bx	lr
.L17:
	.align	2
.L16:
	.word	67109120
	.word	basket
	.size	updateBasket, .-updateBasket
	.align	2
	.global	initApples
	.syntax unified
	.arm
	.fpu softvfp
	.type	initApples, %function
initApples:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #0
	mov	r4, #24
	mov	lr, #28
	mov	r1, #1
	ldr	r3, .L22
	add	ip, r3, #280
.L19:
	ldr	r2, [r3, #8]
	rsb	r2, r2, #0
	str	r0, [r3, #4]
	str	lr, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r0, [r3, #24]
	str	r2, [r3]
	str	r4, [r3, #8]
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L19
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	apples
	.size	initApples, .-initApples
	.align	2
	.global	updateApple
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateApple, %function
updateApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldr	r2, [r0]
	ldr	r3, [r0, #16]
	add	r2, r2, r3
	cmp	r2, #160
	str	r2, [r0]
	ble	.L27
	mov	r1, #0
	ldr	r2, .L35
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [r0, #24]
	bx	lr
.L27:
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r1, .L35+4
	add	r5, r1, #8
	ldm	r5, {r5, r6}
	sub	sp, sp, #16
	ldr	r3, [r0, #12]
	ldm	r1, {ip, lr}
	str	r6, [sp, #12]
	mov	r0, r2
	ldr	r2, [r4, #8]
	str	r5, [sp, #8]
	ldr	r5, .L35+8
	ldr	r1, [r4, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L24
	mov	r1, #0
	ldr	r2, .L35+12
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	str	r1, [r4, #24]
.L24:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	applesMissed
	.word	basket
	.word	collision
	.word	applesCollected
	.size	updateApple, .-updateApple
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L48
	bl	updateBasket
	mov	r7, r6
	mov	r4, r6
	add	r5, r6, #280
.L38:
	mov	r0, r4
	add	r4, r4, #28
	bl	updateApple
	cmp	r4, r5
	bne	.L38
	ldr	r0, .L48+4
	ldr	r3, [r0, #24]
	cmp	r3, #45
	addne	r3, r3, #1
	beq	.L46
	str	r3, [r0, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L46:
	mov	r3, #0
.L42:
	ldr	r1, [r6, #24]
	cmp	r1, #0
	beq	.L47
	add	r3, r3, #1
	cmp	r3, #10
	add	r6, r6, #28
	bne	.L42
	mov	r3, #46
	pop	{r4, r5, r6, r7, r8, lr}
	str	r3, [r0, #24]
	bx	lr
.L47:
	mov	r2, #1
	ldr	ip, [r0, #4]
	ldr	lr, .L48+8
	lsl	ip, ip, r2
	smull	r4, r5, ip, lr
	rsb	r3, r3, r3, lsl #3
	lsl	r3, r3, #2
	sub	ip, r5, ip, asr #31
	str	r1, [r7, r3]
	add	ip, ip, #4
	add	r3, r7, r3
	str	ip, [r3, #4]
	str	r2, [r3, #24]
	mov	r3, r2
	pop	{r4, r5, r6, r7, r8, lr}
	str	r3, [r0, #24]
	bx	lr
.L49:
	.align	2
.L48:
	.word	apples
	.word	basket
	.word	1431655766
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBasket
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBasket, %function
drawBasket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, .L52
	ldm	ip, {r0, r1, r2, r3}
	ldrb	ip, [ip, #16]	@ zero_extendqisi2
	sub	sp, sp, #8
	str	ip, [sp]
	ldr	r4, .L52+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	basket
	.word	drawRect4
	.size	drawBasket, .-drawBasket
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L63
	sub	sp, sp, #12
	mov	r0, #252
	ldr	r3, .L63+4
	mov	lr, pc
	bx	r3
	ldr	r7, .L63+8
	bl	drawBasket
	ldr	r6, .L63+12
	add	r5, r4, #280
	b	.L56
.L55:
	add	r4, r4, #28
	cmp	r4, r5
	beq	.L62
.L56:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L55
	ldm	r4, {r0, r1, r2, r3}
	str	r7, [sp]
	add	r4, r4, #28
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L56
.L62:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	apples
	.word	fillScreen4
	.word	appleBitmap
	.word	drawImage4
	.size	drawGame, .-drawGame
	.align	2
	.global	drawApple
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawApple, %function
drawApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	ip, .L74
	sub	sp, sp, #8
	ldm	r0, {r0, r1, r2, r3}
	ldr	r4, .L74+4
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	appleBitmap
	.word	drawImage4
	.size	drawApple, .-drawApple
	.comm	applesActive,4,4
	.comm	applesMissed,4,4
	.comm	applesCollected,4,4
	.comm	basket,28,4
	.comm	apples,280,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
