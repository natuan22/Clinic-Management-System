/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nat.repository;

import com.nat.pojo.LichKhamBenh;
import java.util.List;

/**
 *
 * @author anhtuan
 */
public interface LichKhamBenhRepository {
    List<LichKhamBenh> getLichKhamBenhsByXacThuc(boolean xacThuc);
    boolean addLichKhamBenh(LichKhamBenh lichKhamBenh);
    boolean confirmLichKhamBenh(int id);
    LichKhamBenh getLichKhamBenhById(int id);
    List<LichKhamBenh> getLichKhamBenhByUser(int id);
    boolean deleteLichKhamBenh(int id);;
}
