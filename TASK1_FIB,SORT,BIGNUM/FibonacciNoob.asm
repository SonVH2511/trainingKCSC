section .data
    msg db 'Nhap n: '
    msgLen equ $-msg
    num1 times 35 db 0
    num2 times 35 db ''
    len db 0

section .text
    global _start

_start:

    ; print
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg
    mov edx, msgLen
    int 0x80

    ; get input
    mov eax, 0x3
    mov ebx, 0x0
    mov ecx, num1
    mov edx, 0xe
    int 0x80

    ; get len
    dec eax
    ; mov [len], eax

    mov ecx, eax
    mov ebx, num1
    call _stringToNum

    mov ecx, eax
    call _Fibonacci

    call _numToString

    ; print
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, num2
    mov edx, ebp
    int 0x80

    call _exit

; Func
_stringToNum: ;ARGS(len(ECX),inputString(EBX))
    xor edx, edx
    xor eax, eax
    xor esi, esi
    stringToNumWorker:
        mov edx, 10
        mul edx
        mov dl, [ebx + esi]
        sub edx, 0x30
        add eax, edx
        inc esi
        loop stringToNumWorker
    ret

_Fibonacci: ;ARGS(n:ECX) Tinh so fibonacci thu n
    mov ebx, 0x0
    mov eax, 0x1
    xor esi, esi
    cmp ecx, 0x2
    jg Fib
    ret

    Fib:
        mov esi, eax
        add eax, ebx
        mov ebx, esi
    loop Fib
    mov eax, ebx
    ret

_numToString: ;ARGS(int(EAX))
    mov ecx, 0
    execute:
        xor edx, edx
        mov ebx, 10
        div ebx
        add edx, 0x30
        push edx
        inc ecx
    cmp eax, 0
    jne execute

    mov ebp, 0
    L00P:
        pop edx
        mov [num2 + ebp], edx
        inc ebp
    loop L00P
    ret

_exit:
    mov eax, 0x1
    int 0x80