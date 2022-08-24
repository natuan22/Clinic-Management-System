/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.repository.impl;

import com.nat.pojo.DichVuBenhVien;
import com.nat.repository.DichVuBenhVienRepository;
import java.util.List;
import javax.persistence.Query;
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
public class DichVuBenhVienRepositoryImpl implements DichVuBenhVienRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<DichVuBenhVien> getDichVuBenhViens() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From DichVuBenhVien");
        
        return q.getResultList();
    }
    
}
