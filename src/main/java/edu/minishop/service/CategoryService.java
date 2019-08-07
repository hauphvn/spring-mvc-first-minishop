package edu.minishop.service;

import edu.minishop.dao.CategoryDao;
import edu.minishop.daoimpl.CategoryImpl;
import edu.minishop.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService implements CategoryImpl {
    @Autowired
    private CategoryDao categoryDao;
    @Override
    public List<Category> getAll() {
        System.out.println("vao categoryService");
        return categoryDao.getAll();
    }
}
