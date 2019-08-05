package edu.minishop.model;


import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

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
