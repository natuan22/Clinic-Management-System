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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author anhtuan
 */
@Entity
@Table(name = "toa_thuoc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ToaThuoc.findAll", query = "SELECT t FROM ToaThuoc t"),
    @NamedQuery(name = "ToaThuoc.findById", query = "SELECT t FROM ToaThuoc t WHERE t.id = :id"),
    @NamedQuery(name = "ToaThuoc.findByActive", query = "SELECT t FROM ToaThuoc t WHERE t.active = :active"),
    @NamedQuery(name = "ToaThuoc.findByCreatedDate", query = "SELECT t FROM ToaThuoc t WHERE t.createdDate = :createdDate"),
    @NamedQuery(name = "ToaThuoc.findByTongTien", query = "SELECT t FROM ToaThuoc t WHERE t.tongTien = :tongTien")})
public class ToaThuoc implements Serializable {
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "toaThuocId")
    private Set<PhieuKhamBenh> phieuKhamBenhSet;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "active")
    private Boolean active;
    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "tong_tien")
    private Long tongTien;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "toaThuocId")
    private Set<ToaThuocDetail> toaThuocDetailSet;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "toaThuocId")
    private PhieuKhamBenh phieuKhamBenh;

    public ToaThuoc() {
    }

    public ToaThuoc(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Long getTongTien() {
        return tongTien;
    }

    public void setTongTien(Long tongTien) {
        this.tongTien = tongTien;
    }

    @XmlTransient
    public Set<ToaThuocDetail> getToaThuocDetailSet() {
        return toaThuocDetailSet;
    }

    public void setToaThuocDetailSet(Set<ToaThuocDetail> toaThuocDetailSet) {
        this.toaThuocDetailSet = toaThuocDetailSet;
    }

    public PhieuKhamBenh getPhieuKhamBenh() {
        return phieuKhamBenh;
    }

    public void setPhieuKhamBenh(PhieuKhamBenh phieuKhamBenh) {
        this.phieuKhamBenh = phieuKhamBenh;
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
        if (!(object instanceof ToaThuoc)) {
            return false;
        }
        ToaThuoc other = (ToaThuoc) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nat.pojo.ToaThuoc[ id=" + id + " ]";
    }

    @XmlTransient
    public Set<PhieuKhamBenh> getPhieuKhamBenhSet() {
        return phieuKhamBenhSet;
    }

    public void setPhieuKhamBenhSet(Set<PhieuKhamBenh> phieuKhamBenhSet) {
        this.phieuKhamBenhSet = phieuKhamBenhSet;
    }
    
}
