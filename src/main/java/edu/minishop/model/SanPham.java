package edu.minishop.model;

import javax.persistence.*;

@Entity(name = "SanPham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "employeeId")
    NhanVien nhanVien;

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
