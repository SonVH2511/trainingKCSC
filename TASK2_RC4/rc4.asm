section .data
; msg
    msg1 db 'Nhap chuoi can ma hoa: '
    lenmsg1 equ $-msg1
    msg2 db 'Nhap chuoi sau khi ma hoa: '
    lenmsg2 equ $-msg2
    msg3 db 'Key: '
    lenmsg3 equ $-msg3
    msg4 db 'Data lưu ở file encryptedString', 0
    lenmsg4 equ $-msg4
; var
    fileName db 'encryptedString', 0
    lenKey dd 0
    lenData dd 0 
    const dd 0x100
    data times 255 db 0xa, 0
    key times 255 db 0xa
    encrypteddata times 255 db 0
    output times 255 db 0
    fd_in dd 0
section .text
    global _start

_start:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg1
    mov edx, lenmsg1
    int 0x80

    mov eax, 0x3
    mov ebx, 0
    mov ecx, data
    mov edx, 0xff
    int 0x80

    dec eax
    mov [lenData], eax

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg3
    mov edx, lenmsg3
    int 0x80

    mov eax, 0x3
    mov ebx, 0
    mov ecx, key
    mov edx, 0xff
    int 0x80

    dec eax
    mov [lenKey], eax

    call _RC4

    call _fileWrite

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, msg4
    mov edx, lenmsg4
    int 0x80

    call _exit

_RC4:
; KSA
    xor esi, esi
    LOOP:
        mov [encrypteddata+esi], esi
    inc esi
    cmp esi, 0x100
    jne LOOP

    xor esi, esi
    xor edi, edi
    L0OP:
        xor edx, edx
        mov bl, [encrypteddata+esi]
        mov eax, esi
        mov ecx, [lenKey]
        div ecx

        mov al, [key+edx]
        add eax, ebx
        add eax, edi

        xor edx, edx
        mov ecx, [const]
        div ecx
        mov edi, edx

        ;swap
        mov al, [encrypteddata+esi]
        mov dl, [encrypteddata+edi]
        mov [encrypteddata+esi], dl
        mov [encrypteddata+edi], al
    inc esi
    cmp esi, 0x100
    jne L0OP

; PRGA
    xor eax, eax
    xor ecx, ecx
    xor edx, edx
    xor edi, edi
    xor esi, esi
    mov ebx, [lenData]
    L00P:
        ; i = (i + 1) % 256
        inc esi
        and esi, 0xff
        ; j = (j + S[i]) % 256
        mov al, [encrypteddata+esi]
        add edi, eax
        and edi, 0xff
        ;swap
        xor eax, eax
        xor edx, edx
        mov al, [encrypteddata+esi]
        mov dl, [encrypteddata+edi]
        mov [encrypteddata+esi], dl
        mov [encrypteddata+edi], al

        add edx, eax
        and edx, 0xff

        mov al, [encrypteddata+edx]     
        mov dl, [data+ecx]

        xor edx, eax

        mov [output+ecx], edx
    inc ecx
    cmp ecx, ebx
    jne L00P
ret

_fileWrite:
    mov eax, 0x5
    mov ebx, fileName
    mov ecx, 0x2
    mov edx, 0777
    int 0x80

    mov dword [fd_in], eax

    mov eax, 0x4
    mov ebx, [fd_in]
    mov ecx, output
    mov edx, lenData
    int 0x80

    mov eax, 0x6
    mov ebx, [fd_in]
    int 0x80
ret

_exit:
    mov eax, 0x1
    int 0x80