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
}
