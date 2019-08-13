package edu.minishop.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "DETAILINVOICE")
public class DetailInvoice {

    @EmbeddedId
    private DetailInvoiceId detailInvoiceId;
    private int amount;
    private String price;

    public DetailInvoiceId getDetailInvoiceId() {
        return detailInvoiceId;
    }

    public void setDetailInvoiceId(DetailInvoiceId detailInvoiceId) {
        this.detailInvoiceId = detailInvoiceId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String totalPrice) {
        this.price = totalPrice;
    }

    public DetailInvoice() {
    }
}
