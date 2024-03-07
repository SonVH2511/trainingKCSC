from z3 import *

correctPassword = [43490, 822, 2243, 1105, 4652,
                   429, 1187, 3901, 395, 1067, 622, 457901]
enteredPassword0 = Int('enteredPassword0')
enteredPassword1 = Int('enteredPassword1')
enteredPassword2 = Int('enteredPassword2')
enteredPassword3 = Int('enteredPassword3')
enteredPassword4 = Int('enteredPassword4')
enteredPassword5 = Int('enteredPassword5')
enteredPassword6 = Int('enteredPassword6')
enteredPassword7 = Int('enteredPassword7')
enteredPassword8 = Int('enteredPassword8')
enteredPassword9 = Int('enteredPassword9')
enteredPassword10 = Int('enteredPassword10')
enteredPassword11 = Int('enteredPassword11')

# enteredPassword = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
# print(len(enteredPassword))


# giải ra 6 nghiệm đầu
solve(enteredPassword0 * enteredPassword1 - 2 * enteredPassword2 == 43490, enteredPassword1 + 5 * enteredPassword2 - 3 * enteredPassword3 == 822, enteredPassword2 + enteredPassword3 * enteredPassword4 - enteredPassword0 ==
      2243, enteredPassword5 + 2 * enteredPassword4 + enteredPassword2 == 1105, 20 * enteredPassword1 - 2 * enteredPassword2 - enteredPassword4 == 4652, enteredPassword2 + enteredPassword5 - 2 * enteredPassword1 == 429)


for i in range(0, 1000):
    solve(2 * 250 + 130 + 3 * enteredPassword6 + 4 * enteredPassword7 == correctPassword[6],
          5 * 799 - enteredPassword7 -
          enteredPassword8 + 2 * enteredPassword9 == correctPassword[7],
          3 * enteredPassword8 + 2 * enteredPassword9 +
          4 * enteredPassword10 - 3 *
          enteredPassword6 == correctPassword[8],
          9 * enteredPassword11 + 2 *
          enteredPassword10 - enteredPassword8 == correctPassword[9],
          4 * enteredPassword7 - enteredPassword8 +
          enteredPassword10 == correctPassword[10],
          26 ** i + 3 * enteredPassword11 - 2 * enteredPassword7 + enteredPassword6 + 799 + enteredPassword10 == correctPassword[11], enteredPassword7 >= 0, enteredPassword6 >= 0, enteredPassword8 >= 0, enteredPassword9 >= 0, enteredPassword10 >= 0, enteredPassword11 >= 0)


# // Check password here
# const correctPassword = [43490, 822, 2243, 1105, 4652, 429, 1187, 3901, 395, 1067, 622, 457901];

# function checkPassword() {
#     const dials = document.querySelectorAll('.dial');
#     const enteredPassword = Array.from(dials).map(dial => Number(dial.value));
#     const decodedPassword = [
#         enteredPassword[0] * enteredPassword[1] - 2 * enteredPassword[2],
#         enteredPassword[1] + 5 * enteredPassword[2] - 3 * enteredPassword[3],
#         enteredPassword[2] + enteredPassword[3] * enteredPassword[4] - enteredPassword[0],
#         enteredPassword[5] + 2 * enteredPassword[4] + enteredPassword[2],
#         20 * enteredPassword[1] - 2 * enteredPassword[2] - enteredPassword[4],
#         enteredPassword[2] + enteredPassword[5] - 2 * enteredPassword[1],
#         2 * enteredPassword[1] + enteredPassword[2] + 3 * enteredPassword6 + 4 * enteredPassword7,
#         5 * enteredPassword[5] - enteredPassword7 - enteredPassword8 + 2 * enteredPassword9,
#         3 * enteredPassword8 + 2 * enteredPassword9 + 4 * enteredPassword10 - 3 * enteredPassword6,
#         9 * enteredPassword11 + 2 * enteredPassword10 - enteredPassword8,
#         4 * enteredPassword7 - enteredPassword8 + enteredPassword10,
#         enteredPassword[3] ** enteredPassword8 + 3 * enteredPassword11 - 2 * enteredPassword7 + enteredPassword6 + enteredPassword[5] + enteredPassword10,
#     ];
#     if (JSON.stringify(decodedPassword) === JSON.stringify(correctPassword)) {
#         const passwordString = enteredPassword.join('');
#         const hexPassword = new TextEncoder().encode(passwordString).reduce((prev, curr) => prev + curr.toString(16).padStart(2, '0'), '');
#         const base64Password = btoa(hexPassword);
#         alert("Mở khóa thành công! Cờ của bạn là BKSEC{" + base64Password + "}");
#     } else {
#         alert('Mật khẩu không chính xác. Vui lòng thử lại.');
#     }
# }
