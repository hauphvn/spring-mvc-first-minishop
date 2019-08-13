package edu.minishop.service;

import edu.minishop.dao.InvoiceDao;
import edu.minishop.daoimpl.InvoiceImpl;
import edu.minishop.model.Invoice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvoiceService implements InvoiceImpl {

    @Autowired
    private InvoiceDao invoiceDao;

    @Override
    public int addSingle(Invoice invoice) {
        return invoiceDao.addSingle(invoice);
    }
}
