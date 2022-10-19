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
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
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
@PropertySource("classpath:messages.properties")
public class IndexController {

    @Autowired
    private Environment env;
    
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
        String errMsg = "";
        String successMsg = "";
        List<User> users = this.userService.getUsers(principal.getName());
        User user = users.get(0);
        lichKhamBenh.setUserId(user);

        if (rs.hasErrors()) {
            return "dangkykham";
        }

        if (this.lichKhamBenhService.countLichKhamBenh(lichKhamBenh.getNgayKham()) < Integer.parseInt(env.getProperty("lichKhamBenh.soLuong"))) { //Nhan toi da 40 lich kham 1 ngay
            if (this.lichKhamBenhService.addLichKhamBenh(lichKhamBenh) == true) {
                successMsg = "Đã đặt lịch khám thành công. Xin hãy đợi xác nhận từ y tá qua email";
                model.addAttribute("successMsg", successMsg);
                return "forward:/";
            } else {
                errMsg = "Đã có lỗi xảy ra!";
            }
        } else {
            errMsg = "Số lượng lịch khám bệnh trong ngày đã đủ, xin chọn ngày khác";
        }
        
        model.addAttribute("errMsg", errMsg);
        
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
