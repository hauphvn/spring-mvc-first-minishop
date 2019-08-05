package edu.minishop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity(name = "POSITIONM")
public class Position {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int positionm_id;
    private String name;

    public int getPositionm_id() {
        return positionm_id;
    }

    public void setPositionm_id(int positionm_id) {
        this.positionm_id = positionm_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Position() {
    }

}
