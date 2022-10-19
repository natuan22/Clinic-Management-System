/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.controllers;

import com.nat.service.DichVuBenhVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author anhtuan
 */
@Controller
public class DichVuController {
    @Autowired
    private DichVuBenhVienService dichVuBenhVienService;
    
    @GetMapping("/dichVu/{dichuVuId}")
    public String dichvu(Model model, @PathVariable(value = "dichuVuId") int id) {
        model.addAttribute("dichvu", this.dichVuBenhVienService.getDichVuBenhVienById(id));

        return "dichvu";
    }
}
