package com.nat.pojo;

import com.nat.pojo.LichKhamBenh;
import com.nat.pojo.PhieuKhamBenh;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-08-31T23:18:39")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> lastName;
    public static volatile SingularAttribute<User, Boolean> active;
    public static volatile SingularAttribute<User, Boolean> isSuperuser;
    public static volatile SingularAttribute<User, String> gioiTinh;
    public static volatile SingularAttribute<User, String> avatar;
    public static volatile SetAttribute<User, LichKhamBenh> lichKhamBenhSet;
    public static volatile SetAttribute<User, PhieuKhamBenh> phieuKhamBenhSet1;
    public static volatile SingularAttribute<User, String> firstName;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, String> phone;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> userRole;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SetAttribute<User, PhieuKhamBenh> phieuKhamBenhSet;
    public static volatile SingularAttribute<User, String> username;

}