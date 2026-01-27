package com.anna.sixcities.dao;

import com.anna.sixcities.model.IncomeByMonth;
import com.anna.sixcities.model.OffersByType;
import com.anna.sixcities.model.ReservationsByMonth;
import com.anna.sixcities.model.ReviewsByRating;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Component
public class ReportDao {

    private static final String RESERVATIONS_BY_MONTH_QUERY = """
                    SELECT
                        month_name, count
                    FROM (
                        SELECT
                            EXTRACT(YEAR FROM check_in) AS year,
                            EXTRACT(MONTH FROM check_in) AS month,
                            TO_CHAR(check_in, 'Mon') AS month_name,
                            COUNT(*) AS count
                        FROM reservation
                        GROUP BY year, month, month_name
                        ORDER BY year DESC, month DESC
                        LIMIT 12
                    )
                    ORDER BY year ASC, month ASC
            """;

    private static final String OFFERS_BY_TYPE_QUERY = """
                    SELECT
                        offer_type_id,
                        offer_type.name AS offer_type_name,
                        COUNT(*) AS count
                    FROM offer
                    JOIN offer_type ON offer.offer_type_id = offer_type.id
                    GROUP BY offer_type_id, offer_type_name
                    ORDER BY offer_type_id
            """;

    private static final String REVIEWS_BY_RATING_QUERY = """
                    SELECT
                        rating,
                        COUNT(*) AS count
                    FROM review
                    GROUP BY rating
                    ORDER BY rating
            """;

    private static final String INCOME_BY_MONTH = """
                    SELECT
                        month_name, sum
                    FROM (
                        SELECT
                            EXTRACT(YEAR FROM check_in) AS year,
                            EXTRACT(MONTH FROM check_in) AS month,
                            TO_CHAR(check_in, 'Mon') AS month_name,
                            SUM(price) AS sum
                        FROM reservation
                        JOIN OFFER ON reservation.offer_id = offer.id
                        GROUP BY year, month, month_name
                        ORDER BY year DESC, month DESC
                        LIMIT 12
                    )
                    ORDER BY year ASC, month ASC
            """;

     @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<ReservationsByMonth> searchReservationsByMonth() {
        List<Map<String, Object>> dbRowList = jdbcTemplate.queryForList(RESERVATIONS_BY_MONTH_QUERY);
        return dbRowList.stream().map(dbRow -> {
            ReservationsByMonth reservationsByMonth = new ReservationsByMonth();
            reservationsByMonth.setMonth((String) dbRow.get("month_name"));
            reservationsByMonth.setCount((Long) dbRow.get("count"));
            return reservationsByMonth;
        }).toList();
    }

    public List<OffersByType> searchOffersByType() {
        List<Map<String, Object>> dbRowList = jdbcTemplate.queryForList(OFFERS_BY_TYPE_QUERY);
        return dbRowList.stream().map(dbRow -> {
            OffersByType offersByType = new OffersByType();
            offersByType.setOfferType((String) dbRow.get("offer_type_name"));
            offersByType.setCount((Long) dbRow.get("count"));
            return offersByType;
        }).toList();
    }

    public List<ReviewsByRating> searchReviewByRating() {
        List<Map<String, Object>> dbRowList = jdbcTemplate.queryForList(REVIEWS_BY_RATING_QUERY);
        return dbRowList.stream().map(dbRow -> {
            ReviewsByRating reviewsByRating = new ReviewsByRating();
            reviewsByRating.setRating((Integer) dbRow.get("rating"));
            reviewsByRating.setCount((Long) dbRow.get("count"));
            return reviewsByRating;
        }).toList();
    }

    public List<IncomeByMonth> searchIncomeByMonth() {
        List<Map<String, Object>> dbRowList = jdbcTemplate.queryForList(INCOME_BY_MONTH);
        return dbRowList.stream().map(dbRow -> {
            IncomeByMonth incomeByMonth = new IncomeByMonth();
            incomeByMonth.setIncome((BigDecimal) dbRow.get("sum"));
            incomeByMonth.setMonth((String) dbRow.get("month_name"));
            return incomeByMonth;
        }).toList();
    }
}
