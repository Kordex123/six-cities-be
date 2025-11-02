package com.anna.sixcities.service;

import com.anna.sixcities.dao.OfferDao;
import com.anna.sixcities.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfferService {

    @Autowired
    private OfferDao offerDao;

    public List<Offer> getOffers() {
        return offerDao.getOffers();
    }
}
