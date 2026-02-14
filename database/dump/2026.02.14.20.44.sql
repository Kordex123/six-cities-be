--
-- PostgreSQL database dump
--

\restrict LDStMORUKXldTZbTkbM1AAl1NBS8o5O8Db1d1JWM7i1zFao5wB7ZWgb02W7Ca29

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: amenity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amenity (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.amenity OWNER TO postgres;

--
-- Name: amenity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amenity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.amenity_id_seq OWNER TO postgres;

--
-- Name: amenity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amenity_id_seq OWNED BY public.amenity.id;


--
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    id bigint NOT NULL,
    login character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255)
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id bigint NOT NULL,
    lat numeric(10,8) NOT NULL,
    lng numeric(11,8) NOT NULL,
    zoom integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_id_seq OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite (
    offer_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.favorite OWNER TO postgres;

--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    offer_id bigint NOT NULL,
    type character varying(50),
    column_name integer
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.image_id_seq OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- Name: offer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.offer_id_seq
    AS integer
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.offer_id_seq OWNER TO postgres;

--
-- Name: offer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offer (
    id bigint DEFAULT nextval('public.offer_id_seq'::regclass) NOT NULL,
    title text,
    price numeric(10,2),
    lat numeric(10,6),
    lng numeric(10,6),
    city_id bigint,
    offer_type_id bigint,
    rating numeric,
    description text,
    bedrooms smallint,
    max_adults smallint,
    children smallint,
    has_pets boolean,
    host_id integer
);


ALTER TABLE public.offer OWNER TO postgres;

--
-- Name: offer_amenity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offer_amenity (
    offer_id bigint NOT NULL,
    amenity_id bigint NOT NULL
);


ALTER TABLE public.offer_amenity OWNER TO postgres;

--
-- Name: offer_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offer_type (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.offer_type OWNER TO postgres;

--
-- Name: offer_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.offer_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.offer_type_id_seq OWNER TO postgres;

--
-- Name: offer_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.offer_type_id_seq OWNED BY public.offer_type.id;


--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permission_id_seq OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id bigint NOT NULL,
    offer_id bigint NOT NULL,
    user_id bigint NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservation_id_seq OWNER TO postgres;

--
-- Name: reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id;


--
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    id bigint NOT NULL,
    offer_id bigint NOT NULL,
    user_id bigint NOT NULL,
    description text,
    rating integer NOT NULL,
    creation_date timestamp without time zone,
    CONSTRAINT review_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_id_seq OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public.app_user.id;


--
-- Name: user_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_permission (
    user_id bigint NOT NULL,
    permission_id bigint NOT NULL
);


ALTER TABLE public.user_permission OWNER TO postgres;

--
-- Name: v_offer; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_offer AS
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
    c.id AS city_id,
    c.title AS city_title,
    c.lat AS city_lat,
    c.lng AS city_lng,
    c.zoom AS city_zoom,
    ot.id AS offer_type_id,
    ot.name AS offer_type_name,
    i.name AS preview_image
   FROM (((public.offer o
     LEFT JOIN public.city c ON ((o.city_id = c.id)))
     LEFT JOIN public.offer_type ot ON ((o.offer_type_id = ot.id)))
     LEFT JOIN public.image i ON (((o.id = i.offer_id) AND ((i.type)::text = 'preview'::text))));


ALTER VIEW public.v_offer OWNER TO postgres;

--
-- Name: amenity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenity ALTER COLUMN id SET DEFAULT nextval('public.amenity_id_seq'::regclass);


--
-- Name: app_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- Name: offer_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_type ALTER COLUMN id SET DEFAULT nextval('public.offer_type_id_seq'::regclass);


--
-- Name: permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission ALTER COLUMN id SET DEFAULT nextval('public.permission_id_seq'::regclass);


--
-- Name: reservation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);


--
-- Name: review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- Data for Name: amenity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.amenity VALUES (1, 'WiFi');
INSERT INTO public.amenity VALUES (2, 'Air Conditioning');
INSERT INTO public.amenity VALUES (3, 'Heating');
INSERT INTO public.amenity VALUES (4, 'Kitchen');
INSERT INTO public.amenity VALUES (5, 'Washing Machine');
INSERT INTO public.amenity VALUES (6, 'Dryer');
INSERT INTO public.amenity VALUES (7, 'TV');
INSERT INTO public.amenity VALUES (8, 'Parking');
INSERT INTO public.amenity VALUES (9, 'Elevator');
INSERT INTO public.amenity VALUES (10, 'Balcony');
INSERT INTO public.amenity VALUES (11, 'Terrace');
INSERT INTO public.amenity VALUES (12, 'Garden');
INSERT INTO public.amenity VALUES (13, 'Pool');
INSERT INTO public.amenity VALUES (14, 'Gym');
INSERT INTO public.amenity VALUES (15, 'Hot Tub');
INSERT INTO public.amenity VALUES (16, 'Sauna');
INSERT INTO public.amenity VALUES (17, 'Fireplace');
INSERT INTO public.amenity VALUES (18, 'BBQ Grill');
INSERT INTO public.amenity VALUES (19, 'Dishwasher');
INSERT INTO public.amenity VALUES (20, 'Microwave');
INSERT INTO public.amenity VALUES (21, 'Coffee Maker');
INSERT INTO public.amenity VALUES (22, 'Iron');
INSERT INTO public.amenity VALUES (23, 'Hair Dryer');
INSERT INTO public.amenity VALUES (24, 'Bed Linens');
INSERT INTO public.amenity VALUES (25, 'Towels');
INSERT INTO public.amenity VALUES (26, 'Shampoo');
INSERT INTO public.amenity VALUES (27, 'Workspace');
INSERT INTO public.amenity VALUES (28, 'Baby Crib');
INSERT INTO public.amenity VALUES (29, 'High Chair');
INSERT INTO public.amenity VALUES (30, 'Smoke Detector');
INSERT INTO public.amenity VALUES (31, 'Carbon Monoxide Detector');
INSERT INTO public.amenity VALUES (32, 'First Aid Kit');
INSERT INTO public.amenity VALUES (33, 'Fire Extinguisher');
INSERT INTO public.amenity VALUES (34, 'Security Cameras');
INSERT INTO public.amenity VALUES (35, 'Smart Lock');
INSERT INTO public.amenity VALUES (36, 'Doorman');
INSERT INTO public.amenity VALUES (37, 'Pet Friendly');
INSERT INTO public.amenity VALUES (38, 'Beach Access');
INSERT INTO public.amenity VALUES (39, 'Ski In/Out');
INSERT INTO public.amenity VALUES (40, 'Bicycle');
INSERT INTO public.amenity VALUES (41, 'Board Games');
INSERT INTO public.amenity VALUES (42, 'Books');
INSERT INTO public.amenity VALUES (43, 'Sound System');
INSERT INTO public.amenity VALUES (44, 'Piano');
INSERT INTO public.amenity VALUES (45, 'Outdoor Furniture');
INSERT INTO public.amenity VALUES (46, 'Hammock');
INSERT INTO public.amenity VALUES (47, 'Lake Access');
INSERT INTO public.amenity VALUES (48, 'Mountain View');
INSERT INTO public.amenity VALUES (49, 'City View');
INSERT INTO public.amenity VALUES (50, 'Sea View');


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.app_user VALUES (2, 'maria_garcia', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'maria.garcia@email.com', 'Maria', 'Garcia');
INSERT INTO public.app_user VALUES (3, 'hans_mueller', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'hans.mueller@email.com', 'Hans', 'Mueller');
INSERT INTO public.app_user VALUES (4, 'sophie_martin', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'sophie.martin@email.com', 'Sophie', 'Martin');
INSERT INTO public.app_user VALUES (5, 'luca_rossi', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'luca.rossi@email.com', 'Luca', 'Rossi');
INSERT INTO public.app_user VALUES (6, 'anna_kowalski', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'anna.kowalski@email.com', 'Anna', 'Kowalski');
INSERT INTO public.app_user VALUES (7, 'pierre_dubois', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'pierre.dubois@email.com', 'Pierre', 'Dubois');
INSERT INTO public.app_user VALUES (8, 'elena_papadopoulos', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'elena.papadopoulos@email.com', 'Elena', 'Papadopoulos');
INSERT INTO public.app_user VALUES (9, 'marco_ferrari', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'marco.ferrari@email.com', 'Marco', 'Ferrari');
INSERT INTO public.app_user VALUES (10, 'julia_van_dijk', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'julia.vandijk@email.com', 'Julia', 'Van');
INSERT INTO public.app_user VALUES (11, 'carlos_sanchez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'carlos.sanchez@email.com', 'Carlos', 'Sanchez');
INSERT INTO public.app_user VALUES (12, 'isabelle_laurent', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'isabelle.laurent@email.com', 'Isabelle', 'Laurent');
INSERT INTO public.app_user VALUES (13, 'thomas_schmidt', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'thomas.schmidt@email.com', 'Thomas', 'Schmidt');
INSERT INTO public.app_user VALUES (14, 'katerina_novak', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'katerina.novak@email.com', 'Katerina', 'Novak');
INSERT INTO public.app_user VALUES (15, 'antonio_martinez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'antonio.martinez@email.com', 'Antonio', 'Martinez');
INSERT INTO public.app_user VALUES (16, 'charlotte_dupont', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'charlotte.dupont@email.com', 'Charlotte', 'Dupont');
INSERT INTO public.app_user VALUES (17, 'dimitri_vasiliou', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'dimitri.vasiliou@email.com', 'Dimitri', 'Vasiliou');
INSERT INTO public.app_user VALUES (18, 'francesco_bianchi', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'francesco.bianchi@email.com', 'Francesco', 'Bianchi');
INSERT INTO public.app_user VALUES (19, 'emma_janssen', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'emma.janssen@email.com', 'Emma', 'Janssen');
INSERT INTO public.app_user VALUES (20, 'pablo_rodriguez', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'pablo.rodriguez@email.com', 'Pablo', 'Rodriguez');
INSERT INTO public.app_user VALUES (21, 'zbyszek_mistrz', 'geniusz123', 'zbyszek.mistrz@interia.pl', 'Zbyszek', 'Mistrz');
INSERT INTO public.app_user VALUES (25, 'Login', 'Aaaa1234', 'aaa@gmail.com', 'Ala', 'Ma');
INSERT INTO public.app_user VALUES (26, 'aaaaa', 'aaa', 'a@a.pl', 'a', 'a');
INSERT INTO public.app_user VALUES (27, 'bbbb', 'bbb', 'b@b.pl', 'bbb', 'bbb');
INSERT INTO public.app_user VALUES (28, 'magda', 'magda', 'magda@magda.pl', 'Magda', 'M');
INSERT INTO public.app_user VALUES (29, 'admin', 'admin', 'admin@admin.pl', 'Jana', 'Fabijanska');
INSERT INTO public.app_user VALUES (1, 'john_doe', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'john.doe@email.com', 'John', 'Doe');


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.city VALUES (1, 37.98380000, 23.72750000, 12, 'Athens');
INSERT INTO public.city VALUES (2, 41.90280000, 12.49640000, 12, 'Rome');
INSERT INTO public.city VALUES (3, 52.22970000, 21.01220000, 12, 'Warsaw');
INSERT INTO public.city VALUES (4, 48.85660000, 2.35220000, 12, 'Paris');
INSERT INTO public.city VALUES (5, 40.41680000, -3.70380000, 12, 'Madrid');
INSERT INTO public.city VALUES (6, 52.36760000, 4.90410000, 12, 'Amsterdam');
INSERT INTO public.city VALUES (7, 50.85030000, 4.35170000, 12, 'Brussels');


--
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.favorite VALUES (21, 1);
INSERT INTO public.favorite VALUES (47, 1);
INSERT INTO public.favorite VALUES (2, 2);
INSERT INTO public.favorite VALUES (36, 2);
INSERT INTO public.favorite VALUES (30, 3);
INSERT INTO public.favorite VALUES (43, 3);
INSERT INTO public.favorite VALUES (4, 4);
INSERT INTO public.favorite VALUES (18, 4);
INSERT INTO public.favorite VALUES (73, 4);
INSERT INTO public.favorite VALUES (6, 5);
INSERT INTO public.favorite VALUES (24, 5);
INSERT INTO public.favorite VALUES (13, 6);
INSERT INTO public.favorite VALUES (26, 6);
INSERT INTO public.favorite VALUES (67, 6);
INSERT INTO public.favorite VALUES (27, 7);
INSERT INTO public.favorite VALUES (7, 8);
INSERT INTO public.favorite VALUES (34, 8);
INSERT INTO public.favorite VALUES (9, 9);
INSERT INTO public.favorite VALUES (28, 9);
INSERT INTO public.favorite VALUES (62, 9);
INSERT INTO public.favorite VALUES (20, 10);
INSERT INTO public.favorite VALUES (40, 10);
INSERT INTO public.favorite VALUES (10, 11);
INSERT INTO public.favorite VALUES (44, 11);
INSERT INTO public.favorite VALUES (11, 12);
INSERT INTO public.favorite VALUES (31, 12);
INSERT INTO public.favorite VALUES (12, 13);
INSERT INTO public.favorite VALUES (14, 14);
INSERT INTO public.favorite VALUES (33, 14);
INSERT INTO public.favorite VALUES (8, 15);
INSERT INTO public.favorite VALUES (19, 15);
INSERT INTO public.favorite VALUES (15, 1);
INSERT INTO public.favorite VALUES (4, 1);
INSERT INTO public.favorite VALUES (4, 27);
INSERT INTO public.favorite VALUES (5, 27);
INSERT INTO public.favorite VALUES (8, 27);
INSERT INTO public.favorite VALUES (9, 27);
INSERT INTO public.favorite VALUES (2, 26);
INSERT INTO public.favorite VALUES (1, 26);
INSERT INTO public.favorite VALUES (3, 26);
INSERT INTO public.favorite VALUES (4, 26);
INSERT INTO public.favorite VALUES (6, 26);
INSERT INTO public.favorite VALUES (5, 26);
INSERT INTO public.favorite VALUES (2, 21);
INSERT INTO public.favorite VALUES (1, 21);
INSERT INTO public.favorite VALUES (4, 21);
INSERT INTO public.favorite VALUES (3, 21);


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image VALUES (2, 'bedroom', 1, NULL, NULL);
INSERT INTO public.image VALUES (3, 'kitchen_view', 1, NULL, NULL);
INSERT INTO public.image VALUES (4, 'balcony', 1, NULL, NULL);
INSERT INTO public.image VALUES (5, 'bathroom', 1, NULL, NULL);
INSERT INTO public.image VALUES (6, 'street_view', 1, NULL, NULL);
INSERT INTO public.image VALUES (8, 'master_bedroom', 2, NULL, NULL);
INSERT INTO public.image VALUES (9, 'villa_exterior', 2, NULL, NULL);
INSERT INTO public.image VALUES (10, 'pool_area', 2, NULL, NULL);
INSERT INTO public.image VALUES (11, 'dining_room', 2, NULL, NULL);
INSERT INTO public.image VALUES (12, 'terrace', 2, NULL, NULL);
INSERT INTO public.image VALUES (14, 'bed_area', 3, NULL, NULL);
INSERT INTO public.image VALUES (15, 'kitchenette', 3, NULL, NULL);
INSERT INTO public.image VALUES (16, 'window_view', 3, NULL, NULL);
INSERT INTO public.image VALUES (17, 'entrance', 3, NULL, NULL);
INSERT INTO public.image VALUES (18, 'bathroom', 3, NULL, NULL);
INSERT INTO public.image VALUES (20, 'bedroom_loft', 4, NULL, NULL);
INSERT INTO public.image VALUES (21, 'exposed_brick', 4, NULL, NULL);
INSERT INTO public.image VALUES (22, 'kitchen', 4, NULL, NULL);
INSERT INTO public.image VALUES (23, 'bathroom', 4, NULL, NULL);
INSERT INTO public.image VALUES (24, 'city_view', 4, NULL, NULL);
INSERT INTO public.image VALUES (26, 'master_suite', 5, NULL, NULL);
INSERT INTO public.image VALUES (27, 'living_area', 5, NULL, NULL);
INSERT INTO public.image VALUES (28, 'terrace', 5, NULL, NULL);
INSERT INTO public.image VALUES (29, 'kitchen', 5, NULL, NULL);
INSERT INTO public.image VALUES (30, 'bathroom', 5, NULL, NULL);
INSERT INTO public.image VALUES (32, 'living_room', 6, NULL, NULL);
INSERT INTO public.image VALUES (33, 'bedroom', 6, NULL, NULL);
INSERT INTO public.image VALUES (34, 'kitchen', 6, NULL, NULL);
INSERT INTO public.image VALUES (35, 'bathroom', 6, NULL, NULL);
INSERT INTO public.image VALUES (36, 'entrance', 6, NULL, NULL);
INSERT INTO public.image VALUES (38, 'garden', 7, NULL, NULL);
INSERT INTO public.image VALUES (39, 'living_room', 7, NULL, NULL);
INSERT INTO public.image VALUES (40, 'bedroom', 7, NULL, NULL);
INSERT INTO public.image VALUES (41, 'kitchen', 7, NULL, NULL);
INSERT INTO public.image VALUES (42, 'bathroom', 7, NULL, NULL);
INSERT INTO public.image VALUES (44, 'living_room', 8, NULL, NULL);
INSERT INTO public.image VALUES (45, 'bedroom', 8, NULL, NULL);
INSERT INTO public.image VALUES (46, 'balcony', 8, NULL, NULL);
INSERT INTO public.image VALUES (47, 'kitchen', 8, NULL, NULL);
INSERT INTO public.image VALUES (48, 'bathroom', 8, NULL, NULL);
INSERT INTO public.image VALUES (50, 'upper_floor', 9, NULL, NULL);
INSERT INTO public.image VALUES (51, 'bedroom', 9, NULL, NULL);
INSERT INTO public.image VALUES (52, 'kitchen', 9, NULL, NULL);
INSERT INTO public.image VALUES (53, 'bathroom', 9, NULL, NULL);
INSERT INTO public.image VALUES (54, 'terrace', 9, NULL, NULL);
INSERT INTO public.image VALUES (56, 'garden', 10, NULL, NULL);
INSERT INTO public.image VALUES (57, 'living_room', 10, NULL, NULL);
INSERT INTO public.image VALUES (58, 'bedroom', 10, NULL, NULL);
INSERT INTO public.image VALUES (59, 'kitchen', 10, NULL, NULL);
INSERT INTO public.image VALUES (60, 'bathroom', 10, NULL, NULL);
INSERT INTO public.image VALUES (62, 'work_area', 11, NULL, NULL);
INSERT INTO public.image VALUES (63, 'bed_space', 11, NULL, NULL);
INSERT INTO public.image VALUES (64, 'kitchen', 11, NULL, NULL);
INSERT INTO public.image VALUES (65, 'bathroom', 11, NULL, NULL);
INSERT INTO public.image VALUES (66, 'window', 11, NULL, NULL);
INSERT INTO public.image VALUES (68, 'living_room', 12, NULL, NULL);
INSERT INTO public.image VALUES (69, 'bedroom', 12, NULL, NULL);
INSERT INTO public.image VALUES (70, 'balcony', 12, NULL, NULL);
INSERT INTO public.image VALUES (71, 'kitchen', 12, NULL, NULL);
INSERT INTO public.image VALUES (72, 'bathroom', 12, NULL, NULL);
INSERT INTO public.image VALUES (74, 'living_area', 13, NULL, NULL);
INSERT INTO public.image VALUES (75, 'bedroom', 13, NULL, NULL);
INSERT INTO public.image VALUES (76, 'kitchen', 13, NULL, NULL);
INSERT INTO public.image VALUES (77, 'bathroom', 13, NULL, NULL);
INSERT INTO public.image VALUES (78, 'rooftop', 13, NULL, NULL);
INSERT INTO public.image VALUES (80, 'penthouse_living', 14, NULL, NULL);
INSERT INTO public.image VALUES (81, 'master_bedroom', 14, NULL, NULL);
INSERT INTO public.image VALUES (82, 'kitchen', 14, NULL, NULL);
INSERT INTO public.image VALUES (83, 'terrace', 14, NULL, NULL);
INSERT INTO public.image VALUES (84, 'bathroom', 14, NULL, NULL);
INSERT INTO public.image VALUES (86, 'living_room', 15, NULL, NULL);
INSERT INTO public.image VALUES (87, 'bedroom', 15, NULL, NULL);
INSERT INTO public.image VALUES (88, 'kitchen', 15, NULL, NULL);
INSERT INTO public.image VALUES (89, 'bathroom', 15, NULL, NULL);
INSERT INTO public.image VALUES (90, 'balcony', 15, NULL, NULL);
INSERT INTO public.image VALUES (92, 'living_room', 16, NULL, NULL);
INSERT INTO public.image VALUES (93, 'dining_room', 16, NULL, NULL);
INSERT INTO public.image VALUES (94, 'master_bedroom', 16, NULL, NULL);
INSERT INTO public.image VALUES (95, 'kitchen', 16, NULL, NULL);
INSERT INTO public.image VALUES (96, 'garden', 16, NULL, NULL);
INSERT INTO public.image VALUES (98, 'garden_view', 17, NULL, NULL);
INSERT INTO public.image VALUES (99, 'living_room', 17, NULL, NULL);
INSERT INTO public.image VALUES (100, 'bedroom', 17, NULL, NULL);
INSERT INTO public.image VALUES (101, 'kitchen', 17, NULL, NULL);
INSERT INTO public.image VALUES (102, 'bathroom', 17, NULL, NULL);
INSERT INTO public.image VALUES (104, 'condo_living', 18, NULL, NULL);
INSERT INTO public.image VALUES (105, 'bedroom', 18, NULL, NULL);
INSERT INTO public.image VALUES (106, 'balcony', 18, NULL, NULL);
INSERT INTO public.image VALUES (107, 'kitchen', 18, NULL, NULL);
INSERT INTO public.image VALUES (108, 'bathroom', 18, NULL, NULL);
INSERT INTO public.image VALUES (110, 'living_room', 19, NULL, NULL);
INSERT INTO public.image VALUES (111, 'upper_bedroom', 19, NULL, NULL);
INSERT INTO public.image VALUES (112, 'kitchen', 19, NULL, NULL);
INSERT INTO public.image VALUES (113, 'bathroom', 19, NULL, NULL);
INSERT INTO public.image VALUES (114, 'balcony', 19, NULL, NULL);
INSERT INTO public.image VALUES (116, 'living_space', 20, NULL, NULL);
INSERT INTO public.image VALUES (117, 'bedroom', 20, NULL, NULL);
INSERT INTO public.image VALUES (118, 'kitchen', 20, NULL, NULL);
INSERT INTO public.image VALUES (119, 'bathroom', 20, NULL, NULL);
INSERT INTO public.image VALUES (120, 'patio', 20, NULL, NULL);
INSERT INTO public.image VALUES (122, 'penthouse_interior', 21, NULL, NULL);
INSERT INTO public.image VALUES (123, 'master_suite', 21, NULL, NULL);
INSERT INTO public.image VALUES (124, 'living_room', 21, NULL, NULL);
INSERT INTO public.image VALUES (125, 'terrace', 21, NULL, NULL);
INSERT INTO public.image VALUES (126, 'kitchen', 21, NULL, NULL);
INSERT INTO public.image VALUES (128, 'bedroom', 22, NULL, NULL);
INSERT INTO public.image VALUES (129, 'kitchen', 22, NULL, NULL);
INSERT INTO public.image VALUES (130, 'bathroom', 22, NULL, NULL);
INSERT INTO public.image VALUES (131, 'balcony', 22, NULL, NULL);
INSERT INTO public.image VALUES (132, 'entrance', 22, NULL, NULL);
INSERT INTO public.image VALUES (134, 'industrial_look', 23, NULL, NULL);
INSERT INTO public.image VALUES (135, 'bedroom', 23, NULL, NULL);
INSERT INTO public.image VALUES (136, 'kitchen', 23, NULL, NULL);
INSERT INTO public.image VALUES (137, 'bathroom', 23, NULL, NULL);
INSERT INTO public.image VALUES (138, 'windows', 23, NULL, NULL);
INSERT INTO public.image VALUES (140, 'studio_interior', 24, NULL, NULL);
INSERT INTO public.image VALUES (141, 'bed_area', 24, NULL, NULL);
INSERT INTO public.image VALUES (142, 'kitchen', 24, NULL, NULL);
INSERT INTO public.image VALUES (25, 'penthouse_view', 5, 'preview', NULL);
INSERT INTO public.image VALUES (31, 'canal_view', 6, 'preview', NULL);
INSERT INTO public.image VALUES (37, 'cottage_exterior', 7, 'preview', NULL);
INSERT INTO public.image VALUES (143, 'bathroom', 24, NULL, NULL);
INSERT INTO public.image VALUES (144, 'view', 24, NULL, NULL);
INSERT INTO public.image VALUES (146, 'bedroom', 25, NULL, NULL);
INSERT INTO public.image VALUES (147, 'dining_area', 25, NULL, NULL);
INSERT INTO public.image VALUES (148, 'kitchen', 25, NULL, NULL);
INSERT INTO public.image VALUES (149, 'bathroom', 25, NULL, NULL);
INSERT INTO public.image VALUES (150, 'balcony', 25, NULL, NULL);
INSERT INTO public.image VALUES (152, 'open_space', 26, NULL, NULL);
INSERT INTO public.image VALUES (153, 'bedroom', 26, NULL, NULL);
INSERT INTO public.image VALUES (154, 'kitchen', 26, NULL, NULL);
INSERT INTO public.image VALUES (155, 'bathroom', 26, NULL, NULL);
INSERT INTO public.image VALUES (156, 'terrace', 26, NULL, NULL);
INSERT INTO public.image VALUES (158, 'living_room', 27, NULL, NULL);
INSERT INTO public.image VALUES (159, 'bedroom', 27, NULL, NULL);
INSERT INTO public.image VALUES (160, 'office', 27, NULL, NULL);
INSERT INTO public.image VALUES (161, 'kitchen', 27, NULL, NULL);
INSERT INTO public.image VALUES (162, 'garden', 27, NULL, NULL);
INSERT INTO public.image VALUES (164, 'bedroom', 28, NULL, NULL);
INSERT INTO public.image VALUES (165, 'balcony', 28, NULL, NULL);
INSERT INTO public.image VALUES (166, 'kitchen', 28, NULL, NULL);
INSERT INTO public.image VALUES (167, 'bathroom', 28, NULL, NULL);
INSERT INTO public.image VALUES (168, 'entrance', 28, NULL, NULL);
INSERT INTO public.image VALUES (170, 'bed_space', 29, NULL, NULL);
INSERT INTO public.image VALUES (171, 'kitchen', 29, NULL, NULL);
INSERT INTO public.image VALUES (172, 'bathroom', 29, NULL, NULL);
INSERT INTO public.image VALUES (173, 'window', 29, NULL, NULL);
INSERT INTO public.image VALUES (174, 'entrance', 29, NULL, NULL);
INSERT INTO public.image VALUES (176, 'garden', 30, NULL, NULL);
INSERT INTO public.image VALUES (177, 'living_room', 30, NULL, NULL);
INSERT INTO public.image VALUES (178, 'master_bedroom', 30, NULL, NULL);
INSERT INTO public.image VALUES (179, 'kitchen', 30, NULL, NULL);
INSERT INTO public.image VALUES (180, 'pool', 30, NULL, NULL);
INSERT INTO public.image VALUES (182, 'bedroom', 31, NULL, NULL);
INSERT INTO public.image VALUES (183, 'dining_room', 31, NULL, NULL);
INSERT INTO public.image VALUES (184, 'kitchen', 31, NULL, NULL);
INSERT INTO public.image VALUES (185, 'bathroom', 31, NULL, NULL);
INSERT INTO public.image VALUES (186, 'balcony', 31, NULL, NULL);
INSERT INTO public.image VALUES (188, 'bed_area', 32, NULL, NULL);
INSERT INTO public.image VALUES (189, 'kitchen', 32, NULL, NULL);
INSERT INTO public.image VALUES (190, 'bathroom', 32, NULL, NULL);
INSERT INTO public.image VALUES (191, 'workspace', 32, NULL, NULL);
INSERT INTO public.image VALUES (192, 'window', 32, NULL, NULL);
INSERT INTO public.image VALUES (194, 'condo_living', 33, NULL, NULL);
INSERT INTO public.image VALUES (195, 'bedroom', 33, NULL, NULL);
INSERT INTO public.image VALUES (196, 'kitchen', 33, NULL, NULL);
INSERT INTO public.image VALUES (197, 'bathroom', 33, NULL, NULL);
INSERT INTO public.image VALUES (198, 'balcony', 33, NULL, NULL);
INSERT INTO public.image VALUES (200, 'upper_level', 34, NULL, NULL);
INSERT INTO public.image VALUES (201, 'bedroom', 34, NULL, NULL);
INSERT INTO public.image VALUES (202, 'kitchen', 34, NULL, NULL);
INSERT INTO public.image VALUES (203, 'bathroom', 34, NULL, NULL);
INSERT INTO public.image VALUES (204, 'terrace', 34, NULL, NULL);
INSERT INTO public.image VALUES (206, 'living_space', 35, NULL, NULL);
INSERT INTO public.image VALUES (207, 'bedroom', 35, NULL, NULL);
INSERT INTO public.image VALUES (208, 'kitchen', 35, NULL, NULL);
INSERT INTO public.image VALUES (209, 'bathroom', 35, NULL, NULL);
INSERT INTO public.image VALUES (210, 'view', 35, NULL, NULL);
INSERT INTO public.image VALUES (212, 'entrance', 36, NULL, NULL);
INSERT INTO public.image VALUES (213, 'living_room', 36, NULL, NULL);
INSERT INTO public.image VALUES (214, 'master_suite', 36, NULL, NULL);
INSERT INTO public.image VALUES (215, 'pool', 36, NULL, NULL);
INSERT INTO public.image VALUES (216, 'garden', 36, NULL, NULL);
INSERT INTO public.image VALUES (218, 'living_room', 37, NULL, NULL);
INSERT INTO public.image VALUES (219, 'bedroom', 37, NULL, NULL);
INSERT INTO public.image VALUES (220, 'workspace', 37, NULL, NULL);
INSERT INTO public.image VALUES (221, 'kitchen', 37, NULL, NULL);
INSERT INTO public.image VALUES (222, 'bathroom', 37, NULL, NULL);
INSERT INTO public.image VALUES (224, 'open_space', 38, NULL, NULL);
INSERT INTO public.image VALUES (225, 'bedroom', 38, NULL, NULL);
INSERT INTO public.image VALUES (226, 'kitchen', 38, NULL, NULL);
INSERT INTO public.image VALUES (227, 'bathroom', 38, NULL, NULL);
INSERT INTO public.image VALUES (228, 'terrace', 38, NULL, NULL);
INSERT INTO public.image VALUES (230, 'living_room', 39, NULL, NULL);
INSERT INTO public.image VALUES (231, 'bedroom', 39, NULL, NULL);
INSERT INTO public.image VALUES (232, 'kitchen', 39, NULL, NULL);
INSERT INTO public.image VALUES (233, 'bathroom', 39, NULL, NULL);
INSERT INTO public.image VALUES (234, 'balcony', 39, NULL, NULL);
INSERT INTO public.image VALUES (236, 'work_space', 40, NULL, NULL);
INSERT INTO public.image VALUES (237, 'bed_area', 40, NULL, NULL);
INSERT INTO public.image VALUES (238, 'kitchen', 40, NULL, NULL);
INSERT INTO public.image VALUES (239, 'bathroom', 40, NULL, NULL);
INSERT INTO public.image VALUES (240, 'window', 40, NULL, NULL);
INSERT INTO public.image VALUES (242, 'bedroom', 41, NULL, NULL);
INSERT INTO public.image VALUES (243, 'kitchen', 41, NULL, NULL);
INSERT INTO public.image VALUES (244, 'bathroom', 41, NULL, NULL);
INSERT INTO public.image VALUES (245, 'entrance', 41, NULL, NULL);
INSERT INTO public.image VALUES (246, 'view', 41, NULL, NULL);
INSERT INTO public.image VALUES (248, 'living_space', 42, NULL, NULL);
INSERT INTO public.image VALUES (249, 'bedroom', 42, NULL, NULL);
INSERT INTO public.image VALUES (250, 'kitchen', 42, NULL, NULL);
INSERT INTO public.image VALUES (251, 'bathroom', 42, NULL, NULL);
INSERT INTO public.image VALUES (252, 'balcony', 42, NULL, NULL);
INSERT INTO public.image VALUES (254, 'garden', 43, NULL, NULL);
INSERT INTO public.image VALUES (255, 'living_room', 43, NULL, NULL);
INSERT INTO public.image VALUES (256, 'master_bedroom', 43, NULL, NULL);
INSERT INTO public.image VALUES (257, 'pool', 43, NULL, NULL);
INSERT INTO public.image VALUES (258, 'terrace', 43, NULL, NULL);
INSERT INTO public.image VALUES (260, 'living_room', 44, NULL, NULL);
INSERT INTO public.image VALUES (261, 'bedroom', 44, NULL, NULL);
INSERT INTO public.image VALUES (262, 'dining_room', 44, NULL, NULL);
INSERT INTO public.image VALUES (263, 'kitchen', 44, NULL, NULL);
INSERT INTO public.image VALUES (264, 'garden', 44, NULL, NULL);
INSERT INTO public.image VALUES (266, 'living_space', 45, NULL, NULL);
INSERT INTO public.image VALUES (267, 'bedroom', 45, NULL, NULL);
INSERT INTO public.image VALUES (268, 'kitchen', 45, NULL, NULL);
INSERT INTO public.image VALUES (269, 'bathroom', 45, NULL, NULL);
INSERT INTO public.image VALUES (270, 'terrace', 45, NULL, NULL);
INSERT INTO public.image VALUES (272, 'bed_space', 46, NULL, NULL);
INSERT INTO public.image VALUES (273, 'study_area', 46, NULL, NULL);
INSERT INTO public.image VALUES (274, 'kitchen', 46, NULL, NULL);
INSERT INTO public.image VALUES (275, 'bathroom', 46, NULL, NULL);
INSERT INTO public.image VALUES (276, 'window', 46, NULL, NULL);
INSERT INTO public.image VALUES (278, 'living_room', 47, NULL, NULL);
INSERT INTO public.image VALUES (279, 'master_suite', 47, NULL, NULL);
INSERT INTO public.image VALUES (280, 'terrace', 47, NULL, NULL);
INSERT INTO public.image VALUES (281, 'kitchen', 47, NULL, NULL);
INSERT INTO public.image VALUES (282, 'view', 47, NULL, NULL);
INSERT INTO public.image VALUES (284, 'living_space', 48, NULL, NULL);
INSERT INTO public.image VALUES (285, 'bedroom', 48, NULL, NULL);
INSERT INTO public.image VALUES (286, 'kitchen', 48, NULL, NULL);
INSERT INTO public.image VALUES (287, 'bathroom', 48, NULL, NULL);
INSERT INTO public.image VALUES (288, 'entrance', 48, NULL, NULL);
INSERT INTO public.image VALUES (290, 'living_room', 49, NULL, NULL);
INSERT INTO public.image VALUES (291, 'bedroom', 49, NULL, NULL);
INSERT INTO public.image VALUES (292, 'kitchen', 49, NULL, NULL);
INSERT INTO public.image VALUES (293, 'bathroom', 49, NULL, NULL);
INSERT INTO public.image VALUES (294, 'balcony', 49, NULL, NULL);
INSERT INTO public.image VALUES (296, 'open_plan', 50, NULL, NULL);
INSERT INTO public.image VALUES (297, 'bedroom', 50, NULL, NULL);
INSERT INTO public.image VALUES (298, 'kitchen', 50, NULL, NULL);
INSERT INTO public.image VALUES (299, 'bathroom', 50, NULL, NULL);
INSERT INTO public.image VALUES (300, 'windows', 50, NULL, NULL);
INSERT INTO public.image VALUES (302, 'garden', 51, NULL, NULL);
INSERT INTO public.image VALUES (303, 'living_room', 51, NULL, NULL);
INSERT INTO public.image VALUES (304, 'bedroom', 51, NULL, NULL);
INSERT INTO public.image VALUES (305, 'kitchen', 51, NULL, NULL);
INSERT INTO public.image VALUES (306, 'patio', 51, NULL, NULL);
INSERT INTO public.image VALUES (308, 'living_room', 52, NULL, NULL);
INSERT INTO public.image VALUES (309, 'bedroom', 52, NULL, NULL);
INSERT INTO public.image VALUES (310, 'kitchen', 52, NULL, NULL);
INSERT INTO public.image VALUES (311, 'bathroom', 52, NULL, NULL);
INSERT INTO public.image VALUES (312, 'balcony', 52, NULL, NULL);
INSERT INTO public.image VALUES (314, 'living_space', 53, NULL, NULL);
INSERT INTO public.image VALUES (315, 'bedroom', 53, NULL, NULL);
INSERT INTO public.image VALUES (316, 'kitchen', 53, NULL, NULL);
INSERT INTO public.image VALUES (317, 'bathroom', 53, NULL, NULL);
INSERT INTO public.image VALUES (318, 'terrace', 53, NULL, NULL);
INSERT INTO public.image VALUES (320, 'living_room', 54, NULL, NULL);
INSERT INTO public.image VALUES (321, 'bedroom', 54, NULL, NULL);
INSERT INTO public.image VALUES (322, 'office', 54, NULL, NULL);
INSERT INTO public.image VALUES (323, 'kitchen', 54, NULL, NULL);
INSERT INTO public.image VALUES (324, 'garden', 54, NULL, NULL);
INSERT INTO public.image VALUES (326, 'living_room', 55, NULL, NULL);
INSERT INTO public.image VALUES (327, 'bedroom', 55, NULL, NULL);
INSERT INTO public.image VALUES (328, 'dining_room', 55, NULL, NULL);
INSERT INTO public.image VALUES (329, 'kitchen', 55, NULL, NULL);
INSERT INTO public.image VALUES (330, 'bathroom', 55, NULL, NULL);
INSERT INTO public.image VALUES (332, 'exterior', 56, NULL, NULL);
INSERT INTO public.image VALUES (333, 'living_room', 56, NULL, NULL);
INSERT INTO public.image VALUES (334, 'master_bedroom', 56, NULL, NULL);
INSERT INTO public.image VALUES (335, 'pool', 56, NULL, NULL);
INSERT INTO public.image VALUES (336, 'garden', 56, NULL, NULL);
INSERT INTO public.image VALUES (338, 'living_room', 57, NULL, NULL);
INSERT INTO public.image VALUES (339, 'bedroom', 57, NULL, NULL);
INSERT INTO public.image VALUES (340, 'kitchen', 57, NULL, NULL);
INSERT INTO public.image VALUES (341, 'bathroom', 57, NULL, NULL);
INSERT INTO public.image VALUES (342, 'balcony', 57, NULL, NULL);
INSERT INTO public.image VALUES (344, 'living_room', 58, NULL, NULL);
INSERT INTO public.image VALUES (345, 'upper_floor', 58, NULL, NULL);
INSERT INTO public.image VALUES (346, 'bedroom', 58, NULL, NULL);
INSERT INTO public.image VALUES (347, 'kitchen', 58, NULL, NULL);
INSERT INTO public.image VALUES (348, 'bathroom', 58, NULL, NULL);
INSERT INTO public.image VALUES (350, 'living_space', 59, NULL, NULL);
INSERT INTO public.image VALUES (351, 'bedroom', 59, NULL, NULL);
INSERT INTO public.image VALUES (352, 'kitchen', 59, NULL, NULL);
INSERT INTO public.image VALUES (353, 'bathroom', 59, NULL, NULL);
INSERT INTO public.image VALUES (354, 'terrace', 59, NULL, NULL);
INSERT INTO public.image VALUES (356, 'study_space', 60, NULL, NULL);
INSERT INTO public.image VALUES (357, 'bed_area', 60, NULL, NULL);
INSERT INTO public.image VALUES (358, 'kitchen', 60, NULL, NULL);
INSERT INTO public.image VALUES (359, 'bathroom', 60, NULL, NULL);
INSERT INTO public.image VALUES (360, 'window', 60, NULL, NULL);
INSERT INTO public.image VALUES (362, 'living_room', 61, NULL, NULL);
INSERT INTO public.image VALUES (363, 'bedroom', 61, NULL, NULL);
INSERT INTO public.image VALUES (364, 'workspace', 61, NULL, NULL);
INSERT INTO public.image VALUES (365, 'kitchen', 61, NULL, NULL);
INSERT INTO public.image VALUES (366, 'bathroom', 61, NULL, NULL);
INSERT INTO public.image VALUES (368, 'living_space', 62, NULL, NULL);
INSERT INTO public.image VALUES (369, 'bedroom', 62, NULL, NULL);
INSERT INTO public.image VALUES (370, 'kitchen', 62, NULL, NULL);
INSERT INTO public.image VALUES (371, 'bathroom', 62, NULL, NULL);
INSERT INTO public.image VALUES (372, 'rooftop', 62, NULL, NULL);
INSERT INTO public.image VALUES (374, 'beach_access', 63, NULL, NULL);
INSERT INTO public.image VALUES (375, 'living_room', 63, NULL, NULL);
INSERT INTO public.image VALUES (376, 'master_suite', 63, NULL, NULL);
INSERT INTO public.image VALUES (377, 'pool', 63, NULL, NULL);
INSERT INTO public.image VALUES (378, 'terrace', 63, NULL, NULL);
INSERT INTO public.image VALUES (380, 'exterior', 64, NULL, NULL);
INSERT INTO public.image VALUES (381, 'living_room', 64, NULL, NULL);
INSERT INTO public.image VALUES (382, 'bedroom', 64, NULL, NULL);
INSERT INTO public.image VALUES (383, 'kitchen', 64, NULL, NULL);
INSERT INTO public.image VALUES (384, 'garden', 64, NULL, NULL);
INSERT INTO public.image VALUES (386, 'living_room', 65, NULL, NULL);
INSERT INTO public.image VALUES (387, 'bedroom', 65, NULL, NULL);
INSERT INTO public.image VALUES (388, 'workspace', 65, NULL, NULL);
INSERT INTO public.image VALUES (389, 'kitchen', 65, NULL, NULL);
INSERT INTO public.image VALUES (390, 'bathroom', 65, NULL, NULL);
INSERT INTO public.image VALUES (392, 'living_space', 66, NULL, NULL);
INSERT INTO public.image VALUES (393, 'bedroom', 66, NULL, NULL);
INSERT INTO public.image VALUES (394, 'kitchen', 66, NULL, NULL);
INSERT INTO public.image VALUES (395, 'bathroom', 66, NULL, NULL);
INSERT INTO public.image VALUES (396, 'balcony', 66, NULL, NULL);
INSERT INTO public.image VALUES (398, 'living_room', 67, NULL, NULL);
INSERT INTO public.image VALUES (399, 'master_bedroom', 67, NULL, NULL);
INSERT INTO public.image VALUES (400, 'office', 67, NULL, NULL);
INSERT INTO public.image VALUES (401, 'terrace', 67, NULL, NULL);
INSERT INTO public.image VALUES (402, 'view', 67, NULL, NULL);
INSERT INTO public.image VALUES (404, 'living_room', 68, NULL, NULL);
INSERT INTO public.image VALUES (405, 'bedroom', 68, NULL, NULL);
INSERT INTO public.image VALUES (406, 'kitchen', 68, NULL, NULL);
INSERT INTO public.image VALUES (407, 'bathroom', 68, NULL, NULL);
INSERT INTO public.image VALUES (408, 'view', 68, NULL, NULL);
INSERT INTO public.image VALUES (410, 'living_space', 69, NULL, NULL);
INSERT INTO public.image VALUES (411, 'bedroom', 69, NULL, NULL);
INSERT INTO public.image VALUES (412, 'kitchen', 69, NULL, NULL);
INSERT INTO public.image VALUES (413, 'bathroom', 69, NULL, NULL);
INSERT INTO public.image VALUES (414, 'entrance', 69, NULL, NULL);
INSERT INTO public.image VALUES (416, 'living_room', 70, NULL, NULL);
INSERT INTO public.image VALUES (417, 'bedroom', 70, NULL, NULL);
INSERT INTO public.image VALUES (418, 'kitchen', 70, NULL, NULL);
INSERT INTO public.image VALUES (419, 'bathroom', 70, NULL, NULL);
INSERT INTO public.image VALUES (420, 'balcony', 70, NULL, NULL);
INSERT INTO public.image VALUES (422, 'living_room', 71, NULL, NULL);
INSERT INTO public.image VALUES (423, 'master_bedroom', 71, NULL, NULL);
INSERT INTO public.image VALUES (424, 'kids_room', 71, NULL, NULL);
INSERT INTO public.image VALUES (425, 'kitchen', 71, NULL, NULL);
INSERT INTO public.image VALUES (426, 'bathroom', 71, NULL, NULL);
INSERT INTO public.image VALUES (428, 'exterior', 72, NULL, NULL);
INSERT INTO public.image VALUES (429, 'living_room', 72, NULL, NULL);
INSERT INTO public.image VALUES (430, 'bedroom', 72, NULL, NULL);
INSERT INTO public.image VALUES (431, 'kitchen', 72, NULL, NULL);
INSERT INTO public.image VALUES (432, 'garden', 72, NULL, NULL);
INSERT INTO public.image VALUES (434, 'champs_view', 73, NULL, NULL);
INSERT INTO public.image VALUES (435, 'living_room', 73, NULL, NULL);
INSERT INTO public.image VALUES (436, 'master_suite', 73, NULL, NULL);
INSERT INTO public.image VALUES (437, 'terrace', 73, NULL, NULL);
INSERT INTO public.image VALUES (438, 'kitchen', 73, NULL, NULL);
INSERT INTO public.image VALUES (440, 'interior', 74, NULL, NULL);
INSERT INTO public.image VALUES (441, 'bed_space', 74, NULL, NULL);
INSERT INTO public.image VALUES (442, 'kitchen', 74, NULL, NULL);
INSERT INTO public.image VALUES (443, 'bathroom', 74, NULL, NULL);
INSERT INTO public.image VALUES (444, 'window', 74, NULL, NULL);
INSERT INTO public.image VALUES (446, 'living_room', 75, NULL, NULL);
INSERT INTO public.image VALUES (447, 'bedroom', 75, NULL, NULL);
INSERT INTO public.image VALUES (448, 'kitchen', 75, NULL, NULL);
INSERT INTO public.image VALUES (449, 'bathroom', 75, NULL, NULL);
INSERT INTO public.image VALUES (450, 'balcony', 75, NULL, NULL);
INSERT INTO public.image VALUES (452, 'exterior', 76, NULL, NULL);
INSERT INTO public.image VALUES (453, 'living_room', 76, NULL, NULL);
INSERT INTO public.image VALUES (454, 'master_bedroom', 76, NULL, NULL);
INSERT INTO public.image VALUES (455, 'garden', 76, NULL, NULL);
INSERT INTO public.image VALUES (456, 'pool', 76, NULL, NULL);
INSERT INTO public.image VALUES (458, 'living_space', 77, NULL, NULL);
INSERT INTO public.image VALUES (459, 'bedroom', 77, NULL, NULL);
INSERT INTO public.image VALUES (460, 'kitchen', 77, NULL, NULL);
INSERT INTO public.image VALUES (461, 'bathroom', 77, NULL, NULL);
INSERT INTO public.image VALUES (462, 'terrace', 77, NULL, NULL);
INSERT INTO public.image VALUES (464, 'living_room', 78, NULL, NULL);
INSERT INTO public.image VALUES (465, 'bedroom', 78, NULL, NULL);
INSERT INTO public.image VALUES (466, 'dining_area', 78, NULL, NULL);
INSERT INTO public.image VALUES (467, 'kitchen', 78, NULL, NULL);
INSERT INTO public.image VALUES (468, 'bathroom', 78, NULL, NULL);
INSERT INTO public.image VALUES (470, 'living_room', 79, NULL, NULL);
INSERT INTO public.image VALUES (471, 'bedroom', 79, NULL, NULL);
INSERT INTO public.image VALUES (472, 'kitchen', 79, NULL, NULL);
INSERT INTO public.image VALUES (473, 'bathroom', 79, NULL, NULL);
INSERT INTO public.image VALUES (474, 'balcony', 79, NULL, NULL);
INSERT INTO public.image VALUES (476, 'interior', 80, NULL, NULL);
INSERT INTO public.image VALUES (477, 'bed_area', 80, NULL, NULL);
INSERT INTO public.image VALUES (478, 'kitchen', 80, NULL, NULL);
INSERT INTO public.image VALUES (479, 'bathroom', 80, NULL, NULL);
INSERT INTO public.image VALUES (480, 'view', 80, NULL, NULL);
INSERT INTO public.image VALUES (482, 'living_space', 81, NULL, NULL);
INSERT INTO public.image VALUES (483, 'bedroom', 81, NULL, NULL);
INSERT INTO public.image VALUES (484, 'kitchen', 81, NULL, NULL);
INSERT INTO public.image VALUES (485, 'bathroom', 81, NULL, NULL);
INSERT INTO public.image VALUES (486, 'entrance', 81, NULL, NULL);
INSERT INTO public.image VALUES (488, 'living_space', 82, NULL, NULL);
INSERT INTO public.image VALUES (489, 'bedroom', 82, NULL, NULL);
INSERT INTO public.image VALUES (490, 'kitchen', 82, NULL, NULL);
INSERT INTO public.image VALUES (491, 'bathroom', 82, NULL, NULL);
INSERT INTO public.image VALUES (492, 'windows', 82, NULL, NULL);
INSERT INTO public.image VALUES (494, 'exterior', 83, NULL, NULL);
INSERT INTO public.image VALUES (495, 'living_room', 83, NULL, NULL);
INSERT INTO public.image VALUES (496, 'master_bedroom', 83, NULL, NULL);
INSERT INTO public.image VALUES (497, 'office', 83, NULL, NULL);
INSERT INTO public.image VALUES (498, 'garden', 83, NULL, NULL);
INSERT INTO public.image VALUES (500, 'living_room', 84, NULL, NULL);
INSERT INTO public.image VALUES (501, 'bedroom', 84, NULL, NULL);
INSERT INTO public.image VALUES (502, 'kitchen', 84, NULL, NULL);
INSERT INTO public.image VALUES (503, 'bathroom', 84, NULL, NULL);
INSERT INTO public.image VALUES (504, 'balcony', 84, NULL, NULL);
INSERT INTO public.image VALUES (506, 'living_room', 85, NULL, NULL);
INSERT INTO public.image VALUES (507, 'bedroom', 85, NULL, NULL);
INSERT INTO public.image VALUES (508, 'kitchen', 85, NULL, NULL);
INSERT INTO public.image VALUES (509, 'bathroom', 85, NULL, NULL);
INSERT INTO public.image VALUES (510, 'view', 85, NULL, NULL);
INSERT INTO public.image VALUES (512, 'living_room', 86, NULL, NULL);
INSERT INTO public.image VALUES (513, 'upper_floor', 86, NULL, NULL);
INSERT INTO public.image VALUES (514, 'bedroom', 86, NULL, NULL);
INSERT INTO public.image VALUES (515, 'kitchen', 86, NULL, NULL);
INSERT INTO public.image VALUES (516, 'bathroom', 86, NULL, NULL);
INSERT INTO public.image VALUES (518, 'living_room', 87, NULL, NULL);
INSERT INTO public.image VALUES (519, 'bedroom', 87, NULL, NULL);
INSERT INTO public.image VALUES (520, 'kitchen', 87, NULL, NULL);
INSERT INTO public.image VALUES (521, 'bathroom', 87, NULL, NULL);
INSERT INTO public.image VALUES (522, 'balcony', 87, NULL, NULL);
INSERT INTO public.image VALUES (524, 'living_space', 88, NULL, NULL);
INSERT INTO public.image VALUES (525, 'bedroom', 88, NULL, NULL);
INSERT INTO public.image VALUES (526, 'study_area', 88, NULL, NULL);
INSERT INTO public.image VALUES (527, 'kitchen', 88, NULL, NULL);
INSERT INTO public.image VALUES (528, 'bathroom', 88, NULL, NULL);
INSERT INTO public.image VALUES (530, 'exterior', 89, NULL, NULL);
INSERT INTO public.image VALUES (531, 'living_room', 89, NULL, NULL);
INSERT INTO public.image VALUES (532, 'bedroom', 89, NULL, NULL);
INSERT INTO public.image VALUES (533, 'kitchen', 89, NULL, NULL);
INSERT INTO public.image VALUES (534, 'garden', 89, NULL, NULL);
INSERT INTO public.image VALUES (536, 'exterior', 90, NULL, NULL);
INSERT INTO public.image VALUES (537, 'living_room', 90, NULL, NULL);
INSERT INTO public.image VALUES (538, 'bedroom', 90, NULL, NULL);
INSERT INTO public.image VALUES (539, 'kitchen', 90, NULL, NULL);
INSERT INTO public.image VALUES (540, 'garden', 90, NULL, NULL);
INSERT INTO public.image VALUES (542, 'living_room', 91, NULL, NULL);
INSERT INTO public.image VALUES (543, 'bedroom', 91, NULL, NULL);
INSERT INTO public.image VALUES (544, 'kitchen', 91, NULL, NULL);
INSERT INTO public.image VALUES (545, 'bathroom', 91, NULL, NULL);
INSERT INTO public.image VALUES (546, 'balcony', 91, NULL, NULL);
INSERT INTO public.image VALUES (548, 'living_room', 92, NULL, NULL);
INSERT INTO public.image VALUES (549, 'bedroom', 92, NULL, NULL);
INSERT INTO public.image VALUES (550, 'study_space', 92, NULL, NULL);
INSERT INTO public.image VALUES (551, 'kitchen', 92, NULL, NULL);
INSERT INTO public.image VALUES (552, 'bathroom', 92, NULL, NULL);
INSERT INTO public.image VALUES (554, 'living_space', 93, NULL, NULL);
INSERT INTO public.image VALUES (555, 'bedroom', 93, NULL, NULL);
INSERT INTO public.image VALUES (556, 'kitchen', 93, NULL, NULL);
INSERT INTO public.image VALUES (557, 'bathroom', 93, NULL, NULL);
INSERT INTO public.image VALUES (558, 'view', 93, NULL, NULL);
INSERT INTO public.image VALUES (560, 'living_room', 94, NULL, NULL);
INSERT INTO public.image VALUES (561, 'bedroom', 94, NULL, NULL);
INSERT INTO public.image VALUES (562, 'dining_area', 94, NULL, NULL);
INSERT INTO public.image VALUES (563, 'kitchen', 94, NULL, NULL);
INSERT INTO public.image VALUES (564, 'bathroom', 94, NULL, NULL);
INSERT INTO public.image VALUES (566, 'living_space', 95, NULL, NULL);
INSERT INTO public.image VALUES (567, 'bedroom', 95, NULL, NULL);
INSERT INTO public.image VALUES (568, 'kitchen', 95, NULL, NULL);
INSERT INTO public.image VALUES (569, 'bathroom', 95, NULL, NULL);
INSERT INTO public.image VALUES (570, 'entrance', 95, NULL, NULL);
INSERT INTO public.image VALUES (572, 'living_space', 96, NULL, NULL);
INSERT INTO public.image VALUES (573, 'bedroom', 96, NULL, NULL);
INSERT INTO public.image VALUES (574, 'kitchen', 96, NULL, NULL);
INSERT INTO public.image VALUES (575, 'bathroom', 96, NULL, NULL);
INSERT INTO public.image VALUES (576, 'terrace', 96, NULL, NULL);
INSERT INTO public.image VALUES (578, 'living_room', 97, NULL, NULL);
INSERT INTO public.image VALUES (579, 'bedroom', 97, NULL, NULL);
INSERT INTO public.image VALUES (580, 'kitchen', 97, NULL, NULL);
INSERT INTO public.image VALUES (581, 'bathroom', 97, NULL, NULL);
INSERT INTO public.image VALUES (582, 'balcony', 97, NULL, NULL);
INSERT INTO public.image VALUES (584, 'living_space', 98, NULL, NULL);
INSERT INTO public.image VALUES (585, 'bedroom', 98, NULL, NULL);
INSERT INTO public.image VALUES (586, 'kitchen', 98, NULL, NULL);
INSERT INTO public.image VALUES (587, 'bathroom', 98, NULL, NULL);
INSERT INTO public.image VALUES (588, 'entrance', 98, NULL, NULL);
INSERT INTO public.image VALUES (590, 'living_room', 99, NULL, NULL);
INSERT INTO public.image VALUES (591, 'bedroom', 99, NULL, NULL);
INSERT INTO public.image VALUES (592, 'kitchen', 99, NULL, NULL);
INSERT INTO public.image VALUES (593, 'bathroom', 99, NULL, NULL);
INSERT INTO public.image VALUES (594, 'balcony', 99, NULL, NULL);
INSERT INTO public.image VALUES (596, 'open_space', 100, NULL, NULL);
INSERT INTO public.image VALUES (597, 'bedroom', 100, NULL, NULL);
INSERT INTO public.image VALUES (598, 'kitchen', 100, NULL, NULL);
INSERT INTO public.image VALUES (599, 'bathroom', 100, NULL, NULL);
INSERT INTO public.image VALUES (600, 'windows', 100, NULL, NULL);
INSERT INTO public.image VALUES (43, 'sea_view', 8, 'preview', NULL);
INSERT INTO public.image VALUES (49, 'duplex_living', 9, 'preview', NULL);
INSERT INTO public.image VALUES (55, 'bungalow_exterior', 10, 'preview', NULL);
INSERT INTO public.image VALUES (61, 'studio_view', 11, 'preview', NULL);
INSERT INTO public.image VALUES (67, 'park_view', 12, 'preview', NULL);
INSERT INTO public.image VALUES (73, 'loft_space', 13, 'preview', NULL);
INSERT INTO public.image VALUES (79, 'grand_place_view', 14, 'preview', NULL);
INSERT INTO public.image VALUES (85, 'square_view', 15, 'preview', NULL);
INSERT INTO public.image VALUES (91, 'townhouse_exterior', 16, 'preview', NULL);
INSERT INTO public.image VALUES (97, 'cottage_front', 17, 'preview', NULL);
INSERT INTO public.image VALUES (103, 'tower_view', 18, 'preview', NULL);
INSERT INTO public.image VALUES (109, 'duplex_interior', 19, 'preview', NULL);
INSERT INTO public.image VALUES (115, 'bungalow_front', 20, 'preview', NULL);
INSERT INTO public.image VALUES (121, 'acropolis_view', 21, 'preview', NULL);
INSERT INTO public.image VALUES (127, 'modern_living', 22, 'preview', NULL);
INSERT INTO public.image VALUES (133, 'loft_space', 23, 'preview', NULL);
INSERT INTO public.image VALUES (139, 'latin_quarter', 24, 'preview', NULL);
INSERT INTO public.image VALUES (145, 'classic_living', 25, 'preview', NULL);
INSERT INTO public.image VALUES (151, 'loft_living', 26, 'preview', NULL);
INSERT INTO public.image VALUES (157, 'townhouse_front', 27, 'preview', NULL);
INSERT INTO public.image VALUES (163, 'luxury_living', 28, 'preview', NULL);
INSERT INTO public.image VALUES (169, 'charming_studio', 29, 'preview', NULL);
INSERT INTO public.image VALUES (175, 'villa_exterior', 30, 'preview', NULL);
INSERT INTO public.image VALUES (181, 'elegant_living', 31, 'preview', NULL);
INSERT INTO public.image VALUES (187, 'modern_studio', 32, 'preview', NULL);
INSERT INTO public.image VALUES (193, 'waterfront_view', 33, 'preview', NULL);
INSERT INTO public.image VALUES (199, 'duplex_living', 34, 'preview', NULL);
INSERT INTO public.image VALUES (205, 'alternative_loft', 35, 'preview', NULL);
INSERT INTO public.image VALUES (211, 'exclusive_villa', 36, 'preview', NULL);
INSERT INTO public.image VALUES (217, 'business_apartment', 37, 'preview', NULL);
INSERT INTO public.image VALUES (223, 'artistic_loft', 38, 'preview', NULL);
INSERT INTO public.image VALUES (229, 'multicultural_apt', 39, 'preview', NULL);
INSERT INTO public.image VALUES (235, 'creative_studio', 40, 'preview', NULL);
INSERT INTO public.image VALUES (241, 'vintage_living', 41, 'preview', NULL);
INSERT INTO public.image VALUES (247, 'nightlife_apt', 42, 'preview', NULL);
INSERT INTO public.image VALUES (253, 'peaceful_villa', 43, 'preview', NULL);
INSERT INTO public.image VALUES (259, 'historic_townhouse', 44, 'preview', NULL);
INSERT INTO public.image VALUES (265, 'cosmopolitan_loft', 45, 'preview', NULL);
INSERT INTO public.image VALUES (271, 'student_studio', 46, 'preview', NULL);
INSERT INTO public.image VALUES (277, 'luxury_penthouse', 47, 'preview', NULL);
INSERT INTO public.image VALUES (283, 'university_apt', 48, 'preview', NULL);
INSERT INTO public.image VALUES (289, 'residential_apt', 49, 'preview', NULL);
INSERT INTO public.image VALUES (295, 'industrial_loft', 50, 'preview', NULL);
INSERT INTO public.image VALUES (301, 'green_bungalow', 51, 'preview', NULL);
INSERT INTO public.image VALUES (307, 'village_apartment', 52, 'preview', NULL);
INSERT INTO public.image VALUES (313, 'modern_condo', 53, 'preview', NULL);
INSERT INTO public.image VALUES (319, 'spacious_townhouse', 54, 'preview', NULL);
INSERT INTO public.image VALUES (325, 'art_nouveau', 55, 'preview', NULL);
INSERT INTO public.image VALUES (331, 'suburban_villa', 56, 'preview', NULL);
INSERT INTO public.image VALUES (337, 'stadium_area', 57, 'preview', NULL);
INSERT INTO public.image VALUES (343, 'residential_duplex', 58, 'preview', NULL);
INSERT INTO public.image VALUES (349, 'urban_loft', 59, 'preview', NULL);
INSERT INTO public.image VALUES (355, 'academic_studio', 60, 'preview', NULL);
INSERT INTO public.image VALUES (361, 'artistic_apartment', 61, 'preview', NULL);
INSERT INTO public.image VALUES (367, 'trendy_loft', 62, 'preview', NULL);
INSERT INTO public.image VALUES (373, 'beachfront_villa', 63, 'preview', NULL);
INSERT INTO public.image VALUES (379, 'garden_cottage', 64, 'preview', NULL);
INSERT INTO public.image VALUES (385, 'business_district', 65, 'preview', NULL);
INSERT INTO public.image VALUES (391, 'nightlife_apartment', 66, 'preview', NULL);
INSERT INTO public.image VALUES (397, 'business_penthouse', 67, 'preview', NULL);
INSERT INTO public.image VALUES (403, 'historic_apartment', 68, 'preview', NULL);
INSERT INTO public.image VALUES (409, 'local_experience', 69, 'preview', NULL);
INSERT INTO public.image VALUES (415, 'modern_condo', 70, 'preview', NULL);
INSERT INTO public.image VALUES (421, 'family_apartment', 71, 'preview', NULL);
INSERT INTO public.image VALUES (427, 'quiet_bungalow', 72, 'preview', NULL);
INSERT INTO public.image VALUES (433, 'luxury_penthouse', 73, 'preview', NULL);
INSERT INTO public.image VALUES (439, 'affordable_studio', 74, 'preview', NULL);
INSERT INTO public.image VALUES (445, 'multicultural_apt', 75, 'preview', NULL);
INSERT INTO public.image VALUES (451, 'residential_villa', 76, 'preview', NULL);
INSERT INTO public.image VALUES (457, 'hipster_loft', 77, 'preview', NULL);
INSERT INTO public.image VALUES (463, 'vatican_apartment', 78, 'preview', NULL);
INSERT INTO public.image VALUES (469, 'new_development', 79, 'preview', NULL);
INSERT INTO public.image VALUES (475, 'entertainment_studio', 80, 'preview', NULL);
INSERT INTO public.image VALUES (481, 'immigrant_quarter', 81, 'preview', NULL);
INSERT INTO public.image VALUES (487, 'market_loft', 82, 'preview', NULL);
INSERT INTO public.image VALUES (493, 'executive_townhouse', 83, 'preview', NULL);
INSERT INTO public.image VALUES (499, 'local_apartment', 84, 'preview', NULL);
INSERT INTO public.image VALUES (505, 'residential_apt', 85, 'preview', NULL);
INSERT INTO public.image VALUES (511, 'affordable_duplex', 86, 'preview', NULL);
INSERT INTO public.image VALUES (517, 'transport_hub', 87, 'preview', NULL);
INSERT INTO public.image VALUES (523, 'campus_apartment', 88, 'preview', NULL);
INSERT INTO public.image VALUES (529, 'family_bungalow', 89, 'preview', NULL);
INSERT INTO public.image VALUES (535, 'green_cottage', 90, 'preview', NULL);
INSERT INTO public.image VALUES (541, 'urban_apartment', 91, 'preview', NULL);
INSERT INTO public.image VALUES (547, 'academic_apartment', 92, 'preview', NULL);
INSERT INTO public.image VALUES (553, 'military_district', 93, 'preview', NULL);
INSERT INTO public.image VALUES (559, 'elegant_apartment', 94, 'preview', NULL);
INSERT INTO public.image VALUES (565, 'workers_apartment', 95, 'preview', NULL);
INSERT INTO public.image VALUES (571, 'entertainment_loft', 96, 'preview', NULL);
INSERT INTO public.image VALUES (577, 'quiet_apartment', 97, 'preview', NULL);
INSERT INTO public.image VALUES (583, 'working_class', 98, 'preview', NULL);
INSERT INTO public.image VALUES (589, 'cinema_district', 99, 'preview', NULL);
INSERT INTO public.image VALUES (595, 'industrial_loft', 100, 'preview', NULL);
INSERT INTO public.image VALUES (13, 'studio_space', 3, 'preview', NULL);
INSERT INTO public.image VALUES (1, 'living_room', 1, 'preview', NULL);
INSERT INTO public.image VALUES (7, 'garden_view', 2, 'preview', NULL);
INSERT INTO public.image VALUES (19, 'loft_living', 4, 'preview', NULL);


--
-- Data for Name: offer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.offer VALUES (34, 'Sablon Antique Duplex', 170.00, 50.841100, 4.356200, 7, 9, 5, 'Charming duplex in antiques district', 2, 4, 1, false, 26);
INSERT INTO public.offer VALUES (36, 'Parioli Exclusive Villa', 380.00, 41.922200, 12.487500, 2, 2, 5, 'Luxurious villa in upscale district', 5, 10, 4, false, 26);
INSERT INTO public.offer VALUES (39, 'Lavapiés Multicultural Apartment', 85.00, 40.408700, -3.701700, 5, 1, 4, 'Vibrant apartment in diverse area', 1, 3, 0, false, 26);
INSERT INTO public.offer VALUES (44, 'Żoliborz Historic Townhouse', 140.00, 52.265600, 21.002900, 3, 6, 4, 'Pre-war townhouse with character', 3, 6, 0, true, 28);
INSERT INTO public.offer VALUES (40, 'Noord Creative Studio', 115.00, 52.389100, 4.900500, 6, 3, 4, 'Industrial studio across IJ river', 1, 2, 0, true, 28);
INSERT INTO public.offer VALUES (46, 'Argüelles Student Studio', 68.00, 40.428200, -3.718400, 5, 3, 4, 'Affordable studio near university', 1, 2, 0, false, 28);
INSERT INTO public.offer VALUES (53, 'Tetuán Modern Condo', 98.00, 40.465600, -3.689600, 5, 8, 4, 'New development condo', 2, 4, 0, false, 28);
INSERT INTO public.offer VALUES (49, 'Pangrati Residential Apartment', 95.00, 37.968500, 23.747500, 1, 1, 4, 'Family-friendly apartment', 2, 5, 1, false, 28);
INSERT INTO public.offer VALUES (48, 'Etterbeek University Apartment', 88.00, 50.822100, 4.396200, 7, 1, 4, 'Practical apartment near campuses', 1, 2, 0, true, 28);
INSERT INTO public.offer VALUES (54, 'West Spacious Townhouse', 185.00, 52.378700, 4.860800, 6, 6, 5, 'Family townhouse with parking', 3, 7, 0, true, 28);
INSERT INTO public.offer VALUES (41, 'Marolles Vintage Apartment', 95.00, 50.838900, 4.349100, 7, 1, 4, 'Retro apartment in flea market area', 1, 3, 1, false, 28);
INSERT INTO public.offer VALUES (47, 'Oud-Zuid Luxury Penthouse', 340.00, 52.348700, 4.874500, 6, 5, 5, 'Premium penthouse in prestigious area', 3, 6, 3, false, 28);
INSERT INTO public.offer VALUES (43, 'Aventino Peaceful Villa', 295.00, 41.883500, 12.480600, 2, 2, 5, 'Serene villa with orange gardens', 4, 8, 4, true, 28);
INSERT INTO public.offer VALUES (33, 'Oost Waterfront Condo', 155.00, 52.358100, 4.957700, 6, 8, 4, 'New condo with water views', 2, 4, 0, true, 28);
INSERT INTO public.offer VALUES (38, 'Bastille Artistic Loft', 148.00, 48.853700, 2.375100, 4, 4, 5, 'Creative loft in dynamic neighborhood', 2, 4, 1, false, 28);
INSERT INTO public.offer VALUES (37, 'Mokotów Business Apartment', 105.00, 52.189400, 21.028200, 3, 1, 4, 'Modern apartment near business centers', 2, 4, 0, true, 28);
INSERT INTO public.offer VALUES (35, 'Exarchia Alternative Loft', 78.00, 37.987800, 23.733100, 1, 4, 4, 'Bohemian loft in student quarter', 1, 3, 0, true, NULL);
INSERT INTO public.offer VALUES (42, 'Psirri Nightlife Apartment', 82.00, 37.976400, 23.724200, 1, 1, 4, 'Lively apartment in entertainment district', 1, 2, 0, false, NULL);
INSERT INTO public.offer VALUES (45, 'Belleville Cosmopolitan Loft', 128.00, 48.872600, 2.389300, 4, 4, 5, 'Eclectic loft in diverse quarter', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (51, 'Bródno Green Bungalow', 72.00, 52.289600, 21.051200, 3, 10, 4, 'Eco-friendly bungalow with garden', 1, 3, 0, true, NULL);
INSERT INTO public.offer VALUES (50, 'Ostiense Industrial Loft', 158.00, 41.870200, 12.478200, 2, 4, 5, 'Converted factory loft', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (52, 'Batignolles Village Apartment', 135.00, 48.884400, 2.321300, 4, 1, 5, 'Charming apartment in village-like area', 2, 4, 2, false, NULL);
INSERT INTO public.offer VALUES (1, 'Charming Apartment in Plaka', 85.00, 37.972300, 23.726900, 1, 1, 4.5, 'Beautiful apartment with Acropolis view', 2, 4, 1, true, NULL);
INSERT INTO public.offer VALUES (97, 'Forest Quiet Residential Apartment', 92.00, 50.813400, 4.322400, 7, 1, 4, 'Peaceful apartment in Brussels suburb', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (93, 'Rembertów Military District Apartment', 75.00, 52.258600, 21.149800, 3, 1, 3, 'Quiet apartment in green district', 1, 3, 0, false, NULL);
INSERT INTO public.offer VALUES (16, 'Villa Borghese Townhouse', 230.00, 41.913900, 12.486300, 2, 6, 5.0, 'Elegant townhouse near famous gardens', 3, 7, 2, false, NULL);
INSERT INTO public.offer VALUES (87, 'Nation Transport Hub Apartment', 118.00, 48.848500, 2.395800, 4, 1, 4, 'Convenient apartment by metro hub', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (71, 'San Giovanni Family Apartment', 128.00, 41.878700, 12.513800, 2, 1, 5, 'Spacious apartment for families', 3, 6, 0, false, NULL);
INSERT INTO public.offer VALUES (14, 'Grand Place View Penthouse', 280.00, 50.846700, 4.352500, 7, 5, 5.0, 'Penthouse overlooking Grand Place', 3, 6, 3, false, NULL);
INSERT INTO public.offer VALUES (24, 'Latin Quarter Studio', 98.00, 48.846200, 2.343100, 4, 3, 5.0, 'Historic studio near Sorbonne', 1, 2, 1, false, NULL);
INSERT INTO public.offer VALUES (4, 'Elegant Loft in Le Marais', 180.00, 48.858300, 2.362500, 4, 4, 5.0, 'Spacious loft with high ceilings', 2, 5, 0, true, NULL);
INSERT INTO public.offer VALUES (57, 'Flaminio Stadium Area Apartment', 112.00, 41.927800, 12.475500, 2, 1, 4, 'Modern apartment near sports venues', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (78, 'Prati Vatican Apartment', 148.00, 41.907100, 12.460400, 2, 1, 5, 'Classic apartment near Vatican', 2, 5, 0, true, NULL);
INSERT INTO public.offer VALUES (72, 'Bemowo Quiet Bungalow', 68.00, 52.243800, 20.912300, 3, 10, 4, 'Peaceful bungalow away from crowds', 1, 2, 0, true, NULL);
INSERT INTO public.offer VALUES (10, 'Garden Bungalow in Wilanów', 75.00, 52.165600, 21.089200, 3, 10, 4.0, 'Peaceful bungalow with large garden', 1, 3, 1, false, NULL);
INSERT INTO public.offer VALUES (56, 'Kifissia Suburban Villa', 265.00, 38.074200, 23.810800, 1, 2, 5, 'Elegant villa in green suburb', 4, 8, 2, false, NULL);
INSERT INTO public.offer VALUES (59, 'République Urban Loft', 152.00, 48.867200, 2.363800, 4, 4, 4, 'Contemporary loft in central location', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (25, 'Chamberí Classic Apartment', 115.00, 40.440700, -3.700600, 5, 1, 4.0, 'Traditional apartment with modern amenities', 2, 5, 0, true, NULL);
INSERT INTO public.offer VALUES (83, 'Woluwe-Saint-Pierre Executive Townhouse', 275.00, 50.831400, 4.419800, 7, 6, 5, 'Premium townhouse in diplomatic area', 4, 8, 2, true, NULL);
INSERT INTO public.offer VALUES (75, 'Bijlmer Multicultural Apartment', 92.00, 52.313800, 4.949600, 6, 1, 4, 'Diverse neighborhood apartment', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (96, 'Leidseplein Entertainment Loft', 165.00, 52.364100, 4.882500, 6, 4, 4, 'Party loft in nightlife center', 2, 4, 1, true, NULL);
INSERT INTO public.offer VALUES (30, 'Saska Kępa Family Villa', 200.00, 52.228900, 21.054200, 3, 2, 5.0, 'Spacious villa in residential area', 4, 8, 0, false, NULL);
INSERT INTO public.offer VALUES (6, 'Canal View Townhouse', 195.00, 52.373000, 4.885500, 6, 6, 4.0, 'Historic townhouse along the canal', 3, 6, 0, false, NULL);
INSERT INTO public.offer VALUES (100, 'Ursus Industrial Loft', 85.00, 52.197700, 20.885500, 3, 4, 4, 'Converted factory loft', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (62, 'Saint-Gilles Trendy Loft', 142.00, 50.829400, 4.344800, 7, 4, 4, 'Hip loft in multicultural area', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (91, 'Kallithea Urban Apartment', 88.00, 37.953800, 23.704900, 1, 1, 4, 'Central apartment with good transport', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (8, 'Seafront Condo in Glyfada', 165.00, 37.864600, 23.753100, 1, 8, 4.5, 'Modern condo with sea access', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (89, 'Osdorp Family Bungalow', 105.00, 52.359800, 4.796800, 6, 10, 4, 'Suburban bungalow with garden', 2, 5, 0, true, NULL);
INSERT INTO public.offer VALUES (18, 'Eiffel Tower View Condo', 240.00, 48.858400, 2.294500, 4, 8, 5.0, 'Stunning condo with tower views', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (67, 'Chamartín Business Penthouse', 245.00, 40.468500, -3.687900, 5, 5, 5, 'Executive penthouse near train station', 3, 6, 0, false, NULL);
INSERT INTO public.offer VALUES (77, 'Metaxourgeio Hipster Loft', 88.00, 37.991800, 23.722300, 1, 4, 4, 'Trendy loft in gentrifying area', 1, 3, 0, false, NULL);
INSERT INTO public.offer VALUES (61, 'Zuid Artistic Apartment', 125.00, 52.357000, 4.891900, 6, 1, 5, 'Creative space in arts district', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (28, 'Kolonaki Luxury Apartment', 145.00, 37.978700, 23.742700, 1, 1, 5.0, 'Upscale apartment in posh neighborhood', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (20, 'Museum Quarter Bungalow', 105.00, 52.359100, 4.881700, 6, 10, 4.0, 'Quiet bungalow near museums', 1, 2, 0, false, NULL);
INSERT INTO public.offer VALUES (92, 'Nomentano Academic Apartment', 95.00, 41.925100, 12.516500, 2, 1, 4, 'Apartment near La Sapienza University', 2, 3, 0, true, NULL);
INSERT INTO public.offer VALUES (66, 'Oberkampf Nightlife Apartment', 115.00, 48.866800, 2.380600, 4, 1, 4, 'Vibrant apartment in party area', 1, 3, 2, true, NULL);
INSERT INTO public.offer VALUES (99, 'Cinecittà Cinema District Apartment', 98.00, 41.856800, 12.558200, 2, 1, 4, 'Apartment in famous film district', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (23, 'Praga District Loft', 95.00, 52.250300, 21.038900, 3, 4, 4.0, 'Industrial loft in up-and-coming area', 2, 4, 1, false, NULL);
INSERT INTO public.offer VALUES (73, 'Champs-Élysées Luxury Penthouse', 485.00, 48.869800, 2.305300, 4, 5, 5, 'Ultra-luxury penthouse on famous avenue', 4, 8, 3, false, NULL);
INSERT INTO public.offer VALUES (9, 'Artistic Duplex in Trastevere', 145.00, 41.889700, 12.469800, 2, 9, 5.0, 'Unique duplex in bohemian neighborhood', 2, 5, 1, true, NULL);
INSERT INTO public.offer VALUES (84, 'Petralona Local Apartment', 78.00, 37.968000, 23.715800, 1, 1, 4, 'Authentic Greek living experience', 1, 3, 0, false, NULL);
INSERT INTO public.offer VALUES (58, 'Ursynów Residential Duplex', 110.00, 52.148900, 21.047800, 3, 9, 5, 'Comfortable duplex in family district', 2, 5, 1, false, NULL);
INSERT INTO public.offer VALUES (90, 'Jette Green Suburb Cottage', 115.00, 50.877100, 4.324100, 7, 7, 5, 'Cottage in leafy neighborhood', 2, 4, 4, false, NULL);
INSERT INTO public.offer VALUES (79, 'Białołęka New Development Apartment', 95.00, 52.305100, 20.986200, 3, 1, 4, 'Brand new apartment', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (31, 'Saint-Germain Elegant Apartment', 165.00, 48.850700, 2.326700, 4, 1, 5.0, 'Sophisticated apartment on left bank', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (86, 'Targówek Affordable Duplex', 78.00, 52.288200, 21.051200, 3, 9, 3, 'Value duplex for budget travelers', 2, 5, 2, true, NULL);
INSERT INTO public.offer VALUES (60, 'Moncloa Academic Studio', 75.00, 40.434700, -3.718300, 5, 3, 4, 'Student-friendly studio', 1, 2, 0, true, NULL);
INSERT INTO public.offer VALUES (21, 'Acropolis View Penthouse', 350.00, 37.968800, 23.728300, 1, 5, 5.0, 'Premium penthouse with panoramic views', 4, 8, 0, false, NULL);
INSERT INTO public.offer VALUES (70, 'Neos Kosmos Modern Condo', 108.00, 37.955100, 23.731800, 1, 8, 4, 'New condo with facilities', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (69, 'Anderlecht Local Experience Apartment', 85.00, 50.834900, 4.310400, 7, 1, 3, 'Authentic apartment off tourist track', 1, 3, 0, false, NULL);
INSERT INTO public.offer VALUES (68, 'Centrum Historic Apartment', 165.00, 52.374700, 4.895200, 6, 1, 4, 'Heritage apartment in city center', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (82, 'Waterlooplein Market Loft', 138.00, 52.368400, 4.901900, 6, 4, 4, 'Loft above famous flea market', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (12, 'Retiro Park Apartment', 110.00, 40.415300, -3.684600, 5, 1, 4.5, 'Bright apartment near beautiful park', 2, 4, 0, true, NULL);
INSERT INTO public.offer VALUES (94, 'Passy Elegant Apartment', 185.00, 48.858400, 2.281100, 4, 1, 5, 'Refined apartment in chic arrondissement', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (3, 'Modern Studio in Old Town', 55.00, 52.240100, 21.015200, 3, 3, 4.5, 'Cozy studio in the heart of Warsaw', 1, 2, 0, true, NULL);
INSERT INTO public.offer VALUES (95, 'Puente de Vallecas Workers Apartment', 68.00, 40.392200, -3.655600, 5, 1, 3, 'Honest apartment in working class area', 1, 3, 0, false, NULL);
INSERT INTO public.offer VALUES (85, 'Appio Latino Residential Apartment', 102.00, 41.864300, 12.531800, 2, 1, 4, 'Quiet apartment in residential zone', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (76, 'Uccle Residential Villa', 235.00, 50.804900, 4.355600, 7, 2, 5, 'Elegant villa in upscale suburb', 4, 8, 3, false, NULL);
INSERT INTO public.offer VALUES (88, 'Vicálvaro Campus Apartment', 65.00, 40.400500, -3.607800, 5, 1, 3, 'Student apartment near university', 1, 2, 0, false, NULL);
INSERT INTO public.offer VALUES (64, 'Garbatella Garden Cottage', 105.00, 41.865400, 12.486200, 2, 7, 4, 'Unique cottage in garden city', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (5, 'Penthouse with City Views', 320.00, 40.435200, -3.683800, 5, 5, 5.0, 'Luxurious penthouse in Salamanca district', 3, 6, 1, false, NULL);
INSERT INTO public.offer VALUES (32, 'Chueca Modern Studio', 92.00, 40.424200, -3.698500, 5, 3, 4.0, 'Stylish studio in LGBTQ+ friendly area', 1, 2, 2, true, NULL);
INSERT INTO public.offer VALUES (80, 'Pigalle Entertainment District Studio', 98.00, 48.883700, 2.334300, 4, 3, 4, 'Lively studio in red light area', 1, 2, 0, false, NULL);
INSERT INTO public.offer VALUES (17, 'Łazienki Park Cottage', 85.00, 52.214900, 21.035200, 3, 7, 4.0, 'Romantic cottage near royal park', 2, 3, 0, false, NULL);
INSERT INTO public.offer VALUES (13, 'Jordaan Luxury Loft', 210.00, 52.378800, 4.880500, 6, 4, 5.0, 'Stylish loft in trendy neighborhood', 2, 4, 3, true, NULL);
INSERT INTO public.offer VALUES (65, 'Wola Business District Apartment', 98.00, 52.232900, 20.984600, 3, 1, 4, 'Modern apartment in new district', 2, 4, 2, true, NULL);
INSERT INTO public.offer VALUES (19, 'Malasaña Hip Duplex', 135.00, 40.425800, -3.705300, 5, 9, 4.0, 'Trendy duplex in vibrant area', 2, 5, 0, true, NULL);
INSERT INTO public.offer VALUES (81, 'Usera Immigrant Quarter Apartment', 72.00, 40.384200, -3.700400, 5, 1, 3, 'Cultural melting pot apartment', 1, 3, 1, true, NULL);
INSERT INTO public.offer VALUES (11, 'Montmartre Artist Studio', 120.00, 48.886700, 2.335200, 4, 3, 5.0, 'Inspiring studio in artistic quarter', 1, 2, 0, false, NULL);
INSERT INTO public.offer VALUES (74, 'Vallecas Affordable Studio', 58.00, 40.389700, -3.652300, 5, 3, 3, 'Budget-friendly studio', 1, 2, 0, false, NULL);
INSERT INTO public.offer VALUES (98, 'Peristeri Working Class Apartment', 65.00, 38.015600, 23.691900, 1, 1, 3, 'Affordable apartment west of Athens', 1, 3, 0, false, NULL);
INSERT INTO public.offer VALUES (63, 'Vouliagmeni Beachfront Villa', 420.00, 37.800900, 23.789000, 1, 2, 5, 'Luxury villa with private beach', 5, 10, 2, false, NULL);
INSERT INTO public.offer VALUES (55, 'Schaerbeek Art Nouveau Apartment', 118.00, 50.846100, 4.372700, 7, 1, 4, 'Beautiful period apartment', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (22, 'Testaccio Modern Apartment', 125.00, 41.878300, 12.476500, 2, 1, 4.0, 'Contemporary apartment in food district', 2, 4, 1, false, NULL);
INSERT INTO public.offer VALUES (27, 'European Quarter Townhouse', 190.00, 50.842900, 4.376900, 7, 6, 4.0, 'Modern townhouse near EU buildings', 3, 6, 0, false, NULL);
INSERT INTO public.offer VALUES (29, 'Monti Charming Studio', 88.00, 41.895300, 12.494100, 2, 3, 4.0, 'Quaint studio in historic district', 1, 2, 0, false, NULL);
INSERT INTO public.offer VALUES (7, 'Cozy Cottage in Ixelles', 95.00, 50.830100, 4.362100, 7, 7, 5.0, 'Charming cottage with garden', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (15, 'Syntagma Square Apartment', 90.00, 37.975500, 23.734800, 1, 1, 4.0, 'Central apartment near metro', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (26, 'De Pijp Trendy Loft', 175.00, 52.355100, 4.892900, 6, 4, 5.0, 'Converted warehouse loft', 2, 4, 0, false, NULL);
INSERT INTO public.offer VALUES (104, 'Mieszkanie Mokotów', 100.00, 52.170598, 21.024806, 3, NULL, 5, 'Mieszkanie ze wspaniałym widokiem na wysokim piętrze', 1, 2, 0, false, 29);
INSERT INTO public.offer VALUES (2, 'Luxury Villa near Colosseum2', 250.00, 41.890200, 12.492200, 2, NULL, 5, 'Stunning villa with private garden', 4, 8, 4, false, NULL);


--
-- Data for Name: offer_amenity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.offer_amenity VALUES (1, 1);
INSERT INTO public.offer_amenity VALUES (1, 2);
INSERT INTO public.offer_amenity VALUES (1, 4);
INSERT INTO public.offer_amenity VALUES (1, 7);
INSERT INTO public.offer_amenity VALUES (1, 9);
INSERT INTO public.offer_amenity VALUES (1, 10);
INSERT INTO public.offer_amenity VALUES (1, 19);
INSERT INTO public.offer_amenity VALUES (1, 20);
INSERT INTO public.offer_amenity VALUES (1, 21);
INSERT INTO public.offer_amenity VALUES (1, 22);
INSERT INTO public.offer_amenity VALUES (1, 23);
INSERT INTO public.offer_amenity VALUES (1, 24);
INSERT INTO public.offer_amenity VALUES (1, 25);
INSERT INTO public.offer_amenity VALUES (1, 27);
INSERT INTO public.offer_amenity VALUES (1, 49);
INSERT INTO public.offer_amenity VALUES (2, 1);
INSERT INTO public.offer_amenity VALUES (2, 2);
INSERT INTO public.offer_amenity VALUES (2, 3);
INSERT INTO public.offer_amenity VALUES (2, 4);
INSERT INTO public.offer_amenity VALUES (2, 5);
INSERT INTO public.offer_amenity VALUES (2, 6);
INSERT INTO public.offer_amenity VALUES (2, 7);
INSERT INTO public.offer_amenity VALUES (2, 8);
INSERT INTO public.offer_amenity VALUES (2, 12);
INSERT INTO public.offer_amenity VALUES (2, 13);
INSERT INTO public.offer_amenity VALUES (2, 15);
INSERT INTO public.offer_amenity VALUES (2, 17);
INSERT INTO public.offer_amenity VALUES (2, 18);
INSERT INTO public.offer_amenity VALUES (2, 24);
INSERT INTO public.offer_amenity VALUES (2, 25);
INSERT INTO public.offer_amenity VALUES (2, 26);
INSERT INTO public.offer_amenity VALUES (2, 30);
INSERT INTO public.offer_amenity VALUES (2, 31);
INSERT INTO public.offer_amenity VALUES (2, 32);
INSERT INTO public.offer_amenity VALUES (2, 48);
INSERT INTO public.offer_amenity VALUES (3, 1);
INSERT INTO public.offer_amenity VALUES (3, 2);
INSERT INTO public.offer_amenity VALUES (3, 3);
INSERT INTO public.offer_amenity VALUES (3, 4);
INSERT INTO public.offer_amenity VALUES (3, 7);
INSERT INTO public.offer_amenity VALUES (3, 20);
INSERT INTO public.offer_amenity VALUES (3, 21);
INSERT INTO public.offer_amenity VALUES (3, 22);
INSERT INTO public.offer_amenity VALUES (3, 23);
INSERT INTO public.offer_amenity VALUES (3, 24);
INSERT INTO public.offer_amenity VALUES (3, 25);
INSERT INTO public.offer_amenity VALUES (3, 27);
INSERT INTO public.offer_amenity VALUES (4, 1);
INSERT INTO public.offer_amenity VALUES (4, 2);
INSERT INTO public.offer_amenity VALUES (4, 3);
INSERT INTO public.offer_amenity VALUES (4, 4);
INSERT INTO public.offer_amenity VALUES (4, 5);
INSERT INTO public.offer_amenity VALUES (4, 7);
INSERT INTO public.offer_amenity VALUES (4, 9);
INSERT INTO public.offer_amenity VALUES (4, 17);
INSERT INTO public.offer_amenity VALUES (4, 19);
INSERT INTO public.offer_amenity VALUES (4, 20);
INSERT INTO public.offer_amenity VALUES (4, 21);
INSERT INTO public.offer_amenity VALUES (4, 22);
INSERT INTO public.offer_amenity VALUES (4, 23);
INSERT INTO public.offer_amenity VALUES (4, 24);
INSERT INTO public.offer_amenity VALUES (4, 25);
INSERT INTO public.offer_amenity VALUES (4, 27);
INSERT INTO public.offer_amenity VALUES (4, 43);
INSERT INTO public.offer_amenity VALUES (4, 49);
INSERT INTO public.offer_amenity VALUES (5, 1);
INSERT INTO public.offer_amenity VALUES (5, 2);
INSERT INTO public.offer_amenity VALUES (5, 3);
INSERT INTO public.offer_amenity VALUES (5, 4);
INSERT INTO public.offer_amenity VALUES (5, 5);
INSERT INTO public.offer_amenity VALUES (5, 6);
INSERT INTO public.offer_amenity VALUES (5, 7);
INSERT INTO public.offer_amenity VALUES (5, 8);
INSERT INTO public.offer_amenity VALUES (5, 9);
INSERT INTO public.offer_amenity VALUES (5, 10);
INSERT INTO public.offer_amenity VALUES (5, 14);
INSERT INTO public.offer_amenity VALUES (5, 19);
INSERT INTO public.offer_amenity VALUES (5, 20);
INSERT INTO public.offer_amenity VALUES (5, 21);
INSERT INTO public.offer_amenity VALUES (5, 24);
INSERT INTO public.offer_amenity VALUES (5, 25);
INSERT INTO public.offer_amenity VALUES (5, 35);
INSERT INTO public.offer_amenity VALUES (5, 43);
INSERT INTO public.offer_amenity VALUES (5, 49);
INSERT INTO public.offer_amenity VALUES (5, 50);
INSERT INTO public.offer_amenity VALUES (6, 1);
INSERT INTO public.offer_amenity VALUES (6, 2);
INSERT INTO public.offer_amenity VALUES (6, 3);
INSERT INTO public.offer_amenity VALUES (6, 4);
INSERT INTO public.offer_amenity VALUES (6, 5);
INSERT INTO public.offer_amenity VALUES (6, 7);
INSERT INTO public.offer_amenity VALUES (6, 9);
INSERT INTO public.offer_amenity VALUES (6, 10);
INSERT INTO public.offer_amenity VALUES (6, 19);
INSERT INTO public.offer_amenity VALUES (6, 20);
INSERT INTO public.offer_amenity VALUES (6, 21);
INSERT INTO public.offer_amenity VALUES (6, 22);
INSERT INTO public.offer_amenity VALUES (6, 24);
INSERT INTO public.offer_amenity VALUES (6, 25);
INSERT INTO public.offer_amenity VALUES (6, 27);
INSERT INTO public.offer_amenity VALUES (6, 40);
INSERT INTO public.offer_amenity VALUES (6, 49);
INSERT INTO public.offer_amenity VALUES (7, 1);
INSERT INTO public.offer_amenity VALUES (7, 2);
INSERT INTO public.offer_amenity VALUES (7, 4);
INSERT INTO public.offer_amenity VALUES (7, 7);
INSERT INTO public.offer_amenity VALUES (7, 12);
INSERT INTO public.offer_amenity VALUES (7, 18);
INSERT INTO public.offer_amenity VALUES (7, 20);
INSERT INTO public.offer_amenity VALUES (7, 21);
INSERT INTO public.offer_amenity VALUES (7, 22);
INSERT INTO public.offer_amenity VALUES (7, 24);
INSERT INTO public.offer_amenity VALUES (7, 25);
INSERT INTO public.offer_amenity VALUES (7, 30);
INSERT INTO public.offer_amenity VALUES (7, 31);
INSERT INTO public.offer_amenity VALUES (7, 45);
INSERT INTO public.offer_amenity VALUES (8, 1);
INSERT INTO public.offer_amenity VALUES (8, 2);
INSERT INTO public.offer_amenity VALUES (8, 3);
INSERT INTO public.offer_amenity VALUES (8, 4);
INSERT INTO public.offer_amenity VALUES (8, 7);
INSERT INTO public.offer_amenity VALUES (8, 8);
INSERT INTO public.offer_amenity VALUES (8, 9);
INSERT INTO public.offer_amenity VALUES (8, 10);
INSERT INTO public.offer_amenity VALUES (8, 13);
INSERT INTO public.offer_amenity VALUES (8, 19);
INSERT INTO public.offer_amenity VALUES (8, 20);
INSERT INTO public.offer_amenity VALUES (8, 21);
INSERT INTO public.offer_amenity VALUES (8, 24);
INSERT INTO public.offer_amenity VALUES (8, 25);
INSERT INTO public.offer_amenity VALUES (8, 30);
INSERT INTO public.offer_amenity VALUES (8, 31);
INSERT INTO public.offer_amenity VALUES (8, 38);
INSERT INTO public.offer_amenity VALUES (8, 50);
INSERT INTO public.offer_amenity VALUES (9, 1);
INSERT INTO public.offer_amenity VALUES (9, 2);
INSERT INTO public.offer_amenity VALUES (9, 3);
INSERT INTO public.offer_amenity VALUES (9, 4);
INSERT INTO public.offer_amenity VALUES (9, 5);
INSERT INTO public.offer_amenity VALUES (9, 7);
INSERT INTO public.offer_amenity VALUES (9, 19);
INSERT INTO public.offer_amenity VALUES (9, 20);
INSERT INTO public.offer_amenity VALUES (9, 21);
INSERT INTO public.offer_amenity VALUES (9, 22);
INSERT INTO public.offer_amenity VALUES (9, 23);
INSERT INTO public.offer_amenity VALUES (9, 24);
INSERT INTO public.offer_amenity VALUES (9, 25);
INSERT INTO public.offer_amenity VALUES (9, 27);
INSERT INTO public.offer_amenity VALUES (9, 41);
INSERT INTO public.offer_amenity VALUES (9, 42);
INSERT INTO public.offer_amenity VALUES (10, 1);
INSERT INTO public.offer_amenity VALUES (10, 2);
INSERT INTO public.offer_amenity VALUES (10, 4);
INSERT INTO public.offer_amenity VALUES (10, 7);
INSERT INTO public.offer_amenity VALUES (10, 12);
INSERT INTO public.offer_amenity VALUES (10, 18);
INSERT INTO public.offer_amenity VALUES (10, 20);
INSERT INTO public.offer_amenity VALUES (10, 21);
INSERT INTO public.offer_amenity VALUES (10, 22);
INSERT INTO public.offer_amenity VALUES (10, 24);
INSERT INTO public.offer_amenity VALUES (10, 25);
INSERT INTO public.offer_amenity VALUES (10, 37);
INSERT INTO public.offer_amenity VALUES (10, 45);
INSERT INTO public.offer_amenity VALUES (11, 1);
INSERT INTO public.offer_amenity VALUES (11, 2);
INSERT INTO public.offer_amenity VALUES (11, 3);
INSERT INTO public.offer_amenity VALUES (11, 4);
INSERT INTO public.offer_amenity VALUES (11, 7);
INSERT INTO public.offer_amenity VALUES (11, 21);
INSERT INTO public.offer_amenity VALUES (11, 22);
INSERT INTO public.offer_amenity VALUES (11, 23);
INSERT INTO public.offer_amenity VALUES (11, 24);
INSERT INTO public.offer_amenity VALUES (11, 25);
INSERT INTO public.offer_amenity VALUES (11, 27);
INSERT INTO public.offer_amenity VALUES (12, 1);
INSERT INTO public.offer_amenity VALUES (12, 2);
INSERT INTO public.offer_amenity VALUES (12, 3);
INSERT INTO public.offer_amenity VALUES (12, 4);
INSERT INTO public.offer_amenity VALUES (12, 7);
INSERT INTO public.offer_amenity VALUES (12, 9);
INSERT INTO public.offer_amenity VALUES (12, 10);
INSERT INTO public.offer_amenity VALUES (12, 20);
INSERT INTO public.offer_amenity VALUES (12, 21);
INSERT INTO public.offer_amenity VALUES (12, 22);
INSERT INTO public.offer_amenity VALUES (12, 24);
INSERT INTO public.offer_amenity VALUES (12, 25);
INSERT INTO public.offer_amenity VALUES (12, 27);
INSERT INTO public.offer_amenity VALUES (12, 30);
INSERT INTO public.offer_amenity VALUES (12, 49);
INSERT INTO public.offer_amenity VALUES (13, 1);
INSERT INTO public.offer_amenity VALUES (13, 2);
INSERT INTO public.offer_amenity VALUES (13, 3);
INSERT INTO public.offer_amenity VALUES (13, 4);
INSERT INTO public.offer_amenity VALUES (13, 5);
INSERT INTO public.offer_amenity VALUES (13, 7);
INSERT INTO public.offer_amenity VALUES (13, 9);
INSERT INTO public.offer_amenity VALUES (13, 10);
INSERT INTO public.offer_amenity VALUES (13, 17);
INSERT INTO public.offer_amenity VALUES (13, 19);
INSERT INTO public.offer_amenity VALUES (13, 20);
INSERT INTO public.offer_amenity VALUES (13, 21);
INSERT INTO public.offer_amenity VALUES (13, 22);
INSERT INTO public.offer_amenity VALUES (13, 24);
INSERT INTO public.offer_amenity VALUES (13, 25);
INSERT INTO public.offer_amenity VALUES (13, 27);
INSERT INTO public.offer_amenity VALUES (13, 34);
INSERT INTO public.offer_amenity VALUES (13, 35);
INSERT INTO public.offer_amenity VALUES (13, 43);
INSERT INTO public.offer_amenity VALUES (14, 1);
INSERT INTO public.offer_amenity VALUES (14, 2);
INSERT INTO public.offer_amenity VALUES (14, 3);
INSERT INTO public.offer_amenity VALUES (14, 4);
INSERT INTO public.offer_amenity VALUES (14, 5);
INSERT INTO public.offer_amenity VALUES (14, 7);
INSERT INTO public.offer_amenity VALUES (14, 8);
INSERT INTO public.offer_amenity VALUES (14, 9);
INSERT INTO public.offer_amenity VALUES (14, 10);
INSERT INTO public.offer_amenity VALUES (14, 14);
INSERT INTO public.offer_amenity VALUES (14, 19);
INSERT INTO public.offer_amenity VALUES (14, 20);
INSERT INTO public.offer_amenity VALUES (14, 21);
INSERT INTO public.offer_amenity VALUES (14, 24);
INSERT INTO public.offer_amenity VALUES (14, 25);
INSERT INTO public.offer_amenity VALUES (14, 27);
INSERT INTO public.offer_amenity VALUES (14, 30);
INSERT INTO public.offer_amenity VALUES (14, 31);
INSERT INTO public.offer_amenity VALUES (14, 43);
INSERT INTO public.offer_amenity VALUES (14, 49);
INSERT INTO public.offer_amenity VALUES (15, 1);
INSERT INTO public.offer_amenity VALUES (15, 2);
INSERT INTO public.offer_amenity VALUES (15, 3);
INSERT INTO public.offer_amenity VALUES (15, 4);
INSERT INTO public.offer_amenity VALUES (15, 7);
INSERT INTO public.offer_amenity VALUES (15, 9);
INSERT INTO public.offer_amenity VALUES (15, 20);
INSERT INTO public.offer_amenity VALUES (15, 21);
INSERT INTO public.offer_amenity VALUES (15, 22);
INSERT INTO public.offer_amenity VALUES (15, 23);
INSERT INTO public.offer_amenity VALUES (15, 24);
INSERT INTO public.offer_amenity VALUES (15, 25);
INSERT INTO public.offer_amenity VALUES (15, 27);
INSERT INTO public.offer_amenity VALUES (15, 49);
INSERT INTO public.offer_amenity VALUES (16, 1);
INSERT INTO public.offer_amenity VALUES (16, 2);
INSERT INTO public.offer_amenity VALUES (16, 3);
INSERT INTO public.offer_amenity VALUES (16, 4);
INSERT INTO public.offer_amenity VALUES (16, 5);
INSERT INTO public.offer_amenity VALUES (16, 7);
INSERT INTO public.offer_amenity VALUES (16, 8);
INSERT INTO public.offer_amenity VALUES (16, 12);
INSERT INTO public.offer_amenity VALUES (16, 13);
INSERT INTO public.offer_amenity VALUES (16, 17);
INSERT INTO public.offer_amenity VALUES (16, 19);
INSERT INTO public.offer_amenity VALUES (16, 20);
INSERT INTO public.offer_amenity VALUES (16, 21);
INSERT INTO public.offer_amenity VALUES (16, 24);
INSERT INTO public.offer_amenity VALUES (16, 25);
INSERT INTO public.offer_amenity VALUES (16, 30);
INSERT INTO public.offer_amenity VALUES (16, 31);
INSERT INTO public.offer_amenity VALUES (16, 48);
INSERT INTO public.offer_amenity VALUES (17, 1);
INSERT INTO public.offer_amenity VALUES (17, 2);
INSERT INTO public.offer_amenity VALUES (17, 4);
INSERT INTO public.offer_amenity VALUES (17, 7);
INSERT INTO public.offer_amenity VALUES (17, 12);
INSERT INTO public.offer_amenity VALUES (17, 18);
INSERT INTO public.offer_amenity VALUES (17, 20);
INSERT INTO public.offer_amenity VALUES (17, 21);
INSERT INTO public.offer_amenity VALUES (17, 22);
INSERT INTO public.offer_amenity VALUES (17, 24);
INSERT INTO public.offer_amenity VALUES (17, 25);
INSERT INTO public.offer_amenity VALUES (17, 37);
INSERT INTO public.offer_amenity VALUES (17, 45);
INSERT INTO public.offer_amenity VALUES (18, 1);
INSERT INTO public.offer_amenity VALUES (18, 2);
INSERT INTO public.offer_amenity VALUES (18, 3);
INSERT INTO public.offer_amenity VALUES (18, 4);
INSERT INTO public.offer_amenity VALUES (18, 7);
INSERT INTO public.offer_amenity VALUES (18, 9);
INSERT INTO public.offer_amenity VALUES (18, 10);
INSERT INTO public.offer_amenity VALUES (18, 19);
INSERT INTO public.offer_amenity VALUES (18, 20);
INSERT INTO public.offer_amenity VALUES (18, 21);
INSERT INTO public.offer_amenity VALUES (18, 22);
INSERT INTO public.offer_amenity VALUES (18, 24);
INSERT INTO public.offer_amenity VALUES (18, 25);
INSERT INTO public.offer_amenity VALUES (18, 27);
INSERT INTO public.offer_amenity VALUES (18, 30);
INSERT INTO public.offer_amenity VALUES (18, 43);
INSERT INTO public.offer_amenity VALUES (18, 49);
INSERT INTO public.offer_amenity VALUES (19, 1);
INSERT INTO public.offer_amenity VALUES (19, 2);
INSERT INTO public.offer_amenity VALUES (19, 3);
INSERT INTO public.offer_amenity VALUES (19, 4);
INSERT INTO public.offer_amenity VALUES (19, 5);
INSERT INTO public.offer_amenity VALUES (19, 7);
INSERT INTO public.offer_amenity VALUES (19, 19);
INSERT INTO public.offer_amenity VALUES (19, 20);
INSERT INTO public.offer_amenity VALUES (19, 21);
INSERT INTO public.offer_amenity VALUES (19, 22);
INSERT INTO public.offer_amenity VALUES (19, 23);
INSERT INTO public.offer_amenity VALUES (19, 24);
INSERT INTO public.offer_amenity VALUES (19, 25);
INSERT INTO public.offer_amenity VALUES (19, 27);
INSERT INTO public.offer_amenity VALUES (19, 41);
INSERT INTO public.offer_amenity VALUES (19, 49);
INSERT INTO public.offer_amenity VALUES (20, 1);
INSERT INTO public.offer_amenity VALUES (20, 2);
INSERT INTO public.offer_amenity VALUES (20, 3);
INSERT INTO public.offer_amenity VALUES (20, 4);
INSERT INTO public.offer_amenity VALUES (20, 7);
INSERT INTO public.offer_amenity VALUES (20, 21);
INSERT INTO public.offer_amenity VALUES (20, 22);
INSERT INTO public.offer_amenity VALUES (20, 23);
INSERT INTO public.offer_amenity VALUES (20, 24);
INSERT INTO public.offer_amenity VALUES (20, 25);
INSERT INTO public.offer_amenity VALUES (20, 27);
INSERT INTO public.offer_amenity VALUES (20, 49);
INSERT INTO public.offer_amenity VALUES (21, 1);
INSERT INTO public.offer_amenity VALUES (21, 2);
INSERT INTO public.offer_amenity VALUES (21, 3);
INSERT INTO public.offer_amenity VALUES (21, 4);
INSERT INTO public.offer_amenity VALUES (21, 5);
INSERT INTO public.offer_amenity VALUES (21, 6);
INSERT INTO public.offer_amenity VALUES (21, 7);
INSERT INTO public.offer_amenity VALUES (21, 8);
INSERT INTO public.offer_amenity VALUES (21, 9);
INSERT INTO public.offer_amenity VALUES (21, 10);
INSERT INTO public.offer_amenity VALUES (21, 14);
INSERT INTO public.offer_amenity VALUES (21, 15);
INSERT INTO public.offer_amenity VALUES (21, 19);
INSERT INTO public.offer_amenity VALUES (21, 20);
INSERT INTO public.offer_amenity VALUES (21, 24);
INSERT INTO public.offer_amenity VALUES (21, 25);
INSERT INTO public.offer_amenity VALUES (21, 35);
INSERT INTO public.offer_amenity VALUES (21, 43);
INSERT INTO public.offer_amenity VALUES (21, 49);
INSERT INTO public.offer_amenity VALUES (21, 50);
INSERT INTO public.offer_amenity VALUES (22, 1);
INSERT INTO public.offer_amenity VALUES (22, 2);
INSERT INTO public.offer_amenity VALUES (22, 3);
INSERT INTO public.offer_amenity VALUES (22, 4);
INSERT INTO public.offer_amenity VALUES (22, 7);
INSERT INTO public.offer_amenity VALUES (22, 9);
INSERT INTO public.offer_amenity VALUES (22, 19);
INSERT INTO public.offer_amenity VALUES (22, 20);
INSERT INTO public.offer_amenity VALUES (22, 21);
INSERT INTO public.offer_amenity VALUES (22, 22);
INSERT INTO public.offer_amenity VALUES (22, 24);
INSERT INTO public.offer_amenity VALUES (22, 25);
INSERT INTO public.offer_amenity VALUES (22, 27);
INSERT INTO public.offer_amenity VALUES (22, 49);
INSERT INTO public.offer_amenity VALUES (23, 1);
INSERT INTO public.offer_amenity VALUES (23, 2);
INSERT INTO public.offer_amenity VALUES (23, 3);
INSERT INTO public.offer_amenity VALUES (23, 4);
INSERT INTO public.offer_amenity VALUES (23, 7);
INSERT INTO public.offer_amenity VALUES (23, 9);
INSERT INTO public.offer_amenity VALUES (23, 17);
INSERT INTO public.offer_amenity VALUES (23, 19);
INSERT INTO public.offer_amenity VALUES (23, 20);
INSERT INTO public.offer_amenity VALUES (23, 21);
INSERT INTO public.offer_amenity VALUES (23, 24);
INSERT INTO public.offer_amenity VALUES (23, 25);
INSERT INTO public.offer_amenity VALUES (23, 27);
INSERT INTO public.offer_amenity VALUES (23, 42);
INSERT INTO public.offer_amenity VALUES (23, 43);
INSERT INTO public.offer_amenity VALUES (24, 1);
INSERT INTO public.offer_amenity VALUES (24, 2);
INSERT INTO public.offer_amenity VALUES (24, 3);
INSERT INTO public.offer_amenity VALUES (24, 4);
INSERT INTO public.offer_amenity VALUES (24, 7);
INSERT INTO public.offer_amenity VALUES (24, 21);
INSERT INTO public.offer_amenity VALUES (24, 22);
INSERT INTO public.offer_amenity VALUES (24, 23);
INSERT INTO public.offer_amenity VALUES (24, 24);
INSERT INTO public.offer_amenity VALUES (24, 25);
INSERT INTO public.offer_amenity VALUES (24, 27);
INSERT INTO public.offer_amenity VALUES (25, 1);
INSERT INTO public.offer_amenity VALUES (25, 2);
INSERT INTO public.offer_amenity VALUES (25, 3);
INSERT INTO public.offer_amenity VALUES (25, 4);
INSERT INTO public.offer_amenity VALUES (25, 5);
INSERT INTO public.offer_amenity VALUES (25, 7);
INSERT INTO public.offer_amenity VALUES (25, 9);
INSERT INTO public.offer_amenity VALUES (25, 10);
INSERT INTO public.offer_amenity VALUES (25, 19);
INSERT INTO public.offer_amenity VALUES (25, 20);
INSERT INTO public.offer_amenity VALUES (25, 21);
INSERT INTO public.offer_amenity VALUES (25, 22);
INSERT INTO public.offer_amenity VALUES (25, 24);
INSERT INTO public.offer_amenity VALUES (25, 25);
INSERT INTO public.offer_amenity VALUES (25, 27);
INSERT INTO public.offer_amenity VALUES (25, 49);
INSERT INTO public.offer_amenity VALUES (26, 1);
INSERT INTO public.offer_amenity VALUES (26, 2);
INSERT INTO public.offer_amenity VALUES (26, 3);
INSERT INTO public.offer_amenity VALUES (26, 4);
INSERT INTO public.offer_amenity VALUES (26, 7);
INSERT INTO public.offer_amenity VALUES (26, 9);
INSERT INTO public.offer_amenity VALUES (26, 10);
INSERT INTO public.offer_amenity VALUES (26, 17);
INSERT INTO public.offer_amenity VALUES (26, 19);
INSERT INTO public.offer_amenity VALUES (26, 20);
INSERT INTO public.offer_amenity VALUES (26, 21);
INSERT INTO public.offer_amenity VALUES (26, 22);
INSERT INTO public.offer_amenity VALUES (26, 24);
INSERT INTO public.offer_amenity VALUES (26, 25);
INSERT INTO public.offer_amenity VALUES (26, 27);
INSERT INTO public.offer_amenity VALUES (26, 41);
INSERT INTO public.offer_amenity VALUES (26, 43);
INSERT INTO public.offer_amenity VALUES (27, 1);
INSERT INTO public.offer_amenity VALUES (27, 2);
INSERT INTO public.offer_amenity VALUES (27, 3);
INSERT INTO public.offer_amenity VALUES (27, 4);
INSERT INTO public.offer_amenity VALUES (27, 5);
INSERT INTO public.offer_amenity VALUES (27, 7);
INSERT INTO public.offer_amenity VALUES (27, 8);
INSERT INTO public.offer_amenity VALUES (27, 9);
INSERT INTO public.offer_amenity VALUES (27, 12);
INSERT INTO public.offer_amenity VALUES (27, 19);
INSERT INTO public.offer_amenity VALUES (27, 20);
INSERT INTO public.offer_amenity VALUES (27, 21);
INSERT INTO public.offer_amenity VALUES (27, 22);
INSERT INTO public.offer_amenity VALUES (27, 24);
INSERT INTO public.offer_amenity VALUES (27, 25);
INSERT INTO public.offer_amenity VALUES (27, 27);
INSERT INTO public.offer_amenity VALUES (27, 30);
INSERT INTO public.offer_amenity VALUES (27, 45);
INSERT INTO public.offer_amenity VALUES (28, 1);
INSERT INTO public.offer_amenity VALUES (28, 2);
INSERT INTO public.offer_amenity VALUES (28, 3);
INSERT INTO public.offer_amenity VALUES (28, 4);
INSERT INTO public.offer_amenity VALUES (28, 7);
INSERT INTO public.offer_amenity VALUES (28, 8);
INSERT INTO public.offer_amenity VALUES (28, 9);
INSERT INTO public.offer_amenity VALUES (28, 10);
INSERT INTO public.offer_amenity VALUES (28, 19);
INSERT INTO public.offer_amenity VALUES (28, 20);
INSERT INTO public.offer_amenity VALUES (28, 21);
INSERT INTO public.offer_amenity VALUES (28, 24);
INSERT INTO public.offer_amenity VALUES (28, 25);
INSERT INTO public.offer_amenity VALUES (28, 27);
INSERT INTO public.offer_amenity VALUES (28, 36);
INSERT INTO public.offer_amenity VALUES (28, 49);
INSERT INTO public.offer_amenity VALUES (29, 1);
INSERT INTO public.offer_amenity VALUES (29, 2);
INSERT INTO public.offer_amenity VALUES (29, 3);
INSERT INTO public.offer_amenity VALUES (29, 4);
INSERT INTO public.offer_amenity VALUES (29, 7);
INSERT INTO public.offer_amenity VALUES (29, 21);
INSERT INTO public.offer_amenity VALUES (29, 22);
INSERT INTO public.offer_amenity VALUES (29, 24);
INSERT INTO public.offer_amenity VALUES (29, 25);
INSERT INTO public.offer_amenity VALUES (29, 27);
INSERT INTO public.offer_amenity VALUES (30, 1);
INSERT INTO public.offer_amenity VALUES (30, 2);
INSERT INTO public.offer_amenity VALUES (30, 3);
INSERT INTO public.offer_amenity VALUES (30, 4);
INSERT INTO public.offer_amenity VALUES (30, 5);
INSERT INTO public.offer_amenity VALUES (30, 7);
INSERT INTO public.offer_amenity VALUES (30, 8);
INSERT INTO public.offer_amenity VALUES (30, 12);
INSERT INTO public.offer_amenity VALUES (30, 13);
INSERT INTO public.offer_amenity VALUES (30, 18);
INSERT INTO public.offer_amenity VALUES (30, 19);
INSERT INTO public.offer_amenity VALUES (30, 20);
INSERT INTO public.offer_amenity VALUES (30, 21);
INSERT INTO public.offer_amenity VALUES (30, 24);
INSERT INTO public.offer_amenity VALUES (30, 25);
INSERT INTO public.offer_amenity VALUES (30, 30);
INSERT INTO public.offer_amenity VALUES (30, 31);
INSERT INTO public.offer_amenity VALUES (30, 37);
INSERT INTO public.offer_amenity VALUES (30, 45);
INSERT INTO public.offer_amenity VALUES (31, 1);
INSERT INTO public.offer_amenity VALUES (31, 2);
INSERT INTO public.offer_amenity VALUES (31, 3);
INSERT INTO public.offer_amenity VALUES (31, 4);
INSERT INTO public.offer_amenity VALUES (31, 7);
INSERT INTO public.offer_amenity VALUES (31, 9);
INSERT INTO public.offer_amenity VALUES (31, 17);
INSERT INTO public.offer_amenity VALUES (31, 19);
INSERT INTO public.offer_amenity VALUES (31, 20);
INSERT INTO public.offer_amenity VALUES (31, 21);
INSERT INTO public.offer_amenity VALUES (31, 22);
INSERT INTO public.offer_amenity VALUES (31, 24);
INSERT INTO public.offer_amenity VALUES (31, 25);
INSERT INTO public.offer_amenity VALUES (31, 27);
INSERT INTO public.offer_amenity VALUES (31, 49);
INSERT INTO public.offer_amenity VALUES (32, 1);
INSERT INTO public.offer_amenity VALUES (32, 2);
INSERT INTO public.offer_amenity VALUES (32, 3);
INSERT INTO public.offer_amenity VALUES (32, 4);
INSERT INTO public.offer_amenity VALUES (32, 7);
INSERT INTO public.offer_amenity VALUES (32, 9);
INSERT INTO public.offer_amenity VALUES (32, 21);
INSERT INTO public.offer_amenity VALUES (32, 22);
INSERT INTO public.offer_amenity VALUES (32, 23);
INSERT INTO public.offer_amenity VALUES (32, 24);
INSERT INTO public.offer_amenity VALUES (32, 25);
INSERT INTO public.offer_amenity VALUES (32, 27);
INSERT INTO public.offer_amenity VALUES (33, 1);
INSERT INTO public.offer_amenity VALUES (33, 2);
INSERT INTO public.offer_amenity VALUES (33, 3);
INSERT INTO public.offer_amenity VALUES (33, 4);
INSERT INTO public.offer_amenity VALUES (33, 7);
INSERT INTO public.offer_amenity VALUES (33, 9);
INSERT INTO public.offer_amenity VALUES (33, 10);
INSERT INTO public.offer_amenity VALUES (33, 14);
INSERT INTO public.offer_amenity VALUES (33, 19);
INSERT INTO public.offer_amenity VALUES (33, 20);
INSERT INTO public.offer_amenity VALUES (33, 21);
INSERT INTO public.offer_amenity VALUES (33, 24);
INSERT INTO public.offer_amenity VALUES (33, 25);
INSERT INTO public.offer_amenity VALUES (33, 27);
INSERT INTO public.offer_amenity VALUES (33, 30);
INSERT INTO public.offer_amenity VALUES (33, 31);
INSERT INTO public.offer_amenity VALUES (33, 47);
INSERT INTO public.offer_amenity VALUES (34, 1);
INSERT INTO public.offer_amenity VALUES (34, 2);
INSERT INTO public.offer_amenity VALUES (34, 3);
INSERT INTO public.offer_amenity VALUES (34, 4);
INSERT INTO public.offer_amenity VALUES (34, 5);
INSERT INTO public.offer_amenity VALUES (34, 7);
INSERT INTO public.offer_amenity VALUES (34, 9);
INSERT INTO public.offer_amenity VALUES (34, 17);
INSERT INTO public.offer_amenity VALUES (34, 19);
INSERT INTO public.offer_amenity VALUES (34, 20);
INSERT INTO public.offer_amenity VALUES (34, 21);
INSERT INTO public.offer_amenity VALUES (34, 22);
INSERT INTO public.offer_amenity VALUES (34, 24);
INSERT INTO public.offer_amenity VALUES (34, 25);
INSERT INTO public.offer_amenity VALUES (34, 27);
INSERT INTO public.offer_amenity VALUES (34, 49);
INSERT INTO public.offer_amenity VALUES (35, 1);
INSERT INTO public.offer_amenity VALUES (35, 2);
INSERT INTO public.offer_amenity VALUES (35, 3);
INSERT INTO public.offer_amenity VALUES (35, 4);
INSERT INTO public.offer_amenity VALUES (35, 7);
INSERT INTO public.offer_amenity VALUES (35, 17);
INSERT INTO public.offer_amenity VALUES (35, 19);
INSERT INTO public.offer_amenity VALUES (35, 21);
INSERT INTO public.offer_amenity VALUES (35, 22);
INSERT INTO public.offer_amenity VALUES (35, 24);
INSERT INTO public.offer_amenity VALUES (35, 25);
INSERT INTO public.offer_amenity VALUES (35, 27);
INSERT INTO public.offer_amenity VALUES (35, 41);
INSERT INTO public.offer_amenity VALUES (36, 1);
INSERT INTO public.offer_amenity VALUES (36, 2);
INSERT INTO public.offer_amenity VALUES (36, 3);
INSERT INTO public.offer_amenity VALUES (36, 4);
INSERT INTO public.offer_amenity VALUES (36, 5);
INSERT INTO public.offer_amenity VALUES (36, 6);
INSERT INTO public.offer_amenity VALUES (36, 7);
INSERT INTO public.offer_amenity VALUES (36, 8);
INSERT INTO public.offer_amenity VALUES (36, 12);
INSERT INTO public.offer_amenity VALUES (36, 13);
INSERT INTO public.offer_amenity VALUES (36, 15);
INSERT INTO public.offer_amenity VALUES (36, 17);
INSERT INTO public.offer_amenity VALUES (36, 18);
INSERT INTO public.offer_amenity VALUES (36, 19);
INSERT INTO public.offer_amenity VALUES (36, 20);
INSERT INTO public.offer_amenity VALUES (36, 24);
INSERT INTO public.offer_amenity VALUES (36, 25);
INSERT INTO public.offer_amenity VALUES (36, 30);
INSERT INTO public.offer_amenity VALUES (36, 31);
INSERT INTO public.offer_amenity VALUES (36, 48);
INSERT INTO public.offer_amenity VALUES (37, 1);
INSERT INTO public.offer_amenity VALUES (37, 2);
INSERT INTO public.offer_amenity VALUES (37, 3);
INSERT INTO public.offer_amenity VALUES (37, 4);
INSERT INTO public.offer_amenity VALUES (37, 7);
INSERT INTO public.offer_amenity VALUES (37, 8);
INSERT INTO public.offer_amenity VALUES (37, 9);
INSERT INTO public.offer_amenity VALUES (37, 19);
INSERT INTO public.offer_amenity VALUES (37, 20);
INSERT INTO public.offer_amenity VALUES (37, 21);
INSERT INTO public.offer_amenity VALUES (37, 24);
INSERT INTO public.offer_amenity VALUES (37, 25);
INSERT INTO public.offer_amenity VALUES (37, 27);
INSERT INTO public.offer_amenity VALUES (37, 49);
INSERT INTO public.offer_amenity VALUES (38, 1);
INSERT INTO public.offer_amenity VALUES (38, 2);
INSERT INTO public.offer_amenity VALUES (38, 3);
INSERT INTO public.offer_amenity VALUES (38, 4);
INSERT INTO public.offer_amenity VALUES (38, 7);
INSERT INTO public.offer_amenity VALUES (38, 9);
INSERT INTO public.offer_amenity VALUES (38, 17);
INSERT INTO public.offer_amenity VALUES (38, 19);
INSERT INTO public.offer_amenity VALUES (38, 20);
INSERT INTO public.offer_amenity VALUES (38, 21);
INSERT INTO public.offer_amenity VALUES (38, 22);
INSERT INTO public.offer_amenity VALUES (38, 24);
INSERT INTO public.offer_amenity VALUES (38, 25);
INSERT INTO public.offer_amenity VALUES (38, 27);
INSERT INTO public.offer_amenity VALUES (38, 42);
INSERT INTO public.offer_amenity VALUES (38, 43);
INSERT INTO public.offer_amenity VALUES (39, 1);
INSERT INTO public.offer_amenity VALUES (39, 2);
INSERT INTO public.offer_amenity VALUES (39, 3);
INSERT INTO public.offer_amenity VALUES (39, 4);
INSERT INTO public.offer_amenity VALUES (39, 7);
INSERT INTO public.offer_amenity VALUES (39, 20);
INSERT INTO public.offer_amenity VALUES (39, 21);
INSERT INTO public.offer_amenity VALUES (39, 22);
INSERT INTO public.offer_amenity VALUES (39, 24);
INSERT INTO public.offer_amenity VALUES (39, 25);
INSERT INTO public.offer_amenity VALUES (39, 27);
INSERT INTO public.offer_amenity VALUES (39, 37);
INSERT INTO public.offer_amenity VALUES (40, 1);
INSERT INTO public.offer_amenity VALUES (40, 2);
INSERT INTO public.offer_amenity VALUES (40, 3);
INSERT INTO public.offer_amenity VALUES (40, 4);
INSERT INTO public.offer_amenity VALUES (40, 7);
INSERT INTO public.offer_amenity VALUES (40, 17);
INSERT INTO public.offer_amenity VALUES (40, 21);
INSERT INTO public.offer_amenity VALUES (40, 22);
INSERT INTO public.offer_amenity VALUES (40, 23);
INSERT INTO public.offer_amenity VALUES (40, 24);
INSERT INTO public.offer_amenity VALUES (40, 25);
INSERT INTO public.offer_amenity VALUES (40, 27);
INSERT INTO public.offer_amenity VALUES (40, 43);
INSERT INTO public.offer_amenity VALUES (41, 1);
INSERT INTO public.offer_amenity VALUES (41, 2);
INSERT INTO public.offer_amenity VALUES (41, 3);
INSERT INTO public.offer_amenity VALUES (41, 4);
INSERT INTO public.offer_amenity VALUES (41, 7);
INSERT INTO public.offer_amenity VALUES (41, 21);
INSERT INTO public.offer_amenity VALUES (41, 22);
INSERT INTO public.offer_amenity VALUES (41, 24);
INSERT INTO public.offer_amenity VALUES (41, 25);
INSERT INTO public.offer_amenity VALUES (41, 27);
INSERT INTO public.offer_amenity VALUES (41, 42);
INSERT INTO public.offer_amenity VALUES (42, 1);
INSERT INTO public.offer_amenity VALUES (42, 2);
INSERT INTO public.offer_amenity VALUES (42, 3);
INSERT INTO public.offer_amenity VALUES (42, 4);
INSERT INTO public.offer_amenity VALUES (42, 7);
INSERT INTO public.offer_amenity VALUES (42, 21);
INSERT INTO public.offer_amenity VALUES (42, 22);
INSERT INTO public.offer_amenity VALUES (42, 24);
INSERT INTO public.offer_amenity VALUES (42, 25);
INSERT INTO public.offer_amenity VALUES (42, 49);
INSERT INTO public.offer_amenity VALUES (43, 1);
INSERT INTO public.offer_amenity VALUES (43, 2);
INSERT INTO public.offer_amenity VALUES (43, 3);
INSERT INTO public.offer_amenity VALUES (43, 4);
INSERT INTO public.offer_amenity VALUES (43, 5);
INSERT INTO public.offer_amenity VALUES (43, 7);
INSERT INTO public.offer_amenity VALUES (43, 8);
INSERT INTO public.offer_amenity VALUES (43, 12);
INSERT INTO public.offer_amenity VALUES (43, 13);
INSERT INTO public.offer_amenity VALUES (43, 15);
INSERT INTO public.offer_amenity VALUES (43, 17);
INSERT INTO public.offer_amenity VALUES (43, 18);
INSERT INTO public.offer_amenity VALUES (43, 19);
INSERT INTO public.offer_amenity VALUES (43, 20);
INSERT INTO public.offer_amenity VALUES (43, 24);
INSERT INTO public.offer_amenity VALUES (43, 25);
INSERT INTO public.offer_amenity VALUES (43, 30);
INSERT INTO public.offer_amenity VALUES (43, 31);
INSERT INTO public.offer_amenity VALUES (43, 45);
INSERT INTO public.offer_amenity VALUES (44, 1);
INSERT INTO public.offer_amenity VALUES (44, 2);
INSERT INTO public.offer_amenity VALUES (44, 3);
INSERT INTO public.offer_amenity VALUES (44, 4);
INSERT INTO public.offer_amenity VALUES (44, 5);
INSERT INTO public.offer_amenity VALUES (44, 7);
INSERT INTO public.offer_amenity VALUES (44, 8);
INSERT INTO public.offer_amenity VALUES (44, 12);
INSERT INTO public.offer_amenity VALUES (44, 17);
INSERT INTO public.offer_amenity VALUES (44, 19);
INSERT INTO public.offer_amenity VALUES (44, 20);
INSERT INTO public.offer_amenity VALUES (44, 21);
INSERT INTO public.offer_amenity VALUES (44, 22);
INSERT INTO public.offer_amenity VALUES (44, 24);
INSERT INTO public.offer_amenity VALUES (44, 25);
INSERT INTO public.offer_amenity VALUES (44, 30);
INSERT INTO public.offer_amenity VALUES (44, 45);
INSERT INTO public.offer_amenity VALUES (45, 1);
INSERT INTO public.offer_amenity VALUES (45, 2);
INSERT INTO public.offer_amenity VALUES (45, 3);
INSERT INTO public.offer_amenity VALUES (45, 4);
INSERT INTO public.offer_amenity VALUES (45, 7);
INSERT INTO public.offer_amenity VALUES (45, 9);
INSERT INTO public.offer_amenity VALUES (45, 17);
INSERT INTO public.offer_amenity VALUES (45, 19);
INSERT INTO public.offer_amenity VALUES (45, 20);
INSERT INTO public.offer_amenity VALUES (45, 21);
INSERT INTO public.offer_amenity VALUES (45, 24);
INSERT INTO public.offer_amenity VALUES (45, 25);
INSERT INTO public.offer_amenity VALUES (45, 27);
INSERT INTO public.offer_amenity VALUES (45, 41);
INSERT INTO public.offer_amenity VALUES (45, 49);
INSERT INTO public.offer_amenity VALUES (46, 1);
INSERT INTO public.offer_amenity VALUES (46, 2);
INSERT INTO public.offer_amenity VALUES (46, 3);
INSERT INTO public.offer_amenity VALUES (46, 4);
INSERT INTO public.offer_amenity VALUES (46, 7);
INSERT INTO public.offer_amenity VALUES (46, 21);
INSERT INTO public.offer_amenity VALUES (46, 22);
INSERT INTO public.offer_amenity VALUES (46, 24);
INSERT INTO public.offer_amenity VALUES (46, 25);
INSERT INTO public.offer_amenity VALUES (46, 27);
INSERT INTO public.offer_amenity VALUES (47, 1);
INSERT INTO public.offer_amenity VALUES (47, 2);
INSERT INTO public.offer_amenity VALUES (47, 3);
INSERT INTO public.offer_amenity VALUES (47, 4);
INSERT INTO public.offer_amenity VALUES (47, 5);
INSERT INTO public.offer_amenity VALUES (47, 6);
INSERT INTO public.offer_amenity VALUES (47, 7);
INSERT INTO public.offer_amenity VALUES (47, 8);
INSERT INTO public.offer_amenity VALUES (47, 9);
INSERT INTO public.offer_amenity VALUES (47, 10);
INSERT INTO public.offer_amenity VALUES (47, 14);
INSERT INTO public.offer_amenity VALUES (47, 15);
INSERT INTO public.offer_amenity VALUES (47, 19);
INSERT INTO public.offer_amenity VALUES (47, 20);
INSERT INTO public.offer_amenity VALUES (47, 24);
INSERT INTO public.offer_amenity VALUES (47, 25);
INSERT INTO public.offer_amenity VALUES (47, 35);
INSERT INTO public.offer_amenity VALUES (47, 43);
INSERT INTO public.offer_amenity VALUES (47, 48);
INSERT INTO public.offer_amenity VALUES (47, 49);
INSERT INTO public.offer_amenity VALUES (48, 1);
INSERT INTO public.offer_amenity VALUES (48, 2);
INSERT INTO public.offer_amenity VALUES (48, 3);
INSERT INTO public.offer_amenity VALUES (48, 4);
INSERT INTO public.offer_amenity VALUES (48, 7);
INSERT INTO public.offer_amenity VALUES (48, 9);
INSERT INTO public.offer_amenity VALUES (48, 21);
INSERT INTO public.offer_amenity VALUES (48, 22);
INSERT INTO public.offer_amenity VALUES (48, 24);
INSERT INTO public.offer_amenity VALUES (48, 25);
INSERT INTO public.offer_amenity VALUES (48, 27);
INSERT INTO public.offer_amenity VALUES (49, 1);
INSERT INTO public.offer_amenity VALUES (49, 2);
INSERT INTO public.offer_amenity VALUES (49, 3);
INSERT INTO public.offer_amenity VALUES (49, 4);
INSERT INTO public.offer_amenity VALUES (49, 7);
INSERT INTO public.offer_amenity VALUES (49, 9);
INSERT INTO public.offer_amenity VALUES (49, 20);
INSERT INTO public.offer_amenity VALUES (49, 21);
INSERT INTO public.offer_amenity VALUES (49, 22);
INSERT INTO public.offer_amenity VALUES (49, 24);
INSERT INTO public.offer_amenity VALUES (49, 25);
INSERT INTO public.offer_amenity VALUES (49, 27);
INSERT INTO public.offer_amenity VALUES (49, 30);
INSERT INTO public.offer_amenity VALUES (49, 37);
INSERT INTO public.offer_amenity VALUES (50, 1);
INSERT INTO public.offer_amenity VALUES (50, 2);
INSERT INTO public.offer_amenity VALUES (50, 3);
INSERT INTO public.offer_amenity VALUES (50, 4);
INSERT INTO public.offer_amenity VALUES (50, 7);
INSERT INTO public.offer_amenity VALUES (50, 9);
INSERT INTO public.offer_amenity VALUES (50, 17);
INSERT INTO public.offer_amenity VALUES (50, 19);
INSERT INTO public.offer_amenity VALUES (50, 20);
INSERT INTO public.offer_amenity VALUES (50, 21);
INSERT INTO public.offer_amenity VALUES (50, 22);
INSERT INTO public.offer_amenity VALUES (50, 24);
INSERT INTO public.offer_amenity VALUES (50, 25);
INSERT INTO public.offer_amenity VALUES (50, 27);
INSERT INTO public.offer_amenity VALUES (50, 42);
INSERT INTO public.offer_amenity VALUES (50, 43);
INSERT INTO public.offer_amenity VALUES (51, 1);
INSERT INTO public.offer_amenity VALUES (51, 2);
INSERT INTO public.offer_amenity VALUES (51, 3);
INSERT INTO public.offer_amenity VALUES (51, 4);
INSERT INTO public.offer_amenity VALUES (51, 7);
INSERT INTO public.offer_amenity VALUES (51, 12);
INSERT INTO public.offer_amenity VALUES (51, 18);
INSERT INTO public.offer_amenity VALUES (51, 21);
INSERT INTO public.offer_amenity VALUES (51, 24);
INSERT INTO public.offer_amenity VALUES (51, 25);
INSERT INTO public.offer_amenity VALUES (51, 37);
INSERT INTO public.offer_amenity VALUES (51, 45);
INSERT INTO public.offer_amenity VALUES (52, 1);
INSERT INTO public.offer_amenity VALUES (52, 2);
INSERT INTO public.offer_amenity VALUES (52, 3);
INSERT INTO public.offer_amenity VALUES (52, 4);
INSERT INTO public.offer_amenity VALUES (52, 7);
INSERT INTO public.offer_amenity VALUES (52, 9);
INSERT INTO public.offer_amenity VALUES (52, 10);
INSERT INTO public.offer_amenity VALUES (52, 19);
INSERT INTO public.offer_amenity VALUES (52, 20);
INSERT INTO public.offer_amenity VALUES (52, 21);
INSERT INTO public.offer_amenity VALUES (52, 24);
INSERT INTO public.offer_amenity VALUES (52, 25);
INSERT INTO public.offer_amenity VALUES (52, 27);
INSERT INTO public.offer_amenity VALUES (52, 49);
INSERT INTO public.offer_amenity VALUES (53, 1);
INSERT INTO public.offer_amenity VALUES (53, 2);
INSERT INTO public.offer_amenity VALUES (53, 3);
INSERT INTO public.offer_amenity VALUES (53, 4);
INSERT INTO public.offer_amenity VALUES (53, 7);
INSERT INTO public.offer_amenity VALUES (53, 9);
INSERT INTO public.offer_amenity VALUES (53, 10);
INSERT INTO public.offer_amenity VALUES (53, 14);
INSERT INTO public.offer_amenity VALUES (53, 19);
INSERT INTO public.offer_amenity VALUES (53, 20);
INSERT INTO public.offer_amenity VALUES (53, 21);
INSERT INTO public.offer_amenity VALUES (53, 24);
INSERT INTO public.offer_amenity VALUES (53, 25);
INSERT INTO public.offer_amenity VALUES (53, 27);
INSERT INTO public.offer_amenity VALUES (53, 30);
INSERT INTO public.offer_amenity VALUES (54, 1);
INSERT INTO public.offer_amenity VALUES (54, 2);
INSERT INTO public.offer_amenity VALUES (54, 3);
INSERT INTO public.offer_amenity VALUES (54, 4);
INSERT INTO public.offer_amenity VALUES (54, 5);
INSERT INTO public.offer_amenity VALUES (54, 7);
INSERT INTO public.offer_amenity VALUES (54, 8);
INSERT INTO public.offer_amenity VALUES (54, 9);
INSERT INTO public.offer_amenity VALUES (54, 12);
INSERT INTO public.offer_amenity VALUES (54, 19);
INSERT INTO public.offer_amenity VALUES (54, 20);
INSERT INTO public.offer_amenity VALUES (54, 21);
INSERT INTO public.offer_amenity VALUES (54, 22);
INSERT INTO public.offer_amenity VALUES (54, 24);
INSERT INTO public.offer_amenity VALUES (54, 25);
INSERT INTO public.offer_amenity VALUES (54, 28);
INSERT INTO public.offer_amenity VALUES (54, 29);
INSERT INTO public.offer_amenity VALUES (54, 45);
INSERT INTO public.offer_amenity VALUES (55, 1);
INSERT INTO public.offer_amenity VALUES (55, 2);
INSERT INTO public.offer_amenity VALUES (55, 3);
INSERT INTO public.offer_amenity VALUES (55, 4);
INSERT INTO public.offer_amenity VALUES (55, 7);
INSERT INTO public.offer_amenity VALUES (55, 9);
INSERT INTO public.offer_amenity VALUES (55, 17);
INSERT INTO public.offer_amenity VALUES (55, 19);
INSERT INTO public.offer_amenity VALUES (55, 20);
INSERT INTO public.offer_amenity VALUES (55, 21);
INSERT INTO public.offer_amenity VALUES (55, 22);
INSERT INTO public.offer_amenity VALUES (55, 24);
INSERT INTO public.offer_amenity VALUES (55, 25);
INSERT INTO public.offer_amenity VALUES (55, 27);
INSERT INTO public.offer_amenity VALUES (55, 49);
INSERT INTO public.offer_amenity VALUES (56, 1);
INSERT INTO public.offer_amenity VALUES (56, 2);
INSERT INTO public.offer_amenity VALUES (56, 3);
INSERT INTO public.offer_amenity VALUES (56, 4);
INSERT INTO public.offer_amenity VALUES (56, 5);
INSERT INTO public.offer_amenity VALUES (56, 6);
INSERT INTO public.offer_amenity VALUES (56, 7);
INSERT INTO public.offer_amenity VALUES (56, 8);
INSERT INTO public.offer_amenity VALUES (56, 12);
INSERT INTO public.offer_amenity VALUES (56, 13);
INSERT INTO public.offer_amenity VALUES (56, 15);
INSERT INTO public.offer_amenity VALUES (56, 16);
INSERT INTO public.offer_amenity VALUES (56, 18);
INSERT INTO public.offer_amenity VALUES (56, 19);
INSERT INTO public.offer_amenity VALUES (56, 20);
INSERT INTO public.offer_amenity VALUES (56, 24);
INSERT INTO public.offer_amenity VALUES (56, 25);
INSERT INTO public.offer_amenity VALUES (56, 30);
INSERT INTO public.offer_amenity VALUES (56, 31);
INSERT INTO public.offer_amenity VALUES (56, 45);
INSERT INTO public.offer_amenity VALUES (57, 1);
INSERT INTO public.offer_amenity VALUES (57, 2);
INSERT INTO public.offer_amenity VALUES (57, 3);
INSERT INTO public.offer_amenity VALUES (57, 4);
INSERT INTO public.offer_amenity VALUES (57, 7);
INSERT INTO public.offer_amenity VALUES (57, 8);
INSERT INTO public.offer_amenity VALUES (57, 9);
INSERT INTO public.offer_amenity VALUES (57, 14);
INSERT INTO public.offer_amenity VALUES (57, 19);
INSERT INTO public.offer_amenity VALUES (57, 20);
INSERT INTO public.offer_amenity VALUES (57, 21);
INSERT INTO public.offer_amenity VALUES (57, 24);
INSERT INTO public.offer_amenity VALUES (57, 25);
INSERT INTO public.offer_amenity VALUES (57, 27);
INSERT INTO public.offer_amenity VALUES (58, 1);
INSERT INTO public.offer_amenity VALUES (58, 2);
INSERT INTO public.offer_amenity VALUES (58, 3);
INSERT INTO public.offer_amenity VALUES (58, 4);
INSERT INTO public.offer_amenity VALUES (58, 5);
INSERT INTO public.offer_amenity VALUES (58, 7);
INSERT INTO public.offer_amenity VALUES (58, 8);
INSERT INTO public.offer_amenity VALUES (58, 19);
INSERT INTO public.offer_amenity VALUES (58, 20);
INSERT INTO public.offer_amenity VALUES (58, 21);
INSERT INTO public.offer_amenity VALUES (58, 22);
INSERT INTO public.offer_amenity VALUES (58, 24);
INSERT INTO public.offer_amenity VALUES (58, 25);
INSERT INTO public.offer_amenity VALUES (58, 28);
INSERT INTO public.offer_amenity VALUES (58, 29);
INSERT INTO public.offer_amenity VALUES (58, 30);
INSERT INTO public.offer_amenity VALUES (59, 1);
INSERT INTO public.offer_amenity VALUES (59, 2);
INSERT INTO public.offer_amenity VALUES (59, 3);
INSERT INTO public.offer_amenity VALUES (59, 4);
INSERT INTO public.offer_amenity VALUES (59, 7);
INSERT INTO public.offer_amenity VALUES (59, 9);
INSERT INTO public.offer_amenity VALUES (59, 10);
INSERT INTO public.offer_amenity VALUES (59, 17);
INSERT INTO public.offer_amenity VALUES (59, 19);
INSERT INTO public.offer_amenity VALUES (59, 20);
INSERT INTO public.offer_amenity VALUES (59, 21);
INSERT INTO public.offer_amenity VALUES (59, 22);
INSERT INTO public.offer_amenity VALUES (59, 24);
INSERT INTO public.offer_amenity VALUES (59, 25);
INSERT INTO public.offer_amenity VALUES (59, 27);
INSERT INTO public.offer_amenity VALUES (59, 35);
INSERT INTO public.offer_amenity VALUES (59, 43);
INSERT INTO public.offer_amenity VALUES (60, 1);
INSERT INTO public.offer_amenity VALUES (60, 2);
INSERT INTO public.offer_amenity VALUES (60, 3);
INSERT INTO public.offer_amenity VALUES (60, 4);
INSERT INTO public.offer_amenity VALUES (60, 7);
INSERT INTO public.offer_amenity VALUES (60, 21);
INSERT INTO public.offer_amenity VALUES (60, 22);
INSERT INTO public.offer_amenity VALUES (60, 24);
INSERT INTO public.offer_amenity VALUES (60, 25);
INSERT INTO public.offer_amenity VALUES (60, 27);
INSERT INTO public.offer_amenity VALUES (61, 1);
INSERT INTO public.offer_amenity VALUES (61, 2);
INSERT INTO public.offer_amenity VALUES (61, 3);
INSERT INTO public.offer_amenity VALUES (61, 4);
INSERT INTO public.offer_amenity VALUES (61, 7);
INSERT INTO public.offer_amenity VALUES (61, 9);
INSERT INTO public.offer_amenity VALUES (61, 10);
INSERT INTO public.offer_amenity VALUES (61, 19);
INSERT INTO public.offer_amenity VALUES (61, 20);
INSERT INTO public.offer_amenity VALUES (61, 21);
INSERT INTO public.offer_amenity VALUES (61, 24);
INSERT INTO public.offer_amenity VALUES (61, 25);
INSERT INTO public.offer_amenity VALUES (61, 27);
INSERT INTO public.offer_amenity VALUES (61, 41);
INSERT INTO public.offer_amenity VALUES (61, 42);
INSERT INTO public.offer_amenity VALUES (62, 1);
INSERT INTO public.offer_amenity VALUES (62, 2);
INSERT INTO public.offer_amenity VALUES (62, 3);
INSERT INTO public.offer_amenity VALUES (62, 4);
INSERT INTO public.offer_amenity VALUES (62, 7);
INSERT INTO public.offer_amenity VALUES (62, 9);
INSERT INTO public.offer_amenity VALUES (62, 17);
INSERT INTO public.offer_amenity VALUES (62, 19);
INSERT INTO public.offer_amenity VALUES (62, 20);
INSERT INTO public.offer_amenity VALUES (62, 21);
INSERT INTO public.offer_amenity VALUES (62, 22);
INSERT INTO public.offer_amenity VALUES (62, 24);
INSERT INTO public.offer_amenity VALUES (62, 25);
INSERT INTO public.offer_amenity VALUES (62, 27);
INSERT INTO public.offer_amenity VALUES (62, 41);
INSERT INTO public.offer_amenity VALUES (62, 43);
INSERT INTO public.offer_amenity VALUES (63, 1);
INSERT INTO public.offer_amenity VALUES (63, 2);
INSERT INTO public.offer_amenity VALUES (63, 3);
INSERT INTO public.offer_amenity VALUES (63, 4);
INSERT INTO public.offer_amenity VALUES (63, 5);
INSERT INTO public.offer_amenity VALUES (63, 6);
INSERT INTO public.offer_amenity VALUES (63, 7);
INSERT INTO public.offer_amenity VALUES (63, 8);
INSERT INTO public.offer_amenity VALUES (63, 13);
INSERT INTO public.offer_amenity VALUES (63, 14);
INSERT INTO public.offer_amenity VALUES (63, 15);
INSERT INTO public.offer_amenity VALUES (63, 16);
INSERT INTO public.offer_amenity VALUES (63, 18);
INSERT INTO public.offer_amenity VALUES (63, 19);
INSERT INTO public.offer_amenity VALUES (63, 20);
INSERT INTO public.offer_amenity VALUES (63, 24);
INSERT INTO public.offer_amenity VALUES (63, 25);
INSERT INTO public.offer_amenity VALUES (63, 38);
INSERT INTO public.offer_amenity VALUES (63, 45);
INSERT INTO public.offer_amenity VALUES (63, 50);
INSERT INTO public.offer_amenity VALUES (64, 1);
INSERT INTO public.offer_amenity VALUES (64, 2);
INSERT INTO public.offer_amenity VALUES (64, 3);
INSERT INTO public.offer_amenity VALUES (64, 4);
INSERT INTO public.offer_amenity VALUES (64, 7);
INSERT INTO public.offer_amenity VALUES (64, 12);
INSERT INTO public.offer_amenity VALUES (64, 18);
INSERT INTO public.offer_amenity VALUES (64, 20);
INSERT INTO public.offer_amenity VALUES (64, 21);
INSERT INTO public.offer_amenity VALUES (64, 24);
INSERT INTO public.offer_amenity VALUES (64, 25);
INSERT INTO public.offer_amenity VALUES (64, 37);
INSERT INTO public.offer_amenity VALUES (64, 45);
INSERT INTO public.offer_amenity VALUES (65, 1);
INSERT INTO public.offer_amenity VALUES (65, 2);
INSERT INTO public.offer_amenity VALUES (65, 3);
INSERT INTO public.offer_amenity VALUES (65, 4);
INSERT INTO public.offer_amenity VALUES (65, 7);
INSERT INTO public.offer_amenity VALUES (65, 8);
INSERT INTO public.offer_amenity VALUES (65, 9);
INSERT INTO public.offer_amenity VALUES (65, 19);
INSERT INTO public.offer_amenity VALUES (65, 20);
INSERT INTO public.offer_amenity VALUES (65, 21);
INSERT INTO public.offer_amenity VALUES (65, 24);
INSERT INTO public.offer_amenity VALUES (65, 25);
INSERT INTO public.offer_amenity VALUES (65, 27);
INSERT INTO public.offer_amenity VALUES (65, 49);
INSERT INTO public.offer_amenity VALUES (66, 1);
INSERT INTO public.offer_amenity VALUES (66, 2);
INSERT INTO public.offer_amenity VALUES (66, 3);
INSERT INTO public.offer_amenity VALUES (66, 4);
INSERT INTO public.offer_amenity VALUES (66, 7);
INSERT INTO public.offer_amenity VALUES (66, 9);
INSERT INTO public.offer_amenity VALUES (66, 20);
INSERT INTO public.offer_amenity VALUES (66, 21);
INSERT INTO public.offer_amenity VALUES (66, 24);
INSERT INTO public.offer_amenity VALUES (66, 25);
INSERT INTO public.offer_amenity VALUES (66, 27);
INSERT INTO public.offer_amenity VALUES (66, 43);
INSERT INTO public.offer_amenity VALUES (67, 1);
INSERT INTO public.offer_amenity VALUES (67, 2);
INSERT INTO public.offer_amenity VALUES (67, 3);
INSERT INTO public.offer_amenity VALUES (67, 4);
INSERT INTO public.offer_amenity VALUES (67, 5);
INSERT INTO public.offer_amenity VALUES (67, 6);
INSERT INTO public.offer_amenity VALUES (67, 7);
INSERT INTO public.offer_amenity VALUES (67, 8);
INSERT INTO public.offer_amenity VALUES (67, 9);
INSERT INTO public.offer_amenity VALUES (67, 10);
INSERT INTO public.offer_amenity VALUES (67, 14);
INSERT INTO public.offer_amenity VALUES (67, 19);
INSERT INTO public.offer_amenity VALUES (67, 20);
INSERT INTO public.offer_amenity VALUES (67, 24);
INSERT INTO public.offer_amenity VALUES (67, 25);
INSERT INTO public.offer_amenity VALUES (67, 27);
INSERT INTO public.offer_amenity VALUES (67, 35);
INSERT INTO public.offer_amenity VALUES (67, 36);
INSERT INTO public.offer_amenity VALUES (67, 49);
INSERT INTO public.offer_amenity VALUES (68, 1);
INSERT INTO public.offer_amenity VALUES (68, 2);
INSERT INTO public.offer_amenity VALUES (68, 3);
INSERT INTO public.offer_amenity VALUES (68, 4);
INSERT INTO public.offer_amenity VALUES (68, 7);
INSERT INTO public.offer_amenity VALUES (68, 9);
INSERT INTO public.offer_amenity VALUES (68, 10);
INSERT INTO public.offer_amenity VALUES (68, 19);
INSERT INTO public.offer_amenity VALUES (68, 20);
INSERT INTO public.offer_amenity VALUES (68, 21);
INSERT INTO public.offer_amenity VALUES (68, 22);
INSERT INTO public.offer_amenity VALUES (68, 24);
INSERT INTO public.offer_amenity VALUES (68, 25);
INSERT INTO public.offer_amenity VALUES (68, 27);
INSERT INTO public.offer_amenity VALUES (68, 30);
INSERT INTO public.offer_amenity VALUES (68, 49);
INSERT INTO public.offer_amenity VALUES (69, 1);
INSERT INTO public.offer_amenity VALUES (69, 2);
INSERT INTO public.offer_amenity VALUES (69, 3);
INSERT INTO public.offer_amenity VALUES (69, 4);
INSERT INTO public.offer_amenity VALUES (69, 7);
INSERT INTO public.offer_amenity VALUES (69, 20);
INSERT INTO public.offer_amenity VALUES (69, 21);
INSERT INTO public.offer_amenity VALUES (69, 22);
INSERT INTO public.offer_amenity VALUES (69, 24);
INSERT INTO public.offer_amenity VALUES (69, 25);
INSERT INTO public.offer_amenity VALUES (69, 27);
INSERT INTO public.offer_amenity VALUES (70, 1);
INSERT INTO public.offer_amenity VALUES (70, 2);
INSERT INTO public.offer_amenity VALUES (70, 3);
INSERT INTO public.offer_amenity VALUES (70, 4);
INSERT INTO public.offer_amenity VALUES (70, 7);
INSERT INTO public.offer_amenity VALUES (70, 9);
INSERT INTO public.offer_amenity VALUES (70, 10);
INSERT INTO public.offer_amenity VALUES (70, 14);
INSERT INTO public.offer_amenity VALUES (70, 19);
INSERT INTO public.offer_amenity VALUES (70, 20);
INSERT INTO public.offer_amenity VALUES (70, 21);
INSERT INTO public.offer_amenity VALUES (70, 24);
INSERT INTO public.offer_amenity VALUES (70, 25);
INSERT INTO public.offer_amenity VALUES (70, 27);
INSERT INTO public.offer_amenity VALUES (70, 30);
INSERT INTO public.offer_amenity VALUES (71, 1);
INSERT INTO public.offer_amenity VALUES (71, 2);
INSERT INTO public.offer_amenity VALUES (71, 3);
INSERT INTO public.offer_amenity VALUES (71, 4);
INSERT INTO public.offer_amenity VALUES (71, 5);
INSERT INTO public.offer_amenity VALUES (71, 7);
INSERT INTO public.offer_amenity VALUES (71, 9);
INSERT INTO public.offer_amenity VALUES (71, 19);
INSERT INTO public.offer_amenity VALUES (71, 20);
INSERT INTO public.offer_amenity VALUES (71, 21);
INSERT INTO public.offer_amenity VALUES (71, 22);
INSERT INTO public.offer_amenity VALUES (71, 24);
INSERT INTO public.offer_amenity VALUES (71, 25);
INSERT INTO public.offer_amenity VALUES (71, 28);
INSERT INTO public.offer_amenity VALUES (71, 29);
INSERT INTO public.offer_amenity VALUES (71, 30);
INSERT INTO public.offer_amenity VALUES (71, 37);
INSERT INTO public.offer_amenity VALUES (72, 1);
INSERT INTO public.offer_amenity VALUES (72, 2);
INSERT INTO public.offer_amenity VALUES (72, 3);
INSERT INTO public.offer_amenity VALUES (72, 4);
INSERT INTO public.offer_amenity VALUES (72, 7);
INSERT INTO public.offer_amenity VALUES (72, 12);
INSERT INTO public.offer_amenity VALUES (72, 21);
INSERT INTO public.offer_amenity VALUES (72, 24);
INSERT INTO public.offer_amenity VALUES (72, 25);
INSERT INTO public.offer_amenity VALUES (72, 45);
INSERT INTO public.offer_amenity VALUES (73, 1);
INSERT INTO public.offer_amenity VALUES (73, 2);
INSERT INTO public.offer_amenity VALUES (73, 3);
INSERT INTO public.offer_amenity VALUES (73, 4);
INSERT INTO public.offer_amenity VALUES (73, 5);
INSERT INTO public.offer_amenity VALUES (73, 6);
INSERT INTO public.offer_amenity VALUES (73, 7);
INSERT INTO public.offer_amenity VALUES (73, 8);
INSERT INTO public.offer_amenity VALUES (73, 9);
INSERT INTO public.offer_amenity VALUES (73, 10);
INSERT INTO public.offer_amenity VALUES (73, 14);
INSERT INTO public.offer_amenity VALUES (73, 15);
INSERT INTO public.offer_amenity VALUES (73, 19);
INSERT INTO public.offer_amenity VALUES (73, 20);
INSERT INTO public.offer_amenity VALUES (73, 24);
INSERT INTO public.offer_amenity VALUES (73, 25);
INSERT INTO public.offer_amenity VALUES (73, 35);
INSERT INTO public.offer_amenity VALUES (73, 36);
INSERT INTO public.offer_amenity VALUES (73, 43);
INSERT INTO public.offer_amenity VALUES (73, 49);
INSERT INTO public.offer_amenity VALUES (74, 1);
INSERT INTO public.offer_amenity VALUES (74, 2);
INSERT INTO public.offer_amenity VALUES (74, 3);
INSERT INTO public.offer_amenity VALUES (74, 4);
INSERT INTO public.offer_amenity VALUES (74, 7);
INSERT INTO public.offer_amenity VALUES (74, 21);
INSERT INTO public.offer_amenity VALUES (74, 22);
INSERT INTO public.offer_amenity VALUES (74, 24);
INSERT INTO public.offer_amenity VALUES (74, 25);
INSERT INTO public.offer_amenity VALUES (74, 27);
INSERT INTO public.offer_amenity VALUES (75, 1);
INSERT INTO public.offer_amenity VALUES (75, 2);
INSERT INTO public.offer_amenity VALUES (75, 3);
INSERT INTO public.offer_amenity VALUES (75, 4);
INSERT INTO public.offer_amenity VALUES (75, 7);
INSERT INTO public.offer_amenity VALUES (75, 9);
INSERT INTO public.offer_amenity VALUES (75, 20);
INSERT INTO public.offer_amenity VALUES (75, 21);
INSERT INTO public.offer_amenity VALUES (75, 22);
INSERT INTO public.offer_amenity VALUES (75, 24);
INSERT INTO public.offer_amenity VALUES (75, 25);
INSERT INTO public.offer_amenity VALUES (75, 27);
INSERT INTO public.offer_amenity VALUES (75, 37);
INSERT INTO public.offer_amenity VALUES (76, 1);
INSERT INTO public.offer_amenity VALUES (76, 2);
INSERT INTO public.offer_amenity VALUES (76, 3);
INSERT INTO public.offer_amenity VALUES (76, 4);
INSERT INTO public.offer_amenity VALUES (76, 5);
INSERT INTO public.offer_amenity VALUES (76, 6);
INSERT INTO public.offer_amenity VALUES (76, 7);
INSERT INTO public.offer_amenity VALUES (76, 8);
INSERT INTO public.offer_amenity VALUES (76, 12);
INSERT INTO public.offer_amenity VALUES (76, 13);
INSERT INTO public.offer_amenity VALUES (76, 15);
INSERT INTO public.offer_amenity VALUES (76, 17);
INSERT INTO public.offer_amenity VALUES (76, 18);
INSERT INTO public.offer_amenity VALUES (76, 19);
INSERT INTO public.offer_amenity VALUES (76, 20);
INSERT INTO public.offer_amenity VALUES (76, 24);
INSERT INTO public.offer_amenity VALUES (76, 25);
INSERT INTO public.offer_amenity VALUES (76, 30);
INSERT INTO public.offer_amenity VALUES (76, 45);
INSERT INTO public.offer_amenity VALUES (77, 1);
INSERT INTO public.offer_amenity VALUES (77, 2);
INSERT INTO public.offer_amenity VALUES (77, 3);
INSERT INTO public.offer_amenity VALUES (77, 4);
INSERT INTO public.offer_amenity VALUES (77, 7);
INSERT INTO public.offer_amenity VALUES (77, 9);
INSERT INTO public.offer_amenity VALUES (77, 17);
INSERT INTO public.offer_amenity VALUES (77, 21);
INSERT INTO public.offer_amenity VALUES (77, 22);
INSERT INTO public.offer_amenity VALUES (77, 24);
INSERT INTO public.offer_amenity VALUES (77, 25);
INSERT INTO public.offer_amenity VALUES (77, 27);
INSERT INTO public.offer_amenity VALUES (77, 41);
INSERT INTO public.offer_amenity VALUES (78, 1);
INSERT INTO public.offer_amenity VALUES (78, 2);
INSERT INTO public.offer_amenity VALUES (78, 3);
INSERT INTO public.offer_amenity VALUES (78, 4);
INSERT INTO public.offer_amenity VALUES (78, 5);
INSERT INTO public.offer_amenity VALUES (78, 7);
INSERT INTO public.offer_amenity VALUES (78, 9);
INSERT INTO public.offer_amenity VALUES (78, 10);
INSERT INTO public.offer_amenity VALUES (78, 19);
INSERT INTO public.offer_amenity VALUES (78, 20);
INSERT INTO public.offer_amenity VALUES (78, 21);
INSERT INTO public.offer_amenity VALUES (78, 22);
INSERT INTO public.offer_amenity VALUES (78, 24);
INSERT INTO public.offer_amenity VALUES (78, 25);
INSERT INTO public.offer_amenity VALUES (78, 27);
INSERT INTO public.offer_amenity VALUES (78, 30);
INSERT INTO public.offer_amenity VALUES (79, 1);
INSERT INTO public.offer_amenity VALUES (79, 2);
INSERT INTO public.offer_amenity VALUES (79, 3);
INSERT INTO public.offer_amenity VALUES (79, 4);
INSERT INTO public.offer_amenity VALUES (79, 7);
INSERT INTO public.offer_amenity VALUES (79, 9);
INSERT INTO public.offer_amenity VALUES (79, 10);
INSERT INTO public.offer_amenity VALUES (79, 19);
INSERT INTO public.offer_amenity VALUES (79, 20);
INSERT INTO public.offer_amenity VALUES (79, 21);
INSERT INTO public.offer_amenity VALUES (79, 24);
INSERT INTO public.offer_amenity VALUES (79, 25);
INSERT INTO public.offer_amenity VALUES (79, 27);
INSERT INTO public.offer_amenity VALUES (79, 30);
INSERT INTO public.offer_amenity VALUES (80, 1);
INSERT INTO public.offer_amenity VALUES (80, 2);
INSERT INTO public.offer_amenity VALUES (80, 3);
INSERT INTO public.offer_amenity VALUES (80, 4);
INSERT INTO public.offer_amenity VALUES (80, 7);
INSERT INTO public.offer_amenity VALUES (80, 9);
INSERT INTO public.offer_amenity VALUES (80, 21);
INSERT INTO public.offer_amenity VALUES (80, 22);
INSERT INTO public.offer_amenity VALUES (80, 24);
INSERT INTO public.offer_amenity VALUES (80, 25);
INSERT INTO public.offer_amenity VALUES (80, 27);
INSERT INTO public.offer_amenity VALUES (81, 1);
INSERT INTO public.offer_amenity VALUES (81, 2);
INSERT INTO public.offer_amenity VALUES (81, 3);
INSERT INTO public.offer_amenity VALUES (81, 4);
INSERT INTO public.offer_amenity VALUES (81, 7);
INSERT INTO public.offer_amenity VALUES (81, 20);
INSERT INTO public.offer_amenity VALUES (81, 21);
INSERT INTO public.offer_amenity VALUES (81, 24);
INSERT INTO public.offer_amenity VALUES (81, 25);
INSERT INTO public.offer_amenity VALUES (81, 27);
INSERT INTO public.offer_amenity VALUES (82, 1);
INSERT INTO public.offer_amenity VALUES (82, 2);
INSERT INTO public.offer_amenity VALUES (82, 3);
INSERT INTO public.offer_amenity VALUES (82, 4);
INSERT INTO public.offer_amenity VALUES (82, 7);
INSERT INTO public.offer_amenity VALUES (82, 9);
INSERT INTO public.offer_amenity VALUES (82, 17);
INSERT INTO public.offer_amenity VALUES (82, 19);
INSERT INTO public.offer_amenity VALUES (82, 20);
INSERT INTO public.offer_amenity VALUES (82, 21);
INSERT INTO public.offer_amenity VALUES (82, 24);
INSERT INTO public.offer_amenity VALUES (82, 25);
INSERT INTO public.offer_amenity VALUES (82, 27);
INSERT INTO public.offer_amenity VALUES (82, 41);
INSERT INTO public.offer_amenity VALUES (82, 42);
INSERT INTO public.offer_amenity VALUES (83, 1);
INSERT INTO public.offer_amenity VALUES (83, 2);
INSERT INTO public.offer_amenity VALUES (83, 3);
INSERT INTO public.offer_amenity VALUES (83, 4);
INSERT INTO public.offer_amenity VALUES (83, 5);
INSERT INTO public.offer_amenity VALUES (83, 6);
INSERT INTO public.offer_amenity VALUES (83, 7);
INSERT INTO public.offer_amenity VALUES (83, 8);
INSERT INTO public.offer_amenity VALUES (83, 9);
INSERT INTO public.offer_amenity VALUES (83, 12);
INSERT INTO public.offer_amenity VALUES (83, 13);
INSERT INTO public.offer_amenity VALUES (83, 19);
INSERT INTO public.offer_amenity VALUES (83, 20);
INSERT INTO public.offer_amenity VALUES (83, 21);
INSERT INTO public.offer_amenity VALUES (83, 24);
INSERT INTO public.offer_amenity VALUES (83, 25);
INSERT INTO public.offer_amenity VALUES (83, 30);
INSERT INTO public.offer_amenity VALUES (83, 31);
INSERT INTO public.offer_amenity VALUES (83, 45);
INSERT INTO public.offer_amenity VALUES (84, 1);
INSERT INTO public.offer_amenity VALUES (84, 2);
INSERT INTO public.offer_amenity VALUES (84, 3);
INSERT INTO public.offer_amenity VALUES (84, 4);
INSERT INTO public.offer_amenity VALUES (84, 7);
INSERT INTO public.offer_amenity VALUES (84, 10);
INSERT INTO public.offer_amenity VALUES (84, 20);
INSERT INTO public.offer_amenity VALUES (84, 21);
INSERT INTO public.offer_amenity VALUES (84, 24);
INSERT INTO public.offer_amenity VALUES (84, 25);
INSERT INTO public.offer_amenity VALUES (84, 49);
INSERT INTO public.offer_amenity VALUES (85, 1);
INSERT INTO public.offer_amenity VALUES (85, 2);
INSERT INTO public.offer_amenity VALUES (85, 3);
INSERT INTO public.offer_amenity VALUES (85, 4);
INSERT INTO public.offer_amenity VALUES (85, 7);
INSERT INTO public.offer_amenity VALUES (85, 9);
INSERT INTO public.offer_amenity VALUES (85, 10);
INSERT INTO public.offer_amenity VALUES (85, 19);
INSERT INTO public.offer_amenity VALUES (85, 20);
INSERT INTO public.offer_amenity VALUES (85, 21);
INSERT INTO public.offer_amenity VALUES (85, 24);
INSERT INTO public.offer_amenity VALUES (85, 25);
INSERT INTO public.offer_amenity VALUES (85, 27);
INSERT INTO public.offer_amenity VALUES (85, 30);
INSERT INTO public.offer_amenity VALUES (86, 1);
INSERT INTO public.offer_amenity VALUES (86, 2);
INSERT INTO public.offer_amenity VALUES (86, 3);
INSERT INTO public.offer_amenity VALUES (86, 4);
INSERT INTO public.offer_amenity VALUES (86, 5);
INSERT INTO public.offer_amenity VALUES (86, 7);
INSERT INTO public.offer_amenity VALUES (86, 20);
INSERT INTO public.offer_amenity VALUES (86, 21);
INSERT INTO public.offer_amenity VALUES (86, 22);
INSERT INTO public.offer_amenity VALUES (86, 24);
INSERT INTO public.offer_amenity VALUES (86, 25);
INSERT INTO public.offer_amenity VALUES (86, 28);
INSERT INTO public.offer_amenity VALUES (86, 29);
INSERT INTO public.offer_amenity VALUES (87, 1);
INSERT INTO public.offer_amenity VALUES (87, 2);
INSERT INTO public.offer_amenity VALUES (87, 3);
INSERT INTO public.offer_amenity VALUES (87, 4);
INSERT INTO public.offer_amenity VALUES (87, 7);
INSERT INTO public.offer_amenity VALUES (87, 9);
INSERT INTO public.offer_amenity VALUES (87, 19);
INSERT INTO public.offer_amenity VALUES (87, 20);
INSERT INTO public.offer_amenity VALUES (87, 21);
INSERT INTO public.offer_amenity VALUES (87, 22);
INSERT INTO public.offer_amenity VALUES (87, 24);
INSERT INTO public.offer_amenity VALUES (87, 25);
INSERT INTO public.offer_amenity VALUES (87, 27);
INSERT INTO public.offer_amenity VALUES (87, 49);
INSERT INTO public.offer_amenity VALUES (88, 1);
INSERT INTO public.offer_amenity VALUES (88, 2);
INSERT INTO public.offer_amenity VALUES (88, 3);
INSERT INTO public.offer_amenity VALUES (88, 4);
INSERT INTO public.offer_amenity VALUES (88, 7);
INSERT INTO public.offer_amenity VALUES (88, 21);
INSERT INTO public.offer_amenity VALUES (88, 22);
INSERT INTO public.offer_amenity VALUES (88, 24);
INSERT INTO public.offer_amenity VALUES (88, 25);
INSERT INTO public.offer_amenity VALUES (88, 27);
INSERT INTO public.offer_amenity VALUES (89, 1);
INSERT INTO public.offer_amenity VALUES (89, 2);
INSERT INTO public.offer_amenity VALUES (89, 3);
INSERT INTO public.offer_amenity VALUES (89, 4);
INSERT INTO public.offer_amenity VALUES (89, 7);
INSERT INTO public.offer_amenity VALUES (89, 8);
INSERT INTO public.offer_amenity VALUES (89, 12);
INSERT INTO public.offer_amenity VALUES (89, 18);
INSERT INTO public.offer_amenity VALUES (89, 20);
INSERT INTO public.offer_amenity VALUES (89, 21);
INSERT INTO public.offer_amenity VALUES (89, 24);
INSERT INTO public.offer_amenity VALUES (89, 25);
INSERT INTO public.offer_amenity VALUES (89, 28);
INSERT INTO public.offer_amenity VALUES (89, 29);
INSERT INTO public.offer_amenity VALUES (89, 45);
INSERT INTO public.offer_amenity VALUES (90, 1);
INSERT INTO public.offer_amenity VALUES (90, 2);
INSERT INTO public.offer_amenity VALUES (90, 3);
INSERT INTO public.offer_amenity VALUES (90, 4);
INSERT INTO public.offer_amenity VALUES (90, 5);
INSERT INTO public.offer_amenity VALUES (90, 7);
INSERT INTO public.offer_amenity VALUES (90, 12);
INSERT INTO public.offer_amenity VALUES (90, 18);
INSERT INTO public.offer_amenity VALUES (90, 20);
INSERT INTO public.offer_amenity VALUES (90, 21);
INSERT INTO public.offer_amenity VALUES (90, 24);
INSERT INTO public.offer_amenity VALUES (90, 25);
INSERT INTO public.offer_amenity VALUES (90, 37);
INSERT INTO public.offer_amenity VALUES (90, 45);
INSERT INTO public.offer_amenity VALUES (91, 1);
INSERT INTO public.offer_amenity VALUES (91, 2);
INSERT INTO public.offer_amenity VALUES (91, 3);
INSERT INTO public.offer_amenity VALUES (91, 4);
INSERT INTO public.offer_amenity VALUES (91, 7);
INSERT INTO public.offer_amenity VALUES (91, 9);
INSERT INTO public.offer_amenity VALUES (91, 20);
INSERT INTO public.offer_amenity VALUES (91, 21);
INSERT INTO public.offer_amenity VALUES (91, 22);
INSERT INTO public.offer_amenity VALUES (91, 24);
INSERT INTO public.offer_amenity VALUES (91, 25);
INSERT INTO public.offer_amenity VALUES (91, 27);
INSERT INTO public.offer_amenity VALUES (91, 49);
INSERT INTO public.offer_amenity VALUES (92, 1);
INSERT INTO public.offer_amenity VALUES (92, 2);
INSERT INTO public.offer_amenity VALUES (92, 3);
INSERT INTO public.offer_amenity VALUES (92, 4);
INSERT INTO public.offer_amenity VALUES (92, 7);
INSERT INTO public.offer_amenity VALUES (92, 9);
INSERT INTO public.offer_amenity VALUES (92, 20);
INSERT INTO public.offer_amenity VALUES (92, 21);
INSERT INTO public.offer_amenity VALUES (92, 24);
INSERT INTO public.offer_amenity VALUES (92, 25);
INSERT INTO public.offer_amenity VALUES (92, 27);
INSERT INTO public.offer_amenity VALUES (92, 42);
INSERT INTO public.offer_amenity VALUES (93, 1);
INSERT INTO public.offer_amenity VALUES (93, 2);
INSERT INTO public.offer_amenity VALUES (93, 3);
INSERT INTO public.offer_amenity VALUES (93, 4);
INSERT INTO public.offer_amenity VALUES (93, 7);
INSERT INTO public.offer_amenity VALUES (93, 10);
INSERT INTO public.offer_amenity VALUES (93, 20);
INSERT INTO public.offer_amenity VALUES (93, 21);
INSERT INTO public.offer_amenity VALUES (93, 24);
INSERT INTO public.offer_amenity VALUES (93, 25);
INSERT INTO public.offer_amenity VALUES (93, 45);
INSERT INTO public.offer_amenity VALUES (94, 1);
INSERT INTO public.offer_amenity VALUES (94, 2);
INSERT INTO public.offer_amenity VALUES (94, 3);
INSERT INTO public.offer_amenity VALUES (94, 4);
INSERT INTO public.offer_amenity VALUES (94, 5);
INSERT INTO public.offer_amenity VALUES (94, 7);
INSERT INTO public.offer_amenity VALUES (94, 9);
INSERT INTO public.offer_amenity VALUES (94, 10);
INSERT INTO public.offer_amenity VALUES (94, 17);
INSERT INTO public.offer_amenity VALUES (94, 19);
INSERT INTO public.offer_amenity VALUES (94, 20);
INSERT INTO public.offer_amenity VALUES (94, 21);
INSERT INTO public.offer_amenity VALUES (94, 24);
INSERT INTO public.offer_amenity VALUES (94, 25);
INSERT INTO public.offer_amenity VALUES (94, 27);
INSERT INTO public.offer_amenity VALUES (94, 30);
INSERT INTO public.offer_amenity VALUES (94, 49);
INSERT INTO public.offer_amenity VALUES (95, 1);
INSERT INTO public.offer_amenity VALUES (95, 2);
INSERT INTO public.offer_amenity VALUES (95, 3);
INSERT INTO public.offer_amenity VALUES (95, 4);
INSERT INTO public.offer_amenity VALUES (95, 7);
INSERT INTO public.offer_amenity VALUES (95, 20);
INSERT INTO public.offer_amenity VALUES (95, 21);
INSERT INTO public.offer_amenity VALUES (95, 24);
INSERT INTO public.offer_amenity VALUES (95, 25);
INSERT INTO public.offer_amenity VALUES (95, 27);
INSERT INTO public.offer_amenity VALUES (96, 1);
INSERT INTO public.offer_amenity VALUES (96, 2);
INSERT INTO public.offer_amenity VALUES (96, 3);
INSERT INTO public.offer_amenity VALUES (96, 4);
INSERT INTO public.offer_amenity VALUES (96, 7);
INSERT INTO public.offer_amenity VALUES (96, 9);
INSERT INTO public.offer_amenity VALUES (96, 10);
INSERT INTO public.offer_amenity VALUES (96, 17);
INSERT INTO public.offer_amenity VALUES (96, 19);
INSERT INTO public.offer_amenity VALUES (96, 20);
INSERT INTO public.offer_amenity VALUES (96, 21);
INSERT INTO public.offer_amenity VALUES (96, 24);
INSERT INTO public.offer_amenity VALUES (96, 25);
INSERT INTO public.offer_amenity VALUES (96, 27);
INSERT INTO public.offer_amenity VALUES (96, 43);
INSERT INTO public.offer_amenity VALUES (96, 49);
INSERT INTO public.offer_amenity VALUES (97, 1);
INSERT INTO public.offer_amenity VALUES (97, 2);
INSERT INTO public.offer_amenity VALUES (97, 3);
INSERT INTO public.offer_amenity VALUES (97, 4);
INSERT INTO public.offer_amenity VALUES (97, 7);
INSERT INTO public.offer_amenity VALUES (97, 9);
INSERT INTO public.offer_amenity VALUES (97, 10);
INSERT INTO public.offer_amenity VALUES (97, 20);
INSERT INTO public.offer_amenity VALUES (97, 21);
INSERT INTO public.offer_amenity VALUES (97, 24);
INSERT INTO public.offer_amenity VALUES (97, 25);
INSERT INTO public.offer_amenity VALUES (97, 27);
INSERT INTO public.offer_amenity VALUES (97, 30);
INSERT INTO public.offer_amenity VALUES (98, 1);
INSERT INTO public.offer_amenity VALUES (98, 2);
INSERT INTO public.offer_amenity VALUES (98, 3);
INSERT INTO public.offer_amenity VALUES (98, 4);
INSERT INTO public.offer_amenity VALUES (98, 7);
INSERT INTO public.offer_amenity VALUES (98, 20);
INSERT INTO public.offer_amenity VALUES (98, 21);
INSERT INTO public.offer_amenity VALUES (98, 24);
INSERT INTO public.offer_amenity VALUES (98, 25);
INSERT INTO public.offer_amenity VALUES (98, 37);
INSERT INTO public.offer_amenity VALUES (99, 1);
INSERT INTO public.offer_amenity VALUES (99, 2);
INSERT INTO public.offer_amenity VALUES (99, 3);
INSERT INTO public.offer_amenity VALUES (99, 4);
INSERT INTO public.offer_amenity VALUES (99, 7);
INSERT INTO public.offer_amenity VALUES (99, 9);
INSERT INTO public.offer_amenity VALUES (99, 19);
INSERT INTO public.offer_amenity VALUES (99, 20);
INSERT INTO public.offer_amenity VALUES (99, 21);
INSERT INTO public.offer_amenity VALUES (99, 24);
INSERT INTO public.offer_amenity VALUES (99, 25);
INSERT INTO public.offer_amenity VALUES (99, 27);
INSERT INTO public.offer_amenity VALUES (99, 42);
INSERT INTO public.offer_amenity VALUES (100, 1);
INSERT INTO public.offer_amenity VALUES (100, 2);
INSERT INTO public.offer_amenity VALUES (100, 3);
INSERT INTO public.offer_amenity VALUES (100, 4);
INSERT INTO public.offer_amenity VALUES (100, 7);
INSERT INTO public.offer_amenity VALUES (100, 9);
INSERT INTO public.offer_amenity VALUES (100, 17);
INSERT INTO public.offer_amenity VALUES (100, 19);
INSERT INTO public.offer_amenity VALUES (100, 20);
INSERT INTO public.offer_amenity VALUES (100, 21);
INSERT INTO public.offer_amenity VALUES (100, 24);
INSERT INTO public.offer_amenity VALUES (100, 25);
INSERT INTO public.offer_amenity VALUES (100, 27);
INSERT INTO public.offer_amenity VALUES (100, 43);


--
-- Data for Name: offer_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.offer_type VALUES (1, 'apartment');
INSERT INTO public.offer_type VALUES (2, 'villa');
INSERT INTO public.offer_type VALUES (3, 'studio');
INSERT INTO public.offer_type VALUES (4, 'loft');
INSERT INTO public.offer_type VALUES (5, 'penthouse');
INSERT INTO public.offer_type VALUES (6, 'townhouse');
INSERT INTO public.offer_type VALUES (7, 'cottage');
INSERT INTO public.offer_type VALUES (8, 'condo');
INSERT INTO public.offer_type VALUES (9, 'duplex');
INSERT INTO public.offer_type VALUES (10, 'bungalow');


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.permission VALUES (1, 'CLIENT');
INSERT INTO public.permission VALUES (3, 'ADMIN');
INSERT INTO public.permission VALUES (2, 'HOST');


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservation VALUES (1, 1, 2, '2026-03-01', '2026-03-05');
INSERT INTO public.reservation VALUES (2, 1, 10, '2026-04-10', '2026-04-14');
INSERT INTO public.reservation VALUES (3, 2, 3, '2026-03-15', '2026-03-22');
INSERT INTO public.reservation VALUES (4, 3, 4, '2026-03-20', '2026-03-23');
INSERT INTO public.reservation VALUES (5, 3, 12, '2026-04-15', '2026-04-20');
INSERT INTO public.reservation VALUES (6, 4, 5, '2026-04-01', '2026-04-05');
INSERT INTO public.reservation VALUES (7, 5, 6, '2026-04-08', '2026-04-12');
INSERT INTO public.reservation VALUES (8, 5, 14, '2026-05-20', '2026-05-26');
INSERT INTO public.reservation VALUES (9, 6, 7, '2026-04-15', '2026-04-20');
INSERT INTO public.reservation VALUES (10, 7, 8, '2026-04-22', '2026-04-26');
INSERT INTO public.reservation VALUES (11, 8, 9, '2026-05-01', '2026-05-06');
INSERT INTO public.reservation VALUES (12, 8, 15, '2026-07-01', '2026-07-08');
INSERT INTO public.reservation VALUES (13, 9, 10, '2026-05-10', '2026-05-15');
INSERT INTO public.reservation VALUES (14, 10, 11, '2026-05-18', '2026-05-22');
INSERT INTO public.reservation VALUES (15, 11, 12, '2026-05-25', '2026-05-30');
INSERT INTO public.reservation VALUES (16, 12, 13, '2026-06-05', '2026-06-10');
INSERT INTO public.reservation VALUES (17, 12, 16, '2026-07-20', '2026-07-26');
INSERT INTO public.reservation VALUES (18, 13, 14, '2026-06-12', '2026-06-17');
INSERT INTO public.reservation VALUES (19, 14, 15, '2026-06-20', '2026-06-25');
INSERT INTO public.reservation VALUES (20, 15, 16, '2026-06-28', '2026-07-03');
INSERT INTO public.reservation VALUES (21, 16, 17, '2026-07-05', '2026-07-12');
INSERT INTO public.reservation VALUES (22, 16, 1, '2026-08-15', '2026-08-22');
INSERT INTO public.reservation VALUES (24, 18, 19, '2026-07-18', '2026-07-23');
INSERT INTO public.reservation VALUES (25, 19, 20, '2026-07-25', '2026-07-30');
INSERT INTO public.reservation VALUES (26, 20, 1, '2026-08-01', '2026-08-05');
INSERT INTO public.reservation VALUES (27, 21, 2, '2026-08-10', '2026-08-16');
INSERT INTO public.reservation VALUES (28, 22, 3, '2026-08-18', '2026-08-23');
INSERT INTO public.reservation VALUES (29, 23, 4, '2026-08-25', '2026-08-30');
INSERT INTO public.reservation VALUES (30, 23, 17, '2026-09-22', '2026-09-26');
INSERT INTO public.reservation VALUES (31, 24, 5, '2026-09-01', '2026-09-05');
INSERT INTO public.reservation VALUES (32, 25, 6, '2026-09-10', '2026-09-15');
INSERT INTO public.reservation VALUES (33, 26, 7, '2026-09-18', '2026-09-23');
INSERT INTO public.reservation VALUES (34, 27, 8, '2026-09-25', '2026-09-30');
INSERT INTO public.reservation VALUES (35, 27, 18, '2026-10-28', '2026-11-02');
INSERT INTO public.reservation VALUES (36, 28, 9, '2026-10-02', '2026-10-07');
INSERT INTO public.reservation VALUES (37, 29, 10, '2026-10-10', '2026-10-14');
INSERT INTO public.reservation VALUES (38, 30, 11, '2026-10-18', '2026-10-24');
INSERT INTO public.reservation VALUES (39, 31, 12, '2026-10-25', '2026-10-30');
INSERT INTO public.reservation VALUES (40, 32, 13, '2026-11-01', '2026-11-05');
INSERT INTO public.reservation VALUES (67, 2, 1, '2026-01-12', '2026-01-15');
INSERT INTO public.reservation VALUES (68, 2, 1, '2026-01-12', '2026-01-15');
INSERT INTO public.reservation VALUES (69, 2, 27, '2026-01-19', '2026-01-22');
INSERT INTO public.reservation VALUES (23, 17, 18, '2026-01-10', '2026-01-11');


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.review VALUES (1, 1, 2, 'Amazing location with stunning Acropolis view! Very clean and comfortable.', 5, '2026-10-23 17:33:04.42583');
INSERT INTO public.review VALUES (2, 1, 10, 'Great apartment, but could use better WiFi connection.', 4, '2026-07-10 17:16:18.869968');
INSERT INTO public.review VALUES (3, 2, 3, 'Absolutely luxurious! The garden is beautiful and location is perfect.', 5, '2026-03-22 17:39:24.856064');
INSERT INTO public.review VALUES (4, 3, 4, 'Cozy studio, perfect for a solo traveler. Good value for money.', 4, '2026-08-25 18:45:25.058764');
INSERT INTO public.review VALUES (5, 3, 12, 'Loved the Old Town location. Everything was within walking distance.', 5, '2026-03-05 12:48:51.563994');
INSERT INTO public.review VALUES (6, 4, 5, 'The loft is spacious and stylish. Le Marais is such a great neighborhood!', 5, '2026-03-19 20:37:30.882171');
INSERT INTO public.review VALUES (7, 5, 6, 'Penthouse is spectacular! Views are breathtaking. Worth every euro.', 5, '2026-09-13 11:20:14.256672');
INSERT INTO public.review VALUES (8, 5, 14, 'Perfect for a family vacation. Lots of space and very comfortable.', 5, '2026-10-11 18:43:21.493316');
INSERT INTO public.review VALUES (9, 6, 7, 'Beautiful townhouse along the canal. A bit pricey but worth it.', 4, '2026-11-14 10:14:16.725353');
INSERT INTO public.review VALUES (10, 7, 8, 'Charming cottage with a lovely garden. Very peaceful.', 5, '2026-10-13 17:27:19.974675');
INSERT INTO public.review VALUES (11, 8, 9, 'Great location by the sea. The condo is modern and well-equipped.', 4, '2026-04-24 09:03:44.49624');
INSERT INTO public.review VALUES (12, 8, 15, 'Perfect beach getaway! We had an amazing time.', 5, '2026-01-09 22:49:23.050283');
INSERT INTO public.review VALUES (13, 9, 10, 'Loved the artistic vibe of Trastevere. Unique and comfortable duplex.', 5, '2026-02-05 08:59:35.918494');
INSERT INTO public.review VALUES (14, 10, 11, 'Quiet location with a nice garden. Great for relaxation.', 4, '2026-04-30 16:47:12.066751');
INSERT INTO public.review VALUES (15, 11, 12, 'Perfect artist studio in Montmartre! So much inspiration here.', 5, '2026-01-13 13:03:45.707925');
INSERT INTO public.review VALUES (16, 12, 13, 'Nice apartment near Retiro Park. Good for morning jogs.', 4, '2026-12-02 18:43:15.487221');
INSERT INTO public.review VALUES (17, 12, 16, 'Excellent location! The park is wonderful and the apartment is comfortable.', 5, '2026-02-03 09:01:48.122546');
INSERT INTO public.review VALUES (18, 13, 14, 'Luxurious loft in a trendy area. Loved exploring Jordaan!', 5, '2026-07-10 23:22:41.859167');
INSERT INTO public.review VALUES (19, 14, 15, 'The view of Grand Place is amazing! Couldn''t ask for better location.', 5, '2026-03-28 22:55:07.230099');
INSERT INTO public.review VALUES (20, 15, 16, 'Central location, close to everything. Apartment is good but a bit small.', 4, '2026-05-04 07:57:44.912733');
INSERT INTO public.review VALUES (21, 16, 17, 'Elegant townhouse near Villa Borghese. Perfect for our family.', 5, '2026-02-01 09:55:15.187113');
INSERT INTO public.review VALUES (22, 16, 1, 'Beautiful property in a great location. Highly recommend!', 5, '2026-01-16 13:30:48.035131');
INSERT INTO public.review VALUES (23, 17, 18, 'Romantic cottage near Łazienki Park. Very peaceful.', 4, '2026-03-19 13:51:03.18336');
INSERT INTO public.review VALUES (24, 18, 19, 'Waking up to Eiffel Tower view was a dream! Amazing condo.', 5, '2026-10-03 18:13:41.412784');
INSERT INTO public.review VALUES (25, 19, 20, 'Hip area with lots of bars and restaurants. Duplex is stylish.', 4, '2026-07-07 17:19:44.848562');
INSERT INTO public.review VALUES (26, 20, 1, 'Quiet location near museums. Good for culture lovers.', 4, '2026-06-30 12:38:50.067143');
INSERT INTO public.review VALUES (27, 21, 2, 'Best penthouse ever! Panoramic views of Athens are incredible.', 5, '2026-04-20 11:39:42.059174');
INSERT INTO public.review VALUES (28, 22, 3, 'Nice modern apartment in foodie district. Great restaurants nearby.', 4, '2026-12-05 16:31:03.420491');
INSERT INTO public.review VALUES (29, 23, 4, 'Interesting area with lots of character. Loft is spacious.', 4, '2026-04-26 20:09:44.399456');
INSERT INTO public.review VALUES (30, 23, 17, 'Area is still developing, but the loft itself is nice.', 3, '2026-07-29 15:27:32.92026');
INSERT INTO public.review VALUES (31, 24, 5, 'Perfect location in Latin Quarter! So much history around.', 5, '2026-07-21 09:27:57.387213');
INSERT INTO public.review VALUES (32, 25, 6, 'Traditional Spanish apartment with modern touches. Very comfortable.', 4, '2026-10-03 09:56:24.538395');
INSERT INTO public.review VALUES (33, 26, 7, 'Trendy loft in a vibrant neighborhood. Loved De Pijp!', 5, '2026-01-05 17:16:07.065099');
INSERT INTO public.review VALUES (34, 27, 8, 'Modern townhouse close to work. Very convenient.', 4, '2026-03-07 12:31:29.982951');
INSERT INTO public.review VALUES (35, 27, 18, 'Good for business travelers. Near EU buildings.', 4, '2026-01-15 20:17:51.565125');
INSERT INTO public.review VALUES (36, 28, 9, 'Upscale apartment in posh Kolonaki. Felt very luxurious.', 5, '2026-04-18 08:13:18.157925');
INSERT INTO public.review VALUES (37, 29, 10, 'Quaint studio in historic Monti. Charming area to explore.', 4, '2026-06-17 16:59:18.429409');
INSERT INTO public.review VALUES (38, 30, 11, 'Spacious villa perfect for our large family. Kids loved the garden!', 5, '2026-10-05 11:34:42.226854');
INSERT INTO public.review VALUES (39, 31, 12, 'Sophisticated apartment on the left bank. Felt like a true Parisian!', 5, '2026-01-12 11:24:33.953438');
INSERT INTO public.review VALUES (40, 32, 13, 'Stylish studio in a friendly neighborhood. Great nightlife.', 4, '2026-02-16 20:41:14.293184');
INSERT INTO public.review VALUES (41, 23, 21, 'Good public communication', 5, '2026-04-19 13:37:45.198805');
INSERT INTO public.review VALUES (43, 2, 21, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 5, '2026-10-03 08:51:12.477127');


--
-- Data for Name: user_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_permission VALUES (2, 2);
INSERT INTO public.user_permission VALUES (3, 1);
INSERT INTO public.user_permission VALUES (4, 2);
INSERT INTO public.user_permission VALUES (5, 1);
INSERT INTO public.user_permission VALUES (6, 2);
INSERT INTO public.user_permission VALUES (7, 1);
INSERT INTO public.user_permission VALUES (8, 2);
INSERT INTO public.user_permission VALUES (9, 1);
INSERT INTO public.user_permission VALUES (10, 2);
INSERT INTO public.user_permission VALUES (11, 1);
INSERT INTO public.user_permission VALUES (12, 2);
INSERT INTO public.user_permission VALUES (13, 1);
INSERT INTO public.user_permission VALUES (14, 2);
INSERT INTO public.user_permission VALUES (15, 1);
INSERT INTO public.user_permission VALUES (16, 2);
INSERT INTO public.user_permission VALUES (17, 3);
INSERT INTO public.user_permission VALUES (18, 2);
INSERT INTO public.user_permission VALUES (19, 1);
INSERT INTO public.user_permission VALUES (20, 2);
INSERT INTO public.user_permission VALUES (27, 3);
INSERT INTO public.user_permission VALUES (26, 2);
INSERT INTO public.user_permission VALUES (21, 1);
INSERT INTO public.user_permission VALUES (28, 2);
INSERT INTO public.user_permission VALUES (29, 3);


--
-- Name: amenity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amenity_id_seq', 1, false);


--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 1, false);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 600, true);


--
-- Name: offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.offer_id_seq', 104, true);


--
-- Name: offer_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.offer_type_id_seq', 1, false);


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_id_seq', 1, false);


--
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_seq', 69, true);


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_id_seq', 43, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 29, true);


--
-- Name: amenity amenity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenity
    ADD CONSTRAINT amenity_pkey PRIMARY KEY (id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: favorite favorite_offer_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_offer_id_user_id_key UNIQUE (offer_id, user_id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: offer_amenity offer_amenity_offer_id_amenity_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_amenity
    ADD CONSTRAINT offer_amenity_offer_id_amenity_id_key UNIQUE (offer_id, amenity_id);


--
-- Name: offer offer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_pkey PRIMARY KEY (id);


--
-- Name: offer_type offer_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_type
    ADD CONSTRAINT offer_type_pkey PRIMARY KEY (id);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: app_user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: app_user user_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT user_login_key UNIQUE (login);


--
-- Name: user_permission user_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_permission
    ADD CONSTRAINT user_permission_pkey PRIMARY KEY (user_id, permission_id);


--
-- Name: app_user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: offer city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT city_id FOREIGN KEY (city_id) REFERENCES public.city(id);


--
-- Name: favorite favorite_offer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offer(id) ON DELETE CASCADE;


--
-- Name: favorite favorite_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id) ON DELETE CASCADE;


--
-- Name: image fk_image_offer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fk_image_offer FOREIGN KEY (offer_id) REFERENCES public.offer(id) ON DELETE CASCADE;


--
-- Name: user_permission fk_user_permission_permission; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_permission
    ADD CONSTRAINT fk_user_permission_permission FOREIGN KEY (permission_id) REFERENCES public.permission(id) ON DELETE CASCADE;


--
-- Name: user_permission fk_user_permission_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_permission
    ADD CONSTRAINT fk_user_permission_user FOREIGN KEY (user_id) REFERENCES public.app_user(id) ON DELETE CASCADE;


--
-- Name: offer_amenity offer_amenity_amenity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_amenity
    ADD CONSTRAINT offer_amenity_amenity_id_fkey FOREIGN KEY (amenity_id) REFERENCES public.amenity(id) ON DELETE CASCADE;


--
-- Name: offer_amenity offer_amenity_offer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer_amenity
    ADD CONSTRAINT offer_amenity_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offer(id) ON DELETE CASCADE;


--
-- Name: offer offer_offer_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT offer_offer_type_id_fk FOREIGN KEY (offer_type_id) REFERENCES public.offer_type(id);


--
-- Name: reservation reservation_offer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offer(id) ON DELETE CASCADE;


--
-- Name: reservation reservation_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id) ON DELETE CASCADE;


--
-- Name: review review_offer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_offer_id_fkey FOREIGN KEY (offer_id) REFERENCES public.offer(id) ON DELETE CASCADE;


--
-- Name: review review_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.app_user(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict LDStMORUKXldTZbTkbM1AAl1NBS8o5O8Db1d1JWM7i1zFao5wB7ZWgb02W7Ca29

