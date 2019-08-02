/*
* Cung cap api cho ajax xu ly ngam
* */
package edu.minishop.controller;

import edu.minishop.model.Employee;
import edu.minishop.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("api/")
@SessionAttributes("fullName")
public class APIController {
    @Autowired
    private EmployeeService employeeService;
    @GetMapping("checkLogin")
    @ResponseBody
    public String checkLogin(@RequestParam String username, @RequestParam String password, ModelMap modelMap){
        Employee employee = employeeService.handleLogin(username, password);
        if (employee != null){
            modelMap.addAttribute("fullName", employee.getName());
            return "true";
        }else{
            return "false";
        }

    }
}
