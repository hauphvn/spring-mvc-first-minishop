package edu.minishop.service;

import edu.minishop.dao.SizeProductDao;
import edu.minishop.daoimpl.SizeProductImpl;
import edu.minishop.model.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SizeProductService implements SizeProductImpl {

    @Autowired
    private SizeProductDao sizeProductDao;

    @Override
    public List<Size> getAll() {
        return sizeProductDao.getAll();
    }

    @Override
    public Size getById(int id) {
        return sizeProductDao.getById(id);
    }
}
