## Task3/RE

## HiddenTreasure

### Lời giải

- Ở Chall này mình thu được kha khá kiến thức về việc thay đổi mã giả thành chương trình `C++` có thể thực thi. Tất nhiên mình có một vài khó khăn khi xử lí Chall này như sau:

1. Không rõ nội dung `input`, Dù thấy được chương trình sử dụng `argv[1]`, `argv[2]`. Mình chỉ có thể suy đoán được file ảnh `.bmp` được cấp sẽ là `argv[1]` bởi hàm `CreateFileW` có truyền đối số đọc file có sẵn. Chỉ khi được gợi ý mới rõ `argv[2]` là nội dung của file ảnh.

   ![alt text](IMG/HiddenTreasure/image.png)

2. Xử lý chương trình từ mã giả để có thể thực thi đúng ý muốn. Tất nhiên đây không phải vấn đề lớn, mình chỉ việc định nghĩa lại các kiểu dữ liệu là được :v.

- Đi vào xử lý bài toán. Ta đã có hướng đi là phục chế lại chương trình cho sẵn, nhưng cần tìm hiểu để dữ liệu mình cần là gì để in ra. Mình xem xét đoạn thao tác với file và khẳng định được file sẽ thay đổi khi biến `lpBaseAddress` và giá trị trong các con trỏ trỏ tới nó thay đổi vì biến `lpBaseAddress` là ptr ánh xạ tới data trong file được mở ra trước đó thông qua hàm `MapViewOfFile()`.

  ![alt text](IMG/HiddenTreasure/image-1.png)

```
    FileW = CreateFileW((LPCWSTR)argv[1], 0xC0000000, 1u, 0, 3u, 0x80u, 0);
    v5 = FileW
    v5 là tham số truyền vào hàm CreateFileMappingW() = FileMappingW
    FileMappingW là tham số truyền vào hàm MapViewOfFile() = lpBaseAddress
```

- Từ đó ta tìm tới các biến được gán với `lpBaseAddress`. Ta có v13, v14, v16 = v25, v27, v17 = v26. Tuy nhiên v13, v14, v16 v25, v27, được gán bởi giá trị cụ thể trong mảng `lpBaseAddress` nên không thể thay đổi data của file. chỉ v26 ~ v17 cùng trỏ tới `lpBaseAddress[v14]` mới có khả năng truy cập tới dữ liệu của file và thay đổi.

  ![alt text](IMG/HiddenTreasure/image-2.png)

- Xác định được rằng v26 và v17 là đối tượng cần theo dõi, khéo xuống dưới ta chỉ thấy một dòng lệnh duy nhất là phép gán `v26[2 * v21 + v21] = v22;` nhằm thay đổi giá trị trong file.

  ![alt text](IMG/HiddenTreasure/image-3.png)

- với v21 phụ thuộc vào v16 = const. Ta thử xem xét v22, v22 = v29 = v9. Ta thấy một đoạn biến đổi giá trị của v9[8*256]. Đoạn này mình bắt đầu thấy ngờ ngợ :v, mảng cấp phát bởi malloc() được sinh ngẫu nhiên thì biến đổi được gì nhỉ :D.

  ![alt text](IMG/HiddenTreasure/image-4.png)

- Mình đặt vòng lặp in ra mảng v9 ở chương trình được phục chế sau đoạn biến đổi để xem giá trị của v9 có thông tin gì không. Lúc này có vẻ mục đích của Chall đã được làm rõ, mảng v9 sau khi biến đổi hoàn toàn mang giá trị `0`. Mình chợt nhớ tới tên đề bài: HiddenTreasure. Có lẽ phép gán các vị trí `v26[2 * v21 + v21] = v22 = v9[i];` là để che đi các giá trị mình cần đúng như tên đề bài :v. (Cơ mà cấp phát mảng `0` sao không dùng `calloc()` cho nhanh mà phải `xor` với `and` @@).

  ![alt text](IMG/HiddenTreasure/image-5.png)

- Với ý tưởng đó, ta sẽ không gán cho v22-thứ dùng để giấu đi flag mà trực tiếp in ra `v26[2 * v21 + v21]`. Phần đầu của output là một chuỗi nhị phân khả năng cao là key. Nhặt ra và convert sang ASCII.

  ![alt text](IMG/HiddenTreasure/image-6.png)

- đoạn này convert ra data rác :v tìm hiểu một hồi thì biết giá trị dạng `bin` thường được lưu trữ ngược lại :c. reverse() string và convert rồi reverse() phát nữa là được.

  ![alt text](IMG/HiddenTreasure/image-7.png)

```
flag: flag{dont_forget_the_treasure}
```

- Mình giải được bài này là nhờ một vài gợi ý từ WU https://hackmd.io/@S0L/REVnMISC_for_FPT#Writeup-RE--MISC.

## Mong WRITEUP này giúp ích cho các bạn!

```
from KMA
Author: 13r_ə_Rɪst
Email: sonvha2k23@cvp.vn
```
