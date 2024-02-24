#include <bits/stdc++.h>
#include <windows.h>
// #include <ntifs.h>
// #include <ntdll.h>
using namespace std;
int main()
{
    // Lấy handle của luồng hiện tại
    HANDLE currentThread = GetCurrentThread();

    // Thiết lập thông tin của luồng để ẩn nó khỏi bộ gỡ lỗi
    NtSetInformationThread(
        currentThread,
        THREAD_INFORMATION_CLASS::ThreadHideFromDebugger,
        NULL,
        0);

    // Phần mã khác của chương trình...

    return 0;
}
