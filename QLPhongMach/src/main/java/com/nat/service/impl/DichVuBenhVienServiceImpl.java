/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.service.impl;

import com.nat.pojo.DichVuBenhVien;
import com.nat.repository.DichVuBenhVienRepository;
import com.nat.service.DichVuBenhVienService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anhtuan
 */
@Service
public class DichVuBenhVienServiceImpl implements DichVuBenhVienService {
    @Autowired
    private DichVuBenhVienRepository dichVuBenhVienRepository;

    @Override
    public List<DichVuBenhVien> getDichVuBenhViens() {
        return this.dichVuBenhVienRepository.getDichVuBenhViens();
    }
}
