package com.anna.sixcities.dao;

import com.anna.sixcities.model.City;
import com.anna.sixcities.model.Offer;
import com.anna.sixcities.model.Reservation;
import com.anna.sixcities.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import static com.anna.sixcities.util.DateUtil.objectToLocalDate;
import static com.anna.sixcities.util.SecurityUtil.getCurrentUserId;

@Component
public class ReservationDao {

    private static final String RESERVATION_QUERY = """
            SELECT CITY.TITLE AS CITY_TITLE,
                  RESERVATION.*,
                  OFFER.*,
                  CITY.*,
                  APP_USER.*
            FROM RESERVATION
            JOIN OFFER ON RESERVATION.OFFER_ID = OFFER.ID
            JOIN CITY ON OFFER.CITY_ID = CITY.ID
            JOIN APP_USER ON RESERVATION.USER_ID = APP_USER.ID
            --WHERE CITY.TITLE = ?
            """;

    private static final String RESERVATION_INSERT = """
            INSERT INTO RESERVATION (USER_ID, OFFER_ID, START_DATE, END_DATE) VALUES (?, ?, ?, ?)
            """;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Reservation> searchReservations() {
        List<Map<String, Object>> dbRowList = jdbcTemplate.queryForList(RESERVATION_QUERY);
        return dbRowList.stream().map(dbRow -> {
            Reservation reservation = new Reservation();
            reservation.setId(((Long) dbRow.get("id")));

            Offer offer = new Offer();
            offer.setId((Long) dbRow.get("offer_id"));
            offer.setTitle((String) dbRow.get("title"));
            offer.setPrice((BigDecimal) dbRow.get("price"));
            City city = new City();
            city.setTitle((String) dbRow.get("city_title"));
            offer.setCity(city);
            reservation.setOffer(offer);

            User user = new User();
            user.setFirstName((String) dbRow.get("first_name"));
            user.setLastName((String) dbRow.get("last_name"));
            reservation.setParticipants(List.of(user));

            reservation.setUserId((Long) dbRow.get("user_id"));
            reservation.setCheckIn(objectToLocalDate(dbRow.get("start_date")));
            reservation.setCheckOut(objectToLocalDate(dbRow.get("end_date")));
            return reservation;
        }).toList();
    }

    public void addReservation(Reservation reservation) {
        jdbcTemplate.update(RESERVATION_INSERT, getCurrentUserId(), reservation.getOffer().getId(), reservation.getCheckIn(), reservation.getCheckOut());
    }

}