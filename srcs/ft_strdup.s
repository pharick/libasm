global	_ft_strdup
extern	___error
extern	_malloc
extern	_ft_strlen
extern	_ft_strcpy

_ft_strdup:
	push	rdi

	call	_ft_strlen
	inc		rax
	mov		rdi, rax

	call	_malloc
	pop		rdi
	cmp		rax, 0
	jz		.error
	mov		rsi, rdi
	mov		rdi, rax

	call	_ft_strcpy
	ret

.error:
	ret

