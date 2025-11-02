package com.anna.sixcities.dao;

import com.anna.sixcities.model.Offer;
import com.anna.sixcities.model.Position;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Component
public class OfferDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Offer> searchOffers() {
        List<Map<String,Object>> offers = jdbcTemplate.queryForList("SELECT ID, TITLE, LAT, LNG FROM OFFER ORDER BY ID");
        return offers.stream().map(offer -> new Offer((Integer) offer.get("id"), (String) offer.get("title"), new Position((BigDecimal) offer.get("lat"), (BigDecimal) offer.get("lng")))).toList();
    }
}
