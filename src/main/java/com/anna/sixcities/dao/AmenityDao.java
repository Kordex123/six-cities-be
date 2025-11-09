package com.anna.sixcities.dao;

import com.anna.sixcities.model.Amenity;
import com.anna.sixcities.model.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class AmenityDao {

    private static final String AMENITY_QUERY = """
        SELECT * FROM AMENITY JOIN OFFER_AMENITY ON AMENITY.ID = OFFER_AMENITY.AMENITY_ID
        """;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Amenity> searchAmenities() {
        List<Map<String, Object>> amenityMapList = jdbcTemplate.queryForList(AMENITY_QUERY);
        return amenityMapList.stream().map(amenityMap -> {
            Amenity amenity = new Amenity();
            amenity.setId(((Number) amenityMap.get("id")).longValue());
            amenity.setOfferId((Long) amenityMap.get("offer_id"));
            amenity.setName((String) amenityMap.get("name"));
            return amenity;
        }).toList();
    }
}
