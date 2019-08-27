/*
 * Cung cap api cho ajax xu ly ngam
 * */
package edu.minishop.controller;

import edu.minishop.model.Cart;
import edu.minishop.model.Color;
import edu.minishop.model.Employee;
import edu.minishop.model.Product;
import edu.minishop.service.ColorProductService;
import edu.minishop.service.EmployeeService;
import edu.minishop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("api/")
@SessionAttributes({"fullName", "sessionCart"})
public class APIController {

    private final static int ROW_NUMBER_PAGINATION = 6;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ServletContext servletContext;

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
            @RequestParam String urlImage,
            @RequestParam int idProductDetail,
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
        cart.setImage(urlImage);
        cart.setIdDetailProduct(idProductDetail);

        if (httpSession.getAttribute("sessionCart") == null) {
            carts.add(cart);
            httpSession.setAttribute("sessionCart", carts);
            result = carts.size() + "";
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
                result = carts.size() + "";
            }
        }
        return result;
    }

    @GetMapping("itemInCart")
    @ResponseBody
    public String countItemInCart(HttpSession httpSession) {
        String result = "";
        if (httpSession.getAttribute("sessionCart") != null) {
            List<Cart> carts = (List<Cart>) httpSession.getAttribute("sessionCart");
            result = carts.size() + "";
        }
        return result;
    }

    @GetMapping("updateAmount")
    @ResponseBody
    public String UpdateAmountProductInCart(HttpSession httpSession, int amount, int idProduct, int idSize, int idColor) {
        int index = isExitstProduct(httpSession, idProduct, idSize, idColor);
        if (index != -1) {
            List<Cart> carts = (List<Cart>) httpSession.getAttribute("sessionCart");
            Cart cart = carts.get(index);
            cart.setAmount(amount);
            return "true";
        }
        return "false";
    }

    @GetMapping("removeProductFromCart")
    @ResponseBody
    public String removeProductFromCart(HttpSession httpSession, int idProduct, int idColor, int idSize){
        int index = isExitstProduct(httpSession, idProduct, idSize, idColor);
        if (index != -1){
            List<Cart> carts = (List<Cart>) httpSession.getAttribute("sessionCart");
            carts.remove(index);
            System.out.println("xoa thanh cong");
            return "true";
        }
        System.out.println("xoa that bai");
        return "false";
    }

    public int isExitstProduct(HttpSession httpSession, int idProduct, int idSize, int idColor) {
        if (httpSession.getAttribute("sessionCart") != null) {
            List<Cart> carts = (List<Cart>) httpSession.getAttribute("sessionCart");
            int index = 0;
            for (Cart cart :
                    carts) {
                if (cart.getIdProduct() == idProduct && cart.getIdColor() == idColor && cart.getIdSize() == idSize) {
                    return index;
                }
                index++;
            }
        }
        return -1;
    }

    @GetMapping(path = "pagination", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String pagination(ModelMap modelMap, @RequestParam int curPage){
        int fromPos = ROW_NUMBER_PAGINATION * (curPage - 1);
        List<Product> products = productService.getAllLimitCriteria(fromPos,ROW_NUMBER_PAGINATION);
        String html = "";
        for (Product product :
                products) {
            html = html + "<tr>" +
                    "<td>"+product.getName()+"</td> " +
                    "<td>"+product.getCategory().getName()+"</td> " +
                    "<td>"+product.getPrice()+"</td> " +
                    "<td><img class='removeProduct' data-removeProduct='"+product.getProduct_id()+"' style='cursor: pointer' src='/Minishop/resources/imgs/remove.png ' alt='img-remove-product'></td> " +
                    "</tr>";
        }
        return html;
    }

    @GetMapping("deleteProductById")
    @ResponseBody
    public String deleteProductById(@RequestParam int id){
        if(productService.deleteById(id) == true){
            return "true";
        }
        return "false";
    }

    @PostMapping("uploadFile")
    @ResponseBody
    public String uploadFile(MultipartHttpServletRequest multipartHttpServletRequest){
        String pathToSave = servletContext.getRealPath("/resources/imgs/products/");
        Iterator<String> stringIteratorName = multipartHttpServletRequest.getFileNames();
        MultipartFile multipartFile = multipartHttpServletRequest.getFile(stringIteratorName.next());
        System.out.println(pathToSave);

        File fileToSave = new File(pathToSave + multipartFile.getOriginalFilename());
        try {
            multipartFile.transferTo(fileToSave);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "null";
    }

    @PostMapping("addingProduct")
    @ResponseBody
     public void addingProduct(String content){
        System.out.println(content);
    }

}
