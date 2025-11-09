package com.anna.sixcities.model;

public class Favorite {
    private Long userId;
    private Long offerId;

    public Favorite(Long userId, Long offerId) {
        this.userId = userId;
        this.offerId = offerId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getOfferId() {
        return offerId;
    }

    public void setOfferId(Long offerId) {
        this.offerId = offerId;
    }
}
