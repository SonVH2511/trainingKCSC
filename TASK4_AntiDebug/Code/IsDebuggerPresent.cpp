#include <bits/stdc++.h>
#include <windows.h>
using namespace std;

void debuggerDetected()
{
    cout << "Debugger detected";
    return;
}

void normalProcess()
{
    cout << "successfully accessed";
}

int main()
{
    if (IsDebuggerPresent())
        debuggerDetected();
    else
        normalProcess();
    return 0;
}