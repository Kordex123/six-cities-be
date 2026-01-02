package com.anna.sixcities.controller;

import com.anna.sixcities.model.Favorite;
import com.anna.sixcities.model.Offer;
import com.anna.sixcities.model.OfferSearchCriteria;
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
    public List<Offer> searchOffers(OfferSearchCriteria criteria) {
        return offerService.searchOffers(criteria);
    }

    @PostMapping("/favorite/add")
    public Favorite addFavorite(@RequestParam Long offerId, @RequestParam Long userId) {
        offerService.addFavorite(offerId, userId);
        return new Favorite(offerId, userId);
    }

    @DeleteMapping("/favorite/delete")
    public Favorite deleteFavorite(@RequestParam Long offerId, @RequestParam Long userId) {
        offerService.deleteFavorite(offerId, userId);
        return new Favorite(offerId, userId);
    }
 }
