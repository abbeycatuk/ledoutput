	.arch armv8-a
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"blinkt.c"
	.comm	blinkt,96,4
	.text
	.align	2
	.global	blinkt_init
	.type	blinkt_init, %function
blinkt_init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	movw	r2, #:lower16:blinkt
	movt	r2, #:upper16:blinkt
	ldr	r3, [fp, #-16]
	mov	r1, r3
	mov	r3, r1, asl #2
	mov	r1, r3
	mov	r3, r1, asl #2
	rsb	r3, r1, r3
	add	r3, r2, r3
	mov	r2, #255
	str	r2, [r3]
	movw	r2, #:lower16:blinkt
	movt	r2, #:upper16:blinkt
	ldr	r3, [fp, #-16]
	mov	r1, r3
	mov	r3, r1, asl #2
	mov	r1, r3
	mov	r3, r1, asl #2
	rsb	r3, r1, r3
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #4]
	movw	r2, #:lower16:blinkt
	movt	r2, #:upper16:blinkt
	ldr	r3, [fp, #-16]
	mov	r1, r3
	mov	r3, r1, asl #2
	mov	r1, r3
	mov	r3, r1, asl #2
	rsb	r3, r1, r3
	add	r3, r2, r3
	add	r3, r3, #8
	mov	r2, #119
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L3
	mov	r0, #23
	bl	gpio_configure_for_output
	mov	r0, #24
	bl	gpio_configure_for_output
	bl	blinkt_program
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	blinkt_init, .-blinkt_init
	.align	2
	.global	blinkt_program
	.type	blinkt_program, %function
blinkt_program:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	mov	r0, #0
	bl	blinkt_send_word
	mov	r3, #239
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L5
.L6:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #24
	add	r3, r3, #16711680
	add	r3, r3, #136
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-24]
	bl	blinkt_send_word
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L5:
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	bls	.L6
	mov	r0, #-16777216
	bl	blinkt_send_word
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	blinkt_program, .-blinkt_program
	.align	2
	.global	blinkt_send_word
	.type	blinkt_send_word, %function
blinkt_send_word:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	mov	r3, #31
	str	r3, [fp, #-16]
.L10:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	mov	r3, r2, lsr r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L8
	mov	r0, #23
	bl	gpio_set
	b	.L9
.L8:
	mov	r0, #23
	bl	gpio_clear
.L9:
	mov	r0, #24
	bl	gpio_set
	mov	r0, #24
	bl	gpio_clear
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L10
	.size	blinkt_send_word, .-blinkt_send_word
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
