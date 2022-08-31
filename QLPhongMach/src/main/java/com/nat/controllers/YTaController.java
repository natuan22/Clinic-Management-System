/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.controllers;

import com.nat.service.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author anhtuan
 */
@Controller
@RequestMapping("/yta")
public class YTaController {
    @Autowired
    private HoaDonService hoaDonService;
    
    @GetMapping()
    public String pageYTa() {
        
        return "pageYTa";
    }
    
    @GetMapping("/thanh-toan")
    public String thanhToan(Model model) {
        model.addAttribute("hoadons", this.hoaDonService.getHoaDons());
        return "thanhToanHoaDon";
    }
}
