package com.anna.sixcities.service;

import com.anna.sixcities.dao.ReservationDao;
import com.anna.sixcities.model.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {

    @Autowired
    private ReservationDao reservationDao;

    public List<Reservation> searchReservation() {
        return reservationDao.searchReservations();
    }

    public void addReservation(Reservation reservation) {
        reservationDao.addReservation(reservation);
    }
}
