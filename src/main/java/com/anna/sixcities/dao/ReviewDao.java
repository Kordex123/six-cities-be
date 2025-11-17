package com.anna.sixcities.dao;

import com.anna.sixcities.model.Offer;
import com.anna.sixcities.model.Review;
import com.anna.sixcities.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class ReviewDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Review> searchReview(Review reviewFilter) {
        String query = "SELECT * FROM REVIEW WHERE 1 = 1";
        if (reviewFilter.getId() != null) {
            query += " AND ID = " + reviewFilter.getId();
        }
        if (reviewFilter.getOfferId() != null) {
            query += " AND OFFER_ID = " + reviewFilter.getOfferId();
        }
        if (reviewFilter.getUserId() != null) {
            query += " AND USER_ID = " + reviewFilter.getUserId();
        }
        if (reviewFilter.getDescription() != null) {
            query += " AND DESCRIPTION LIKE '%" + reviewFilter.getDescription() + "%'";
        }
        if (reviewFilter.getRating() != null) {
            query += " AND RATING = " + reviewFilter.getRating();
        }

        List<Map<String, Object>> reviewMapList = jdbcTemplate.queryForList(query);
        List<Review> result = reviewMapList.stream().map(reviewMap -> {
            Review review = new Review();
            review.setId(((Number) reviewMap.get("id")).longValue());
            review.setOfferId((Long) reviewMap.get("offer_id"));
            review.setUserId((Long) reviewMap.get("user_id"));
            review.setDescription((String) reviewMap.get("description"));
            review.setRating((Integer) reviewMap.get("rating"));
            return review;
        }).toList();
        return result;
    }

    public void addReview(Review review) {
        jdbcTemplate.update("INSERT INTO review (offer_id, user_id, description, rating) VALUES (?, ?, ?, ?)",
                review.getOfferId(), review.getUserId(), review.getDescription(), review.getRating());
    }

    public void deleteReview(Long reviewId) {
        jdbcTemplate.update("DELETE FROM review WHERE id = ?", reviewId);
    }

    public void updateReview(Review review) {
        jdbcTemplate.update("UPDATE REVIEW SET DESCRIPTION = ?, RATING = ? WHERE ID = ?",
                review.getDescription(), review.getRating(), review.getId());
    }
}

