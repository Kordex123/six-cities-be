package com.anna.sixcities.service;

import com.anna.sixcities.dao.OfferDao;
import com.anna.sixcities.model.Offer;
import com.anna.sixcities.model.OfferSearchCriteria;
import com.anna.sixcities.model.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Service
public class OfferService {

    @Autowired
    private OfferDao offerDao;

    public List<Offer> searchOffers(OfferSearchCriteria criteria) {
        return offerDao.searchOffers(criteria);
    }

    public void addOffer(Offer offer) {
        offerDao.addOffer(offer);
    }

    public void updateOffer(Offer offer) {
        offerDao.updateOffer(offer);
    }

    public List<Offer> searchOffersForCurrentHost() {
        return offerDao.searchOffersForCurrentHost();
    }

    public void addFavorite(Long offerId) {
        offerDao.addFavorite(offerId);
    }

    public void deleteFavorite(Long offerId) {
        offerDao.deleteFavorite(offerId);
    }
}
