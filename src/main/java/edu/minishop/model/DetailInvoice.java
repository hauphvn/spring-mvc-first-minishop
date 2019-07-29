package edu.minishop.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "DETAILINVOICE")
public class DetailInvoice {

    @EmbeddedId
    private DetailInvoiceId detailInvoiceId;
    private int amount;
    private String totalPrice;

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

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public DetailInvoice() {
    }
}
