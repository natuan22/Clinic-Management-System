/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.service.impl;

import com.nat.pojo.ToaThuocDetail;
import com.nat.repository.ToaThuocDetailRepository;
import com.nat.service.ToaThuocDetailService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anhtuan
 */
@Service
public class ToaThuocDetailServiceImpl implements ToaThuocDetailService {
    @Autowired
    private ToaThuocDetailRepository toaThuocDetailRepository;
    
    @Override
    public List<ToaThuocDetail> getToaThuocDetails(int id) {
        return this.toaThuocDetailRepository.getToaThuocDetails(id);
    }
    
}
