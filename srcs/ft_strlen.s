global	_ft_strlen

section	.text

_ft_strlen:
	mov		rax, 0

.loop:
	cmp		byte [rdi], 0
	jz		.return

	inc		rax
	inc		rdi

	jmp		.loop

.return:
	ret
	