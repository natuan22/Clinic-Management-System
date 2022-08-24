/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nat.service;

import java.util.List;

/**
 *
 * @author anhtuan
 */
public interface StatisticService {
    List<Object[]> thuocStats(int quarter, int y);
    List<Object[]> revenueStats(int year);
}
