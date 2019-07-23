package edu.minishop.controller;

import edu.minishop.model.NhanVien;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import java.io.IOException;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    SessionFactory sessionFactory;//Se lien he toi IoC, tim id giong sessionFactory
    // SessionFactory chua giao thuc ket noi database
//    //Se return mot session
    @GetMapping("/")
    @Transactional //De thuc hien commit va rollback, cua spring framewword
    public String Default(){

        Session session = sessionFactory.getCurrentSession();
        String sql = "from NhanVien where id = :id";
        Query query = session.createQuery(sql);
        query.setParameter("id", 1);
        NhanVien nhanVien = (NhanVien)query.getSingleResult();
        System.out.println(nhanVien);

        return "home";
//        Session session = sessionFactory.openSession();
//        session.beginTransaction();
////        String sql = "from NhanVien where id = :id";
////        Query query = session.createQuery(sql);
////        query.setParameter("id",1);
////        List<NhanVien> nhanViens = query.getResultList();
////        for (NhanVien nhanVien :
////                nhanViens) {
////            System.out.println(nhanVien);
////        }
//        session.close();



    }

}
