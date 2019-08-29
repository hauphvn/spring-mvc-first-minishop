package edu.minishop.service;

import edu.minishop.dao.DetailInvoiceDao;
import edu.minishop.daoimpl.DetailInvoiceImpl;
import edu.minishop.model.DetailInvoice;
import edu.minishop.model.DetailProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class DetailInvoiceService implements DetailInvoiceImpl {

    @Autowired
    private DetailInvoiceDao detailInvoiceDao;

    @Override
    public int addSingle(DetailInvoice detailInvoice) {
        return detailInvoiceDao.addSingle(detailInvoice);
    }

    @Override
    public void deleteByListDetailIdProduct(Set<DetailProduct> detailProducts) {
        detailInvoiceDao.deleteByListDetailIdProduct(detailProducts);
    }

    @Override
    public Set<Integer> getListIdInvoiceByIdDetailProduct(Set<DetailProduct> detailProducts) {
        return detailInvoiceDao.getListIdInvoiceByIdDetailProduct(detailProducts);
    }
}
