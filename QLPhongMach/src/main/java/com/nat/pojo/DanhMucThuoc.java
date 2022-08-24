/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.pojo;

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
@Table(name = "danh_muc_thuoc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DanhMucThuoc.findAll", query = "SELECT d FROM DanhMucThuoc d"),
    @NamedQuery(name = "DanhMucThuoc.findById", query = "SELECT d FROM DanhMucThuoc d WHERE d.id = :id"),
    @NamedQuery(name = "DanhMucThuoc.findByActive", query = "SELECT d FROM DanhMucThuoc d WHERE d.active = :active"),
    @NamedQuery(name = "DanhMucThuoc.findByCreatedDate", query = "SELECT d FROM DanhMucThuoc d WHERE d.createdDate = :createdDate"),
    @NamedQuery(name = "DanhMucThuoc.findByTen", query = "SELECT d FROM DanhMucThuoc d WHERE d.ten = :ten")})
public class DanhMucThuoc implements Serializable {

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
    @Size(min = 1, max = 45)
    @Column(name = "ten")
    private String ten;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "danhMucId")
    private Set<Thuoc> thuocSet;

    public DanhMucThuoc() {
    }

    public DanhMucThuoc(Integer id) {
        this.id = id;
    }

    public DanhMucThuoc(Integer id, boolean active, String ten) {
        this.id = id;
        this.active = active;
        this.ten = ten;
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
    public Set<Thuoc> getThuocSet() {
        return thuocSet;
    }

    public void setThuocSet(Set<Thuoc> thuocSet) {
        this.thuocSet = thuocSet;
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
        if (!(object instanceof DanhMucThuoc)) {
            return false;
        }
        DanhMucThuoc other = (DanhMucThuoc) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nat.pojo.DanhMucThuoc[ id=" + id + " ]";
    }
    
}
