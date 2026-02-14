create view v_offer
            (id, title, price, lat, lng, rating, description, bedrooms, max_adults, children, has_pets, host_id,
             city_id, city_title, city_lat, city_lng, city_zoom, offer_type_id, offer_type_name, preview_image)
as
SELECT o.id,
       o.title,
       o.price,
       o.lat,
       o.lng,
       o.rating,
       o.description,
       o.bedrooms,
       o.max_adults,
       o.children,
       o.has_pets,
       o.host_id,
       c.id    AS city_id,
       c.title AS city_title,
       c.lat   AS city_lat,
       c.lng   AS city_lng,
       c.zoom  AS city_zoom,
       ot.id   AS offer_type_id,
       ot.name AS offer_type_name,
       i.name  AS preview_image
FROM offer o
         LEFT JOIN city c ON o.city_id = c.id
         LEFT JOIN offer_type ot ON o.offer_type_id = ot.id
         LEFT JOIN image i ON o.id = i.offer_id AND i.type::text = 'preview'::text;

alter table v_offer
    owner to postgres;

