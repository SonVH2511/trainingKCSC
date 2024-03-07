arr = [22, 101, 133, 137, 79, 75, 166, 157, 189, 57, 172, 155, 144, 91,
       137, 222, 52, 144, 211, 101, 114, 116, 121, 76, 154, 168, 83, 94]
key = 'ThisIsAFlag'
flag_comp = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=<>,.?/{}[]\|~:;"\''

flag = ""
preChar = 0

for i in range(len(arr)):
    for j in flag_comp:
        tmp = ord(j) ^ ord(key[i % len(key)])
        tmp = tmp + preChar
        if tmp == arr[i]:
            flag += j
            preChar = ord(j)
            break
print(flag)


# ./Riga CTFlearn{213412341324}
# BKSEC{w3lC0mE_tO_R3v}
# BKSEC{MzMzNTMyMzUzMw==}
# BKSEC{rev3r5e_r@t_lA_vU1_lu0n_hehe}chU@_h3t_DaU_987g432t24678321)}
# BKSEC{0xb77b}
# BKSEC{welcome_to_our_org}
# BKSEC{Now_you_know_how_to_connect_to_challenges?}
# BKSEC{ju$t_h@rd3r_2_re@d_:P}
# BKSEC{sh0uln't_c0nf1g_th3____th1n9_I_d0nt_und3rst4nd}
