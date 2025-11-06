package com.anna.sixcities.model;

import java.math.BigDecimal;
import java.util.List;

public class Offer {
    private Integer id;
    private String title;
    private BigDecimal price;
    private Position position;
    private Integer rating;
    private String description;
    private Integer bedrooms;
    private Integer maxAdults;
    private City city;
    private String previewImage;
    private List<Image> images;
    private List<String> goods;

    public Offer() { }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {

        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public BigDecimal getPrice() {
        return price;
    }
    public void setPrice(BigDecimal price) {

        this.price = price;
    }
    public Position getPosition() { return position; }
    public void setPosition(Position position) {

        this.position = position;
    }
    public Integer getRating() {
        return rating;
    }
    public void setRating(Integer rating) {

        this.rating = rating;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {

        this.description = description;
    }
    public Integer getBedrooms() {
        return bedrooms;
    }
    public void setBedrooms(Integer bedrooms) {

        this.bedrooms = bedrooms;
    }
    public Integer getMaxAdults() {
        return maxAdults;
    }
    public void setMaxAdults(Integer maxAdults) {

        this.maxAdults = maxAdults;
    }
    public City getCity() {
        return city;
    }
    public void setCity(City city) {
        this.city = city;
    }
    public String getPreviewImage() {
        return previewImage;
    }
    public void setPreviewImage(String previewImage) {
        this.previewImage = previewImage;
    }
    public List<Image> getImages() {
        return images;
    }
    public void setImages(List<Image> images) {
        this.images = images;
    }

    public List<String> getGoods() {
        return goods;
    }
    public void setGoods(List<String> goods) {
        this.goods = goods;
    }
}
