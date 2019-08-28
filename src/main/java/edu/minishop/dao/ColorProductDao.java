package edu.minishop.dao;

import edu.minishop.daoimpl.ColorProductImpl;
import edu.minishop.model.Color;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ColorProductDao implements ColorProductImpl {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Color> getAll() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from COLOR";
        List<Color> colors = new ArrayList<>();
        try {
            colors =  session.createQuery(sql).getResultList();
        } catch (Exception e){
            System.out.println("Error query get all color from database: "+ e.toString());
        }

        return colors;
    }

    @Override
    @Transactional
    public Color getById(int id) {
        Color color = new Color();
        Session session = sessionFactory.getCurrentSession();
        String sql = "from COLOR where color_id = "+id;
        try {
            color = (Color) session.createQuery(sql).getSingleResult();

        }catch (Exception e){
            System.out.println("Loi khong the truy van color tu database: "+ e.toString());
        }
        return color;
    }
}
