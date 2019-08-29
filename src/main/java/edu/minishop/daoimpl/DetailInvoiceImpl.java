package edu.minishop.daoimpl;


import edu.minishop.model.DetailInvoice;
import edu.minishop.model.DetailProduct;

import java.util.Set;

public interface DetailInvoiceImpl {
    int addSingle(DetailInvoice detailInvoice);
    void deleteByListDetailIdProduct(Set<DetailProduct> detailProducts);
    Set<Integer> getListIdInvoiceByIdDetailProduct(Set<DetailProduct> detailProducts);
}
