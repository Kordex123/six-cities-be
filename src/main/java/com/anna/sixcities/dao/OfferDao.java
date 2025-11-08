package com.anna.sixcities.dao;

import com.anna.sixcities.model.City;
import com.anna.sixcities.model.Image;
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

    private static final String FAVORITE_OFFER_QUERY = """
        SELECT v.*,
               CASE WHEN f.offer_id IS NOT NULL THEN 1 ELSE 0 END AS is_favorite
        FROM V_OFFER v
        LEFT JOIN favorite f ON v.id = f.offer_id AND f.user_id = ?
        ORDER BY v.id
        """;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private ImageDao imageDao;

    public List<Offer> searchOffers() {
        List<Map<String,Object>> offerMapList = jdbcTemplate.queryForList(FAVORITE_OFFER_QUERY, 1);
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
            offer.setPreviewImage(new Image((String) offerMap.get("preview_image")));
            offer.setIsFavorite(((Integer) offerMap.get("is_favorite")) == 1);
            offer.setImages(imageDao.searchImages().stream().filter(image ->image.getOfferId().intValue() == (Integer) offerMap.get("id")).toList());
            offer.setGoods(List.of());
            City city = new City();
            city.setTitle((String) offerMap.get("city_title"));
            city.setId((Long) offerMap.get("city_id"));
            offer.setCity(city);
            return offer;
        }).toList();
    }

    public void addFavorite(Integer offerId, Integer userId) {
        jdbcTemplate.update("INSERT INTO favorite (offer_id, user_id) VALUES (?, ?)", offerId, userId);
    }

    public void deleteFavorite(Integer offerId, Integer userId) {
        jdbcTemplate.update("DELETE FROM favorite WHERE offer_id = ? AND user_id = ?", offerId, userId);
    }
}
