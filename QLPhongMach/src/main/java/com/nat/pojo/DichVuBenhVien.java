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
@Table(name = "dich_vu_benh_vien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DichVuBenhVien.findAll", query = "SELECT d FROM DichVuBenhVien d"),
    @NamedQuery(name = "DichVuBenhVien.findById", query = "SELECT d FROM DichVuBenhVien d WHERE d.id = :id"),
    @NamedQuery(name = "DichVuBenhVien.findByActive", query = "SELECT d FROM DichVuBenhVien d WHERE d.active = :active"),
    @NamedQuery(name = "DichVuBenhVien.findByCreatedDate", query = "SELECT d FROM DichVuBenhVien d WHERE d.createdDate = :createdDate"),
    @NamedQuery(name = "DichVuBenhVien.findByTen", query = "SELECT d FROM DichVuBenhVien d WHERE d.ten = :ten"),
    @NamedQuery(name = "DichVuBenhVien.findByGia", query = "SELECT d FROM DichVuBenhVien d WHERE d.gia = :gia")})
public class DichVuBenhVien implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "gia")
    private long gia;

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
    @Size(min = 1, max = 100)
    @Column(name = "ten")
    private String ten;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "dichVuBenhVienId")
    private Set<PhieuKhamBenh> phieuKhamBenhSet;

    public DichVuBenhVien() {
    }

    public DichVuBenhVien(Integer id) {
        this.id = id;
    }

    public DichVuBenhVien(Integer id, boolean active, String ten, Long gia) {
        this.id = id;
        this.active = active;
        this.ten = ten;
        this.gia = gia;
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


    @XmlTransient
    public Set<PhieuKhamBenh> getPhieuKhamBenhSet() {
        return phieuKhamBenhSet;
    }

    public void setPhieuKhamBenhSet(Set<PhieuKhamBenh> phieuKhamBenhSet) {
        this.phieuKhamBenhSet = phieuKhamBenhSet;
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
        if (!(object instanceof DichVuBenhVien)) {
            return false;
        }
        DichVuBenhVien other = (DichVuBenhVien) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nat.pojo.DichVuBenhVien[ id=" + id + " ]";
    }

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }
    
}
