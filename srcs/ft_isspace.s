global	_ft_isspace

section	.text

_ft_isspace:
	mov		rax, 0
	cmp		rdi, 9
	jz		.true
	cmp		rdi, 10
	jz		.true
	cmp		rdi, 11
	jz		.true
	cmp		rdi, 12
	jz		.true
	cmp		rdi, 13
	jz		.true
	cmp		rdi, 32
	jz		.true
	ret

.true:
	mov		rax, 1
	ret
