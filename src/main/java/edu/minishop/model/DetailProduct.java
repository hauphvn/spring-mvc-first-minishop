package edu.minishop.model;

import javax.persistence.*;

@Entity(name = "DETAILPRODUCT")
public class DetailProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id")
    private Product product;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id")
    private Size size;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id")
    private Color color;

    private int amount;
    private String dayOfEntry;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
