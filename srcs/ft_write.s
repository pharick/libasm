global	_ft_write
extern	___error

section	.text

_ft_write:
	mov		rax, 0x2000004
	syscall
	jc		.error
	ret

.error:
	push	r12
	mov		r12, rax
	call	___error
	mov		[rax], r12
	mov		rax, -1
	pop		r12
	ret
