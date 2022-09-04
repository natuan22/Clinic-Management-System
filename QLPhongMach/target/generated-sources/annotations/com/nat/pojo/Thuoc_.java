package com.nat.pojo;

import com.nat.pojo.DanhMucThuoc;
import com.nat.pojo.DonViTinh;
import com.nat.pojo.ToaThuocDetail;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-09-04T14:43:03")
@StaticMetamodel(Thuoc.class)
public class Thuoc_ { 

    public static volatile SetAttribute<Thuoc, ToaThuocDetail> toaThuocDetailSet;
    public static volatile SingularAttribute<Thuoc, Date> createdDate;
    public static volatile SingularAttribute<Thuoc, String> ghiChu;
    public static volatile SingularAttribute<Thuoc, Boolean> active;
    public static volatile SingularAttribute<Thuoc, DanhMucThuoc> danhMucId;
    public static volatile SingularAttribute<Thuoc, Integer> id;
    public static volatile SingularAttribute<Thuoc, DonViTinh> donViTinhId;
    public static volatile SingularAttribute<Thuoc, String> ten;
    public static volatile SingularAttribute<Thuoc, Integer> soLuong;
    public static volatile SingularAttribute<Thuoc, Long> donGia;

}