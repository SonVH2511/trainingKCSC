#include <bits/stdc++.h>
#include <windows.h>
using namespace std;
bool Check()
{
    CHAR szBuffer[] = {"C:\\Windows\\System32\\calc.exe"};
    LoadLibraryA(szBuffer);
    cout << szBuffer << endl;
    return INVALID_HANDLE_VALUE == CreateFileA(szBuffer, GENERIC_READ, 0, NULL, OPEN_EXISTING, 0, NULL);
}
int main()
{
    if (Check())
        cout << "Cannot open the executable file for reading. Debugging might be present." << endl;
    else
        cout << "Executable file opened for reading. No debugging detected." << endl;

    return 0;
}