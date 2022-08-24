/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.repository.impl;

import com.nat.pojo.DonViTinh;
import com.nat.repository.DonViTinhRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
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
public class DonViTinhRepositoryImpl implements DonViTinhRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<DonViTinh> getDonViTinhs() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From DonViTinh");
        
        return q.getResultList();
    }
    
}
