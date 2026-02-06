package com.anna.sixcities.dao;

import com.anna.sixcities.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import static com.anna.sixcities.util.SecurityUtil.getCurrentUserId;

@Component
public class OfferDao {

    private static final String FAVORITE_OFFER_QUERY = """
            SELECT v.*,
                   CASE WHEN f.offer_id IS NOT NULL THEN 1 ELSE 0 END AS is_favorite
            FROM V_OFFER v
            LEFT JOIN favorite f ON v.id = f.offer_id AND f.user_id = ? 
            WHERE (CAST(? AS VARCHAR) IS NULL OR v.city_title = ?)
            AND v.max_adults >= COALESCE(?, v.max_adults)
            AND v.children >= COALESCE(?, v.children)
            AND v.bedrooms >= COALESCE(?, v.bedrooms)
            AND v.has_pets = COALESCE(?, v.has_pets)
            AND v.id not in (
                SELECT DISTINCT offer_id
                FROM reservation
                WHERE check_in < ? AND check_out > ?
            )
            ORDER BY v.id
            LIMIT 1000
            """;

    private static final String HOST_OFFER_QUERY = """
            SELECT v.*
            FROM V_OFFER v
            WHERE v.host_id = ?
            ORDER BY v.id
            LIMIT 1000
            """;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private ImageDao imageDao;

    @Autowired
    private AmenityDao amenityDao;

    public List<Offer> searchOffers(OfferSearchCriteria criteria) {
        List<Map<String, Object>> offerMapList = jdbcTemplate.queryForList(FAVORITE_OFFER_QUERY,
                getCurrentUserId(),
                criteria.getCity(),
                criteria.getCity(),
                criteria.getAdults(),
                criteria.getChildren(),
                criteria.getRooms(),
                criteria.getHasPets(),
                criteria.getCheckOut(),
                criteria.getCheckIn()
        );
        return mapToObject(offerMapList);
    }

    public void addOffer(Offer offer) {
        jdbcTemplate.update("""
                    INSERT INTO offer (
                        title, price, lat, lng, city_id, offer_type_id, rating, description,
                        bedrooms, max_adults, children, has_pets, host_id
                    ) VALUES (?, ?, ?, ?,
                              (SELECT ID FROM city WHERE title = ?),
                              ?, ?, ?, ?, ?, ?, ?, ?)
                """, offer.getTitle(), offer.getPrice(), offer.getPosition().getLat(), offer.getPosition().getLng(),
                offer.getCity().getTitle(), offer.getTypeId(), offer.getRating(), offer.getDescription(), offer.getBedrooms(),
                offer.getMaxAdults(), offer.getChildren(), offer.getHasPets(), getCurrentUserId());
    }
    public void updateOffer(Offer offer) {
        jdbcTemplate.update("""
                    UPDATE offer SET title = ?, price = ?, lat = ?, lng = ?,
                                     city_id = (SELECT ID FROM city WHERE title = ?),
                      offer_type_id = ?, rating = ?, description = ?, bedrooms = ?, max_adults = ?,
                      children = ?, has_pets = ? WHERE ID = ?
                """, offer.getTitle(), offer.getPrice(), offer.getPosition().getLat(), offer.getPosition().getLng(),
                offer.getCity().getTitle(), offer.getTypeId(), offer.getRating(), offer.getDescription(), offer.getBedrooms(), offer.getMaxAdults(), offer.getChildren(), offer.getHasPets(), offer.getId());
    }



    public void addFavorite(Long offerId) {
        jdbcTemplate.update("INSERT INTO favorite (offer_id, user_id) VALUES (?, ?)", offerId, getCurrentUserId());
    }

    public void deleteFavorite(Long offerId) {
        jdbcTemplate.update("DELETE FROM favorite WHERE offer_id = ? AND user_id = ?", offerId, getCurrentUserId());
    }

    public List<Offer> searchOffersForCurrentHost() {
        List<Map<String, Object>> offerMapForHostList = jdbcTemplate.queryForList(HOST_OFFER_QUERY,
                getCurrentUserId());
        return mapToObject(offerMapForHostList);
    }

    @NonNull
    private List<Offer> mapToObject(List<Map<String, Object>> offerMapForHostList) {
        List<Image> images = imageDao.searchImages();
        List<Amenity> amenities = amenityDao.searchAmenities();
         return offerMapForHostList.stream().map(offerMap -> {
            Offer offer = new Offer();
            offer.setId((Long) offerMap.get("id"));
            offer.setTitle((String) offerMap.get("title"));
            offer.setPrice((BigDecimal) offerMap.get("price"));
            offer.setPosition(new Position((BigDecimal) offerMap.get("lat"), (BigDecimal) offerMap.get("lng")));
            offer.setRating((BigDecimal) offerMap.get("rating"));
            offer.setDescription((String) offerMap.get("description"));
            offer.setBedrooms((Integer) offerMap.get("bedrooms"));
            offer.setMaxAdults((Integer) offerMap.get("max_adults"));
            offer.setChildren((Integer) offerMap.get("children"));
            offer.setType((String) offerMap.get("offer_type_name"));
            offer.setPreviewImage(new Image((String) offerMap.get("preview_image")));
            if (offerMap.containsKey("is_favorite")) {
                offer.setIsFavorite(((Integer) offerMap.get("is_favorite")) == 1);
            }
            offer.setHasPets((Boolean) offerMap.get("has_pets"));
            offer.setImages(images.stream().filter(image -> image.getOfferId().equals(offerMap.get("id"))).toList());
            offer.setAmenities(amenities.stream().filter(amenity -> amenity.getOfferId().equals(offerMap.get("id"))).toList());
            City offerCity = new City();
            offerCity.setTitle((String) offerMap.get("city_title"));
            offerCity.setId((Long) offerMap.get("city_id"));
            offer.setCity(offerCity);
            return offer;
        }).toList();
    }
}
