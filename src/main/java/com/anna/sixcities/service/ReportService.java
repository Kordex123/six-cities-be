package com.anna.sixcities.service;

import com.anna.sixcities.dao.ReportDao;
import com.anna.sixcities.model.OffersByType;
import com.anna.sixcities.model.ReservationsByMonth;
import com.anna.sixcities.model.ReviewsByRating;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportService {

    @Autowired
    private ReportDao reportDao;

    public List<ReservationsByMonth> searchReservationsByMonth() {
        return reportDao.searchReservationsByMonth();
    }

    public List<ReviewsByRating> searchReviewsByRating() {
        return reportDao.searchReviewByRating();
    }

    public List<OffersByType> searchOffersByType() {
        return reportDao.searchOffersByType();
    }
}
