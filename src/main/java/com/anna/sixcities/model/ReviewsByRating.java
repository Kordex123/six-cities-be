package com.anna.sixcities.model;

import java.math.BigDecimal;

public class ReviewsByRating {
    private Integer rating;
    private Long count;

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
}
