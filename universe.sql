--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_stars integer,
    first_discovered integer,
    galaxy_id integer DEFAULT 1
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    size numeric(10,3) NOT NULL,
    light_years_away_from_earth integer,
    date_discovered integer
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
    name character varying(60) NOT NULL,
    size integer NOT NULL,
    orbiting_planet character varying(60) NOT NULL,
    planet_id integer DEFAULT 0 NOT NULL,
    date_discovered integer
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
    name character varying(60),
    times_bigger_than_earth numeric(5,2) NOT NULL,
    has_life boolean,
    distance_from_earth_in_au numeric(5,2) NOT NULL,
    star_id integer DEFAULT 1 NOT NULL,
    position_from_sun integer,
    bigger_than_earth boolean,
    date_discovered integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy character varying(30) NOT NULL,
    size integer NOT NULL,
    interesting_info text,
    galaxy_id integer NOT NULL,
    brightness_rank_from_earth integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'orion', 7, 200, 1);
INSERT INTO public.constellation VALUES (2, 'ursa major', 7, 200, 1);
INSERT INTO public.constellation VALUES (3, 'ursa minor', 7, 200, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000.000, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1234.000, 2538000, 1612);
INSERT INTO public.galaxy VALUES (6, 'Draco Dwarf', 2300.000, 258000, 1954);
INSERT INTO public.galaxy VALUES (4, 'Carina Dwarf', 2902.000, 330000, 1977);
INSERT INTO public.galaxy VALUES (3, 'Centarus A', 9873.000, 12010000, 1826);
INSERT INTO public.galaxy VALUES (5, 'Coddingtons Nebula', 97898.000, 10000000, 1898);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 2159, 'Earth', 3, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', 13, 'Mars', 4, 1877);
INSERT INTO public.moon VALUES (4, 'Deimos', 23, 'Mars', 4, 1877);
INSERT INTO public.moon VALUES (5, 'Lo', 3236, 'Jupiter', 5, 1610);
INSERT INTO public.moon VALUES (6, 'Europa', 3138, 'Jupiter', 5, 1610);
INSERT INTO public.moon VALUES (7, 'Ganymede', 5652, 'Jupiter', 5, 1610);
INSERT INTO public.moon VALUES (8, 'Callisto', 4800, 'Jupiter', 5, 1610);
INSERT INTO public.moon VALUES (12, 'Aegir', 6, 'Saturn', 6, 2005);
INSERT INTO public.moon VALUES (15, 'Farbauti', 4, 'Saturn', 6, 2005);
INSERT INTO public.moon VALUES (16, 'Fenrir', 5, 'Saturn', 6, 2005);
INSERT INTO public.moon VALUES (17, 'Fornjot', 6, 'Saturn', 6, 2005);
INSERT INTO public.moon VALUES (18, 'Aerial', 11, 'Uranus', 7, 2003);
INSERT INTO public.moon VALUES (19, 'Mab', 16, 'Uranus', 7, 2003);
INSERT INTO public.moon VALUES (9, 'Amalthea', 200, 'Jupiter', 5, 1892);
INSERT INTO public.moon VALUES (11, 'Thebe', 90, 'Jupiter', 5, 1979);
INSERT INTO public.moon VALUES (13, 'Albiorix', 30, 'Saturn', 6, 2000);
INSERT INTO public.moon VALUES (10, 'Himalia', 170, 'Jupiter', 5, 1904);
INSERT INTO public.moon VALUES (14, 'Anthe', 1, 'Saturn', 6, 2004);
INSERT INTO public.moon VALUES (20, 'Perdita', 20, 'Uranus', 7, 1986);
INSERT INTO public.moon VALUES (21, 'Thalassa', 90, 'Neptune', 8, 1989);
INSERT INTO public.moon VALUES (2, 'Titan', 2345, 'Jupiter', 5, 1655);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 1.00, true, 0.00, 1, 3, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11.24, false, 6.45, 1, 5, true, -700);
INSERT INTO public.planet VALUES (1, 'Mercury', 0.38, false, 1.45, 1, 1, false, -700);
INSERT INTO public.planet VALUES (2, 'Venus', 0.95, false, 1.74, 1, 2, false, -700);
INSERT INTO public.planet VALUES (4, 'Mars', 0.53, false, 2.67, 1, 4, false, -700);
INSERT INTO public.planet VALUES (7, 'Uranus', 4.00, false, 21.09, 1, 7, true, 1781);
INSERT INTO public.planet VALUES (8, 'Neptune', 3.88, false, 31.32, 1, 8, true, 1846);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.45, false, 11.05, 1, 6, true, -700);
INSERT INTO public.planet VALUES (9, 'eridani b', 45.00, false, 32.00, 7, NULL, true, 2015);
INSERT INTO public.planet VALUES (10, 'pegasi b', 5.00, false, 50.00, 7, NULL, true, 1995);
INSERT INTO public.planet VALUES (11, 'Cancri b', 9.00, false, 41.00, 7, NULL, true, 1996);
INSERT INTO public.planet VALUES (12, 'Cancri c', 9.00, false, 41.00, 7, NULL, true, 2004);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Milky Way', 34567, 'The solar system is based round the sun', 1, 1);
INSERT INTO public.star VALUES (2, 'Polaris', 'Milky Way', 234545, 'Also known as the North Star', 1, 48);
INSERT INTO public.star VALUES (3, 'Pollux', 'Milky Way', 345435, 'the other star of gemini', 1, 17);
INSERT INTO public.star VALUES (4, 'Mintaka', 'Milky Way', 345435, 'the other star of gemini', 1, 67);
INSERT INTO public.star VALUES (5, 'Alnitak', 'Milky Way', 3234, 'A Star in Orions belt', 1, 32);
INSERT INTO public.star VALUES (6, 'Alnilam', 'Milky Way', 3234, 'A Star in Orions belt', 1, 29);
INSERT INTO public.star VALUES (7, 'K-type', 'Milky way', 234342, NULL, 1, NULL);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellations_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

