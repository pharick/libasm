global	_ft_strcpy

section	.text

_ft_strcpy:
	mov		rax, rdi

.loop:
	cmp		byte [rsi], 0
	jz		.return

	mov		dl, byte [rsi]
	mov		byte [rdi], dl

	inc		rdi
	inc		rsi

	jmp		.loop

.return:
	mov		byte [rdi], 0
	ret
