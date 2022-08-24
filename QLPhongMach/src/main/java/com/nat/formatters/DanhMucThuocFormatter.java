/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.formatters;

import com.nat.pojo.DanhMucThuoc;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author admin
 */
public class DanhMucThuocFormatter implements Formatter<DanhMucThuoc> {

    @Override
    public String print(DanhMucThuoc t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public DanhMucThuoc parse(String danhMucThuocId, Locale locale) throws ParseException {
        DanhMucThuoc danhMucThuoc = new DanhMucThuoc();
        danhMucThuoc.setId(Integer.parseInt(danhMucThuocId));
        
        return danhMucThuoc;
    }
    
}
