package edu.minishop.dao;

import edu.minishop.daoimpl.SizeProductImpl;
import edu.minishop.model.Size;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SizeProductDao implements SizeProductImpl {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Size> getAll() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from SIZE";
        List<Size> sizes = new ArrayList<>();
        try {
            sizes =  session.createQuery(sql).getResultList();
        } catch (Exception e){
            System.out.println("Error query get all size from database: "+ e.toString());
        }

        return sizes;
    }

    @Override
    @Transactional
    public Size getById(int id) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from SIZE WHERE size_id = "+id;
        Size size = (Size) session.createQuery(sql).getSingleResult();
        return size;
    }
}
