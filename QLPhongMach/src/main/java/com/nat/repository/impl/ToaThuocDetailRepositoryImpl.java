/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.repository.impl;

import com.nat.pojo.ToaThuocDetail;
import com.nat.repository.ToaThuocDetailRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

/**
 *
 * @author anhtuan
 */
@Repository
@Transactional
public class ToaThuocDetailRepositoryImpl implements ToaThuocDetailRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<ToaThuocDetail> getToaThuocDetails(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<ToaThuocDetail> q = b.createQuery(ToaThuocDetail.class);
        Root root = q.from(ToaThuocDetail.class);
        q.select(root);
        
        q = q.where(b.equal(root.get("toaThuocId"), id));
        
        Query query = session.createQuery(q);
        return query.getResultList();
    }

}
