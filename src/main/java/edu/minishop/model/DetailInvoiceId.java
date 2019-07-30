package edu.minishop.model;


import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class DetailInvoiceId implements Serializable {
    private int idInvoice;
    private int idDetailProduct;

    public int getIdInvoice() {
        return idInvoice;
    }

    public void setIdInvoice(int idInvoice) {
        this.idInvoice = idInvoice;
    }

    public int getIdDetailProduct() {
        return idDetailProduct;
    }

    public void setIdDetailProduct(int idDetailProduct) {
        this.idDetailProduct = idDetailProduct;
    }

    public DetailInvoiceId() {
    }
}
