/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.pojo;

/**
 *
 * @author anhtuan
 */
public class Cart {
    private int thuocId;
    private String thuocTen;
    private Long gia;
    private int soLuong;

    /**
     * @return the thuocId
     */
    public int getThuocId() {
        return thuocId;
    }

    /**
     * @param thuocId the thuocId to set
     */
    public void setThuocId(int thuocId) {
        this.thuocId = thuocId;
    }

    /**
     * @return the thuocTen
     */
    public String getThuocTen() {
        return thuocTen;
    }

    /**
     * @param thuocTen the thuocTen to set
     */
    public void setThuocTen(String thuocTen) {
        this.thuocTen = thuocTen;
    }

    /**
     * @return the gia
     */
    public Long getGia() {
        return gia;
    }

    /**
     * @param gia the gia to set
     */
    public void setGia(Long gia) {
        this.gia = gia;
    }

    /**
     * @return the soLuong
     */
    public int getSoLuong() {
        return soLuong;
    }

    /**
     * @param soLuong the soLuong to set
     */
    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
}
