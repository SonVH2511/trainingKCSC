#include <bits/stdc++.h>
#include <windows.h>
using namespace std;
// bool IsDebugged()
// {
//     __try
//     {
//         __asm xor eax, eax;
//         __asm int 0x2d;
//         __asm nop;
//         return true;
//     }
//     __except (EXCEPTION_EXECUTE_HANDLER)
//     {
//         return false;
//     }
// }
bool g_bDebugged = false;

int filter(unsigned int code, struct _EXCEPTION_POINTERS *ep)
{
    g_bDebugged = code != EXCEPTION_BREAKPOINT;
    return EXCEPTION_EXECUTE_HANDLER;
}

bool IsDebugged()
{
    __try
    {
        __asm __emit(0xCD);
        __asm __emit(0x03);
    }
    __except (filter(GetExceptionCode(), GetExceptionInformation()))
    {
        return g_bDebugged;
    }
}