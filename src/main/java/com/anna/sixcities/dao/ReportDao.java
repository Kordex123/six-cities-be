package com.anna.sixcities.dao;

import com.anna.sixcities.model.ReservationsByMonth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

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
}
