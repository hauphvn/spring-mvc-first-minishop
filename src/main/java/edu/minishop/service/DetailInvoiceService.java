package edu.minishop.service;

import edu.minishop.dao.DetailInvoiceDao;
import edu.minishop.daoimpl.DetailInvoiceImpl;
import edu.minishop.model.DetailInvoice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailInvoiceService implements DetailInvoiceImpl {

    @Autowired
    private DetailInvoiceDao detailInvoiceDao;

    @Override
    public int addSingle(DetailInvoice detailInvoice) {
        return detailInvoiceDao.addSingle(detailInvoice);
    }
}
