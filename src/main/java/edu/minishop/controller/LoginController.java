package edu.minishop.controller;

import edu.minishop.model.Employee;
import edu.minishop.model.Position;
import edu.minishop.service.EmployeeService;
import edu.minishop.util.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/dangnhap")
public class LoginController {
    @Autowired
    private EmployeeService employeeService;
    @GetMapping
    public String Defaul(){
        return "login";
    }

    @PostMapping
    public String signUp(@RequestParam String usernameSignUp, @RequestParam String emailSignUp, @RequestParam String passwordSignUp,@RequestParam String rePasswordSignUp, ModelMap modelMap){
        Validate validate = new Validate();
        boolean validEmail = validate.Email(emailSignUp);
        if (validEmail){
           if(passwordSignUp.equals(rePasswordSignUp)){
//               Position position = new Position();
//               position.setName("Khách hàng");
               Employee employee = new Employee();
               employee.setAddress("You have not declared yet");
               employee.setEmail(emailSignUp);
               employee.setName("You have not declared yet");
               employee.setGender(false);
               employee.setIdentification("00000");
//               employee.setPosition(position);
               employee.setUsername(usernameSignUp);
               employee.setPassword(passwordSignUp);

               boolean isAdded = employeeService.addEmploy(employee);
               if(isAdded){
                   modelMap.addAttribute("resultSignUpOrSignIn","Đăng kí thành công");
               }else{//Can not insert into database
                   modelMap.addAttribute("resultSignUpOrSignIn","Đăng kí thất bại");
                   modelMap.addAttribute("reSignUp",true);
               }
           }else{//Re password is incorrect
               modelMap.addAttribute("resultSignUpOrSignIn","Mật khẩu không trùng khớp");
               modelMap.addAttribute("reSignUp",true);
           }

        }else{//Invalid email
            modelMap.addAttribute("resultSignUpOrSignIn","Vui lòng nhập đúng định dạng email");
            modelMap.addAttribute("reSignUp",true);
        }
        return "login";
    }
}
