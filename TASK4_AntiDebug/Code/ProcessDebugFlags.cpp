#include <bits/stdc++.h>
#include <windows.h>
#define NT_SUCCESS(Status) ((NTSTATUS)(Status) >= 0)

using namespace std;

typedef NTSTATUS(NTAPI *NtQueryInformationProcess)(
    IN HANDLE ProcessHandle,
    IN DWORD ProcessInformationClass,
    OUT PVOID ProcessInformation,
    IN ULONG ProcessInformationLength,
    OUT PULONG ReturnLength);

HMODULE hNtdll = LoadLibraryA("ntdll.dll");

BOOL IsProcessBeingDebugged()
{
    if (hNtdll)
    {
        auto pfnNtQueryInformationProcess = (NtQueryInformationProcess)GetProcAddress(
            hNtdll, "NtQueryInformationProcess");

        if (pfnNtQueryInformationProcess)
        {
            DWORD dwReturned;
            DWORD dwProcessDebugFlags;
            const DWORD ProcessDebugFlags = 0x1f;
            NTSTATUS status = pfnNtQueryInformationProcess(
                GetCurrentProcess(),
                ProcessDebugFlags,
                &dwProcessDebugFlags,
                sizeof(DWORD),
                &dwReturned);

            if (NT_SUCCESS(status) && dwProcessDebugFlags == 0)
                return true;
        }
    }
    return false;
}
int main()
{
    if (IsProcessBeingDebugged())
        cout << "debugger detected";
    else
        cout << "successfully access";
    return 0;
}