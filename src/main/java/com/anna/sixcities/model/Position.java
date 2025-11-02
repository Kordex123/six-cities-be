package com.anna.sixcities.model;

import java.math.BigDecimal;

public class Position {
    private BigDecimal lat;
    private BigDecimal lng;

    public Position() { }

    public Position(BigDecimal lat, BigDecimal lng) {
        this.lat = lat;
        this.lng = lng;
    }

    public BigDecimal getLat() {
        return lat;
    }

    public BigDecimal getLng() {
        return lng;
    }

    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    public void setLng(BigDecimal lng) {
        this.lng = lng;
    }
}
