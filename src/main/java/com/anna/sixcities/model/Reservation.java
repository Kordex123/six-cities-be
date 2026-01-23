package com.anna.sixcities.model;

import java.time.LocalDate;
import java.util.List;

public class Reservation {
    private Long id;
    private Long userId;
    private Offer offer;
    private LocalDate checkIn;
    private LocalDate checkOut;
    private List<User> participants;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Offer getOffer() {
        return offer;
    }

    public void setOffer(Offer offer) {
        this.offer = offer;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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

    public Long getUserId() {
        return userId;
    }

    public <E> void setParticipants(List<User> participants) {
        this.participants = participants;
    }

    public List<User> getParticipants() {
        return participants;
    }
}
