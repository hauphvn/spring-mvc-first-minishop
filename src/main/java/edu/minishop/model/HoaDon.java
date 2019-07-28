package edu.minishop.model;

import javax.persistence.*;
import java.util.Set;

@Entity
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "HoaDon_SanPham",
    joinColumns = {@JoinColumn(name = "idHoaDon", referencedColumnName = "id")},
    inverseJoinColumns = {@JoinColumn(name = "idSanPham", referencedColumnName = "id")})
    Set<SanPham> sanPhams;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public HoaDon() {
    }

    public HoaDon(String name) {
        this.name = name;
    }


}
