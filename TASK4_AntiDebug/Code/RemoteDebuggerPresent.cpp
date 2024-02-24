#include <bits/stdc++.h>
#include <windows.h>
using namespace std;

int main()
{
    BOOL DebuggerPresent;

    if (CheckRemoteDebuggerPresent(GetCurrentProcess(), &DebuggerPresent) && DebuggerPresent)
        cout << "debugger detected";
    else
        cout << "successfully access";
}
