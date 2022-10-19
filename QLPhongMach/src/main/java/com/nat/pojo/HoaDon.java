/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.pojo;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author anhtuan
 */
@Entity
@Table(name = "hoa_don")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HoaDon.findAll", query = "SELECT h FROM HoaDon h"),
    @NamedQuery(name = "HoaDon.findById", query = "SELECT h FROM HoaDon h WHERE h.id = :id"),
    @NamedQuery(name = "HoaDon.findByNgayTao", query = "SELECT h FROM HoaDon h WHERE h.ngayTao = :ngayTao"),
    @NamedQuery(name = "HoaDon.findByThanhTien", query = "SELECT h FROM HoaDon h WHERE h.thanhTien = :thanhTien"),
    @NamedQuery(name = "HoaDon.findByTinhTrang", query = "SELECT h FROM HoaDon h WHERE h.tinhTrang = :tinhTrang")})
public class HoaDon implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ngay_tao")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;
    @Basic(optional = false)
    @NotNull
    @Column(name = "thanh_tien")
    private long thanhTien;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tinh_trang")
    private boolean tinhTrang;
    @JoinColumn(name = "phieu_kham_benh_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PhieuKhamBenh phieuKhamBenhId;

    public HoaDon() {
    }

    public HoaDon(Integer id) {
        this.id = id;
    }

    public HoaDon(Integer id, Date ngayTao, long thanhTien, boolean tinhTrang) {
        this.id = id;
        this.ngayTao = ngayTao;
        this.thanhTien = thanhTien;
        this.tinhTrang = tinhTrang;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public long getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(long thanhTien) {
        this.thanhTien = thanhTien;
    }

    public boolean getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(boolean tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public PhieuKhamBenh getPhieuKhamBenhId() {
        return phieuKhamBenhId;
    }

    public void setPhieuKhamBenhId(PhieuKhamBenh phieuKhamBenhId) {
        this.phieuKhamBenhId = phieuKhamBenhId;
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
        if (!(object instanceof HoaDon)) {
            return false;
        }
        HoaDon other = (HoaDon) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nat.pojo.HoaDon[ id=" + id + " ]";
    }
    
}
