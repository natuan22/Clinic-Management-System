/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.service.impl;

import com.nat.pojo.HoaDon;
import com.nat.repository.HoaDonRepository;
import com.nat.service.HoaDonService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anhtuan
 */
@Service
public class HoaDonServiceImpl implements HoaDonService {

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Override
    public List<HoaDon> getHoaDons() {
        return this.hoaDonRepository.getHoaDons();
    }

    @Override
    public boolean confirmHoaDon(int id) {
        return this.hoaDonRepository.confirmHoaDon(id);
    }

}
