/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.service.impl;

import com.nat.pojo.Cart;
import com.nat.pojo.PhieuKhamBenh;
import com.nat.repository.PhieuKhamBenhRepository;
import com.nat.service.PhieuKhamBenhService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anhtuan
 */
@Service
public class PhieuKhamBenhServiceImpl implements PhieuKhamBenhService {

    @Autowired
    private PhieuKhamBenhRepository phieuKhamBenhRepository;

    @Override
    public boolean addPhieuKhamBenh(Map<Integer, Cart> cart, PhieuKhamBenh phieuKhamBenh) {
        if (cart != null)
            return this.phieuKhamBenhRepository.addPhieuKhamBenh(cart, phieuKhamBenh);
        
        return false;
    }

    @Override
    public List<PhieuKhamBenh> getPhieuKhamBenhByUserId(int id) {
        return this.phieuKhamBenhRepository.getPhieuKhamBenhByUserId(id);
    }
}
