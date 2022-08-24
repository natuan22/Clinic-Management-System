/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.controllers;

import com.nat.pojo.Cart;
import com.nat.pojo.PhieuKhamBenh;
import com.nat.service.PhieuKhamBenhService;
import com.nat.utils.Utils;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author anhtuan
 */
@RestController
@RequestMapping("/api")
public class ApiCartController {
    @Autowired
    private PhieuKhamBenhService phieuKhamBenhService;
    
    @PostMapping("/cart")
    public int addToCart(@RequestBody Cart params, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart == null)
            cart = new HashMap<>();
        
        int thuocId = params.getThuocId();
        if (cart.containsKey(thuocId) == true) {
            Cart c = cart.get(thuocId);
            c.setSoLuong(c.getSoLuong() + 1);
        } else {
            cart.put(thuocId, params);
        }
        
        session.setAttribute("cart", cart);
        
        return Utils.countCart(cart);
    }
    
    @PutMapping("/cart")
    public ResponseEntity<Map<String, String>> updateCartItem(@RequestBody Cart params, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart == null)
            cart = new HashMap<>();
        
        int thuocId = params.getThuocId();
        if (cart.containsKey(thuocId) == true) {
            Cart c = cart.get(thuocId);
            c.setSoLuong(params.getSoLuong());
        }
        
        session.setAttribute("cart", cart);
        
        return new ResponseEntity<>(Utils.cartStats(cart), HttpStatus.OK);
    }
    
    @DeleteMapping("/cart/{thuocId}")
    public ResponseEntity<Map<String, String>> deleteCartItem(@PathVariable(value = "thuocId") int id, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart != null && cart.containsKey(id)) {
            cart.remove(id);
            
            session.setAttribute("cart", cart);
        }
        
        return new ResponseEntity<>(Utils.cartStats(cart), HttpStatus.OK);
    }
}
