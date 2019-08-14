package edu.minishop.controller;

import edu.minishop.model.Category;
import edu.minishop.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/ordered")
public class OrderedController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String Default(ModelMap modelMap){

        //        //Load category into menu
        List<Category> categories = categoryService.getAll();
        modelMap.addAttribute("categories", categories);

        return "ordered";
    }
}
