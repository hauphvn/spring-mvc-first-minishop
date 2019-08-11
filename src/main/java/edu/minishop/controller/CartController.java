package edu.minishop.controller;

import edu.minishop.model.Cart;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @GetMapping
    public String Default(HttpSession httpSession, ModelMap modelMap){

        if(httpSession.getAttribute("sessionCart") != null){
            List<Cart> carts = (List<Cart>) httpSession.getAttribute("sessionCart");
            modelMap.addAttribute("carts",carts);
        }
        return "cart";
    }
}
