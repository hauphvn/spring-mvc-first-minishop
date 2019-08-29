package edu.minishop.dao;

import edu.minishop.daoimpl.DetailInvoiceImpl;
import edu.minishop.model.DetailInvoice;
import edu.minishop.model.DetailInvoiceId;
import edu.minishop.model.DetailProduct;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DetailInvoiceDao implements DetailInvoiceImpl {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public int addSingle(DetailInvoice detailInvoice) {

        Session session =sessionFactory.getCurrentSession();
        DetailInvoiceId detailInvoiceId = (DetailInvoiceId) session.save(detailInvoice);
        if (detailInvoiceId != null){
            return 1;
        }
        return 0;
    }

    @Override
    @Transactional
    public void deleteByListDetailIdProduct(Set<DetailProduct> detailProducts) {
        try {
            Session session = sessionFactory.getCurrentSession();
            int idDetailProduct = 0;
            List<Integer> listId = new ArrayList<>();
            for (DetailProduct detailProduct :
                    detailProducts) {
                String sql = "delete from DETAILINVOICE t where t.detailInvoiceId.detail_product_id = "+detailProduct.getDetail_product_id();
                Query query = session.createQuery(sql);
                query.executeUpdate();
            }
        }catch (Exception e){
            System.out.println("Error deleteByListDetailIdProduct: "+ e.toString());
        }
    }

    @Override
    public Set<Integer> getListIdInvoiceByIdDetailProduct(Set<DetailProduct> detailProducts) {
        Set<Integer> listIdInvoices = new HashSet<>();
        try {
            Session session = sessionFactory.getCurrentSession();
            int idDetailProduct = 0;
            List<Integer> listId = new ArrayList<>();
            for (DetailProduct detailProduct :
                    detailProducts) {
                String sql = "select t.detailInvoiceId.invoice_id from DETAILINVOICE t where t.detailInvoiceId.detail_product_id = "+detailProduct.getDetail_product_id();
                Query query = session.createQuery(sql);
                listId = query.getResultList();
                if (!listId.isEmpty()){
                    for (int id :
                            listId) {
                        listIdInvoices.add(id);
                    }
                }
            }
        }catch (Exception e){
            System.out.println("Error deleteByListDetailIdProduct: "+ e.toString());
        }
        return listIdInvoices;
    }
}
