package com.anna.sixcities.dao;

import com.anna.sixcities.model.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class FavoriteDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

//    public List<Favorite> searchFavorite() {
//        List<Map<String, Object>> imageMapList = jdbcTemplate.queryForList("SELECT * FROM IMAGE ORDER BY ID");
//        return imageMapList.stream().map(imageMap -> {
//            Image image = new Image();
//            image.setOfferId((Long) imageMap.get("offer_id"));
//            image.setName((String) imageMap.get("name"));
//            return image;
//        }).toList();
//    }
}

