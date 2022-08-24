/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.service.impl;

import com.nat.pojo.DonViTinh;
import com.nat.repository.DonViTinhRepository;
import com.nat.service.DonViTinhService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anhtuan
 */
@Service
public class DonViTinhServiceImpl implements DonViTinhService {
    @Autowired
    private DonViTinhRepository donViTinhRepository;
    
    @Override
    public List<DonViTinh> getDonViTinhs() {
        return this.donViTinhRepository.getDonViTinhs();
    }
    
}
