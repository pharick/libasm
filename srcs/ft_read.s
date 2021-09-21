global	_ft_read
extern	___error

section	.text

_ft_read:
	mov		rax, 0x2000003
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
