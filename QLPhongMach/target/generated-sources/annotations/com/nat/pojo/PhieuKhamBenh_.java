package com.nat.pojo;

import com.nat.pojo.DichVuBenhVien;
import com.nat.pojo.HoaDon;
import com.nat.pojo.ToaThuoc;
import com.nat.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-08-31T23:18:39")
@StaticMetamodel(PhieuKhamBenh.class)
public class PhieuKhamBenh_ { 

    public static volatile SingularAttribute<PhieuKhamBenh, DichVuBenhVien> dichVuBenhVienId;
    public static volatile SingularAttribute<PhieuKhamBenh, User> bacSiId;
    public static volatile SingularAttribute<PhieuKhamBenh, String> trieuChung;
    public static volatile SingularAttribute<PhieuKhamBenh, ToaThuoc> toaThuocId;
    public static volatile SingularAttribute<PhieuKhamBenh, User> benhNhanId;
    public static volatile SingularAttribute<PhieuKhamBenh, Boolean> active;
    public static volatile SingularAttribute<PhieuKhamBenh, Integer> id;
    public static volatile SingularAttribute<PhieuKhamBenh, String> ketLuan;
    public static volatile SetAttribute<PhieuKhamBenh, HoaDon> hoaDonSet;
    public static volatile SingularAttribute<PhieuKhamBenh, Date> ngayKham;

}