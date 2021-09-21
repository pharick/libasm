global	_ft_list_sort
extern	_ft_list_size

section	.text

_ft_list_sort:
	; r8 = comparator, r12 = len, r13 = begin rcx = passes
	push	r12
	push	r13
	mov		r8, rsi
	mov		rcx, 0
	mov		rdi, [rdi]
	mov		r13, rdi
	call	_ft_list_size
	mov		r12, rax

.pass:
	inc		rcx
	cmp		r12, rcx
	jz		.return
	mov		rdi, r13

.loop:
	cmp		qword [rdi + 8], 0
	jz		.pass

.compare:
	push	rdi
	push	rsi

	mov		rsi, [rdi + 8]
	mov		rsi, [rsi]
	mov		rdi, [rdi]
	
	call	r8
	cmp		rax, 0
	pop		rsi
	pop		rdi
	jle		.next

	mov		r9, [rdi + 8] ; next
	mov		r10, [r9] ; next->data
	mov		r11, [rdi] ; data
	mov		[r9], r11
	mov		[rdi], r10

.next:
	mov		rdi, [rdi + 8]
	jmp		.loop

.return:
	pop		r13
	pop		r12
	ret
