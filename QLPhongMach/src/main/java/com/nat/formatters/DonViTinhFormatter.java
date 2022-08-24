/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.formatters;

import com.nat.pojo.DonViTinh;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author anhtuan
 */
public class DonViTinhFormatter implements Formatter<DonViTinh> {

    @Override
    public String print(DonViTinh t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public DonViTinh parse(String dvtId, Locale locale) throws ParseException {
        DonViTinh dvt = new DonViTinh();
        dvt.setId(Integer.parseInt(dvtId));
        
        return dvt;
    }

}
