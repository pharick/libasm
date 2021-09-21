global	_ft_atoi_base
extern	_ft_strlen
extern	_ft_strchr
extern	_ft_isspace

section	.text

_ft_atoi_base:
	; r8 = base
	push	rdi
	mov		rdi, rsi
	call	_ft_strlen
	pop		rdi
	mov		r8, rax

	mov		r11, 0 ; r11 = result

.whitespace:
	mov		r9, rdi
	push	rdi
	movzx	rdi, byte [r9]
	call	_ft_isspace
	pop		rdi
	cmp		rax, 0
	jz		.minus
	inc		rdi
	jmp		.whitespace

.minus:
	; r12 = isminus
	mov		r12, 0
	cmp		byte [rdi], 45
	jnz		.plus
	mov		r12, 1
	inc		rdi

.plus:
	cmp		byte [rdi], 43
	jnz		.count
	inc		rdi

.count:
	mov		r9, rsi ; r9 = alphabet
	mov		r10b, byte [rdi] ; r10b = digit
	push	rdi
	push	rsi
	mov		rdi, r9
	mov		sil, r10b
	call	_ft_strchr
	pop		rsi
	pop		rdi
	
	cmp		rax, 0
	jz		.return
	cmp		byte [rax], 0
	jz		.return
	
	; r9 = digit_index
	mov		r9, rax
	sub		r9, rsi

	; r11 *= base
	mov		rax, r11
	mov		rcx, r8
	mul		rcx
	mov		r11, rax

	; r11 += digit_index
	add		r11, r9

	inc		rdi

	jmp		.count

.return:
	mov		rax, r11
	cmp		r12, 1
	jz		.negative
	ret

.negative:
	neg		rax
	ret
