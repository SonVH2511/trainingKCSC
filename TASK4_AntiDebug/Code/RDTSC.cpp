#include <bits/stdc++.h>
#include <windows.h>
#include <unistd.h>
using namespace std;
int main()
{
    long long t1, t2;
    t1 = __rdtsc();

    // sleep(10);

    t2 = __rdtsc();
    cout << "t1: " << t1 << '\n'
         << "t2: " << t2;
}