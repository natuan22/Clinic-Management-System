/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.repository.impl;

import com.nat.pojo.Cart;
import com.nat.pojo.HoaDon;
import com.nat.pojo.PhieuKhamBenh;
import com.nat.pojo.ToaThuoc;
import com.nat.pojo.ToaThuocDetail;
import com.nat.repository.PhieuKhamBenhRepository;
import com.nat.repository.ThuocRepository;
import com.nat.utils.Utils;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author anhtuan
 */
@Repository
@Transactional
public class PhieuKhamBenhRepositoryImpl implements PhieuKhamBenhRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private ThuocRepository thuocRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addPhieuKhamBenh(Map<Integer, Cart> cart, PhieuKhamBenh phieuKhamBenh) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();

            ToaThuoc toathuoc = new ToaThuoc();
            toathuoc.setCreatedDate(new Date());

            Map<String, String> stats = Utils.cartStats(cart);
            toathuoc.setTongTien(Long.parseLong(stats.get("amount")));

            session.save(toathuoc);

            for (Cart c : cart.values()) {
                ToaThuocDetail d = new ToaThuocDetail();
                d.setToaThuocId(toathuoc);
                d.setThuocId(this.thuocRepository.getThuocById(c.getThuocId()));
                d.setDonGia(c.getGia());
                d.setSoLuong(c.getSoLuong());

                session.save(d);
            }
            
            phieuKhamBenh.setNgayKham(new Date());
            phieuKhamBenh.setToaThuocId(toathuoc);
            
            session.save(phieuKhamBenh);
            
            HoaDon hoadon = new HoaDon();
            hoadon.setNgayTao(new Date());
            hoadon.setPhieuKhamBenhId(phieuKhamBenh);
            hoadon.setTinhTrang(false);
            hoadon.setThanhTien(phieuKhamBenh.getDichVuBenhVienId().getGia() + Long.parseLong(stats.get("amount")));
            
            session.save(hoadon);
            
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public List<PhieuKhamBenh> getPhieuKhamBenhByUserId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<PhieuKhamBenh> q = b.createQuery(PhieuKhamBenh.class);
        Root<PhieuKhamBenh> root = q.from(PhieuKhamBenh.class);
        q.select(root);
        
        q.where(b.equal(root.get("benhNhanId"), id));
        
        Query query = session.createQuery(q);
        return query.getResultList();
    }
}
