package edu.minishop.model;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "PROMOTION")
public class Promotion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int promotion_id;
    private String name;
    private String startTime;
    private String endTime;
    private String description;
    private String form;
    private int discount;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "DETAILPROMOTION",
            joinColumns = {@JoinColumn(name = "idPromotion", referencedColumnName ="promotion_id")},
            inverseJoinColumns = {@JoinColumn(name = "idProduct", referencedColumnName = "product_id")})
    private Set<Product> products;

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getPromotion_id() {
        return promotion_id;
    }

    public void setPromotion_id(int promotion_id) {
        this.promotion_id = promotion_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getForm() {
        return form;
    }

    public void setForm(String form) {
        this.form = form;
    }

    public Promotion() {
    }
}
