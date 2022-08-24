/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.formatters;

import com.nat.pojo.DichVuBenhVien;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author anhtuan
 */
public class DichVuBenhVienFormatter implements Formatter<DichVuBenhVien> {

    @Override
    public String print(DichVuBenhVien t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public DichVuBenhVien parse(String dichVuBenhVienId, Locale locale) throws ParseException {
        DichVuBenhVien dichVuBenhVien = new DichVuBenhVien();
        dichVuBenhVien.setId(Integer.parseInt(dichVuBenhVienId));
        
        return dichVuBenhVien;
    }

}