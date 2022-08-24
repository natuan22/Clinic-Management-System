package com.nat.pojo;

import com.nat.pojo.PhieuKhamBenh;
import com.nat.pojo.ToaThuocDetail;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-08-25T03:42:38")
@StaticMetamodel(ToaThuoc.class)
public class ToaThuoc_ { 

    public static volatile SetAttribute<ToaThuoc, ToaThuocDetail> toaThuocDetailSet;
    public static volatile SingularAttribute<ToaThuoc, Date> createdDate;
    public static volatile SingularAttribute<ToaThuoc, Long> tongTien;
    public static volatile SingularAttribute<ToaThuoc, PhieuKhamBenh> phieuKhamBenh;
    public static volatile SingularAttribute<ToaThuoc, Boolean> active;
    public static volatile SingularAttribute<ToaThuoc, Integer> id;
    public static volatile SetAttribute<ToaThuoc, PhieuKhamBenh> phieuKhamBenhSet;

}