/*
 * Cung cap api cho ajax xu ly ngam
 * */
package edu.minishop.controller;

import edu.minishop.model.Cart;
import edu.minishop.model.Employee;
import edu.minishop.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("api/")
@SessionAttributes({"fullName", "sessionCart"})
public class APIController {
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("checkLogin")
    @ResponseBody
    public String checkLogin(@RequestParam String username, @RequestParam String password, ModelMap modelMap) {
        Employee employee = employeeService.handleLogin(username, password);
        if (employee != null) {
            modelMap.addAttribute("fullName", employee.getName());
            return "true";
        } else {
            return "false";
        }

    }

    @GetMapping("addCart")
    @ResponseBody
    public String addProductToCart(
            @RequestParam int idProduct,
            @RequestParam int idSize,
            @RequestParam int idColor,
            @RequestParam String nameProduct,
            @RequestParam String nameColor,
            @RequestParam String nameSize,
            @RequestParam String price,
            @RequestParam int amount,
            HttpSession httpSession
    ) {
        String result = "";
        List<Cart> carts = new ArrayList<>();

        Cart cart = new Cart();
        cart.setIdProduct(idProduct);
        cart.setIdSize(idSize);
        cart.setIdColor(idColor);
        cart.setNameProduct(nameProduct);
        cart.setNameColor(nameColor);
        cart.setNameSize(nameSize);
        cart.setPrice(price);
        cart.setAmount(1);

        if (httpSession.getAttribute("sessionCart") == null) {
            carts.add(cart);
            httpSession.setAttribute("sessionCart", carts);
            result = carts.size()+"";
        } else {
            carts = (List<Cart>) httpSession.getAttribute("sessionCart");
            int sizeCarts = carts.size();
            boolean isCodeExist = false;
            Cart cart1;
            for (int i = 0; i < sizeCarts; i++) {
                cart1 = carts.get(i);
                if (cart1.getIdProduct() == idProduct && cart1.getIdColor() == idColor && cart1.getIdSize() == idSize
                ) {
                    cart1.setAmount(cart1.getAmount() + 1);
                    isCodeExist = true;
                    break;
                }
            }

            if (!isCodeExist) {
                carts.add(cart);
                result = carts.size()+"";
            }
        }
        return  result;
    }
    @GetMapping("itemInCart")
    @ResponseBody
    public String countItemInCart(HttpSession httpSession){
        String result = "";
        if (httpSession.getAttribute("sessionCart") != null){
            List<Cart> carts = (List<Cart>) httpSession.getAttribute("sessionCart");
            result = carts.size()+"";
        }
        return result;
    }
}
