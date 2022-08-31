/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nat.repository;

import java.util.List;

/**
 *
 * @author anhtuan
 */
public interface StatisticRepository {
    List<Object[]> thuocStats(int quarter, int y);
    List<Object[]> revenueStats(int year);
    List<Object[]> countBenhNhan(int year);
}
