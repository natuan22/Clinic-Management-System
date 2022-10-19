/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.service.impl;

import com.nat.pojo.Thuoc;
import com.nat.repository.ThuocRepository;
import com.nat.service.ThuocService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anhtuan
 */
@Service
public class ThuocServiceImpl implements ThuocService {
    @Autowired
    private ThuocRepository thuocRepository;
    
    @Override
    public List<Thuoc> getThuocs(Map<String, String> params, int page) {
        return this.thuocRepository.getThuocs(params, page);
    }

    @Override
    public boolean deleteThuoc(int id) {
        return this.thuocRepository.deleteThuoc(id);
    }

    @Override
    public boolean addThuoc(Thuoc t) {
        return this.thuocRepository.addThuoc(t);
    }

    @Override
    public Thuoc getThuocById(int id) {
        return this.thuocRepository.getThuocById(id);
    }

    @Override
    public boolean editThuoc(Thuoc t, int id) {
        return this.thuocRepository.editThuoc(t, id);
    }
}
