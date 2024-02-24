#include <bits/stdc++.h>
#include <windows.h>
using namespace std;

const vector<string> vWindowClasses = {
    "The Interactive Disassembler",
    "gdb",
    "IDA",
    "antidbg",
    "ID",
    "ntdll.dll",
    "ObsidianGUI",
    "OLLYDBG",
    "Rock Debugger",
    "SunAwtFrame",
    "Qt5QWindowIcon"
    "WinDbgFrameClass", // WinDbg
    "Zeta Debugger",
};

bool IsDebugged()
{
    for (auto &sWndClass : vWindowClasses)
    {
        if (NULL != FindWindowA(sWndClass.c_str(), NULL))
            return true;
    }
    return false;
}

int main()
{
    if (IsDebugged())
        cout << "debugger detected" << endl;
    else
        cout << "congrast" << endl;
    return 0;
}