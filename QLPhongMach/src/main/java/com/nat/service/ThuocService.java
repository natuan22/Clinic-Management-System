/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nat.service;

import com.nat.pojo.Thuoc;
import java.util.List;
import java.util.Map;

/**
 *
 * @author anhtuan
 */
public interface ThuocService {
    List<Thuoc> getThuocs(Map<String, String> params, int page);
    boolean deleteThuoc(int id);
    boolean addThuoc(Thuoc t);
}
