package com.anna.sixcities.service;

import com.anna.sixcities.dao.ReviewDao;
import com.anna.sixcities.model.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewDao reviewDao;

    public List<Review> searchReview(Review review) {
        return reviewDao.searchReview(review);
    }

    public void addReview(Review review) {
        reviewDao.addReview(review);
    }

    public void deleteReview(Long reviewId) {
        reviewDao.deleteReview(reviewId);
    }

    public void updateReview(Review review) {
        reviewDao.updateReview(review);
    }
}
