section .data
    hello db 'Hello world'
    length equ $-hello

section .text
    global _start

_start:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, hello
    mov edx, length
    int 0x80
_exit:
    mov eax, 0x1
    int 0x80
