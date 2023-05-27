--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_year integer,
    shape character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_million_year integer NOT NULL,
    description text,
    diameter_km numeric(6,2),
    rotation numeric(6,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth_light_year numeric NOT NULL,
    age integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    star_id integer,
    planet_type_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age integer NOT NULL,
    temp_cel numeric(9,3),
    mass_kg numeric(9,3),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milk way', 'our home galaxy', 13600, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andremonda', 'Nearest Spiral to the Milky way ', 10000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small Spiral galaxy ', 5700, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whrilpool', 'Interacting Spiral Galaxies', 500, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual hat shaped galaxy', 9000, 'Disk');
INSERT INTO public.galaxy VALUES (6, 'Centurus A', 'Active Radio Galaxy', 13000, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 5, 'desc ...', 3474.00, 27.30, 1);
INSERT INTO public.moon VALUES (2, 'europa', 5, 'desc ...', 3122.00, 3.50, 1);
INSERT INTO public.moon VALUES (3, 'Titan', 5, 'desc ...', 5150.00, 15.90, 2);
INSERT INTO public.moon VALUES (4, 'Gany mede', 5, 'desc ...', 5268.00, 7.20, 2);
INSERT INTO public.moon VALUES (5, 'Triton', 5, 'desc ...', 2706.00, -5.90, 2);
INSERT INTO public.moon VALUES (6, 'Enceladus', 5, 'desc ...', 504.00, 1.40, 2);
INSERT INTO public.moon VALUES (7, 'lo', 5, 'desc ...', 3643.00, 1.80, 2);
INSERT INTO public.moon VALUES (8, 'Callisto', 5, 'desc ...', 4820.00, 16.70, 2);
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 'desc ...', 1527.00, 4.50, 2);
INSERT INTO public.moon VALUES (10, 'Dione', 5, 'desc ...', 1123.00, 2.70, 2);
INSERT INTO public.moon VALUES (11, 'Hyperion', 5, 'desc ...', 270.00, 13.10, 2);
INSERT INTO public.moon VALUES (12, 'phobos', 5, 'desc ...', 22.00, 0.30, 2);
INSERT INTO public.moon VALUES (13, 'Deimos', 5, 'desc ...', 12.00, 1.30, 2);
INSERT INTO public.moon VALUES (14, 'Miranda', 5, 'desc ...', 471.00, 1.40, 1);
INSERT INTO public.moon VALUES (15, 'Ariel', 5, 'desc ...', 1157.00, 2.50, 1);
INSERT INTO public.moon VALUES (16, 'Umbriel', 5, 'desc ...', 1169.00, 4.10, 1);
INSERT INTO public.moon VALUES (17, 'Titania', 5, 'desc ...', 1578.00, 8.70, 1);
INSERT INTO public.moon VALUES (18, 'Oberon', 5, 'desc ...', 1523.00, 13.50, 1);
INSERT INTO public.moon VALUES (19, 'Charon', 5, 'desc ...', 1212.00, 6.40, 1);
INSERT INTO public.moon VALUES (20, 'Nereid', 5, 'desc ...', 340.00, 360.10, 1);
INSERT INTO public.moon VALUES (21, 'Proteus', 5, 'desc ...', 420.00, 1.10, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 1, 5, 'our home planet', true, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'mars', 1, 5, 'our home planet', true, true, 1, 2);
INSERT INTO public.planet VALUES (3, 'HD', 63, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (4, 'Kepler', 63, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (5, 'Satrun', 63, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (6, 'Japuiter', 63, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (9, 'Proxima', 1, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (10, 'Trappist', 1, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (11, 'Wasp', 1, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (12, 'K2-18b', 1, 0, 'Blue exoplanet', false, false, 1, 2);
INSERT INTO public.planet VALUES (13, 'Gliese', 1, 0, 'Blue exoplanet', false, false, 1, 2);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'desc ...');
INSERT INTO public.planet_type VALUES (2, 'Gas giants', 'desc ...');
INSERT INTO public.planet_type VALUES (3, 'Ice giants', 'desc ...');
INSERT INTO public.planet_type VALUES (4, 'dwarf', 'desc ...');
INSERT INTO public.planet_type VALUES (5, 'Rogue', 'desc ...');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'pleiades', 'Desc ...', 115, 590.011, 110.000, 1);
INSERT INTO public.star VALUES (2, 'Hyades', 'Desc ...', 625, 5500.000, 119.000, 1);
INSERT INTO public.star VALUES (3, 'orion nebula', 'Desc ...', 625, 5500.000, 119.000, 2);
INSERT INTO public.star VALUES (4, 'Alpha', 'Desc ...', 625, 5500.000, 119.000, 2);
INSERT INTO public.star VALUES (5, 'Beta', 'Desc ...', 625, 5500.000, 119.000, 2);
INSERT INTO public.star VALUES (6, 'Beehive', 'Desc ...', 625, 5500.000, 119.000, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

