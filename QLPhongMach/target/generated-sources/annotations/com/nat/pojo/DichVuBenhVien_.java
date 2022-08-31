package com.nat.pojo;

import com.nat.pojo.PhieuKhamBenh;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-08-31T23:18:39")
@StaticMetamodel(DichVuBenhVien.class)
public class DichVuBenhVien_ { 

    public static volatile SingularAttribute<DichVuBenhVien, Date> createdDate;
    public static volatile SingularAttribute<DichVuBenhVien, Boolean> active;
    public static volatile SingularAttribute<DichVuBenhVien, Integer> id;
    public static volatile SingularAttribute<DichVuBenhVien, String> ten;
    public static volatile SingularAttribute<DichVuBenhVien, Long> gia;
    public static volatile SetAttribute<DichVuBenhVien, PhieuKhamBenh> phieuKhamBenhSet;

}