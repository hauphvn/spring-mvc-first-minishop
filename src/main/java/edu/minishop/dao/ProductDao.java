package edu.minishop.dao;

import edu.minishop.daoimpl.ProductImpl;
import edu.minishop.model.DetailProduct;
import edu.minishop.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ProductDao implements ProductImpl {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    @Transactional
    public List<Product> getAllLimit(int first, int max) {
        List<Product> products = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();
        String sql = "from PRODUCT";
        try {
            Query query = session.createQuery(sql);
            query.setFirstResult(first);
            query.setMaxResults(max);
            products = query.getResultList();
        }catch (Exception e){
            System.out.println("Loi truy cap du lieu PRODUCT: "+ e.toString());
        }
        return products;
    }

    @Override
    @Transactional
    public Product getAllDetailProductById(int id) {
        Product product = new Product();
        Session session = sessionFactory.getCurrentSession();
        String sql = "from PRODUCT where product_id = " + id;
        try {
            product = (Product) session.createQuery(sql).getSingleResult();
        }catch (Exception e){
            System.out.println("Error query database from getAllDetailProductById: " + e.toString());
        }
        return product;
    }

    @Override
    @Transactional
    public List<Product> getByIdCategory(int idCategory) {

        Session session = sessionFactory.getCurrentSession();
        String sql = "From PRODUCT WHERE category.category_id = "+ idCategory +"";
        try {
            List<Product> products = (List<Product>) session.createQuery(sql).getResultList();
            return products;
        }catch (Exception e){
            System.out.println("Error get product by idCategory: "+ e.toString());
        }
        return null;
    }
}
