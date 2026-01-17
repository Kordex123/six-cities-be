package com.anna.sixcities.controller;

import com.anna.sixcities.model.Favorite;
import com.anna.sixcities.model.Offer;
import com.anna.sixcities.model.OfferSearchCriteria;
import com.anna.sixcities.model.Review;
import com.anna.sixcities.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.anna.sixcities.util.SecurityUtil.getCurrentUserId;

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

    @GetMapping("/search/current-host")
    public List<Offer> searchOffersForCurrentHost() {
        return offerService.searchOffersForCurrentHost();
    }

    @PostMapping("/add")
    public Offer addOffer(@RequestBody Offer offer) {
        offerService.addOffer(offer);
        return offer;
    }

    @PostMapping("/favorite/add")
    public Favorite addFavorite(@RequestParam Long offerId) {
        offerService.addFavorite(offerId);
        return new Favorite(offerId, getCurrentUserId());
    }

    @DeleteMapping("/favorite/delete")
    public Favorite deleteFavorite(@RequestParam Long offerId) {
        offerService.deleteFavorite(offerId);
        return new Favorite(offerId, getCurrentUserId());
    }
 }
