/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nat.service;

import com.nat.pojo.HoaDon;
import java.util.List;

/**
 *
 * @author anhtuan
 */
public interface HoaDonService {
    List<HoaDon> getHoaDons();
    boolean confirmHoaDon(int id);
}
