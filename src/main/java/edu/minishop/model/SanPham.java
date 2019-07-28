package edu.minishop.model;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "SanPham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "HoaDon_SanPham",
            joinColumns = {@JoinColumn(name = "idSanPham", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "idHoaDon", referencedColumnName = "id")})
    Set<HoaDon> hoaDons;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "employeeId")
    NhanVien nhanVien;

    public Set<HoaDon> getHoaDons() {
        return hoaDons;
    }

    public void setHoaDons(Set<HoaDon> hoaDons) {
        this.hoaDons = hoaDons;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public NhanVien getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVien nhanVien) {
        this.nhanVien = nhanVien;
    }

    public SanPham() {
    }

    public SanPham(String name, NhanVien nhanVien) {
        this.name = name;
        this.nhanVien = nhanVien;
    }

    public SanPham(String name) {
        this.name = name;
    }


}
