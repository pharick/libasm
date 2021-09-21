global	_ft_list_size

_ft_list_size:
	mov		rax, 0

.loop:
	cmp		rdi, 0
	jz		.return

	inc		rax
	mov		rdi, [rdi + 8]

	jmp		.loop

.return:
	ret
