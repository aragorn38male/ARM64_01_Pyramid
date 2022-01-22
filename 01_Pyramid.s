.global _start
_start:
	ldr x4, =char
	ldrb w4, [x4]
	ldr x5, =string
	ldr x6, =newline
	ldrb w6, [x6]
	add x3, x3, #1
	cmp x3, #22	//n-1 chrs.
	b.ne _addchar
	b _write_quit

_addchar:
	mov x7, x3
	
	_loop:
		add x0, x0, #1
		strb w4, [x5, x0]
		subs x7, x7, #1
		b.ne _loop
		add  x0, x0, #1	
		strb w6, [x5, x0]
		b _start

_write_quit:
	mov x0, #1
	ldr x1, =string
	mov x2, len
	mov x8, #64
	svc 0

	mov x0, #0
	mov x8, #93
	svc 0

.data
string: .fill 255, 1, 0
len= .-string
char: .ascii "*"
newline: .ascii "\n"
