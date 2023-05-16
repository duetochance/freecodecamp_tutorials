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
-- Name: discoverers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoverers (
    discoverers_id integer NOT NULL,
    name character varying(30) NOT NULL,
    association character varying(40)
);


ALTER TABLE public.discoverers OWNER TO freecodecamp;

--
-- Name: discoverers_discoverer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discoverers_discoverer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoverers_discoverer_id_seq OWNER TO freecodecamp;

--
-- Name: discoverers_discoverer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discoverers_discoverer_id_seq OWNED BY public.discoverers.discoverers_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30),
    description character varying(100),
    galaxy_type character varying(30),
    distance_from_earth integer,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL,
    discovered_date date NOT NULL,
    discovered_by character varying(30) NOT NULL
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
    galaxy integer,
    planet_id integer,
    name character varying(30),
    description text,
    age_in_millions_of_years integer,
    moon_id integer NOT NULL,
    discovered_date date NOT NULL
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
    name character varying(30),
    is_spherical boolean,
    description text,
    star_id integer,
    age_in_millions_of_years integer,
    planet_id integer NOT NULL,
    has_moons boolean,
    discovered_date date NOT NULL,
    discovered_by character varying(30) NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    galaxy_id integer,
    description text,
    name character varying(30),
    mass numeric,
    number_of_planets integer,
    star_id integer NOT NULL,
    has_planets boolean,
    discovered_by character varying(30) NOT NULL,
    discovered_date date NOT NULL
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
-- Name: discoverers discoverers_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers ALTER COLUMN discoverers_id SET DEFAULT nextval('public.discoverers_discoverer_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: discoverers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoverers VALUES (1, 'NASA', NULL);
INSERT INTO public.discoverers VALUES (2, 'EASA', NULL);
INSERT INTO public.discoverers VALUES (3, 'Private', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Very much our galaxy', 'Round', 0, NULL, 1, '1600-01-01', 'TBD');
INSERT INTO public.galaxy VALUES ('Andromeda', 'Not a zodiac knigt', 'Round', 35, NULL, 2, '1901-08-12', 'TBD');
INSERT INTO public.galaxy VALUES ('FAL-22', 'Randomic stuff', 'Circle', 321, NULL, 3, '1998-09-01', 'NASA');
INSERT INTO public.galaxy VALUES ('AGH2', 'Random again', 'Depressive', 44, NULL, 4, '1928-10-10', 'EASA');
INSERT INTO public.galaxy VALUES ('CA98-D2', 'Boh, no data', 'TBD', 666, NULL, 5, '2023-06-12', 'Private');
INSERT INTO public.galaxy VALUES ('DD65', 'Unknown', 'TBD', 423, NULL, 6, '1978-05-05', 'EASA');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 'The rrock', 9999, 34, '0001-01-01');
INSERT INTO public.moon VALUES (1, 3, 'Jun23', 'A rock', 9939, 35, '0185-01-01');
INSERT INTO public.moon VALUES (2, 1, 'JRR4', 'A rock', 9939, 36, '0185-01-01');
INSERT INTO public.moon VALUES (1, 4, 'JRR5', 'A rock', 9939, 37, '0185-01-01');
INSERT INTO public.moon VALUES (1, 4, 'JhhR5', 'A rock', 5939, 38, '1859-01-01');
INSERT INTO public.moon VALUES (2, 4, 'Jwef5', 'A rock', 5939, 39, '1859-01-01');
INSERT INTO public.moon VALUES (2, 4, 'Jwer5', 'A rock', 5459, 41, '1639-01-11');
INSERT INTO public.moon VALUES (2, 4, 'DDDD33', 'A rock', 5459, 42, '1639-12-11');
INSERT INTO public.moon VALUES (3, 3, 'AA33', 'A rock', 5459, 43, '1839-12-16');
INSERT INTO public.moon VALUES (1, 9, 'WAA33', 'A rock', 5459, 44, '1839-12-16');
INSERT INTO public.moon VALUES (1, 9, 'xMoon', 'A rock', 5459, 45, '1839-12-16');
INSERT INTO public.moon VALUES (1, 9, '12Moon', 'A rock', 5459, 46, '1839-12-16');
INSERT INTO public.moon VALUES (6, 9, '13Moon', 'A rock', 5459, 47, '1839-12-16');
INSERT INTO public.moon VALUES (6, 2, '14Moon', 'A rock', 1929, 48, '1968-12-16');
INSERT INTO public.moon VALUES (1, 2, '15Moon', 'A rock', 1929, 49, '1968-12-16');
INSERT INTO public.moon VALUES (1, 2, '16Moon', 'A rock', 1929, 50, '1968-12-16');
INSERT INTO public.moon VALUES (2, 3, '17Moon', 'A rock', 1929, 51, '1968-12-16');
INSERT INTO public.moon VALUES (2, 3, '18Moon', 'A rock', 9979, 52, '1969-12-16');
INSERT INTO public.moon VALUES (6, 6, '19Moon', 'A rock', 9979, 53, '1969-12-16');
INSERT INTO public.moon VALUES (5, 8, '20Moon', 'A rock', 9979, 54, '1969-12-16');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Terra', true, 'The blue planet', 1, 2134, 1, true, '0001-01-01', 'Everybody');
INSERT INTO public.planet VALUES ('Mars', true, 'The red planet', 1, 26674, 2, true, '1230-01-14', 'Everybody');
INSERT INTO public.planet VALUES ('Venus', true, 'The inhabitable planet', 1, 26674, 3, true, '1230-01-14', 'Everybody');
INSERT INTO public.planet VALUES ('Saturn', true, 'The inhabitable planet', 1, 6674, 4, true, '1230-01-14', 'Everybody');
INSERT INTO public.planet VALUES ('Simil Saturn', true, 'The inhabitable planet', 2, 6674, 5, true, '1230-01-14', 'NASA');
INSERT INTO public.planet VALUES ('AH98v2', false, 'The very inhabitable planet', 3, 6674, 6, true, '1230-11-20', 'NASA');
INSERT INTO public.planet VALUES ('ddsEE98v2', false, 'The very inhabitable planet', 3, 6674, 7, false, '1980-11-20', 'EASA');
INSERT INTO public.planet VALUES ('Jupyter', true, 'Not the notebook', 1, 98674, 8, false, '1800-11-20', 'Humanity');
INSERT INTO public.planet VALUES ('Pluto', true, 'Random stuff', 1, 98674, 9, false, '1800-11-20', 'NASA');
INSERT INTO public.planet VALUES ('FDFDF443', true, 'Random stuff', 1, 98674, 10, false, '1800-11-20', 'NASA');
INSERT INTO public.planet VALUES ('GGK3', true, 'Random stuff', 1, 98674, 11, false, '1800-11-20', 'NASA');
INSERT INTO public.planet VALUES ('GGK43', true, 'Random stuff', 1, 98674, 12, false, '1999-08-30', 'EASA');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (NULL, 'Very hot', 'Sun', 35452, 9, 1, true, 'Everyone', '0001-01-01');
INSERT INTO public.star VALUES (NULL, 'Hot', 'ST021', 1345, 3, 2, false, 'NASA', '1991-05-11');
INSERT INTO public.star VALUES (NULL, 'KHJFFD', 'AAFS', 88872, 12, 3, true, 'EASA', '1999-01-01');
INSERT INTO public.star VALUES (NULL, 'Cold', 'C001', 232311, 33, 4, true, 'Private', '1954-09-12');
INSERT INTO public.star VALUES (NULL, 'Unknown', 'Sds44', 112, 0, 5, false, 'NASA', '1992-07-07');
INSERT INTO public.star VALUES (NULL, 'AG22', 'AG22992', 875574, 22, 6, true, 'EASA', '1993-01-12');


--
-- Name: discoverers_discoverer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discoverers_discoverer_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 54, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: discoverers discoverers_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers
    ADD CONSTRAINT discoverers_name_key UNIQUE (name);


--
-- Name: discoverers discoverers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverers
    ADD CONSTRAINT discoverers_pkey PRIMARY KEY (discoverers_id);


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
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

