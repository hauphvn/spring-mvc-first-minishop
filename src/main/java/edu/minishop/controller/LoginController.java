package edu.minishop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dangnhap")
public class LoginController {
    @GetMapping
    public String Defaul(){
        return "login";
    }

//    @PostMapping
//    public String handleLogin(@RequestParam String username, @RequestParam String password, ModelMap modelMap){
//
//        return "login";
//    }
}
