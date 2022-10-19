/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author anhtuan
 */
@Entity
@Table(name = "toa_thuoc_detail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ToaThuocDetail.findAll", query = "SELECT t FROM ToaThuocDetail t"),
    @NamedQuery(name = "ToaThuocDetail.findById", query = "SELECT t FROM ToaThuocDetail t WHERE t.id = :id"),
    @NamedQuery(name = "ToaThuocDetail.findBySoLuong", query = "SELECT t FROM ToaThuocDetail t WHERE t.soLuong = :soLuong"),
    @NamedQuery(name = "ToaThuocDetail.findByDonGia", query = "SELECT t FROM ToaThuocDetail t WHERE t.donGia = :donGia")})
public class ToaThuocDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @NotNull
    @Column(name = "so_luong")
    private Integer soLuong;
    @NotNull
    @Column(name = "don_gia")
    private Long donGia;
    @JoinColumn(name = "thuoc_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Thuoc thuocId;
    @JoinColumn(name = "toa_thuoc_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private ToaThuoc toaThuocId;

    public ToaThuocDetail() {
    }

    public ToaThuocDetail(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public Long getDonGia() {
        return donGia;
    }

    public void setDonGia(Long donGia) {
        this.donGia = donGia;
    }

    public Thuoc getThuocId() {
        return thuocId;
    }

    public void setThuocId(Thuoc thuocId) {
        this.thuocId = thuocId;
    }

    public ToaThuoc getToaThuocId() {
        return toaThuocId;
    }

    public void setToaThuocId(ToaThuoc toaThuocId) {
        this.toaThuocId = toaThuocId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ToaThuocDetail)) {
            return false;
        }
        ToaThuocDetail other = (ToaThuocDetail) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nat.pojo.ToaThuocDetail[ id=" + id + " ]";
    }
    
}
