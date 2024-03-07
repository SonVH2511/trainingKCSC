section .text
	global _start

_start:
	push 0x68686868
	push 0xdfed7768
	push 0xabcd1456
	call babyasm

	call _exit

_exit:
	mov eax,0x1
	int 0x80

babyasm:
	push   ebp
	mov    ebp,esp
	xor    eax,eax
	mov    ah,BYTE [ebp+0x9]
	shl    ax,0x10
	sub    al,BYTE [ebp+0xe]
	add    ah,BYTE [ebp+0xf]
	xor    ax,WORD [ebp+0x12]
	nop
	pop    ebp
ret    	

;ans: BKSEC{0xb77b}
