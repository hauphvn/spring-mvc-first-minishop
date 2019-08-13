package edu.minishop.dao;

import edu.minishop.daoimpl.InvoiceImpl;
import edu.minishop.model.Invoice;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class InvoiceDao implements InvoiceImpl {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public int addSingle(Invoice invoice) {

        Session session = sessionFactory.getCurrentSession();
        int id = (int) session.save(invoice);
        return ((id > 0) ? id  : 0);
    }
}
