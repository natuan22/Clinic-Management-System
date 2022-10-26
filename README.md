# QuanLyPhongMach

 Hệ thống **Clinic Management System** cung cấp chức năng **đăng ký**, **khám chữa bệnh** **hỗ trợ** bệnh nhân và các nhân viên y tế trong việc chăm sóc sức khoẻ cộng đồng.
Sử dụng các công nghệ: Spring MVC, Hibernate và hệ cơ sở dữ liệu MySQL.

## 📦 Cài đặt

* [Apache Netbean IDE](https://netbeans.apache.org/download/index.html)

* [MySQL](https://www.mysql.com/downloads/)

* Clone/[Download][ZipDownload]

* Mở MySQL Workbench tạo schema mới 

* Import `qlphongmach.sql` vào schema mới vừa tạo (Server > Data Import > Import from Seft-Contained File > Default Schema to be Imported To...)

* Mở Netbean File > Open Project chọn project QLPhongMach mới tải về

* Vào file **database.properties** chỉnh sửa thông tin account mysql và cơ sở dữ liệu tạo phía trên [Setup database](src/main/resources/databases.properties)

```bash
hibernate.dialect=org.hibernate.dialect.MySQLDialect
hibernate.showSql=true
hibernate.connection.driverClass=com.mysql.cj.jdbc.Driver
hibernate.connection.url=jdbc:mysql://localhost:3306/qlphongmach
hibernate.connection.username=root
hibernate.connection.password=anhtuan222001
```



