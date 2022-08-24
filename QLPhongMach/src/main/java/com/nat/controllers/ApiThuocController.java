/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.controllers;

import com.nat.pojo.Thuoc;
import com.nat.service.ThuocService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author admin
 */
@RestController
@RequestMapping("/api")
public class ApiThuocController {
    @Autowired
    private ThuocService thuocService;
    
    @RequestMapping("/thuocs")
    public ResponseEntity<List<Thuoc>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.thuocService.getThuocs(params, 0), HttpStatus.OK);
    }
    
    @DeleteMapping("/thuocs/{thuocId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "thuocId") int id) {
        this.thuocService.deleteThuoc(id);
    }
}
