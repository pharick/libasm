global	_ft_strcmp

section	.text

_ft_strcmp:

.loop:
	cmp		byte [rdi], 0
	jz		.return
	
	mov		al, byte [rsi]
	cmp		byte [rdi], al
	jnz		.return

	inc		rdi
	inc		rsi

	jmp		.loop

.return:
	movzx	rax, byte [rdi]
	movzx	rdx, byte [rsi]
	sub		rax, rdx
	ret