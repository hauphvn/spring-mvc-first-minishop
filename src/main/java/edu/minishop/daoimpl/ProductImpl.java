package edu.minishop.daoimpl;

import edu.minishop.model.Product;

import java.util.List;

public interface ProductImpl {
    List<Product> getAllLimit(int first, int max);
    List<Product> getAllDetailProductById(int id);
}
