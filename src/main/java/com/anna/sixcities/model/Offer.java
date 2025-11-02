package com.anna.sixcities.model;

public class Offer {
    private Integer id;
    private String title;
    private Position position;

    public Offer(Integer id, String title, Position position) {
        this.id = id;
        this.title = title;
        this.position = position;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public Position getPosition() {
        return position;
    }
    public void setPosition(Position position) {
        this.position = position;
    }
}
