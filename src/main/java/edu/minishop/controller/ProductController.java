package edu.minishop.controller;

import edu.minishop.model.Category;
import edu.minishop.model.Product;
import edu.minishop.service.CategoryService;
import edu.minishop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;

    @GetMapping("{id}/{name}")
    public String getByIdCategory(ModelMap modelMap, @PathVariable int id, @PathVariable String name){
        List<Category> categories = categoryService.getAll();
        List<Product> products = productService.getByIdCategory(id);
        modelMap.addAttribute("categories", categories);
        modelMap.addAttribute("products", products);
        modelMap.addAttribute("nameCategory", name);

        return "product";
    }
}
