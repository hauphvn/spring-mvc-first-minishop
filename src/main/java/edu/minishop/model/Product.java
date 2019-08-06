package edu.minishop.model;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "PRODUCT")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int product_id;
    private String name;
    private String price;
    private String description;
    private String image;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "idCategory")
    private Category category;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "idProduct")
    private Set<DetailProduct> detailProducts;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "DETAILPROMOTION",
            joinColumns = {@JoinColumn(name = "idProduct", referencedColumnName = "product_id")},
            inverseJoinColumns = {@JoinColumn(name = "idPromotion", referencedColumnName = "promotion_id")})
    private Set<Promotion> promotions;

    public Set<DetailProduct> getDetailProducts() {
        return detailProducts;
    }

    public void setDetailProducts(Set<DetailProduct> detailProducts) {
        this.detailProducts = detailProducts;
    }

    public Set<Promotion> getPromotions() {
        return promotions;
    }

    public void setPromotions(Set<Promotion> promotions) {
        this.promotions = promotions;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Product() {
    }
}
