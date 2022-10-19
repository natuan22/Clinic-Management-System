/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.controllers;

import com.nat.pojo.User;
import com.nat.service.UserService;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author anhtuan
 */
@Controller
public class UserController {

    @Autowired
    private UserService userDetailsService;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }
    
    @GetMapping("/tai-khoan/mat-khau")
    public String changePass(Model model, HttpSession session) {
        model.addAttribute("user", new User());
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        
        return "doiMatKhau";
    }
    
    @PostMapping("/tai-khoan/mat-khau")
    public String edit(Model model, @ModelAttribute(value = "user") User user, Principal principal) {
        String errMsg = "";
        String successMsg = "";
        List<User> users = this.userService.getUsers(principal.getName());
        User oldUser = users.get(0);
        if (this.passwordEncoder.matches(user.getOldPassword(), oldUser.getPassword())) {
            if (user.getPassword().equals(user.getConfirmPassword()))
                if (this.userService.changePass(user, oldUser.getId()) == true){
                    successMsg = "Đã đổi mật khẩu thành công";
                    model.addAttribute("successMsg", successMsg);
                    return "forward:/";
                } 
                else 
                    errMsg = "Đã có lỗi xảy ra xin thử lại sau!!";
            else
                errMsg = "Mật khẩu mới không khớp. Xin nhập lại!";
        } else {
            errMsg = "Mật khẩu hiện tại sai. Xin nhập lại!!";
        }

        model.addAttribute("errMsg", errMsg);
        
        return "doiMatKhau";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value = "user") User user) {
        String errMsg = "";
        if (user.getPassword().equals(user.getConfirmPassword())) {
            if (this.userDetailsService.addUser(user) == true) {
                return "redirect:/login";
            } else {
                errMsg = "Đã có lỗi xảy ra!";
            }
        } else {
            errMsg = "Mật khẩu không khớp!";
        }

        model.addAttribute("errMsg", errMsg);
        return "register";
    }
}
