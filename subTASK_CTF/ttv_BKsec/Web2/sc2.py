correctPassword = [43490, 822, 2243, 1105, 4652,
                   429, 1187, 3901, 395, 1067, 622, 457901]

for enteredPassword0 in range(0, 10):
    for enteredPassword1 in range(0, 10):
        for enteredPassword2 in range(0, 10):
            for enteredPassword3 in range(0, 10):
                for enteredPassword4 in range(0, 10):
                    for enteredPassword5 in range(0, 10):
                        for enteredPassword6 in range(0, 10):
                            for enteredPassword7 in range(0, 10):
                                for enteredPassword8 in range(0, 10):
                                    for enteredPassword9 in range(0, 10):
                                        for enteredPassword10 in range(0, 10):
                                            for enteredPassword11 in range(0, 10):
                                                if enteredPassword0 * enteredPassword1 - 2 * enteredPassword2 == correctPassword[0] and enteredPassword1 + 5 * enteredPassword2 - 3 * enteredPassword3 == correctPassword[1] and enteredPassword2 + enteredPassword3 * enteredPassword4 - enteredPassword0 == correctPassword[2] and enteredPassword5 + 2 * enteredPassword4 + enteredPassword2 == correctPassword[3] and 20 * enteredPassword1 - 2 * enteredPassword2 - enteredPassword4 == correctPassword[4] and enteredPassword2 + enteredPassword5 - 2 * enteredPassword1 == correctPassword[5] and 2 * enteredPassword1 + enteredPassword2 + 3 * enteredPassword6 + 4 * enteredPassword7 == correctPassword[6] and 5 * enteredPassword5 - enteredPassword7 - enteredPassword8 + 2 * enteredPassword9 == correctPassword[7] and 3 * enteredPassword8 + 2 * enteredPassword9 + 4 * enteredPassword10 - 3 * enteredPassword6 == correctPassword[8] and 9 * enteredPassword11 + 2 * enteredPassword10 - enteredPassword8 == correctPassword[9] and 4 * enteredPassword7 - enteredPassword8 + enteredPassword10 == correctPassword[10] and enteredPassword3 ** enteredPassword8 + 3 * enteredPassword11 - 2 * enteredPassword7 + enteredPassword6 + enteredPassword5 + enteredPassword10 == correctPassword[11]:
                                                    print(enteredPassword0)
                                                    print(enteredPassword1)
                                                    print(enteredPassword2)
                                                    print(enteredPassword3)
                                                    print(enteredPassword4)
                                                    print(enteredPassword5)
                                                    print(enteredPassword6)
                                                    print(enteredPassword7)
                                                    print(enteredPassword8)
                                                    print(enteredPassword9)
                                                    print(enteredPassword10)
                                                    print(enteredPassword11)


# solve(enteredPassword0 * enteredPassword1 -
#       2 * enteredPassword2 == correctPassword[0],
#       enteredPassword1 + 5 * enteredPassword2 -
#       3 * enteredPassword3 == correctPassword[1],
#       enteredPassword2 + enteredPassword3 *
#       enteredPassword4 - enteredPassword0 == correctPassword[2],
#       enteredPassword5 + 2 * enteredPassword4 +
#       enteredPassword2 == correctPassword[3],
#       20 * enteredPassword1 - 2 * enteredPassword2 -
#       enteredPassword4 == correctPassword[4],
#       enteredPassword2 + enteredPassword5 - 2 *
#       enteredPassword1 == correctPassword[5],
#       2 * enteredPassword1 + enteredPassword2 + 3 *
#       enteredPassword6 + 4 * enteredPassword7 == correctPassword[6],
#       5 * enteredPassword5 - enteredPassword7 -
#       enteredPassword8 + 2 * enteredPassword9 == correctPassword[7],
#       3 * enteredPassword8 + 2 * enteredPassword9 + 4 *
#       enteredPassword10 - 3 * enteredPassword6 == correctPassword[8],
#       9 * enteredPassword11 + 2 * enteredPassword10 -
#       enteredPassword8 == correctPassword[9],
#       4 * enteredPassword7 - enteredPassword8 +
#       enteredPassword10 == correctPassword[10],
#       enteredPassword3 ** enteredPassword8 + 3 * enteredPassword11 - 2 * enteredPassword7 + enteredPassword6 + enteredPassword5 + enteredPassword10 == correctPassword[11])
