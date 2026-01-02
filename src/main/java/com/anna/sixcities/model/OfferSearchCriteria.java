package com.anna.sixcities.model;

public class OfferSearchCriteria {

    private String city;
    private Integer adults;
    private Integer children;
    private Integer rooms;
    private Boolean hasPets;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getAdults() {
        return adults;
    }

    public void setAdults(Integer adults) {
        this.adults = adults;
    }

    public Integer getChildren() {
        return children;
    }

    public void setChildren(Integer children) {
        this.children = children;
    }

    public Integer getRooms() {
        return rooms;
    }

    public void setRooms(Integer rooms) {
        this.rooms = rooms;
    }

    public Boolean getHasPets() {
        return hasPets;
    }

    public void setHasPets(Boolean hasPets) {
        this.hasPets = hasPets;
    }
}
