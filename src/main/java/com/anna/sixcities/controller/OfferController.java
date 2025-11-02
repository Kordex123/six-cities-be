package com.anna.sixcities.controller;

import com.anna.sixcities.model.Offer;
import com.anna.sixcities.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/offer")
public class OfferController {

    @Autowired
    private OfferService offerService;

    @GetMapping("/search")
    public List<Offer> getOffers() {
        return offerService.getOffers();
    }
}
