package com.nat.pojo;

import com.nat.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-08-25T03:42:38")
@StaticMetamodel(LichKhamBenh.class)
public class LichKhamBenh_ { 

    public static volatile SingularAttribute<LichKhamBenh, Boolean> xacThuc;
    public static volatile SingularAttribute<LichKhamBenh, Date> createdDate;
    public static volatile SingularAttribute<LichKhamBenh, String> trieuChung;
    public static volatile SingularAttribute<LichKhamBenh, Date> gioKham;
    public static volatile SingularAttribute<LichKhamBenh, Boolean> active;
    public static volatile SingularAttribute<LichKhamBenh, Integer> id;
    public static volatile SingularAttribute<LichKhamBenh, User> userId;
    public static volatile SingularAttribute<LichKhamBenh, Date> ngayKham;

}