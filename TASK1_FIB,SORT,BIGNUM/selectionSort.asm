section .data
; msg
    msg1 db 'Nhap n: '
    length1 equ $-msg1
    msg2 db 'Nhap n so nguyen', 0xa
    length2 equ $-msg2
    msg3 db 'arr['
    msgLen3 equ $-msg3
    msg4 db '] = '
    msgLen4 equ $-msg4
    msg5 db 'Mang truoc khi sap xep: '
    msgLen5 equ $-msg5
    msg6 db 'Mang sau khi sap xep: '
    msgLen6 equ $-msg6
    blankSpace db ' '
    endLine db 0xa
    minus db '-'

; var
    arr times 400 dd 0
    Ai times 11 db 0
    n db '0'
    cnt dd 0
    count dd 0
    flag db 0
    num2 times 35 db ''
    num2Len equ $-num2

section .text
    global _start

; func
_start:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg1
    mov edx, length1
    int 0x80

    mov eax, 0x3
    mov ebx, 0
    mov ecx, n
    mov edx, 0xa
    int 0x80

    dec eax
    mov ebx, ecx
    mov ecx, eax
    call _stringToNum

    mov dword [count], eax

    xor edi, edi
    mov ecx, eax
    call _getArray

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg5
    mov edx, msgLen5
    int 0x80

    mov ecx, dword [count]
    call _printArr


    call _selectionSort

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg6
    mov edx, msgLen6
    int 0x80

    mov ecx, dword [count]
    call _printArr


    call _exit

_stringToNum: ; Numlen: ecx, String: ebx
    xor edx, edx    
    xor eax, eax
    xor esi, esi

    mov dl, [ebx + esi]
    cmp dl, [minus]   
    jne continu3
    inc esi
    dec ecx
    mov [flag], esi
    continu3:
    L0OP:
        mov edx, 0xa
        mul edx
        mov dl, [ebx + esi]
        sub edx, 0x30
        add eax, edx
    inc esi
    loop L0OP

    mov esi, [flag]
    cmp esi, 0x1
    jne c0ntinu3
        mov ecx, 0xffffffff
        sub ecx, eax
        mov eax, ecx
    c0ntinu3:
    xor esi, esi
ret

_numToString: ;ARGS(int(EAX))
    mov ecx, 0

    mov [flag], ecx
    cmp eax, 2147483648
    jna c0nt1nu3
        inc ecx
        mov edx, 0x1
        mov [flag], edx
        mov edx, 0xffffffff
        sub edx, eax
        mov eax, edx
    c0nt1nu3:

    execute:
        xor edx, edx
        mov ebx, 10
        div ebx
        add edx, 0x30
        push edx
        inc ecx
    cmp eax, 0

    jne execute

    mov edx, 0x1
    cmp [flag], edx
    jne Cont1nue
        mov dl, [minus]
        push edx
    Cont1nue:

    mov ebp, 0
    L00P:
        pop edx
        mov [num2 + ebp], edx
        inc ebp
    loop L00P
ret

_getArray: 

    mov [cnt], ecx

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg2
    mov edx, length2
    int 0x80

    LO0P:

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, msg3
        mov edx, msgLen3
        int 0x80

        xor eax, eax
        mov eax, edi
        call _numToString

        ; mov [num2], eax

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, num2
        mov edx, 0x4
        int 0x80

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, msg4
        mov edx, msgLen4
        int 0x80

        mov eax, 0x3
        mov ebx, 0x0
        mov ecx, Ai
        mov edx, 0xa
        int 0x80

        dec eax
        mov ebx, ecx
        mov ecx, eax
        call _stringToNum

        mov dword [arr + 4 * edi], eax ; arr[edi] = _stringToNum(input)
        ; xor eax, eax
        ; mov eax, dword [arr + 4*edi] ; arr[edi] = _stringToNum(input)

        inc edi 
        cmp edi, [count]
        jne LO0P
    ret

_printArr:

    mov esi, 0
    Looq:
        mov eax, dword [arr + 4 * esi]
        call _numToString

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, num2
        mov edx, ebp
        int 0x80

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, blankSpace
        mov edx, 0x1
        int 0x80

        inc esi
        cmp esi, [count]
        jne Looq

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, endLine
    mov edx, 0x1
    int 0x80

    ret

_selectionSort:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    xor edi, edi
    xor esi, esi
    ForI:
        mov edx, esi
        mov edi, esi

        ForJ:
            mov eax, dword [arr + 4 * edx] 
            mov ecx, dword [arr + 4 * edi]

            cmp eax, ecx
            jl continue
            mov edx, edi
            continue:
                inc edi
                cmp edi, [count]
                jne ForJ
        ; swap arr[edx], arr[esi]
        mov eax, dword [arr + 4 * edx] 
        mov ecx, dword [arr + 4 * esi]
        mov dword [arr + 4 * edx], ecx
        mov dword [arr + 4 * esi], eax

        inc esi
        cmp esi, [count]
        jne ForI
    ret

_ignoreMinus:
    inc esi
    ret

_toMinus:
    mov edx, 0xffffffff
    ret

_exit:
    mov eax, 0x1
    int 0x80