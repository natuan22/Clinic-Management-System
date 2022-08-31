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
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author anhtuan
 */
@Entity
@Table(name = "thuoc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Thuoc.findAll", query = "SELECT t FROM Thuoc t"),
    @NamedQuery(name = "Thuoc.findById", query = "SELECT t FROM Thuoc t WHERE t.id = :id"),
    @NamedQuery(name = "Thuoc.findByActive", query = "SELECT t FROM Thuoc t WHERE t.active = :active"),
    @NamedQuery(name = "Thuoc.findByCreatedDate", query = "SELECT t FROM Thuoc t WHERE t.createdDate = :createdDate"),
    @NamedQuery(name = "Thuoc.findByTen", query = "SELECT t FROM Thuoc t WHERE t.ten = :ten"),
    @NamedQuery(name = "Thuoc.findBySoLuong", query = "SELECT t FROM Thuoc t WHERE t.soLuong = :soLuong"),
    @NamedQuery(name = "Thuoc.findByDonGia", query = "SELECT t FROM Thuoc t WHERE t.donGia = :donGia"),
    @NamedQuery(name = "Thuoc.findByGhiChu", query = "SELECT t FROM Thuoc t WHERE t.ghiChu = :ghiChu")})
public class Thuoc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "active")
    private boolean active;
    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45, message = "{thuoc.ten.lenErr}")
    @Column(name = "ten")
    private String ten;
    @Basic(optional = false)
    @NotNull
    @Column(name = "so_luong")
    @Min(value = 1, message = "{thuoc.soLuong.minErr}")
    private int soLuong;
    @Basic(optional = false)
    @NotNull(message = "{thuoc.dongia.nullErr}")
    @Column(name = "don_gia")
    @Min(value = 5000, message = "{thuoc.dongia.minErr}")
    private Long donGia;
    @Size(max = 255, message = "{thuoc.ghichu.maxErr}")
    @Column(name = "ghi_chu")
    private String ghiChu;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "thuocId")
    private Set<ToaThuocDetail> toaThuocDetailSet;
    @JsonIgnore
    @JoinColumn(name = "danh_muc_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @NotNull(message = "{thuoc.danhMucThuoc.nullErr}")
    private DanhMucThuoc danhMucId;
    @JsonIgnore
    @JoinColumn(name = "don_vi_tinh_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @NotNull(message = "{thuoc.donViTinh.nullErr}")
    private DonViTinh donViTinhId;

    public Thuoc() {
    }

    public Thuoc(Integer id) {
        this.id = id;
    }

    public Thuoc(Integer id, boolean active, String ten, int soLuong, Long donGia) {
        this.id = id;
        this.active = active;
        this.ten = ten;
        this.soLuong = soLuong;
        this.donGia = donGia;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public Long getDonGia() {
        return donGia;
    }

    public void setDonGia(Long donGia) {
        this.donGia = donGia;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    @XmlTransient
    public Set<ToaThuocDetail> getToaThuocDetailSet() {
        return toaThuocDetailSet;
    }

    public void setToaThuocDetailSet(Set<ToaThuocDetail> toaThuocDetailSet) {
        this.toaThuocDetailSet = toaThuocDetailSet;
    }

    public DanhMucThuoc getDanhMucId() {
        return danhMucId;
    }

    public void setDanhMucId(DanhMucThuoc danhMucId) {
        this.danhMucId = danhMucId;
    }

    public DonViTinh getDonViTinhId() {
        return donViTinhId;
    }

    public void setDonViTinhId(DonViTinh donViTinhId) {
        this.donViTinhId = donViTinhId;
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
        if (!(object instanceof Thuoc)) {
            return false;
        }
        Thuoc other = (Thuoc) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nat.pojo.Thuoc[ id=" + id + " ]";
    }
    
}
