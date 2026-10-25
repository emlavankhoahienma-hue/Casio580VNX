# Casio fx-580VN X ClassWiz for iOS (Swift & SwiftUI)

Bản clone 1:1 hoàn chỉnh và chân thực nhất của máy tính khoa học **Casio fx-580VN X ClassWiz** dành cho hệ điều hành **iOS 17+ (iPhone & iPad)**, viết 100% bằng **Swift** và **SwiftUI**.

---

## 🌟 Tính Năng Nổi Bật

### 1. Màn Hình LCD Ma Trận Điểm 2D (Natural Textbook Display)
- AST biểu thức toán học 2 chiều (`MathNode`):
  - Phân số $\frac{\Box}{\Box}$, hỗn số $\Box\frac{\Box}{\Box}$, căn thức $\sqrt{\Box}$, căn bậc n $\sqrt[\Box]{\Box}$, lũy thừa $x^{\Box}$, logarit $\log_{\Box}(\Box)$.
  - Đạo hàm tại 1 điểm $\left.\frac{d}{dx}(\Box)\right|_{x=\Box}$, tích phân xác định $\int_{\Box}^{\Box}\Box\,dx$, tổng $\sum$, tích $\prod$, trị tuyệt đối $|\Box|$.
- Con trỏ điều hướng 4 chiều `[◄] [▲] [▼] [►]` qua D-pad kim loại Replay.
- Phím `S<=>D`: Chuyển đổi qua lại giữa Phân số tối giản $\Leftrightarrow$ Số thập phân $\Leftrightarrow$ Độ-Phút-Giây.
- `SHIFT + FACT`: Phân tích thừa số nguyên tố ($120 \rightarrow 2^3 \times 3 \times 5$).
- `ALPHA + ÷R`: Chia lấy thương và phần dư ($17 \div R \, 5 \rightarrow Q=3, R=2$).
- Thanh trạng thái chuẩn ClassWiz: `[S]`, `[A]`, `[M]`, `[STO]`, `√□/`, `[D]/[R]/[G]`, `[FIX]/[SCI]`, `[𝒊]`, `[MAT]`, `[VCT]`, `▲▼`.

### 2. Đầy Đủ 50 Phím Bấm & Chức Năng Nâng Cao
- `CALC`: Nhập biểu thức chứa biến $A, B, C, D, E, F, x, y$, máy tự hỏi từng biến rồi tính.
- `SHIFT + CALC (SOLVE)`: Tìm nghiệm phương trình bằng giải thuật Newton-Raphson, hiển thị `x = ...` và `L - R = 0`.
- `SHIFT + 7 (CONST)`: Danh mục 40 hằng số khoa học chuẩn quốc tế (Universal, Điện từ, Hạt nhân, Lý hóa, v.v.).
- `SHIFT + 8 (CONV)`: 40 phép đổi đơn vị đo lường (Độ dài, Diện tích, Thể tích, Khối lượng, Áp suất, Công suất, Nhiệt độ).
- `SHIFT + 9 (RESET)`: Khởi tạo lại Dữ liệu cài đặt, Bộ nhớ hoặc Toàn bộ máy.
- `OPTN`: Menu ngữ cảnh thông minh thay đổi theo từng chế độ làm việc.

### 3. Đầy Đủ 12 Chế Độ Tính Toán (Lưới Icon Song Ngữ Việt - Anh)
1. `[1] Tính toán chung (Calculate)`
2. `[2] Số phức (Complex)`: Biểu diễn $a+bi$ và $r\angle\theta$, $\text{Arg}$, $\text{Conjg}$, $\text{ReP}$, $\text{ImP}$.
3. `[3] Hệ đếm cơ số N (Base-N)`: DEC, HEX, BIN, OCT và các phép toán bit logic.
4. `[4] Ma trận (Matrix)`: MatA..MatD (tới $4\times 4$), Định thức Det, Ma trận chuyển vị Trn, Nghịch đảo $M^{-1}$.
5. `[5] Véctơ (Vector)`: VctA..VctD (2D, 3D), Tích vô hướng Dot, Tích có hướng Cross, Góc Angle, Véctơ đơn vị UnitV.
6. `[6] Thống kê (Statistics)`: Thống kê 1 biến và các mô hình hồi quy 2 biến ($y=a+bx$, parabol, hàm mũ, logarit...).
7. `[7] Phân phối (Distribution)`: Normal PD/CD, Inverse Normal, Binomial PD/CD, Poisson PD/CD.
8. `[8] Bảng giá trị (Table)`: Sinh bảng giá trị hàm số $f(x)$ và $g(x)$ theo Start, End, Step.
9. `[9] Phương trình / Hệ PT (Equation)`: Hệ 2-4 ẩn; PT bậc 2-4 (nghiệm thực & nghiệm phức, tìm cực đại/cực tiểu).
10. `[A] Bất phương trình (Inequality)`: Bậc 2, 3, 4 ($>0, <0, \ge 0, \le 0$).
11. `[B] Tỷ lệ thức (Ratio)`: $A:B = X:D$ hoặc $A:B = C:X$.

### 4. Màn Hình Báo Lỗi & Khắc Phục Chuẩn Casio
- Hiển thị thông báo lỗi chuẩn xác: `Lỗi phép tính / Math ERROR`, `Lỗi cú pháp / Syntax ERROR`, `Không giải được / Can't Solve`.
- Bấm `[AC]` để hủy.
- Bấm `[◄]` hoặc `[►]` để tự động đưa con trỏ quay lại đúng vị trí công thức bị lỗi.

---

## 📲 Cài Đặt (Sideload)

File `.ipa` được xuất tự động qua **GitHub Actions** ở định dạng **unsigned**, sẵn sàng cài đặt qua:
1. **Sideloadly**: Kéo thả file `Casio580VNX-unsigned.ipa` vào Sideloadly, nhập Apple ID và bấm Start.
2. **TrollStore**: Mở trực tiếp file `.ipa` trong TrollStore để cài đặt vĩnh viễn không cần ký lại.
