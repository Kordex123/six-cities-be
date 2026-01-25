package com.anna.sixcities.controller;

import com.anna.sixcities.model.OffersByType;
import com.anna.sixcities.model.ReservationsByMonth;
import com.anna.sixcities.model.ReviewsByRating;
import com.anna.sixcities.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @PostMapping("/search/reservation-count")
    public List<ReservationsByMonth> searchReservationsByMonth() {
        return reportService.searchReservationsByMonth();
    }

    @PostMapping("/search/offer-count")
    public List<OffersByType> searchOffersByType() {
        return reportService.searchOffersByType();
    }

    @PostMapping("/search/review-count")
    public List<ReviewsByRating> searchReviewsByRating() {
        return reportService.searchReviewsByRating();
    }
}
