package edu.minishop.controller;

import edu.minishop.model.HoaDon;
import edu.minishop.model.NhanVien;
import edu.minishop.model.SanPham;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    SessionFactory sessionFactory;

    @GetMapping
    @Transactional
    public String Default() {

        //Updata database with the way 1
//        Session session = sessionFactory.getCurrentSession();
//        String sql = "from NhanVien where id = 4";
//        NhanVien nhanVien = (NhanVien)session.createQuery(sql).uniqueResult();
//        nhanVien.setFullName("obama");
//        session.update(nhanVien);

//        One to One relationship
        Session session = sessionFactory.getCurrentSession();

//        Set<SanPham> sanPhams = new HashSet<>();
        SanPham sanPham1 = new SanPham("Meat 5");
//        SanPham sanPham2 = new SanPham("Meat 5");
//        SanPham sanPham3 = new SanPham("Meat 6");

//        sanPhams.add(sanPham1);
//        sanPhams.add(sanPham2);
//        sanPhams.add(sanPham3);

        Set<HoaDon> hoaDons = new HashSet<>();
        HoaDon hoaDon1 = new HoaDon("Hoa don 4");
        HoaDon hoaDon2 = new HoaDon("Hoa don 2");
        HoaDon hoaDon3 = new HoaDon("Hoa don 3");
//
        hoaDons.add(hoaDon1);
        hoaDons.add(hoaDon2);
        hoaDons.add(hoaDon3);

        sanPham1.setHoaDons(hoaDons);
        session.save(sanPham1);
//        session.save(hoaDon1);
//        sanPham1.setHoaDons(hoaDons);

//        session.save(sanPham1);
        return "home";
    }
//    @PostMapping

//    Update database
//    public String updateEmployee(){
//        Session session = sessionFactory.getCurrentSession();
//        String sql = "from Nhanvien where id = 4";
//        NhanVien nhanVien = (NhanVien)session.createQuery(sql).uniqueResult();
//        nhanVien.setFullName("obama");
//        session.update(nhanVien);
//        return "home";
//    }
//    @Autowired
////    SessionFactory sessionFactory;//Se lien he toi IoC, tim id giong sessionFactory
//    // SessionFactory chua giao thuc ket noi database
////    //Se return mot session
//    @GetMapping("/")
////    @Transactional //De thuc hien commit va rollback, cua spring framewword
//    public String Default(){
//
////        Session session = sessionFactory.getCurrentSession();
////        String sql = "from NhanVien where id = :id";
////        Query query = session.createQuery(sql);
////        query.setParameter("id", 1);
////        NhanVien nhanVien = (NhanVien)query.getSingleResult();
////        System.out.println(nhanVien);
//
//        return "home";
////        Session session = sessionFactory.openSession();
////        session.beginTransaction();
//////        String sql = "from NhanVien where id = :id";
//////        Query query = session.createQuery(sql);
//////        query.setParameter("id",1);
//////        List<NhanVien> nhanViens = query.getResultList();
//////        for (NhanVien nhanVien :
//////                nhanViens) {
//////            System.out.println(nhanVien);
//////        }
////        session.close();
//


//    }

}
