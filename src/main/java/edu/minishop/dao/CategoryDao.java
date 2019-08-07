package edu.minishop.dao;

import edu.minishop.daoimpl.CategoryImpl;
import edu.minishop.model.Category;
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
public class CategoryDao implements CategoryImpl {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    @Transactional
    public List<Category> getAll() {
        System.out.println("vao day");
        List<Category> categories = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();
        String sql = "from CATEGORY";
        try {
            categories = session.createQuery(sql).getResultList();
        } catch (Exception e){
            System.out.println("Error from query database CategoryDao: " + e.toString());
        }
        if (categories == null){
            System.out.println("nullllllllll");
        }else {
            System.out.println(categories);
        }
        return categories;
    }
}
