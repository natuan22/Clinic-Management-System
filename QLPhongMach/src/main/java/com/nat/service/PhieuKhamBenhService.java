/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nat.service;

import com.nat.pojo.Cart;
import com.nat.pojo.PhieuKhamBenh;
import com.nat.pojo.ToaThuoc;
import java.util.List;
import java.util.Map;

/**
 *
 * @author anhtuan
 */
public interface PhieuKhamBenhService {
    boolean addPhieuKhamBenh(Map<Integer, Cart> cart, PhieuKhamBenh phieuKhamBenh);
    List<PhieuKhamBenh> getPhieuKhamBenhByUserId(int id);
}