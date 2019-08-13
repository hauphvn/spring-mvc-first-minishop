package edu.minishop.dao;

import edu.minishop.daoimpl.DetailInvoiceImpl;
import edu.minishop.model.DetailInvoice;
import edu.minishop.model.DetailInvoiceId;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
}
