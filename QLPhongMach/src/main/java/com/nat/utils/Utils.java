/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.utils;

import com.nat.pojo.Cart;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author anhtuan
 */
public class Utils {

    public static int countCart(Map<Integer, Cart> cart) {
        int q = 0;

        if (cart != null) {
            for (Cart c : cart.values()) {
                q += c.getSoLuong();
            }
        }

        return q;
    }

    public static Map<String, String> cartStats(Map<Integer, Cart> cart) {
        Long s = 0l;
        int q = 0;

        if (cart != null) {
            for (Cart c : cart.values()) {
                q += c.getSoLuong();
                s += c.getSoLuong() * c.getGia();
            }
        }

        Map<String, String> kq = new HashMap<>();
        kq.put("counter", String.valueOf(q));
        kq.put("amount", String.valueOf(s));

        return kq;
    }
}
