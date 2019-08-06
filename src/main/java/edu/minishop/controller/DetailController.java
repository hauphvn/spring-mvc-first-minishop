package edu.minishop.controller;

import edu.minishop.model.DetailProduct;
import edu.minishop.model.Product;
import edu.minishop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/detail")
public class DetailController {
    @Autowired
    ProductService productService;

    @GetMapping("/{id}")
    public String Default(@PathVariable int id, ModelMap modelMap){
        Product product = productService.getAllDetailProductById(id);
        Set<DetailProduct> detailProducts = product.getDetailProducts();
        modelMap.addAttribute("product",product);
        modelMap.addAttribute("detailProducts",detailProducts);
        return "detail";
    }
}
