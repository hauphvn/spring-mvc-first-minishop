package edu.minishop.service;

import edu.minishop.dao.ProductDao;
import edu.minishop.daoimpl.ProductImpl;
import edu.minishop.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService implements ProductImpl {

    @Autowired
    private ProductDao productDao;
    @Override
    public List<Product> getAllLimit(int first, int max) {
        return productDao.getAllLimit(first,max);
    }

    @Override
    public List<Product> getAllLimitCriteria(int first, int max) {
        return productDao.getAllLimitCriteria(first,max);
    }

    @Override
    public Product getAllDetailProductById(int id) {

        return productDao.getAllDetailProductById(id);
    }

    @Override
    public List<Product> getByIdCategory(int idCategory) {
        return productDao.getByIdCategory(idCategory);
    }

    @Override
    public boolean deleteById(int id) {
        return productDao.deleteById(id);
    }
}
