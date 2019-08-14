package edu.minishop.controller;

import edu.minishop.model.Category;
import edu.minishop.model.Product;
import edu.minishop.service.CategoryService;
import edu.minishop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @GetMapping
    public String Default(HttpSession httpSession, ModelMap modelMap){
        if(httpSession.getAttribute("fullName") != null){
            String fullName = (String)httpSession.getAttribute("fullName");
            String[] arrName = fullName.split(" ");
            String firstName = ((arrName[arrName.length - 1]).toUpperCase()).substring(0,1);
            System.out.println(firstName);
            modelMap.addAttribute("firstName", firstName);
        }
//        //Load category into menu
        List<Category> categories = categoryService.getAll();
        modelMap.addAttribute("categories", categories);

        //Load list products
        List<Product> products = productService.getAllLimit(0,8);
        modelMap.addAttribute("listProducts",products);
        return "home";
    }

}
