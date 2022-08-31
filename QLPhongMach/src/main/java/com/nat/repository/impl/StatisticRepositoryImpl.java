/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.repository.impl;

import com.nat.pojo.HoaDon;
import com.nat.pojo.PhieuKhamBenh;
import com.nat.pojo.Thuoc;
import com.nat.pojo.ToaThuoc;
import com.nat.pojo.ToaThuocDetail;
import com.nat.repository.StatisticRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author anhtuan
 */
@Repository
@Transactional
public class StatisticRepositoryImpl implements StatisticRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> thuocStats(int quarter, int y) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rThuoc = q.from(Thuoc.class);
        Root rToaThuocDetail = q.from(ToaThuocDetail.class);
        Root rToaThuoc = q.from(ToaThuoc.class);

        q.where(b.equal(rToaThuocDetail.get("thuocId"), rThuoc.get("id")),
                b.equal(rToaThuocDetail.get("toaThuocId"), rToaThuoc.get("id")),
                b.equal(b.function("QUARTER", Integer.class, rToaThuoc.get("createdDate")), quarter),
                b.equal(b.function("YEAR", Integer.class, rToaThuoc.get("createdDate")), y));

        q.multiselect(rThuoc.get("id"), rThuoc.get("ten"), b.sum(rToaThuocDetail.get("soLuong")));
        q.groupBy(rThuoc.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> revenueStats(int year) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rHoaDon = q.from(HoaDon.class);

        q.where(b.equal(rHoaDon.get("tinhTrang"), true),
                b.equal(b.function("YEAR", Integer.class, rHoaDon.get("ngayTao")), year));

        q.multiselect(b.function("MONTH", Integer.class, rHoaDon.get("ngayTao")),
                      b.sum(rHoaDon.get("thanhTien")));
        q.groupBy(b.function("MONTH", Integer.class, rHoaDon.get("ngayTao")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> countBenhNhan(int year) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rPhieuKhamBenh = q.from(PhieuKhamBenh.class);

        q.where(b.equal(b.function("YEAR", Integer.class, rPhieuKhamBenh.get("ngayKham")), year));

        q.multiselect(b.function("MONTH", Integer.class, rPhieuKhamBenh.get("ngayKham")),
                      b.count(rPhieuKhamBenh.get("id")));
        q.groupBy(b.function("MONTH", Integer.class, rPhieuKhamBenh.get("ngayKham")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

}
