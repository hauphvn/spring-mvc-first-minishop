package edu.minishop.service;

import edu.minishop.dao.EmployeeDao;
import edu.minishop.daoimpl.EmployeeImpl;
import edu.minishop.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService implements EmployeeImpl {
    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public Employee handleLogin(String username, String password) {
        return employeeDao.handleLogin(username, password);
    }
}
