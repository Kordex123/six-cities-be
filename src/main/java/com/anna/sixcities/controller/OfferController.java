package com.anna.sixcities.controller;

import com.anna.sixcities.model.Offer;
import com.anna.sixcities.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins="http://localhost:5173")
@RestController
@RequestMapping("/offer")
public class OfferController {

    @Autowired
    private OfferService offerService;

    @GetMapping("/search")
    public List<Offer> searchOffers() {
        return offerService.searchOffers();
    }

    @PostMapping("/favorite/add")
    public void addFavorite(@RequestParam Integer offerId, @RequestParam Integer userId) {
        offerService.addFavorite(offerId, userId);
    }

    @DeleteMapping("/favorite/delete")
    public void deleteFavorite(@RequestParam Integer offerId, @RequestParam Integer userId) {
        offerService.deleteFavorite(offerId, userId);
    }
}
