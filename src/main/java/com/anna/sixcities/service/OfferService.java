package com.anna.sixcities.service;

import com.anna.sixcities.dao.OfferDao;
import com.anna.sixcities.model.Offer;
import com.anna.sixcities.model.OfferSearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfferService {

    @Autowired
    private OfferDao offerDao;

    public List<Offer> searchOffers(OfferSearchCriteria criteria) {
        return offerDao.searchOffers(criteria);
    }

    public void addFavorite(Long offerId, Long userId) {
        offerDao.addFavorite(offerId, userId);
    }

    public void deleteFavorite(Long offerId, Long userId) {
        offerDao.deleteFavorite(offerId, userId);
    }
}
