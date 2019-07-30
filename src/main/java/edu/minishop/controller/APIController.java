package edu.minishop.controller;

import edu.minishop.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("api/")
@SessionAttributes("username")
public class APIController {
    @Autowired
    private EmployeeService employeeService;
    @GetMapping("checkLogin")
    @ResponseBody
    public String checkLogin(@RequestParam String username, @RequestParam String password, ModelMap modelMap){
        boolean status = employeeService.handleLogin(username, password);
        if (status){
            modelMap.addAttribute("username", username);
        }
        return ""+status;
    }
}
