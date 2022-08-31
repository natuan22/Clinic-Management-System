/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.repository.impl;

import com.nat.pojo.LichKhamBenh;
import com.nat.repository.LichKhamBenhRepository;
import java.util.Date;
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
public class LichKhamBenhRepositoryImpl implements LichKhamBenhRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<LichKhamBenh> getLichKhamBenhsByXacThuc(boolean xacThuc) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<LichKhamBenh> q = b.createQuery(LichKhamBenh.class);
        Root<LichKhamBenh> root = q.from(LichKhamBenh.class);
        q.select(root);
        
        q = q.where(b.equal(root.get("xacThuc"), xacThuc));
        q.orderBy(b.asc(root.get("ngayKham")), b.asc(root.get("gioKham")));
                
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean addLichKhamBenh(LichKhamBenh lichKhamBenh) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(lichKhamBenh);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean confirmLichKhamBenh(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            LichKhamBenh lichKhamBenh =  session.get(LichKhamBenh.class, id);
            lichKhamBenh.setXacThuc(true);
            session.save(lichKhamBenh);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public LichKhamBenh getLichKhamBenhById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(LichKhamBenh.class, id);
    }

    @Override
    public List<LichKhamBenh> getLichKhamBenhByUser(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<LichKhamBenh> q = b.createQuery(LichKhamBenh.class);
        Root<LichKhamBenh> root = q.from(LichKhamBenh.class);
        q.select(root);
        
        q = q.where(b.equal(root.get("userId"), id));
        q.orderBy(b.asc(root.get("ngayKham")), b.asc(root.get("gioKham")));
                
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean deleteLichKhamBenh(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try {
            LichKhamBenh p = session.get(LichKhamBenh.class, id);
            session.delete(p);
            
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public int countLichKhamBenh(Date date) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery q = b.createQuery(LichKhamBenh.class);
        Root root = q.from(LichKhamBenh.class);
        q.select(root);
        
        q.where(b.equal(root.get("ngayKham"), date));
        q.select(b.count(root.get("id")));
                
        Query query = session.createQuery(q);
        return Integer.parseInt(query.getSingleResult().toString());
    }
}
