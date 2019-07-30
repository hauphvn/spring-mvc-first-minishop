package edu.minishop.controller;

import edu.minishop.model.Employee;
import edu.minishop.service.EmployeeService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dangnhap")
public class LoginController {
    @GetMapping
    public String Defaul(){
        return "login";
    }
    @Autowired
    private EmployeeService employeeService;
    @PostMapping
    public String handleLogin(@RequestParam String username, @RequestParam String password, ModelMap modelMap){
        boolean status = employeeService.handleLogin(username, password);
        if (status){
            modelMap.addAttribute("statusLogin","success");
        }else{
            modelMap.addAttribute("statusLogin","fail");
        }
        return "login";
    }
}
