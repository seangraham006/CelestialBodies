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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    number_stars numeric,
    name character varying(60) NOT NULL,
    year_discovered integer,
    is_active boolean
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
    planet_id integer,
    name character varying(60) NOT NULL,
    is_habitable boolean,
    description text
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
    star_id integer,
    name character varying(60) NOT NULL,
    is_habitable boolean,
    description text
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    moon_id integer,
    name character varying(60) NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(60) NOT NULL,
    mass integer,
    temperature integer
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 250000000000, 'Milky Way', 1920, true);
INSERT INTO public.galaxy VALUES (2, 1000000000000, 'Andromeda', 1912, true);
INSERT INTO public.galaxy VALUES (3, 80000000000, 'Sombrero', 2003, true);
INSERT INTO public.galaxy VALUES (4, 50000000000, 'Whirlpool', 1773, false);
INSERT INTO public.galaxy VALUES (5, 40000000000, 'Triangulum', 1764, true);
INSERT INTO public.galaxy VALUES (6, 20000000000, 'Cartwheel', 1941, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', false, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 2, 'Phobos', false, 'One of Mars'' moons');
INSERT INTO public.moon VALUES (3, 2, 'Deimos', false, 'Smaller moon of Mars');
INSERT INTO public.moon VALUES (4, 3, 'Europa', false, 'Icy moon of Jupiter');
INSERT INTO public.moon VALUES (5, 4, 'Io', false, 'Volcanic moon of Jupiter');
INSERT INTO public.moon VALUES (6, 4, 'Ganymede', false, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 4, 'Callisto', false, 'Moon of Jupiter');
INSERT INTO public.moon VALUES (8, 5, 'Proxima Centauri b-1', false, 'Exomoon');
INSERT INTO public.moon VALUES (9, 6, 'Kepler Moon 1', false, 'Moon of Kepler-22b');
INSERT INTO public.moon VALUES (10, 7, 'HD 189733b-1', false, 'Exomoon');
INSERT INTO public.moon VALUES (11, 8, 'TOI 700d-1', true, 'Possibly habitable moon');
INSERT INTO public.moon VALUES (12, 9, 'Wolf 1061c-1', false, 'Moon of Wolf 1061c');
INSERT INTO public.moon VALUES (13, 10, 'LHS Moon 1', false, 'Moon of LHS 1140b');
INSERT INTO public.moon VALUES (14, 11, 'Gliese 581g-1', false, 'Moon of Gliese 581g');
INSERT INTO public.moon VALUES (15, 12, 'K2-18b-1', true, 'Exomoon with water vapor');
INSERT INTO public.moon VALUES (16, 12, 'K2-18b-2', true, 'Another moon of K2-18b');
INSERT INTO public.moon VALUES (17, 1, 'Miranda', false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (18, 3, 'Titan', true, 'Moon of Saturn with a dense atmosphere');
INSERT INTO public.moon VALUES (19, 4, 'Enceladus', true, 'Icy moon with geysers');
INSERT INTO public.moon VALUES (20, 5, 'Oberon', false, 'Uranian moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', true, 'Blue planet with life');
INSERT INTO public.planet VALUES (2, 1, 'Mars', false, 'Red desert planet');
INSERT INTO public.planet VALUES (3, 1, 'Venus', false, 'Cloud-covered and hot');
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', false, 'Gas giant with many moons');
INSERT INTO public.planet VALUES (5, 2, 'Proxima b', false, 'Closest exoplanet to Earth');
INSERT INTO public.planet VALUES (6, 3, 'Kepler-22b', true, 'Possibly habitable');
INSERT INTO public.planet VALUES (7, 3, 'Kepler-452b', true, 'Super-Earth');
INSERT INTO public.planet VALUES (8, 4, 'HD 189733b', false, 'Gas giant with violent weather');
INSERT INTO public.planet VALUES (9, 5, 'TOI 700d', true, 'Potentially habitable');
INSERT INTO public.planet VALUES (10, 5, 'Wolf 1061c', true, 'Rocky exoplanet');
INSERT INTO public.planet VALUES (11, 6, 'LHS 1140b', true, 'Exoplanet in the habitable zone');
INSERT INTO public.planet VALUES (12, 6, 'Gliese 581g', true, 'Hypothetical habitable planet');
INSERT INTO public.planet VALUES (13, 6, 'K2-18b', true, 'Water vapor detected');


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (29, 1, 'Explorer 1');
INSERT INTO public.satellite VALUES (30, 1, 'Apollo 11');
INSERT INTO public.satellite VALUES (31, 2, 'Mars Orbiter');
INSERT INTO public.satellite VALUES (32, 2, 'Viking 1');
INSERT INTO public.satellite VALUES (33, 3, 'Galileo');
INSERT INTO public.satellite VALUES (34, 3, 'Cassini');
INSERT INTO public.satellite VALUES (35, 4, 'Luna 3');
INSERT INTO public.satellite VALUES (36, 4, 'Pioneer 10');
INSERT INTO public.satellite VALUES (37, 5, 'Voyager 1');
INSERT INTO public.satellite VALUES (38, 5, 'Voyager 2');
INSERT INTO public.satellite VALUES (39, 6, 'Sputnik 1');
INSERT INTO public.satellite VALUES (40, 6, 'Sputnik 2');
INSERT INTO public.satellite VALUES (41, 7, 'Hubble Space Telescope');
INSERT INTO public.satellite VALUES (42, 7, 'Chandra');
INSERT INTO public.satellite VALUES (43, 8, 'New Horizons');
INSERT INTO public.satellite VALUES (44, 8, 'Lunar Orbiter');
INSERT INTO public.satellite VALUES (45, 9, 'Kepler');
INSERT INTO public.satellite VALUES (46, 9, 'TESS');
INSERT INTO public.satellite VALUES (47, 10, 'Hayabusa');
INSERT INTO public.satellite VALUES (48, 10, 'Juno');
INSERT INTO public.satellite VALUES (49, 11, 'Rosetta');
INSERT INTO public.satellite VALUES (50, 11, 'BepiColombo');
INSERT INTO public.satellite VALUES (51, 12, 'James Webb Space Telescope');
INSERT INTO public.satellite VALUES (52, 12, 'Lunar Gateway');
INSERT INTO public.satellite VALUES (53, 13, 'Sentinel-1');
INSERT INTO public.satellite VALUES (54, 13, 'Sentinel-2');
INSERT INTO public.satellite VALUES (55, 14, 'Parker Solar Probe');
INSERT INTO public.satellite VALUES (56, 14, 'Europa Clipper');
INSERT INTO public.satellite VALUES (57, 15, 'Akatsuki');
INSERT INTO public.satellite VALUES (58, 15, 'Insight');
INSERT INTO public.satellite VALUES (59, 16, 'Atlas 1');
INSERT INTO public.satellite VALUES (60, 16, 'Titan 2');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1989000, 5778);
INSERT INTO public.star VALUES (2, 2, 'Sirius', 2020000, 9940);
INSERT INTO public.star VALUES (3, 3, 'Vega', 2100000, 9600);
INSERT INTO public.star VALUES (4, 4, 'Altair', 1840000, 7700);
INSERT INTO public.star VALUES (5, 5, 'Betelgeuse', 1620000, 3500);
INSERT INTO public.star VALUES (6, 6, 'Rigel', 2480000, 12100);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 60, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite satellite_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

