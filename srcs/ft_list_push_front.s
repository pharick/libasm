global	_ft_list_push_front
extern	_malloc

section	.text

_ft_list_push_front:
	push	rsp
	push	rdi
	push	rsi
	mov		rdi, 16
	call	_malloc
	pop		rsi
	pop		rdi

	cmp		rax, 0
	jz		.end

	mov		[rax], rsi
	mov		r11, [rdi]
	mov		[rax + 8], r11
	mov		[rdi], rax

.end:
	pop		rsp
	ret
