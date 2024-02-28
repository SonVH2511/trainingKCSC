## Task4/ANTI-Debug/EX

### anti1

- Về bài đầu tiên, Chương trình thực hiện antidebug bằng cách `throw exception` khi detect ra chương trình đang được debug và hướng ta tới luồng chương trình sai. Tuy nhiên có vẻ `IDA` quá mạnh cho phép debugger thoát khỏi `exception` và quay trở lại luồng chính khiến việc debug không gặp trở ngại nào.

![alt text](IMG/anti1/image.png)

- Nếu phải đánh giá điều gì về chall này, mình nghĩ cái khó ở đây không phải bypass exception bởi các vị trí cần `patch` khá dễ nhận thấy. Điều cản trở việc debug của mình ở chall này là mã giả không cung cấp nhiều thông tin(chương trình gen mã giả không hoàn thiện) khiến nhiều đoạn phải mò và đặt `bp` rồi dần dần nắm được luồng chính.

- Sau quá trình debug, mình rút ra được chương trình sẽ hoạt động như sau.

- Đầu tiên, chương trình kiểm tra ngoại lệ, quăng ra hàm mã hóa khá dài nếu sử dụng debugger. Nếu không sẽ nhảy tới hàm encrypt input.

![alt text](IMG/anti1/image-1.png)

- Hàm mã hóa input khá đơn giản, chỉ gồm phép xor với key là `BKSEECCCC!!!`.

![alt text](IMG/anti1/image-2.png)

- Sau đó, chương trình nhảy tới hàm kiểm tra dưới đây, và cũng là điểm duy nhất ta cần `patch` để bypass(hoặc cũng không cần vì tới đây hoàn toàn có thể debug tĩnh). Một bên là luồng xử lí rất dài mà mình không nắm rõ khi đoạn này không xuất được mã giả. Luồng còn lại ta thấy một dải data được load vào.

![alt text](IMG/anti1/image-3.png)

- Vì chương trình đã có `key`, mình mạnh dạn đoán chuỗi này là có thể là chuỗi để kiểm tra với chuỗi input `xor` với key trước đó. Vì đoạn mã hóa chỉ gồm phép `xor`, ta thử viết script ngược lại xem có thật sự ra flag không.

```python
cipher = [0x0, 0x38, 0x7A, 0x6C, 0x2C, 0x37, 0x43, 0x44, 0x45, 0x1C, 0x72, 0x37, 0x2D, 0x24, 0x1A, 0x60, 0x26, 0x2D, 0x52, 0x7E, 0x12, 0x21, 0x1C, 0x37, 0x30, 0x30, 0x28, 0x0C, 0x78, 0x30, 0x12, 0x49, 0x55, 0x1C, 0x37, 0x36, 0x21, 0x1A, 0x29, 0x3F, 0x7F, 0x2A, 0x42, 0x7E, 0x58, 0x30, 0x77, 0x26, 0x38, 0x6, 0x0, 0x0, 0x0, 0x0
          ]
key = "BKSEECCCC!!!"
flag = ""

for i in range(len(cipher)):
    flag += chr(cipher[len(cipher)-i-1] ^ ord(key[i % len(key)]))
print(flag)
print(len(flag))
```

```
flag: BKSEC{e4sy_ch4ll_but_th3r3_must_b3_som3_ant1_debug??}
```

- Sử dụng flag thu được quăng vào debug xem đoạn nào bắt buộc phải bypass :v. Ta thấy được đoạn này cần patch vì chương trình không nhảy vào đoạn cipher khi debug.

![alt text](IMG/anti1/image-4.png)

- Thông báo flag chuẩn

  ![alt text](IMG/anti1/image-5.png)

## Mong WRITEUP này giúp ích cho các bạn!

```

from KMA
Author: 13r_ə_Rɪst
Email: sonvha2k23@cvp.vn

```
