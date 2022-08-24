/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.controllers;

import com.nat.pojo.Cart;
import com.nat.pojo.LichKhamBenh;
import com.nat.pojo.User;
import com.nat.service.DanhMucThuocService;
import com.nat.service.DichVuBenhVienService;
import com.nat.service.DonViTinhService;
import com.nat.service.LichKhamBenhService;
import com.nat.service.UserService;
import com.nat.utils.Utils;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author anhtuan
 */
@Controller
@ControllerAdvice
public class IndexController {

    @Autowired
    private DanhMucThuocService danhMucThuocService;

    @Autowired
    private DichVuBenhVienService dichVuBenhVienService;

    @Autowired
    private DonViTinhService donViTinhService;

    @Autowired
    private LichKhamBenhService lichKhamBenhService;

    @Autowired
    private UserService userService;

    @ModelAttribute
    public void commonAttr(Model model, HttpSession session) {
        model.addAttribute("dichVuBenhViens", this.dichVuBenhVienService.getDichVuBenhViens());
        model.addAttribute("danhMucThuocs", this.danhMucThuocService.getDanhMucThuocs());
        model.addAttribute("donViTinhs", this.donViTinhService.getDonViTinhs());
        model.addAttribute("cartCounter", Utils.countCart((Map<Integer, Cart>) session.getAttribute("cart")));
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {

        return "index";
    }

    @GetMapping("/dang-ky-kham")
    public String dangKyKhamBenhView(Model model) {
        model.addAttribute("lichKhamBenh", new LichKhamBenh());
        return "dangkykham";
    }

    @PostMapping("/dang-ky-kham")
    public String dangKyKhamBenh(Model model, @ModelAttribute(value = "lichKhamBenh") LichKhamBenh lichKhamBenh,
            BindingResult rs, Principal principal) {
        List<User> users = this.userService.getUsers(principal.getName());
        User user = users.get(0);
        lichKhamBenh.setUserId(user);

        if (rs.hasErrors()) {
            return "dangkykham";
        }

        if (this.lichKhamBenhService.addLichKhamBenh(lichKhamBenh) == true) {
            return "redirect:/";
        }

        return "dangkykham";
    }

    @GetMapping("/lich-kham")
    public String lichSuKham(Model model, Principal principal) {
        List<User> users = this.userService.getUsers(principal.getName());
        User user = users.get(0);
        model.addAttribute("userId", user.getId());
        
        return "lichkham";
    }
}
