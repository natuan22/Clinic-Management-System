/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.nat.repository;

import com.nat.pojo.User;
import java.util.List;

/**
 *
 * @author anhtuan
 */
public interface UserRepository {
    boolean addUser(User user);
    List<User> getUsers(String username);
    boolean changePass(User user, int id);
}
