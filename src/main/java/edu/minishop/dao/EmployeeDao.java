package edu.minishop.dao;

import edu.minishop.daoimpl.EmployeeImpl;
import edu.minishop.model.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS    )
public class EmployeeDao implements EmployeeImpl {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Employee handleLogin(String username, String password) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from EMPLOYEE where username = '"+username+"' and password = '"+password+"'";
        try {
            Employee employee = (Employee)session.createQuery(sql).getSingleResult();
            if (employee != null){
                return employee;
            }else{
                return null;
            }
        }catch (Exception e){
            System.out.println("Error from DAO employee: "+ e.getMessage());
            return null;
        }
    }
}
