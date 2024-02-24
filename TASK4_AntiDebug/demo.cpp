#include <bits/stdc++.h>
#include <windows.h>
using namespace std;
string ans = "";
string key = "";
int encryptedFlag[] = {2, 29, 93, 56, 39, 62, 55, 17, 61, 59, 8, 56,
                       33, 23, 93, 52, 21, 84, 58, 39, 0, 0, 0, 22, 16, 4, 19, 0, 22};
int fake_encryptedFlag[] = {118, 0, 74, 54, 59, 56, 27, 17, 82, 26, 56, 5, 28, 2, 11, 50, 1, 108, 43,
                            61, 108, 27, 4, 12, 1, 14, 56, 1, 23, 93, 52, 21, 108, 57, 60, 45, 113, 17, 61, 43, 57};
void _fakeThread()
{
    int len = sizeof(fake_encryptedFlag) / sizeof(int);
    int stringLen = key.length();
    for (int i = 0; i < len; ++i)
        ans += (char)(key[i % stringLen] ^ fake_encryptedFlag[i]);
}

void _ans()
{
    int len = sizeof(encryptedFlag) / sizeof(int);
    int stringLen = key.length();
    for (int i = 0; i < len; ++i)
        ans += (char)(key[i % stringLen] ^ encryptedFlag[i]);
}

int main()
{
    cout << "Key: ";
    cin >> key;

    if (key == "Ar3_U_Debugger?")
    {
        if (IsDebuggerPresent())
            // int* a=encryptedFlag;
            _fakeThread();
        else
            _ans();
        cout << ans;
    }
    else
        cout << "Wrong!! \nTry using some kinds of debugger^^";

    return 0;
}
