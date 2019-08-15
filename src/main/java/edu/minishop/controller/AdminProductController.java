package edu.minishop.controller;

import edu.minishop.model.Product;
import edu.minishop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/adminAddingProduct")
public class AdminProductController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String Default(ModelMap modelMap){

        List<Product> products = productService.getAllLimit(0,20);
        System.out.println(products.size());
        return "admin-addProduct";
    }
}
