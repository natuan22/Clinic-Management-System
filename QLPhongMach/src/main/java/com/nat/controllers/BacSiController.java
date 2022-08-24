/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.controllers;

import com.nat.pojo.Cart;
import com.nat.pojo.PhieuKhamBenh;
import com.nat.pojo.User;
import com.nat.service.LichKhamBenhService;
import com.nat.service.PhieuKhamBenhService;
import com.nat.service.ThuocService;
import com.nat.service.ToaThuocDetailService;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author anhtuan
 */
@Controller
@ControllerAdvice
@RequestMapping("/bacsi")
public class BacSiController {
    @Autowired
    private LichKhamBenhService lichKhamBenhService;
    
    @Autowired
    private PhieuKhamBenhService phieuKhamBenhService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private ThuocService thuocService;
    
    @Autowired
    private ToaThuocDetailService toaThuocDetailService;
    
    @GetMapping()
    public String index(Model model, @RequestParam Map<String, String> params){
        model.addAttribute("lichKhamBenhs", this.lichKhamBenhService.getLichKhamBenhsByXacThuc(true));
        return "pageBacSi";
    }
    
    @GetMapping("/kham-benh/{lichKhamBenhId}")
    public String khamBenhView(Model model, @PathVariable(value = "lichKhamBenhId") int id, HttpSession session) {
        
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart != null)
            model.addAttribute("carts", cart.values());
        else
            model.addAttribute("carts", null);
        
        model.addAttribute("cartStats", Utils.cartStats(cart));
        model.addAttribute("lichKhamBenh", this.lichKhamBenhService.getLichKhamBenhById(id));
        model.addAttribute("phieuKhamBenh", new PhieuKhamBenh());
        
        return "khamBenh";
    }
    
    @PostMapping("/kham-benh/{lichKhamBenhId}")
    public String khamBenh(Model model, @PathVariable(value = "lichKhamBenhId") int id,
            @ModelAttribute(value = "phieuKhamBenh") PhieuKhamBenh phieuKhamBenh, 
            HttpSession session, Principal principal, BindingResult rs) {
        List<User> users = this.userService.getUsers(principal.getName());
        User user = users.get(0);
        
        phieuKhamBenh.setBacSiId(user);
        phieuKhamBenh.setBenhNhanId(this.lichKhamBenhService.getLichKhamBenhById(id).getUserId());
        
        if (rs.hasErrors()) {
            return "khamBenh";
        }
        
        if (this.phieuKhamBenhService.addPhieuKhamBenh((Map<Integer, Cart>) session.getAttribute("cart"), phieuKhamBenh) == true)
            if(this.lichKhamBenhService.deleteLichKhamBenh(id) == true) {
                session.removeAttribute("cart");
                return "redirect:/bacsi";
            }
        
        return "khamBenh";
    }
    
    @RequestMapping("/kham-benh/{lichKhamBenhId}/toa-thuoc")
    public String toaThuoc(Model model, @PathVariable(value = "lichKhamBenhId") int id, @RequestParam Map<String, String> params) {
        
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("thuocs", this.thuocService.getThuocs(params, page));
        model.addAttribute("lichKhamBenhId", id);
        
        return "toathuoc";
    }
    
    @RequestMapping("/lich-su-kham-benh/{userId}")
    public String lichSuKhamBenh(Model model, @PathVariable(value = "userId") int id) {
        model.addAttribute("userId", id);
        model.addAttribute("phieuKhamBenh", this.phieuKhamBenhService.getPhieuKhamBenhByUserId(id));
        return "lichSuKhamBenh";
    }
    
    @RequestMapping("/lich-su-kham-benh/{userId}/{toaThuocId}")
    public String lichSuKhamBenhToaThuocDetail(Model model,@PathVariable(value = "toaThuocId") int toaThuocId) {
        
        model.addAttribute("toathuoc", this.toaThuocDetailService.getToaThuocDetails(toaThuocId));
        
        return "lichSuKhamBenhToaThuocDetail";
    }
}
