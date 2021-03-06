/*
 * Cung cap api cho ajax xu ly ngam
 * */
package edu.minishop.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.minishop.model.*;
import edu.minishop.service.*;
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
import java.util.*;

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
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private SizeProductService sizeProductService;
    @Autowired
    private ColorProductService colorProductService;

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
    public String removeProductFromCart(HttpSession httpSession, int idProduct, int idColor, int idSize) {
        int index = isExitstProduct(httpSession, idProduct, idSize, idColor);
        if (index != -1) {
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
    public String pagination(ModelMap modelMap, @RequestParam int curPage) {
        int fromPos = ROW_NUMBER_PAGINATION * (curPage - 1);
        List<Product> products = productService.getAllLimitCriteria(fromPos, ROW_NUMBER_PAGINATION);
        String html = "";
        for (Product product :
                products) {
            html = html + "<tr>" +
                    "<td>" + product.getName() + "</td> " +
                    "<td>" + product.getCategory().getName() + "</td> " +
                    "<td>" + product.getPrice() + "</td> " +
                    "<td><img class='removeProduct' data-removeProduct='" + product.getProduct_id() + "' style='cursor: pointer' src='/Minishop/resources/imgs/remove.png ' alt='img-remove-product'></td> " +
                    "<td><a href='adminAddingProduct/updatingProduct/"+product.getProduct_id()+"'><img src='/Minishop/resources/imgs/updated.png' alt='icon-update-product'></a></td>"+
                    "</tr>";
        }
        return html;
    }

    @GetMapping("deleteProductById")
    @ResponseBody
    public String deleteProductById(@RequestParam int id) {
        if (productService.deleteById(id) == true) {
            return "true";
        }
        return "false";
    }

    @PostMapping("uploadFile")
    @ResponseBody
    public String uploadFile(MultipartHttpServletRequest multipartHttpServletRequest) {
        String pathToSave = servletContext.getRealPath("/resources/imgs/products/");
        Iterator<String> stringIteratorName = multipartHttpServletRequest.getFileNames();
        MultipartFile multipartFile = multipartHttpServletRequest.getFile(stringIteratorName.next());

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
    public String addingProduct(String content) {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode;
        Product product = new Product();
        Set<DetailProduct> detailProducts = new HashSet<>();
        //Mapping manual
        try {
            jsonNode = objectMapper.readTree(content);

            product.setName(jsonNode.get("name").asText());
            product.setDescription(jsonNode.get("description").asText());
            product.setPrice(jsonNode.get("price").asText());
            product.setImage(jsonNode.get("image").asText());
            product.setCategory(categoryService.getById(jsonNode.get("category").asInt()));

            JsonNode arrayDetailProduct = jsonNode.get("detailProducts");
            for (JsonNode objectDetail :
                    arrayDetailProduct) {
                DetailProduct detailProduct = new DetailProduct();
                detailProduct.setColor(colorProductService.getById(objectDetail.get("color").asInt()));
                detailProduct.setSize(sizeProductService.getById(objectDetail.get("size").asInt()));
                detailProduct.setAmount(objectDetail.get("amount").asInt());
                detailProduct.setDayOfEntry(objectDetail.get("dayOfEntry").asText());
                detailProduct.setProduct(product);

                detailProducts.add(detailProduct);
                detailProduct = null;
            }

            product.setDetailProducts(detailProducts);


        } catch (IOException e) {
            System.out.println("error" + e.getMessage());
            e.printStackTrace();
            return "false";
        }

        Product product1 = productService.addSingle(product);
        if (product != null)    {
            return "true";
        }
        return "false";
    }

    @PostMapping("updatingProduct")
    @ResponseBody
    public String updatingProduct(String jsonProduct){
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode;
        Product product = new Product();
        Set<DetailProduct> detailProducts = new HashSet<>();
        try {
            jsonNode = objectMapper.readTree(jsonProduct);

            product.setProduct_id(jsonNode.get("product_id").asInt());
            product.setName(jsonNode.get("name").asText());
            product.setDescription(jsonNode.get("description").asText());
            product.setPrice(jsonNode.get("price").asText());
            product.setImage(jsonNode.get("image").asText());
            product.setCategory(categoryService.getById(jsonNode.get("category").asInt()));

            JsonNode arrayDetailProduct = jsonNode.get("detailProducts");
            for (JsonNode objectDetail :
                    arrayDetailProduct) {
                DetailProduct detailProduct = new DetailProduct();
                detailProduct.setColor(colorProductService.getById(objectDetail.get("color").asInt()));
                detailProduct.setSize(sizeProductService.getById(objectDetail.get("size").asInt()));
                detailProduct.setAmount(objectDetail.get("amount").asInt());
                detailProduct.setDayOfEntry(objectDetail.get("dayOfEntry").asText());
                detailProduct.setProduct(product);

                detailProducts.add(detailProduct);
                detailProduct = null;
            }

            product.setDetailProducts(detailProducts);


        } catch (IOException e) {
            e.printStackTrace();
            return "false";
        }

        try {
            productService.update(product);
            return "true";
        }catch (Exception e){
            System.out.println("Error update product: "+ e.getMessage());
            return "false";
        }
    }

}
