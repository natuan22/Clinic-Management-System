/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.repository.impl;

import com.nat.pojo.Thuoc;
import com.nat.repository.ThuocRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

/**
 *
 * @author anhtuan
 */
@Repository
@Transactional
@PropertySource("classpath:messages.properties")
public class ThuocRepositoryImpl implements ThuocRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Autowired
    private Environment env;
    
    @Override
    public List<Thuoc> getThuocs(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Thuoc> q = b.createQuery(Thuoc.class);
        Root root = q.from(Thuoc.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("ten").as(String.class),
                        String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String danhMucThuocId = params.get("danhMucThuocId");
            if (danhMucThuocId != null) {
                Predicate p = b.equal(root.get("danhMucId"), Integer.parseInt(danhMucThuocId));
                predicates.add(p);
            }

            q.where(predicates.toArray(new Predicate[]{}));

        }

        q.orderBy(b.desc(root.get("id")), b.desc(root.get("ten")));

        Query query = session.createQuery(q);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }

        return query.getResultList();
    }

    @Override
    public boolean deleteThuoc(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try {
            Thuoc p = session.get(Thuoc.class, id);
            session.delete(p);
            
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean addThuoc(Thuoc t) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            t.setActive(true);
            t.setCreatedDate(new Date());
            
            session.save(t);
            
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Thuoc getThuocById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Thuoc.class, id);
    }

    @Override
    public boolean editThuoc(Thuoc t, int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try {
            Thuoc p = session.get(Thuoc.class, id);
            p.setTen(t.getTen());
            p.setSoLuong(t.getSoLuong());
            p.setDonGia(t.getDonGia());
            p.setDanhMucId(t.getDanhMucId());
            p.setDonViTinhId(t.getDonViTinhId());
            p.setGhiChu(t.getGhiChu());
            p.setCreatedDate(new Date());
            
            session.save(p);
            
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
