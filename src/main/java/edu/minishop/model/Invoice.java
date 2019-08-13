package edu.minishop.model;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "INVOICE")
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int invoice_id;
    private String nameCustomer;
    private String phoneNumber;
    private String addressDelivery;
    private boolean status;
    private String dateCreated;
    private String deliveryForm;
    private String notes;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "detailInvoiceId")
    private Set<DetailInvoice> detailInvoices;

    public String getDeliveryForm() {
        return deliveryForm;
    }

    public void setDeliveryForm(String deliveryForm) {
        this.deliveryForm = deliveryForm;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Set<DetailInvoice> getDetailInvoices() {
        return detailInvoices;
    }

    public void setDetailInvoices(Set<DetailInvoice> detailInvoices) {
        this.detailInvoices = detailInvoices;
    }

    public int getInvoice_id() {
        return invoice_id;
    }

    public void setInvoice_id(int invoice_id) {
        this.invoice_id = invoice_id;
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddressDelivery() {
        return addressDelivery;
    }

    public void setAddressDelivery(String addressDelivery) {
        this.addressDelivery = addressDelivery;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Invoice() {
    }
}
