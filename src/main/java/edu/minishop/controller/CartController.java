package edu.minishop.controller;

import edu.minishop.model.*;
import edu.minishop.service.CategoryService;
import edu.minishop.service.DetailInvoiceService;
import edu.minishop.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private DetailInvoiceService detailInvoiceService;
    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String Default(HttpSession httpSession, ModelMap modelMap){

        //        //Load category into menu
        List<Category> categories = categoryService.getAll();
        modelMap.addAttribute("categories", categories);

        if(httpSession.getAttribute("sessionCart") != null){
            List<Cart> carts = (List<Cart>) httpSession.getAttribute("sessionCart");
            modelMap.addAttribute("carts",carts);
        }
        return "cart";
    }

    @PostMapping
    public String PlaceOrder(@RequestParam String customer,
                             @RequestParam String phoneNumber,
                             @RequestParam String deliveryForm,
                             @RequestParam String deliveryAddress,
                             @RequestParam String notes,
                             HttpSession httpSession){
        if (httpSession.getAttribute("sessionCart") != null){
            Invoice invoice = new Invoice();

            invoice.setNameCustomer(customer);
            invoice.setPhoneNumber(phoneNumber);
            invoice.setAddressDelivery(deliveryAddress);
            invoice.setStatus(false);
            invoice.setDateCreated(LocalDate.now().toString());
            invoice.setDeliveryForm(deliveryForm);
            invoice.setNotes(notes);

            int idAddedInvoice = invoiceService.addSingle(invoice);
            if (idAddedInvoice > 0){

                DetailInvoiceId detailInvoiceId = new DetailInvoiceId();
                detailInvoiceId.setIdInvoice(idAddedInvoice);
                List<Cart> carts = (List<Cart>) httpSession.getAttribute("sessionCart");
                int countTimesAdd = 0;
                for (Cart cart :
                        carts) {
                    DetailInvoice detailInvoice = new DetailInvoice();
                    detailInvoiceId.setIdDetailProduct(cart.getIdDetailProduct());
                    detailInvoice.setDetailInvoiceId(detailInvoiceId);
                    detailInvoice.setAmount(cart.getAmount());
                    detailInvoice.setPrice(cart.getPrice());

                    countTimesAdd += detailInvoiceService.addSingle(detailInvoice);
                }
                if (countTimesAdd == carts.size()){
                    httpSession.removeAttribute("sessionCart");
                    return "redirect:ordered";
                }
            }
        }
        return "cart";
    }
}
