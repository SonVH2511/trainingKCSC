section .data
    msg db 'Nhap n: '
    msgLen equ $-msg
    num1 times 35 db 0
    num2 times 150 db ''
    len db 0
; Bignum
    ans times 150 db '0'
    pre times 150 db '0'
    sum times 150 db '0'
    one db '1'
    flag db 0
    zero db '0'

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

    call _bigNumToString
    inc edi
    ; print
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, num2
    mov edx, edi
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
    mov edi, 0x1
    cmp ecx, 0x2
    jg n3xt
    ret
    n3xt:
    mov al, 0x31
    mov [ans], al
    Fib:
        push ecx
        call _countBigNum

        mov eax, ans
        mov ebx, pre
        mov ecx, 0x96
        transferArr1:
            mov dl, [eax]
            mov [ebx], dl

            inc al
            inc bl
            xor edx, edx
        loop transferArr1

        xor eax, eax
        xor ebx, ebx

        mov eax, sum
        mov ebx, ans
        mov ecx, 0x96
        transferArr2:
            mov dl, [eax]
            mov [ebx], dl

            inc al
            inc bl
            xor edx, edx
        loop transferArr2

        inc edi
        pop ecx
    cmp edi, ecx
    jne Fib
    mov eax, ebx
ret

_countBigNum: ;
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov esi, 0     ; vị trí đầu

    add_loop:  
        mov cl, [flag]
        mov al, [ans + esi]
        mov bl, [pre + esi]
        sub eax, 0x30
        sub ebx, 0x30

        add eax, ebx
        add eax, ecx
        mov ecx, 0xa
        div ecx
        mov [flag], al
        add dl, 0x30
        mov	[sum + esi], dl

        xor edx, edx
        inc	esi
        cmp esi, 0x96
    jne add_loop
ret

_bigNumToString:
    xor esi, esi
    xor eax, eax
    toStack:
        mov al, [ans + esi]
        push eax
        inc esi
        cmp esi, 0x96
    jne toStack

    xor esi, esi
    formBigNum:
        pop eax
        inc esi
    cmp eax, 0x30
    je formBigNum

    xor edi, edi
    mov [num2+edi], eax

    toNum2:
        inc edi
        pop eax
        mov [num2+edi], eax
    inc esi
    cmp esi, 0x96
    jne toNum2    
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
