/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.controllers;

import com.nat.pojo.Thuoc;
import com.nat.service.StatisticService;
import com.nat.service.ThuocService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author anhtuan
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ThuocService thuocService;

    @Autowired
    private StatisticService statisticService;

    @GetMapping()
    public String pageAdmin(Model model, @RequestParam(value = "quarter", required = false, defaultValue = "1") int quarter,
            @RequestParam(value = "year", defaultValue = "2022") int year) {
        model.addAttribute("thuocStats", this.statisticService.thuocStats(quarter, year));
        return "pageAdmin";
    }

    @GetMapping("/thuocs")
    public String list(Model model) {
        model.addAttribute("thuoc", new Thuoc());
        return "thuocs";
    }

    @PostMapping("/thuocs")
    public String add(@ModelAttribute(value = "thuoc") @Valid Thuoc t, BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.thuocService.addThuoc(t) == true) {
                return "redirect:/admin/thuocs";
            }
        }

        return "thuocs";
    }
    
    @GetMapping("/thuocs/{thuocId}")
    public String list(Model model, @PathVariable(value = "thuocId") int id) {
        model.addAttribute("thuocEdit", new Thuoc());
        model.addAttribute("thuoc", this.thuocService.getThuocById(id));
        
        return "thuocDetail";
    }
    
    @PostMapping("/thuocs/{thuocId}")
    public String edit(@PathVariable(value = "thuocId") int id, 
            @ModelAttribute(value = "thuocEdit") @Valid Thuoc thuoc, BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.thuocService.editThuoc(thuoc, id) == true) {
                return "redirect:/admin/thuocs";
            }
        }
        
        return "thuocDetail";
    }

    @GetMapping("/stats")
    public String stats(Model model, @RequestParam(value = "year", defaultValue = "2022") int year,
            @RequestParam(value = "year2", defaultValue = "2022") int year2) {

        model.addAttribute("countBenhNhan", this.statisticService.countBenhNhan(year));
        model.addAttribute("revenueStats", this.statisticService.revenueStats(year2));

        return "stats";
    }
}
