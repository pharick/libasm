global	_ft_strchr

section	.text

_ft_strchr:
	mov		rax, rdi

.loop:
	cmp		byte [rax], sil
	jz		.return
	cmp		byte [rax], 0
	jz		.return

	inc		rax
	jmp		.loop

.return:
	cmp		byte [rax], 0
	jz		.endline
	ret

.endline:
	cmp		sil, 0
	jnz		.null
	ret

.null:
	mov		rax, 0
	ret
