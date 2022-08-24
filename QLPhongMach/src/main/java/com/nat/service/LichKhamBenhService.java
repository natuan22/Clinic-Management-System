/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nat.service;

import com.nat.pojo.LichKhamBenh;
import com.nat.pojo.User;
import java.util.List;

/**
 *
 * @author anhtuan
 */
public interface LichKhamBenhService {
    List<LichKhamBenh> getLichKhamBenhsByXacThuc(boolean xacThuc);
    boolean addLichKhamBenh(LichKhamBenh lichKhamBenh);
    boolean confirmLichKhamBenh(int id);
    LichKhamBenh getLichKhamBenhById(int id);
    List<LichKhamBenh> getLichKhamBenhByUser(int id);
    boolean deleteLichKhamBenh(int id);
}
