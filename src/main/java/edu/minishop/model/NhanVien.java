package edu.minishop.model;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "NhanVien")
public class NhanVien {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String fullname;
    private int age;
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "employeeId")
    Set<SanPham> sanPhams;

    public NhanVien(Set<SanPham> sanPhams) {
        this.sanPhams = sanPhams;
    }

    public Set<SanPham> getSanPhams() {
        return sanPhams;
    }

    public void setSanPhams(Set<SanPham> sanPhams) {
        this.sanPhams = sanPhams;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullname;
    }

    public void setFullName(String fullName) {
        this.fullname = fullName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public NhanVien(String fullname, int age) {
        this.fullname = fullname;
        this.age = age;
    }

    public NhanVien() {
    }

    @Override
    public String toString() {
        return id + " - " + fullname + " - " + age;
    }
}
