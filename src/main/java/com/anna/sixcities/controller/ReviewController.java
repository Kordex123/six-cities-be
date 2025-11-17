package com.anna.sixcities.controller;

import com.anna.sixcities.model.Review;
import com.anna.sixcities.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping("/search")
    public List<Review> searchReview(@RequestBody Review review) {
        return reviewService.searchReview(review);
    }

    @PostMapping("/add")
    public Review addReview(@RequestBody Review review) {
        reviewService.addReview(review);
        return review;
    }

    @DeleteMapping("/delete")
    public Review deleteReview(@RequestParam Long reviewId) {
        reviewService.deleteReview(reviewId);
        Review review = new Review();
        review.setId(reviewId);
        return review;
    }

    @PutMapping("/update")
    public Review updateReview(@RequestBody Review review) {
        reviewService.updateReview(review);
        return review;
    }
}

