package edu.minishop.daoimpl;

import edu.minishop.model.Employee;

public interface EmployeeImpl {
    Employee handleLogin(String username, String password);
    boolean addEmploy(Employee employee);
}
