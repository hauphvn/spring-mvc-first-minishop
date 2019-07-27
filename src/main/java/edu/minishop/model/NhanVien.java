package edu.minishop.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity(name="NhanVien")
public class NhanVien {

    @Id
    private int id;
    private String fullname;
    private int age;

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
        return id + " - "+ fullname + " - " + age;
    }
}
