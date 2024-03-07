from z3 import *

a1 = Int('a1')
a2 = Int('a2')
a3 = Int('a3')
a4 = Int('a4')
a5 = Int('a5')

solve(a1 + a2 + a3 == 10, a2 + a3 + a4 == 12, a3 + a4 +
      a5 == 10, a4 + a5 + a1 == 11, a5 + a1 + a2 == 11)

# // Check password here
# const correctPassword = [10, 12, 10, 11, 11];

# function checkPassword() {
#     const dials = document.querySelectorAll('.dial');
#     const enteredPassword = Array.from(dials).map(dial => Number(dial.value));
#     const decodedPassword = [
#         enteredPassword[0] + enteredPassword[1] + enteredPassword[2],
#         enteredPassword[1] + enteredPassword[2] + enteredPassword[3],
#         enteredPassword[2] + enteredPassword[3] + enteredPassword[4],
#         enteredPassword[3] + enteredPassword[4] + enteredPassword[0],
#         enteredPassword[4] + enteredPassword[0] + enteredPassword[1],
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
