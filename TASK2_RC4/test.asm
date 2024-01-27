section	.text
   global _start         ;must be declared for using gcc
	
_start:                  ;tell linker entry point
   mov esi, 0x4
   mov eax, 0x4
   mov ebx, 0x1
   mov ecx, [msg_done+esi]
   mov	eax, 0x1             ;system call number (sys_exit)
   int	0x80              ;call kernel

section	.data
file_name db 'myfile.txt', 0
msg db 'Welcome to Tutorials Point'
len equ  $-msg

msg_done db 'Written to file', 0xa
len_done equ $-msg_done

section .bss
fd_out resb 1
fd_in  resb 1
info resb  26