package com.nat.pojo;

import com.nat.pojo.Thuoc;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-09-04T14:43:03")
@StaticMetamodel(DonViTinh.class)
public class DonViTinh_ { 

    public static volatile SingularAttribute<DonViTinh, Date> createdDate;
    public static volatile SingularAttribute<DonViTinh, Boolean> active;
    public static volatile SingularAttribute<DonViTinh, Integer> id;
    public static volatile SingularAttribute<DonViTinh, String> ten;
    public static volatile SetAttribute<DonViTinh, Thuoc> thuocSet;

}