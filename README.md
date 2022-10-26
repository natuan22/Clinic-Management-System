# QuanLyPhongMach

 Hệ thống **Clinic Management System** cung cấp chức năng **đăng ký**, **khám chữa bệnh** **hỗ trợ** bệnh nhân và các nhân viên y tế trong việc chăm sóc sức khoẻ cộng đồng.
Sử dụng các công nghệ: Spring MVC, Hibernate và hệ cơ sở dữ liệu MySQL.

## 📦 Cài đặt

* [Apache Netbean IDE](https://netbeans.apache.org/download/index.html)

* [MySQL](https://www.mysql.com/downloads/)

* [Tomcat Server](https://tomcat.apache.org/download-10.cgi)

* Clone/[Download](https://github.com/natuan22/Clinic-Management-System/archive/refs/heads/main.zip)

* Mở MySQL Workbench tạo schema mới 

* Import `qlphongmach.sql` vào schema mới vừa tạo (Server > Data Import > Import from Seft-Contained File > Default Schema to be Imported To...)

* Mở Netbean File > Open Project chọn project QLPhongMach mới tải về

* Vào file **database.properties** chỉnh sửa thông tin account mysql và cơ sở dữ liệu tạo phía trên [Setup database](QLPhongMach/src/main/resources/databases.properties)

```bash
hibernate.connection.url=jdbc:mysql://localhost:3306/qlphongmach
hibernate.connection.username=root
hibernate.connection.password=anhtuan222001
```

* Chuột phải project chọn `Clean and Build` project hoặc `Shift+F11`

* Sau khi build xong thì chuột phải project chọn `Run` hoặc `F6`

## 🚀 Tài khoản test trong hệ thống

* Role admin: username: admin
* Role bác sĩ: username: bacsi
* Role y tá: username: yta 
* `Tất cả mật khẩu là 1`
## 🎁 Giao diện hệ thống

* Trang chủ

![image](https://res.cloudinary.com/dhldfozup/image/upload/v1666789541/QLPhongMach/screencapture-localhost-8080-QLPhongMach-2022-10-16-22_40_43_utqtkh.png)

<details>
<summary>Một số giao diện khác</summary>
<img src="https://res.cloudinary.com/dhldfozup/image/upload/v1666789535/QLPhongMach/screencapture-localhost-8080-QLPhongMach-dang-ky-kham-2022-10-16-22_42_50_c3qq0f.png" alt="dangKyKhamBenh">
<img src="https://res.cloudinary.com/dhldfozup/image/upload/v1666789534/QLPhongMach/screencapture-localhost-8080-QLPhongMach-bacsi-kham-benh-149-2022-10-16-22_46_40_ky6byg.png" alt="khamBenh">
<img src="https://res.cloudinary.com/dhldfozup/image/upload/v1666789537/QLPhongMach/screencapture-localhost-8080-QLPhongMach-admin-2022-10-16-22_54_42_rezqn4.png" alt="thongKeThuoc">
<img src="https://res.cloudinary.com/dhldfozup/image/upload/v1666789537/QLPhongMach/screencapture-localhost-8080-QLPhongMach-admin-stats-2022-10-16-22_54_56_pnqo2g.png" alt="thongKeBaoCao">
<img src="https://res.cloudinary.com/dhldfozup/image/upload/v1666789533/QLPhongMach/screencapture-localhost-8080-QLPhongMach-admin-thuocs-2022-10-16-22_54_09_pxrzoq.png" alt="quanLyThuoc">
</details>