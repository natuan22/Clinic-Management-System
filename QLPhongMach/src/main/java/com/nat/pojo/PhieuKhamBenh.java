/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author anhtuan
 */
@Entity
@Table(name = "phieu_kham_benh")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PhieuKhamBenh.findAll", query = "SELECT p FROM PhieuKhamBenh p"),
    @NamedQuery(name = "PhieuKhamBenh.findById", query = "SELECT p FROM PhieuKhamBenh p WHERE p.id = :id"),
    @NamedQuery(name = "PhieuKhamBenh.findByNgayKham", query = "SELECT p FROM PhieuKhamBenh p WHERE p.ngayKham = :ngayKham"),
    @NamedQuery(name = "PhieuKhamBenh.findByTrieuChung", query = "SELECT p FROM PhieuKhamBenh p WHERE p.trieuChung = :trieuChung"),
    @NamedQuery(name = "PhieuKhamBenh.findByKetLuan", query = "SELECT p FROM PhieuKhamBenh p WHERE p.ketLuan = :ketLuan")})
public class PhieuKhamBenh implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "phieuKhamBenhId")
    private Set<HoaDon> hoaDonSet;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ngay_kham")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayKham;
    @Size(max = 255)
    @Column(name = "trieu_chung")
    private String trieuChung;
    @Size(max = 255)
    @Column(name = "ket_luan")
    private String ketLuan;
    @JsonIgnore
    @JoinColumn(name = "dich_vu_benh_vien_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private DichVuBenhVien dichVuBenhVienId;
    @JoinColumn(name = "toa_thuoc_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private ToaThuoc toaThuocId;
    @JoinColumn(name = "bac_si_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User bacSiId;
    @JoinColumn(name = "benh_nhan_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User benhNhanId;

    public PhieuKhamBenh() {
    }

    public PhieuKhamBenh(Integer id) {
        this.id = id;
    }

    public PhieuKhamBenh(Integer id, Date ngayKham) {
        this.id = id;
        this.ngayKham = ngayKham;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getNgayKham() {
        return ngayKham;
    }

    public void setNgayKham(Date ngayKham) {
        this.ngayKham = ngayKham;
    }

    public String getTrieuChung() {
        return trieuChung;
    }

    public void setTrieuChung(String trieuChung) {
        this.trieuChung = trieuChung;
    }

    public String getKetLuan() {
        return ketLuan;
    }

    public void setKetLuan(String ketLuan) {
        this.ketLuan = ketLuan;
    }

    public DichVuBenhVien getDichVuBenhVienId() {
        return dichVuBenhVienId;
    }

    public void setDichVuBenhVienId(DichVuBenhVien dichVuBenhVienId) {
        this.dichVuBenhVienId = dichVuBenhVienId;
    }

    public ToaThuoc getToaThuocId() {
        return toaThuocId;
    }

    public void setToaThuocId(ToaThuoc toaThuocId) {
        this.toaThuocId = toaThuocId;
    }

    public User getBacSiId() {
        return bacSiId;
    }

    public void setBacSiId(User bacSiId) {
        this.bacSiId = bacSiId;
    }

    public User getBenhNhanId() {
        return benhNhanId;
    }

    public void setBenhNhanId(User benhNhanId) {
        this.benhNhanId = benhNhanId;
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
        if (!(object instanceof PhieuKhamBenh)) {
            return false;
        }
        PhieuKhamBenh other = (PhieuKhamBenh) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nat.pojo.PhieuKhamBenh[ id=" + id + " ]";
    }

    @XmlTransient
    public Set<HoaDon> getHoaDonSet() {
        return hoaDonSet;
    }

    public void setHoaDonSet(Set<HoaDon> hoaDonSet) {
        this.hoaDonSet = hoaDonSet;
    }
    
}
