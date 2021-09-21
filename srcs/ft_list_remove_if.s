global	_ft_list_remove_if
extern	_free

_ft_list_remove_if:
	mov		r8, 0 ; prev
	mov		r9, [rdi] ; elem

.loop:
	cmp		r9, 0
	jz		.return

	push	rdi
	push	rsi
	push	rdx
	push	rcx
	push	r9
	push	r8
	mov		rdi, [r9] ; data
	call	rdx ; cmp
	pop		r8
	pop		r9
	pop		rcx
	pop		rdx
	pop		rsi
	pop		rdi

	cmp		rax, 0
	jz		.remove

.next:
	mov		r8, r9
	mov		r9, [r9 + 8]
	jmp		.loop

.remove:
	cmp		r8, 0 ; if prev == NULL
	jz		.first

	mov		r10, [r9 + 8]
	mov		[r8 + 8], r10
	
	jmp		.free

.first:
	mov		r10, [r9 + 8] ; *begin_list = elem->next
	mov		[rdi], r10

.free:
	mov		r11, r9
	mov		r9, r10

	push	rdi
	push	rsi
	push	r11
	push	rdx
	push	r9
	push	r8
	push	r10
	push	rcx

	mov		rdi, [r11] ; data
	call	rcx ; free_fct

	pop		rcx
	pop		r10
	pop		r8
	pop		r9
	pop		rdx
	pop		r11
	pop		rsi
	pop		rdi

	push	rsi
	push	rdi
	push	rdx
	push	rcx
	push	r9
	push	r8
	push	r10

	mov		rdi, r11
	call	_free
	
	pop		r10
	pop		r8
	pop		r9
	pop		rcx
	pop		rdx
	pop		rdi
	pop		rsi
	jmp		.loop

.return:
	ret
