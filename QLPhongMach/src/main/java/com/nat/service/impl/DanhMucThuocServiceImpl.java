/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.service.impl;

import com.nat.pojo.DanhMucThuoc;
import com.nat.repository.DanhMucThuocRepository;
import com.nat.service.DanhMucThuocService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anhtuan
 */
@Service
public class DanhMucThuocServiceImpl implements DanhMucThuocService {
    @Autowired
    private DanhMucThuocRepository danhMucThuocRepository;

    @Override
    public List<DanhMucThuoc> getDanhMucThuocs() {
        return this.danhMucThuocRepository.getDanhMucThuocs();
    }
    
}
