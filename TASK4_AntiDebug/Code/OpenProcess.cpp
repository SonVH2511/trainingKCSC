#include <bits/stdc++.h>
#include <windows.h>
using namespace std;

void RevokeDebugPrivilege()
{
    HANDLE hToken;

    // Mở token của tiến trình hiện tại
    if (OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken))
    {
        TOKEN_PRIVILEGES tkp;

        // Lấy thông tin về đặc quyền gỡ lỗi
        if (LookupPrivilegeValue(NULL, SE_DEBUG_NAME, &tkp.Privileges[0].Luid))
        {
            tkp.PrivilegeCount = 1;
            tkp.Privileges[0].Attributes = 0; // Đặt attributes thành 0 để tắt đặc quyền

            // Tắt đặc quyền của tiến trình hiện tại
            if (AdjustTokenPrivileges(hToken, FALSE, &tkp, 0, NULL, NULL))
            {
                std::cout << "Successfully revoked debug privilege for the current process." << std::endl;
            }
            else
            {
                std::cerr << "Error revoking debug privilege. GetLastError: " << GetLastError() << std::endl;
            }
        }
        else
        {
            std::cerr << "Error looking up privilege value. GetLastError: " << GetLastError() << std::endl;
        }

        // Đóng handle của token
        CloseHandle(hToken);
    }
    else
    {
        std::cerr << "Error opening process token. GetLastError: " << GetLastError() << std::endl;
    }
}

typedef DWORD(WINAPI *TCsrGetProcessId)(VOID);

bool Check()
{
    HMODULE hNtdll = LoadLibraryA("ntdll.dll");
    if (!hNtdll)
        return false;

    TCsrGetProcessId pfnCsrGetProcessId = (TCsrGetProcessId)GetProcAddress(hNtdll, "CsrGetProcessId");
    if (!pfnCsrGetProcessId)
        return false;

    HANDLE hCsr = OpenProcess(PROCESS_ALL_ACCESS, FALSE, pfnCsrGetProcessId());
    if (hCsr != NULL)
    {
        CloseHandle(hCsr);
        return true;
    }
    else
        return false;
}
int main()
{
    if (Check())
        // cout << "debugger detected";
        printf("debugger detected");
    else
        printf("congrast");
}
