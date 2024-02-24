#include <bits/stdc++.h>
#include <windows.h>
using namespace std;

bool Check()
{
    CHAR szFileName[MAX_PATH];
    DWORD getFileName = GetModuleFileNameA(NULL, szFileName, sizeof(szFileName));
    if (0 == getFileName)
        return false;

    cout << "Executable Path: " << szFileName << endl;

    return INVALID_HANDLE_VALUE == CreateFileA(szFileName, GENERIC_READ, 0, NULL, OPEN_EXISTING, 0, NULL);
}

int main()
{
    if (Check())
        cout << "Cannot open the executable file for reading. Debugger detected!" << endl;
    else
        cout << "Executable file opened for reading. No debugging detected." << endl;

    return 0;
}
