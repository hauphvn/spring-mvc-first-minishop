package edu.minishop.model;


import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class DetailInvoiceId implements Serializable {
    private int invoice_id;
    private int detail_product_id;

    public int getIdInvoice() {
        return invoice_id;
    }

    public void setIdInvoice(int idInvoice) {
        this.invoice_id = idInvoice;
    }

    public int getIdDetailProduct() {
        return detail_product_id;
    }

    public void setIdDetailProduct(int idDetailProduct) {
        this.detail_product_id = idDetailProduct;
    }

    public DetailInvoiceId() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o){
            return true;
        }
        if(!(o instanceof DetailInvoiceId)){
            return false;
        }
        DetailInvoiceId that = (DetailInvoiceId) o;
        return Objects.equals(getIdInvoice(), that.getIdInvoice())
                && Objects.equals(getIdDetailProduct(), that.getIdDetailProduct());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getIdDetailProduct(), getIdInvoice());
    }
}
