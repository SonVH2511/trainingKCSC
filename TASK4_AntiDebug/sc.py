key = 'Ar3_U_Debugger?'
# fake_Flag = '7rying_t0o_byp4ss_th3_anti_debug_fir5t_^^'
# encrypted_password = 'Congrast_No_Debugger_Detected'
# arr = []
# for i in range(len(encrypted_password)):
#     arr.append(ord(encrypted_password[i]) ^ ord(key[i % len(key)]))

# print(arr)
encryptedPass = [2, 29, 93, 56, 39, 62, 55, 17, 61, 59, 8, 56,
                 33, 23, 93, 52, 21, 84, 58, 39, 0, 0, 0, 22, 16, 4, 19, 0, 22]
fake_encryptedPass = [118, 0, 74, 54, 59, 56, 27, 17, 82, 26, 56, 5, 28, 2, 11, 50, 1, 108, 43,
                      61, 108, 27, 4, 12, 1, 14, 56, 1, 23, 93, 52, 21, 108, 57, 60, 45, 113, 17, 61, 43, 57]
for i in range(len(fake_encryptedPass)):
    print(chr(fake_encryptedPass[i] ^ ord(key[i % len(key)])))
# print(key[i % len(key)])
