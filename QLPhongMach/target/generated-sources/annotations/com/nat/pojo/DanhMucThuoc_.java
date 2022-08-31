package com.nat.pojo;

import com.nat.pojo.Thuoc;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-08-31T23:18:39")
@StaticMetamodel(DanhMucThuoc.class)
public class DanhMucThuoc_ { 

    public static volatile SingularAttribute<DanhMucThuoc, Date> createdDate;
    public static volatile SingularAttribute<DanhMucThuoc, Boolean> active;
    public static volatile SingularAttribute<DanhMucThuoc, Integer> id;
    public static volatile SingularAttribute<DanhMucThuoc, String> ten;
    public static volatile SetAttribute<DanhMucThuoc, Thuoc> thuocSet;

}