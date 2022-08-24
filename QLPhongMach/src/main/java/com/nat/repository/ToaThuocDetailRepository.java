/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nat.repository;

import com.nat.pojo.ToaThuocDetail;
import java.util.List;

/**
 *
 * @author anhtuan
 */
public interface ToaThuocDetailRepository {
    List<ToaThuocDetail> getToaThuocDetails(int id);
}
