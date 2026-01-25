package com.anna.sixcities.controller;

import com.anna.sixcities.model.Reservation;
import com.anna.sixcities.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reservation")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @PostMapping("/search")
    public List<Reservation> searchReservation() {
        return reservationService.searchReservation();
    }

    @PostMapping("/add")
    public Reservation addReservation(@RequestBody Reservation reservation) {
        reservationService.addReservation(reservation);
        return reservation;
    }
}

