section .data
    length equ 255    
    nonNumberArr times 255 db 0xa
    msg times 255 db 0xa 
    lenString db 0    
section .text
    global _start

_start:
    mov eax, 0x3     
    mov ebx, 0        
    mov ecx, msg    
    mov edx, length   
    int 0x80

    sub eax, 0x1
    mov [lenString], eax
    xor esi, esi
    xor edi, edi
    call _filter   

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, nonNumberArr
    mov edx, edi
    int 0x80

    call _exit

_filter:
    l2:
        mov bl, [msg+esi]

        cmp ebx, 0x30
        jl toNewArr
        cmp ebx, 0x39
        ja toNewArr
        jmp continue
        toNewArr:
            mov [nonNumberArr+edi], ebx
            inc edi
        continue:
    inc esi
    cmp esi, eax
    jne l2
ret

_exit:
    mov eax, 0x1
    int 0x80