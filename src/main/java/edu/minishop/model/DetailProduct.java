package edu.minishop.model;

import javax.persistence.*;

@Entity(name = "DETAILPRODUCT")
public class DetailProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int detail_product_id;
    private int amount;
    private String dayOfEntry;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Product product;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "size_id")
    private Size size;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "color_id")
    private Color color;

    public int getDetail_product_id() {
        return detail_product_id;
    }

    public void setDetail_product_id(int detail_product_id) {
        this.detail_product_id = detail_product_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getDayOfEntry() {
        return dayOfEntry;
    }

    public void setDayOfEntry(String dayOfEntry) {
        this.dayOfEntry = dayOfEntry;
    }

    public DetailProduct() {
    }
}
