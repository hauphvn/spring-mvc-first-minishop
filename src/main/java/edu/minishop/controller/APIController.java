package edu.minishop.controller;

import edu.minishop.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("api/")
public class APIController {
    @Autowired
    private EmployeeService employeeService;
    @GetMapping("checkLogin")
    @ResponseBody
    public String checkLogin(@RequestParam String username, @RequestParam String password){
        boolean status = employeeService.handleLogin(username, password);
        return ""+status;
    }
}
