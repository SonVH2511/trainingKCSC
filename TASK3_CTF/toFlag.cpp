#include <bits/stdc++.h>
using namespace std;

int main()
{
    string s = "01100110 00110110 10000110 11100110 11011110 00100110 11110110 01110110 00101110 11111010 01100110 11110110 01001110 11100110 10100110 00101110 11111010 00101110 00010110 10100110 11111010 00101110 01001110 10100110 10000110 11001110 10101110 01001110 10100110 10111110";
    reverse(s.begin(), s.end());
    cout << s << endl;

    string revFlag = "}erusaert_eht_tegrof_tnod{galf";
    reverse(revFlag.begin(), revFlag.end());

    cout << revFlag;
}