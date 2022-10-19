/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author anhtuan
 */
@Entity
@Table(name = "lich_kham_benh")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LichKhamBenh.findAll", query = "SELECT l FROM LichKhamBenh l"),
    @NamedQuery(name = "LichKhamBenh.findById", query = "SELECT l FROM LichKhamBenh l WHERE l.id = :id"),
    @NamedQuery(name = "LichKhamBenh.findByCreatedDate", query = "SELECT l FROM LichKhamBenh l WHERE l.createdDate = :createdDate"),
    @NamedQuery(name = "LichKhamBenh.findByXacThuc", query = "SELECT l FROM LichKhamBenh l WHERE l.xacThuc = :xacThuc"),
    @NamedQuery(name = "LichKhamBenh.findByNgayKham", query = "SELECT l FROM LichKhamBenh l WHERE l.ngayKham = :ngayKham"),
    @NamedQuery(name = "LichKhamBenh.findByGioKham", query = "SELECT l FROM LichKhamBenh l WHERE l.gioKham = :gioKham"),
    @NamedQuery(name = "LichKhamBenh.findByTrieuChung", query = "SELECT l FROM LichKhamBenh l WHERE l.trieuChung = :trieuChung")})
public class LichKhamBenh implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "xac_thuc")
    private boolean xacThuc;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ngay_kham")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd MMM yyyy" , timezone = "VST")
    @Temporal(TemporalType.DATE)
    private Date ngayKham;
    @Basic(optional = false)
    @NotNull
    @Column(name = "gio_kham")
    @DateTimeFormat(pattern = "HH:mm")
    @Temporal(TemporalType.TIME)
    private Date gioKham;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "trieu_chung")
    private String trieuChung;
    @JsonIgnore
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User userId;

    public LichKhamBenh() {
    }

    public LichKhamBenh(Integer id) {
        this.id = id;
    }

    public LichKhamBenh(Integer id, boolean xacThuc, Date ngayKham, Date gioKham, String trieuChung) {
        this.id = id;
        this.xacThuc = xacThuc;
        this.ngayKham = ngayKham;
        this.gioKham = gioKham;
        this.trieuChung = trieuChung;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public boolean getXacThuc() {
        return xacThuc;
    }

    public void setXacThuc(boolean xacThuc) {
        this.xacThuc = xacThuc;
    }

    public Date getNgayKham() {
        return ngayKham;
    }

    public void setNgayKham(Date ngayKham) {
        this.ngayKham = ngayKham;
    }

    public Date getGioKham() {
        return gioKham;
    }

    public void setGioKham(Date gioKham) {
        this.gioKham = gioKham;
    }

    public String getTrieuChung() {
        return trieuChung;
    }

    public void setTrieuChung(String trieuChung) {
        this.trieuChung = trieuChung;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
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
        if (!(object instanceof LichKhamBenh)) {
            return false;
        }
        LichKhamBenh other = (LichKhamBenh) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nat.pojo.LichKhamBenh[ id=" + id + " ]";
    }
    
}
