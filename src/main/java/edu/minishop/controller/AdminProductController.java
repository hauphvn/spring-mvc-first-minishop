package edu.minishop.controller;

import edu.minishop.model.*;
import edu.minishop.service.CategoryService;
import edu.minishop.service.ColorProductService;
import edu.minishop.service.ProductService;
import edu.minishop.service.SizeProductService;
import org.hibernate.annotations.NaturalId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/adminAddingProduct")
public class AdminProductController {

    @Autowired
    private ColorProductService colorProductService;
    @Autowired
    private SizeProductService sizeProductService;
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    private final static int ROW_NUMBER_PAGINATION = 6;
    @GetMapping()
    public String Default(ModelMap modelMap){
        List<Product> products = productService.getAllLimitCriteria(  0,-1);
        int pageNo = (int)Math.ceil((1.0)*products.size()/ROW_NUMBER_PAGINATION);
        modelMap.addAttribute("pageNo",pageNo);
        modelMap.addAttribute("products", products);
        modelMap.addAttribute("choosenPage", 1);
        modelMap.addAttribute("rowMax", ROW_NUMBER_PAGINATION);
        return "admin-manageProduct";
    }

    @GetMapping("addProductSingle")
    public String addProduct(ModelMap modelMap){
        List<Category> categories = categoryService.getAll();
        modelMap.addAttribute("categories", categories);
        List<Color> colors = colorProductService.getAll();
        modelMap.addAttribute("colors", colors);
        List<Size> sizes = sizeProductService.getAll();
        modelMap.addAttribute("sizes", sizes);
        return "admin-addProduct";
    }

    @GetMapping("updatingProduct/{id}")
    public String updatingProduct(ModelMap modelMap, @PathVariable int id){
        List<Category> categories = categoryService.getAll();
        Product product = productService.getById(id);
        List<Size> sizes = sizeProductService.getAll();
        List<Color> colors = colorProductService.getAll();
//        Set<DetailProduct> detailProducts = product.getDetailProducts();
        modelMap.addAttribute("product", product);
        modelMap.addAttribute("categories", categories);
        modelMap.addAttribute("sizes", sizes);
        modelMap.addAttribute("colors", colors);
//        modelMap.addAttribute("details", detailProducts);
        return "admin-updateProduct";
    }
}
