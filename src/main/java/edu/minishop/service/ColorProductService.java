package edu.minishop.service;

import edu.minishop.dao.ColorProductDao;
import edu.minishop.daoimpl.ColorProductImpl;
import edu.minishop.model.Color;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ColorProductService implements ColorProductImpl {

    @Autowired
    private ColorProductDao colorProductDao;

    @Override
    public List<Color> getAll() {
        return colorProductDao.getAll();
    }

    @Override
    public Color getById(int id) {
        return colorProductDao.getById(id);
    }
}
