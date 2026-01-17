package com.anna.sixcities.model;

import java.math.BigDecimal;
import java.util.List;

public class Offer {
    private Integer id;
    private String title;
    private BigDecimal price;
    private Position position;
    private BigDecimal rating;
    private String description;
    private Integer bedrooms;
    private Integer maxAdults;
    private City city;
    private Image previewImage;
    private List<Image> images;
    private List<Amenity> amenities;
    private boolean isFavorite;
    private String type;

    private Long typeId;
    private Integer children;
    private boolean hasPets;

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
    public BigDecimal getRating() {
        return rating;
    }
    public void setRating(BigDecimal rating) {

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

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }
    public City getCity() {
        return city;
    }
    public void setCity(City city) {
        this.city = city;
    }
    public Image getPreviewImage() {
        return previewImage;
    }
    public void setPreviewImage(Image previewImage) {
        this.previewImage = previewImage;
    }
    public List<Image> getImages() {
        return images;
    }
    public void setImages(List<Image> images) {
        this.images = images;
    }

    public List<Amenity> getAmenities() {
        return amenities;
    }
    public void setAmenities(List<Amenity> amenities) {
        this.amenities = amenities;
    }

    public void setIsFavorite(boolean isFavorite) {
        this.isFavorite = isFavorite;
    }
    public boolean getIsFavorite() {
        return isFavorite;
    }

    public Integer getChildren() {
        return children;
    }
    public void setChildren(Integer children) {
        this.children = children;
    }
    public boolean getHasPets() {
        return hasPets;
    }
    public void setHasPets(boolean hasPets) {
        this.hasPets = hasPets;
    }
}

