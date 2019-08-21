package edu.minishop.controller;

import edu.minishop.model.Product;
import edu.minishop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/adminAddingProduct")
public class AdminProductController {

    @Autowired
    private ProductService productService;
    private final static int ROW_NUMBER_PAGINATION = 6;
    @GetMapping()
    public String Default(ModelMap modelMap){
        List<Product> products = productService.getAllLimitCriteria(  0,-1);
        int pageNo = (int)Math.ceil((1.0)*products.size()/ROW_NUMBER_PAGINATION);
        modelMap.addAttribute("pageNo",pageNo);
        modelMap.addAttribute("products", products);
        modelMap.addAttribute("choosenPage", 1);
        modelMap.addAttribute("rowMax", ROW_NUMBER_PAGINATION);
        return "admin-addProduct";
    }
}
