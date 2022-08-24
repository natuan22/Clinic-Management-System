/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.controllers;

import com.nat.pojo.LichKhamBenh;
import com.nat.service.LichKhamBenhService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author anhtuan
 */
@RestController
@RequestMapping("/api")
public class ApiLichKhamBenhController {
    @Autowired
    private LichKhamBenhService lichKhamBenhService;
    
    @GetMapping("/lich-kham-benh-true")
    public ResponseEntity<List<LichKhamBenh>> listTrue() {
        return new ResponseEntity<>(this.lichKhamBenhService.getLichKhamBenhsByXacThuc(true), HttpStatus.OK);
    }
    
    @GetMapping("/lich-kham-benh-false")
    public ResponseEntity<List<LichKhamBenh>> listFalse() {
        return new ResponseEntity<>(this.lichKhamBenhService.getLichKhamBenhsByXacThuc(false), HttpStatus.OK);
    }
    
    @PostMapping("/lich-kham-benh-false/{lichKhamBenhId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void update(@PathVariable(value = "lichKhamBenhId") int id) {
        this.lichKhamBenhService.confirmLichKhamBenh(id);
    }
    
    @RequestMapping("/lich-su-kham/{userId}")
    public ResponseEntity<List<LichKhamBenh>> listLichKhamBenhOfUser(@PathVariable(value = "userId") int id) {
        return new ResponseEntity<>(this.lichKhamBenhService.getLichKhamBenhByUser(id), HttpStatus.OK);
    }
    
    @DeleteMapping("/lich-su-kham/{userId}/{lichKhamBenhId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "lichKhamBenhId") int id) {
        this.lichKhamBenhService.deleteLichKhamBenh(id);
    }
}
