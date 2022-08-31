/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.service.impl;

import com.nat.repository.StatisticRepository;
import com.nat.service.StatisticService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author anhtuan
 */
@Service
public class StatisticServiceImpl implements StatisticService {

    @Autowired
    private StatisticRepository statisticRepository;

    @Override
    public List<Object[]> thuocStats(int quarter, int y) {
        return this.statisticRepository.thuocStats(quarter, y);
    }

    @Override
    public List<Object[]> revenueStats(int year) {
        return this.statisticRepository.revenueStats(year);
    }

    @Override
    public List<Object[]> countBenhNhan(int year) {
        return this.statisticRepository.countBenhNhan(year);
    }

}
