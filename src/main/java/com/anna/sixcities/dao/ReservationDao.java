package com.anna.sixcities.dao;

import com.anna.sixcities.model.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Component
public class ReservationDao {

    private static final String RESERVATION_QUERY = """
            SELECT * FROM RESERVATION
            """;

    private static final String RESERVATION_INSERT = """
            INSERT INTO RESERVATION (USER_ID, OFFER_ID, START_DATE, END_DATE) VALUES (?, ?, ?, ?)
            """;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Reservation> searchReservations() {
        List<Map<String, Object>> reservationMapList = jdbcTemplate.queryForList(RESERVATION_QUERY);
        return reservationMapList.stream().map(reservationMap -> {
            Reservation reservation = new Reservation();
            reservation.setId(((Number) reservationMap.get("id")).longValue());
            reservation.setOfferId((Long) reservationMap.get("offer_id"));
            reservation.setUserId((Long) reservationMap.get("user_id"));
            reservation.setCheckIn((LocalDate) reservationMap.get("start_date"));
            reservation.setCheckOut((LocalDate) reservationMap.get("end_date"));
            return reservation;
        }).toList();
    }

    public void addReservation(Reservation reservation) {
        jdbcTemplate.update(RESERVATION_INSERT, 1, reservation.getOfferId(), reservation.getCheckIn(), reservation.getCheckOut());
    }

}