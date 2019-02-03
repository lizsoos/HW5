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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+16
	ldr	r2, .L4+20
	mov	r1, #90
	mov	r0, #75
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	applelandscapePal
	.word	loadPalette
	.word	applelandscapeBitmap
	.word	drawFullScreenImage4
	.word	drawString4
	.word	.LC0
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.2, %function
win.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L12:
	.align	2
.L11:
	.word	buttons
	.size	win.part.2, .-win.part.2
	.set	lose.part.3,win.part.2
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L20
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L20+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r3, .L20+12
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L20+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.word	state
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L23
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #255
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+4
	ldr	r2, .L27+8
	mov	r1, #100
	mov	r0, #75
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+16
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L27+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	fillScreen4
	.word	drawString4
	.word	.LC1
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L34
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #1
	ldreq	r3, .L34+8
	streq	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #254
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	ldr	r4, .L38+4
	mov	r3, #250
	ldr	r2, .L38+8
	mov	r1, #100
	mov	r0, #75
	mov	lr, pc
	bx	r4
	ldr	r2, .L38+12
	mov	r1, #60
	mov	r0, #95
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L38+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	fillScreen4
	.word	drawString4
	.word	.LC2
	.word	.LC3
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L42
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.2
.L43:
	.align	2
.L42:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #253
	ldr	r3, .L46
	mov	lr, pc
	bx	r3
	ldr	r4, .L46+4
	mov	r3, #250
	ldr	r2, .L46+8
	mov	r1, #100
	mov	r0, #75
	mov	lr, pc
	bx	r4
	ldr	r2, .L46+12
	mov	r1, #60
	mov	r0, #95
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L46+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+20
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L46+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L47:
	.align	2
.L46:
	.word	fillScreen4
	.word	drawString4
	.word	.LC4
	.word	.LC3
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L59
	ldr	r6, .L59+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L59+12
	ldr	r2, [r6]
	ldr	r1, .L59+16
	ldr	r0, .L59+20
	ldr	r7, .L59+24
	mov	lr, pc
	bx	r5
	ldr	r4, .L59+28
	mov	r3, #250
	ldr	r2, .L59+20
	mov	r1, #5
	mov	r0, #145
	mov	lr, pc
	bx	r4
	ldr	r2, [r7]
	ldr	r1, .L59+32
	ldr	r0, .L59+20
	mov	lr, pc
	bx	r5
	ldr	r2, .L59+20
	mov	r1, #130
	mov	r0, #145
	mov	r3, #250
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L49
	ldr	r3, .L59+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
.L49:
	ldr	r3, [r6]
	cmp	r3, #10
	beq	.L57
	ldr	r3, [r7]
	cmp	r3, #5
	beq	.L58
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L56:
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToPause
.L58:
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToLose
.L57:
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToWin
.L60:
	.align	2
.L59:
	.word	updateGame
	.word	applesCollected
	.word	drawGame
	.word	sprintf
	.word	.LC5
	.word	buffer
	.word	applesMissed
	.word	drawString4
	.word	.LC6
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L80
	push	{r4, r7, fp, lr}
	ldr	r3, .L80+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r9, .L80+8
	ldr	r8, .L80+12
	ldr	r10, .L80+16
	ldr	r5, .L80+20
	ldr	r4, .L80+24
	ldr	r7, .L80+28
	ldr	r6, .L80+32
	ldr	fp, .L80+36
.L62:
	ldrh	r0, [r9]
	strh	r0, [r8]	@ movhi
	ldr	r2, [r10]
	ldrh	r3, [fp, #48]
	strh	r3, [r9]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L62
.L65:
	.word	.L64
	.word	.L66
	.word	.L67
	.word	.L68
	.word	.L69
.L69:
	tst	r0, #8
	beq	.L62
	mov	lr, pc
	bx	r6
	b	.L62
.L68:
	tst	r0, #8
	beq	.L62
	mov	lr, pc
	bx	r7
	b	.L62
.L66:
	mov	lr, pc
	bx	r4
	b	.L62
.L67:
	tst	r0, #8
	beq	.L62
	tst	r3, #8
	moveq	r3, #1
	streq	r3, [r10]
	b	.L62
.L64:
	mov	lr, pc
	bx	r5
	b	.L62
.L81:
	.align	2
.L80:
	.word	1044
	.word	goToStart
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	game
	.word	win.part.2
	.word	lose.part.3
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	buffer,41,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press START\000"
.LC1:
	.ascii	"Pause\000"
	.space	2
.LC2:
	.ascii	"YOU WON!\000"
	.space	3
.LC3:
	.ascii	"Press START to play again\000"
	.space	2
.LC4:
	.ascii	"you lose :(\000"
.LC5:
	.ascii	"Apples Collected: %d\000"
	.space	3
.LC6:
	.ascii	"Apples Missed: %d\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
