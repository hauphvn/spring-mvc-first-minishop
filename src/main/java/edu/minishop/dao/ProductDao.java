package edu.minishop.dao;

import edu.minishop.daoimpl.ProductImpl;
import edu.minishop.model.Product;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

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

//            Log4jFactory.getLogger().info("Get product limit from database");
//            Log4jFactory.getLogger().warning("Get product limit from database");
//            Log4jFactory.getLogger().severe("Get product limit from database");
        }catch (Exception e){
            System.out.println("Loi truy cap du lieu PRODUCT: "+ e.toString());
        }
        return products;
    }

    @Override
    @Transactional
    public List<Product> getAllLimitCriteria(int first, int max) {
        List<Product> products = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();

        try {
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<Product> criteriaQuery= criteriaBuilder.createQuery(Product.class);
            Root<Product> productRoot = criteriaQuery.from(Product.class);
            criteriaQuery.select(productRoot);
//            criteriaQuery.select(productRoot).where(criteriaBuilder.equal(productRoot.get("product_id"),1L));
//            Query<Product> productQuery = session.createQuery(criteriaQuery);

            TypedQuery<Product> productTypedQuery = session.createQuery(criteriaQuery);
            if (max > 0){
                productTypedQuery.setMaxResults(max);
            }
            productTypedQuery.setFirstResult(first);
            products = productTypedQuery.getResultList();

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

    @Override
    @Transactional
    public boolean deleteById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Product product = session.get(Product.class, id);
        if (product != null){
            System.out.println(product.getName());
            return true;
        }
        return false;

    }

    @Override
    @Transactional
    public Product addSingle(Product product) {
        Session session = sessionFactory.getCurrentSession();
        session.save(product);
//        System.out.println(product.getName());
//        System.out.println(product.getPrice());
//        System.out.println(product.getDescription());
//        System.out.println(product.getImage());
//        System.out.println(product.getDetailProducts().size());
        return product;
    }
}
