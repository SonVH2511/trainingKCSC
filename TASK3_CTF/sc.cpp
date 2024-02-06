#include <bits/stdc++.h>
#include <windows.h>
#include <windef.h>
#include <stdio.h>
#include <stdlib.h>
using namespace std;
#define el '\n'
typedef long long ll;
typedef unsigned long long ull;
typedef long double ld;
const int MaxN = 1e6 + 1e5;
const int mod = 1e9 + 7;
int TEST = 1;
#define MAXSIZE 100
char PointerAddress[1000000];
char ssss[100000];
char ggg[] = "C:\\Users\\DELL\\Desktop\\reverse\\inside-the-mind-of-a-hacker-memory.bmp";
void solve()
{
    cin >> ssss;
    unsigned int Destination_length;
    HANDLE File_Write_Handle;
    void *v5;
    HANDLE FileMappingW_Handle;
    void *v8;
    unsigned int i_Destination;
    unsigned int i_v9;
    char v12;
    const void *v13;
    DWORD DataOffset;
    unsigned int v15;
    int ImageWidth;
    char *v17;
    int i_Height;
    int v19;
    int i_Width;
    int v21;
    char v22;
    HANDLE v23;
    HANDLE hObject;
    int v25;
    char *BitmapData;
    int ImageHeight;
    char *PointerAddress;
    byte *input_byte;
    DWORD picture_SIZE;
    int v31;
    unsigned int v32;
    int v33;
    char Destination[256];
    {
        memset(Destination, 0, sizeof(Destination));
        wcstombs(Destination, (const wchar_t *)ssss, 0x100u);
        Destination_length = 256;
        if (Destination_length)
        {
            File_Write_Handle = CreateFileW(L"C:\\Users\\DELL\\Desktop\\reverse\\inside-the-mind-of-a-hacker-memory.bmp", 0xC0000000, 1u, 0, 3u, 0x80u, 0);
            v5 = File_Write_Handle;
            v23 = File_Write_Handle;
            if (File_Write_Handle != (HANDLE)-1)
            {
                picture_SIZE = GetFileSize(File_Write_Handle, 0);
                if (picture_SIZE == -1 || (FileMappingW_Handle = CreateFileMappingW(v5, 0, 4u, 0, 0, 0),
                                           v8 = FileMappingW_Handle,
                                           (hObject = FileMappingW_Handle) == 0))
                {
                    CloseHandle(v5);
                    return;
                }
                PointerAddress = (char *)MapViewOfFile(FileMappingW_Handle, 6u, 0, 0, 0);

                if (PointerAddress)
                {
                    byte *v9 = (byte *)malloc(8 * Destination_length);
                    i_Destination = 0;
                    input_byte = v9;
                    i_v9 = 0;
                    v32 = 0;
                    do
                    {
                        v12 = Destination[i_Destination];
                        v9[i_v9] = v12 & 1;
                        v9[i_v9 + 1] = (v12 >> 1) & 1;
                        v9[i_v9 + 2] = (v12 >> 2) & 1;
                        v9[i_v9 + 3] = (v12 >> 3) & 1;
                        v9[i_v9 + 4] = (v12 >> 4) & 1;
                        v9[i_v9 + 5] = (v12 >> 5) & 1;
                        v9[i_v9 + 6] = (v12 >> 6) & 1;
                        i_Destination = v32 + 1;
                        v9[i_v9 + 7] = (v12 >> 7) & 1;
                        i_v9 += 8;
                        v32 = i_Destination;
                    } while (i_Destination < Destination_length);
                    v13 = PointerAddress;
                    {
                        DataOffset = *(int *)(PointerAddress + 10);
                        if (DataOffset < picture_SIZE && i_v9 < *(int *)(PointerAddress + 34))
                        {
                            v15 = 0;
                            ImageWidth = *(int *)(PointerAddress + 18);
                            ImageHeight = *(int *)(PointerAddress + 22);
                            v17 = &PointerAddress[DataOffset];
                            i_Height = 0;
                            v25 = ImageWidth;
                            BitmapData = v17;
                            *((int16_t *)PointerAddress + 3) = i_v9;
                            v33 = 0;
                            if (i_v9)
                            {
                                v19 = 0;
                                v31 = 0;
                                do
                                {
                                    if (i_Height >= ImageHeight)
                                        break;
                                    i_Width = 0;
                                    if (v15 < i_v9)
                                    {
                                        do
                                        {
                                            if (i_Width >= ImageWidth)
                                                break;
                                            v21 = v19 + i_Width++;
                                            v22 = input_byte[v15++];
                                            cout << int((int8_t)BitmapData[2 * v21 + v21]) << endl;
                                            v19 = v31;
                                            ImageWidth = v25;
                                        } while (v15 < i_v9);
                                        i_Height = v33;
                                    }
                                    ++i_Height;
                                    v19 += 3 * ImageWidth;
                                    v33 = i_Height;
                                    v31 = v19;
                                } while (v15 < i_v9);
                                v13 = PointerAddress;
                            }
                            v9 = input_byte;
                        }
                    }
                    free(v9);
                    UnmapViewOfFile(v13);
                    CloseHandle(hObject);
                    CloseHandle(v23);
                }
                else
                {
                    CloseHandle(v8);
                    CloseHandle(v5);
                }
            }
        }
    }
    return;
}
signed main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    freopen("C:\\Users\\DELL\\Desktop\\reverse\\inside-the-mind-of-a-hacker-memory.bmp", "rb", stdin);
    freopen("output.txt", "w", stdout);
    // while (TEST--)
    solve();
}