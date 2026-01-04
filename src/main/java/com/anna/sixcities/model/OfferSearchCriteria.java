package com.anna.sixcities.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

public class OfferSearchCriteria {

    private String city;
    @DateTimeFormat(pattern = "dd.MM.yyyy")
    private LocalDate checkIn;
    @DateTimeFormat(pattern = "dd.MM.yyyy")
    private LocalDate checkOut;
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

    public LocalDate getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(LocalDate checkIn) {
        this.checkIn = checkIn;
    }

    public LocalDate getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(LocalDate checkOut) {
        this.checkOut = checkOut;
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
