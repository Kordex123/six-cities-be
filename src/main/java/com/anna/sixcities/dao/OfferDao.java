package com.anna.sixcities.dao;

import com.anna.sixcities.model.City;
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

    @Autowired
    private ImageDao imageDao;

    public List<Offer> searchOffers() {
        List<Map<String,Object>> offerMapList = jdbcTemplate.queryForList("SELECT * FROM V_OFFER ORDER BY ID");
        return offerMapList.stream().map(offerMap -> {
            Offer offer = new Offer();
            offer.setId((Integer) offerMap.get("id"));
            offer.setTitle((String) offerMap.get("title"));
            offer.setPrice((BigDecimal) offerMap.get("price"));
            offer.setPosition(new Position((BigDecimal) offerMap.get("lat"), (BigDecimal) offerMap.get("lng")));
            offer.setRating((Integer) offerMap.get("rating"));
            offer.setDescription((String) offerMap.get("description"));
            offer.setBedrooms((Integer) offerMap.get("bedrooms"));
            offer.setMaxAdults((Integer) offerMap.get("max_adults"));
            offer.setPreviewImage((String) offerMap.get("preview_image"));

            offer.setImages(imageDao.searchImages().stream().filter(image -> image.getOfferId() == offerMap.get("id")).toList());
            offer.setGoods(List.of());
            City city = new City();
            city.setTitle((String) offerMap.get("city_title"));
            city.setId((Long) offerMap.get("city_id"));
            offer.setCity(city);
            return offer;
        }).toList();
    }
}
