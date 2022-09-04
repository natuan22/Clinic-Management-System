package com.nat.pojo;

import com.nat.pojo.PhieuKhamBenh;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-09-04T14:43:03")
@StaticMetamodel(HoaDon.class)
public class HoaDon_ { 

    public static volatile SingularAttribute<HoaDon, Boolean> tinhTrang;
    public static volatile SingularAttribute<HoaDon, Boolean> active;
    public static volatile SingularAttribute<HoaDon, Long> thanhTien;
    public static volatile SingularAttribute<HoaDon, Integer> id;
    public static volatile SingularAttribute<HoaDon, PhieuKhamBenh> phieuKhamBenhId;
    public static volatile SingularAttribute<HoaDon, Date> ngayTao;

}