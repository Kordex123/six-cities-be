package com.anna.sixcities.dao;

import com.anna.sixcities.model.Offer;
import com.anna.sixcities.model.Review;
import com.anna.sixcities.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import static com.anna.sixcities.util.SecurityUtil.getCurrentUserId;

@Component
public class ReviewDao {

    public static final String REVIEW_QUERY = """
            SELECT 
                APP_USER.ID AS USER_ID,
                OFFER.ID AS OFFER_ID,
                REVIEW.*,
                OFFER.*,
                APP_USER.*
            FROM REVIEW
            JOIN OFFER ON REVIEW.OFFER_ID = OFFER.ID
            JOIN APP_USER ON APP_USER.ID = REVIEW.USER_ID
            WHERE 1 = 1
        """;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Review> searchReview(Review reviewFilter) {
        String sql = REVIEW_QUERY;

        if (reviewFilter.getId() != null) {
            sql += " AND ID = " + reviewFilter.getId();
        }
        if (reviewFilter.getOfferId() != null) {
            sql += " AND OFFER_ID = " + reviewFilter.getOfferId();
        }
        if (reviewFilter.getUserId() != null) {
            sql += " AND USER_ID = " + reviewFilter.getUserId();
        }
        if (reviewFilter.getDescription() != null) {
            sql += " AND DESCRIPTION LIKE '%" + reviewFilter.getDescription() + "%'";
        }
        if (reviewFilter.getRating() != null) {
            sql += " AND RATING = " + reviewFilter.getRating();
        }

        List<Map<String, Object>> reviewMapList = jdbcTemplate.queryForList(sql);
        List<Review> result = reviewMapList.stream().map(reviewMap -> {
            Review review = new Review();
            User user = new User();
            Offer offer = new Offer();

            review.setId(((Number) reviewMap.get("id")).longValue());
            review.setOfferId((Long) reviewMap.get("offer_id"));
            review.setUserId((Long) reviewMap.get("user_id"));
            review.setDescription((String) reviewMap.get("description"));
            review.setRating((Integer) reviewMap.get("rating"));
            Timestamp timestamp = (Timestamp) reviewMap.get("creation_date");
            review.setCreationDate(timestamp != null ? timestamp.toLocalDateTime(): null);

            user.setId(((Number) reviewMap.get("user_id")).longValue());
            user.setFirstName((String) reviewMap.get("first_name"));
            user.setLastName((String) reviewMap.get("last_name"));
            user.setEmail((String) reviewMap.get("email"));
            user.setLogin((String) reviewMap.get("login"));

            offer.setId(((Number) reviewMap.get("offer_id")).longValue());
            offer.setTitle((String) reviewMap.get("title"));

            review.setUser(user);
            review.setOffer(offer);

            return review;
        }).toList();
        return result;
    }

    public void addReview(Review review) {
        jdbcTemplate.update("INSERT INTO review (offer_id, user_id, description, rating) VALUES (?, ?, ?, ?)",
                review.getOfferId(), getCurrentUserId(), review.getDescription(), review.getRating());
    }

    public void deleteReview(Long reviewId) {
        jdbcTemplate.update("DELETE FROM review WHERE id = ?", reviewId);
    }

    public void updateReview(Review review) {
        jdbcTemplate.update("UPDATE REVIEW SET DESCRIPTION = ?, RATING = ? WHERE ID = ?",
                review.getDescription(), review.getRating(), review.getId());
    }
}

