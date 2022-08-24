/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.service.impl;

import com.nat.pojo.LichKhamBenh;
import com.nat.repository.LichKhamBenhRepository;
import com.nat.service.LichKhamBenhService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anhtuan
 */
@Service
public class LichKhamBenhServiceImpl implements LichKhamBenhService {

    @Autowired
    private LichKhamBenhRepository lichKhamBenhRepository;

    @Override
    public List<LichKhamBenh> getLichKhamBenhsByXacThuc(boolean xacThuc) {
        return this.lichKhamBenhRepository.getLichKhamBenhsByXacThuc(xacThuc);
    }

    @Override
    public boolean addLichKhamBenh(LichKhamBenh lichKhamBenh) {
        return this.lichKhamBenhRepository.addLichKhamBenh(lichKhamBenh);

    }

    @Override
    public boolean confirmLichKhamBenh(int id) {
        return this.lichKhamBenhRepository.confirmLichKhamBenh(id);
    }

    @Override
    public LichKhamBenh getLichKhamBenhById(int id) {
        return this.lichKhamBenhRepository.getLichKhamBenhById(id);
    }

    @Override
    public List<LichKhamBenh> getLichKhamBenhByUser(int id) {
        return this.lichKhamBenhRepository.getLichKhamBenhByUser(id);
    }

    @Override
    public boolean deleteLichKhamBenh(int id) {
        return this.lichKhamBenhRepository.deleteLichKhamBenh(id);
    }
}
