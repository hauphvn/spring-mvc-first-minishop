package edu.minishop.controller;

import edu.minishop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/detail")
public class DetailController {
    @Autowired
    ProductService productService;

    @GetMapping("/{id}")
    public String Default(@PathVariable int id){
        productService.getAllDetailProductById(id);
        return "detail";
    }
}
