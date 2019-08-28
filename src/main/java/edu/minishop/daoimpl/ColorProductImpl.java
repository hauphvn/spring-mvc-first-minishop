package edu.minishop.daoimpl;

import edu.minishop.model.Color;

import java.util.List;

public interface ColorProductImpl {
    List<Color> getAll();
    Color getById(int id);
}
