#include <bits/stdc++.h>
#include <windows.h>

using namespace std;

bool Check()
{
    __try
    {
        CloseHandle((HANDLE)0xDEADBEEF);
        return false;
    }
    __except (GetExceptionCode() == EXCEPTION_INVALID_HANDLE
                  ? EXCEPTION_EXECUTE_HANDLER
                  : EXCEPTION_CONTINUE_SEARCH)
    {
        return true;
    }
}

int main()
{
    if (Check())
        cout << "Cannot open the executable file for reading. Debugging might be present." << endl;
    else
        cout << "Executable file opened for reading. No debugging detected." << endl;

    return 0;
}