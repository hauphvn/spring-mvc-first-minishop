package edu.minishop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class HomeController {
    @GetMapping
    public String Default(HttpSession httpSession, ModelMap modelMap){
        if(httpSession.getAttribute("fullName") != null){
            String fullName = (String)httpSession.getAttribute("fullName");
            String[] arrName = fullName.split(" ");
            String firstName = ((arrName[arrName.length - 1]).toUpperCase()).substring(0,1);
            System.out.println(firstName);
            modelMap.addAttribute("firstName", firstName);
        }
        return "home";
    }

}
