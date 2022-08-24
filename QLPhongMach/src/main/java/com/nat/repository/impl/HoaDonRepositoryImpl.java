/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.repository.impl;

import com.nat.pojo.HoaDon;
import com.nat.repository.HoaDonRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

/**
 *
 * @author anhtuan
 */
@Repository
@Transactional
public class HoaDonRepositoryImpl implements HoaDonRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<HoaDon> getHoaDons() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<HoaDon> q = b.createQuery(HoaDon.class);
        Root<HoaDon> root = q.from(HoaDon.class);
        q.select(root);
        
        
        q.orderBy(b.asc(root.get("tinhTrang")));
                
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean confirmHoaDon(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            HoaDon lichKhamBenh =  session.get(HoaDon.class, id);
            lichKhamBenh.setTinhTrang(true);
            session.save(lichKhamBenh);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
}
