/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.pojo;

import java.io.Serializable;
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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author anhtuan
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id = :id"),
    @NamedQuery(name = "User.findByActive", query = "SELECT u FROM User u WHERE u.active = :active"),
    @NamedQuery(name = "User.findByUsername", query = "SELECT u FROM User u WHERE u.username = :username"),
    @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password"),
    @NamedQuery(name = "User.findByFirstName", query = "SELECT u FROM User u WHERE u.firstName = :firstName"),
    @NamedQuery(name = "User.findByLastName", query = "SELECT u FROM User u WHERE u.lastName = :lastName"),
    @NamedQuery(name = "User.findByGioiTinh", query = "SELECT u FROM User u WHERE u.gioiTinh = :gioiTinh"),
    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email"),
    @NamedQuery(name = "User.findByPhone", query = "SELECT u FROM User u WHERE u.phone = :phone"),
    @NamedQuery(name = "User.findByAvatar", query = "SELECT u FROM User u WHERE u.avatar = :avatar"),
    @NamedQuery(name = "User.findByUserRole", query = "SELECT u FROM User u WHERE u.userRole = :userRole"),
    @NamedQuery(name = "User.findByIsSuperuser", query = "SELECT u FROM User u WHERE u.isSuperuser = :isSuperuser")})
public class User implements Serializable {

    
    public static final String ADMIN = "ROLE_ADMIN";
    public static final String BACSI = "ROLE_BACSI";
    public static final String YTA = "ROLE_YTA";
    public static final String USER = "ROLE_USER";
    
    public static final String NAM = "NAM";
    public static final String NU = "NU";

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
    @Basic(optional = false)
    @NotNull(message = "{user.username.nullErr}")
    @Size(min = 1, max = 50, message = "{user.username.lenErr}")
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull(message = "{user.password.nullErr}")
    @Size(min = 1, max = 100, message = "{user.password.lenErr}")
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @NotNull(message = "{user.firstName.nullErr}")
    @Size(min = 1, max = 50, message = "{user.firstName.lenErr}")
    @Column(name = "first_name")
    private String firstName;
    @Basic(optional = false)
    @NotNull(message = "{user.lastName.nullErr}")
    @Size(min = 1, max = 50, message = "{user.lastName.lenErr}")
    @Column(name = "last_name")
    private String lastName;
    @Basic(optional = false)
    @NotNull(message = "{user.gioiTinh.nullErr}")
    @Size(min = 1, max = 50)
    @Column(name = "gioi_tinh")
    private String gioiTinh;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50, message = "{user.email.lenErr}")
    @Column(name = "email")
    private String email;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50, message = "{user.phone.lenErr}")
    @Column(name = "phone")
    private String phone;
    @Size(max = 200)
    @Column(name = "avatar")
    private String avatar;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "user_role")
    private String userRole;
    @Basic(optional = false)
    @NotNull
    @Column(name = "is_superuser")
    private boolean isSuperuser;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Set<LichKhamBenh> lichKhamBenhSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bacSiId")
    private Set<PhieuKhamBenh> phieuKhamBenhSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "benhNhanId")
    private Set<PhieuKhamBenh> phieuKhamBenhSet1;
    @Transient
    private String confirmPassword;
    @Transient
    private MultipartFile file;
    
    public User() {
    }

    public User(Integer id) {
        this.id = id;
    }

    public User(Integer id, boolean active, String username, String password, String firstName, String lastName, String gioiTinh, String email, String phone, String userRole, boolean isSuperuser) {
        this.id = id;
        this.active = active;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gioiTinh = gioiTinh;
        this.email = email;
        this.phone = phone;
        this.userRole = userRole;
        this.isSuperuser = isSuperuser;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public boolean getIsSuperuser() {
        return isSuperuser;
    }

    public void setIsSuperuser(boolean isSuperuser) {
        this.isSuperuser = isSuperuser;
    }

    @XmlTransient
    public Set<LichKhamBenh> getLichKhamBenhSet() {
        return lichKhamBenhSet;
    }

    public void setLichKhamBenhSet(Set<LichKhamBenh> lichKhamBenhSet) {
        this.lichKhamBenhSet = lichKhamBenhSet;
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
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nat.pojo.User[ id=" + id + " ]";
    }

    /**
     * @return the confirmPassword
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * @param confirmPassword the confirmPassword to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @XmlTransient
    public Set<PhieuKhamBenh> getPhieuKhamBenhSet() {
        return phieuKhamBenhSet;
    }

    public void setPhieuKhamBenhSet(Set<PhieuKhamBenh> phieuKhamBenhSet) {
        this.phieuKhamBenhSet = phieuKhamBenhSet;
    }

    @XmlTransient
    public Set<PhieuKhamBenh> getPhieuKhamBenhSet1() {
        return phieuKhamBenhSet1;
    }

    public void setPhieuKhamBenhSet1(Set<PhieuKhamBenh> phieuKhamBenhSet1) {
        this.phieuKhamBenhSet1 = phieuKhamBenhSet1;
    }
    
}
