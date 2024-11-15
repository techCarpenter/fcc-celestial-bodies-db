--
-- PostgreSQL database dump
--
-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
SET
  statement_timeout = 0;


SET
  lock_timeout = 0;


SET
  idle_in_transaction_session_timeout = 0;


SET
  client_encoding = 'UTF8';


SET
  standard_conforming_strings = ON;


SELECT
  pg_catalog.set_config('search_path', '', false);


SET
  check_function_bodies = false;


SET
  xmloption = content;


SET
  client_min_messages = warning;


SET
  row_security = off;


DROP DATABASE universe;


--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--
CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;


\ connect universe
SET
  statement_timeout = 0;


SET
  lock_timeout = 0;


SET
  idle_in_transaction_session_timeout = 0;


SET
  client_encoding = 'UTF8';


SET
  standard_conforming_strings = ON;


SELECT
  pg_catalog.set_config('search_path', '', false);


SET
  check_function_bodies = false;


SET
  xmloption = content;


SET
  client_min_messages = warning;


SET
  row_security = off;


--
-- Name: DATABASE universe; Type: COMMENT; Schema: -; Owner: freecodecamp
--
COMMENT ON DATABASE universe IS 'default administrative connection database';


SET
  default_tablespace = '';


SET
  default_table_access_method = HEAP;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.galaxy (
  galaxy_id integer NOT NULL,
  name character varying(30) NOT NULL,
  diameter_ly numeric(5, 1),
  color character varying(30),
  galaxy_type_id integer NOT NULL
);


ALTER TABLE
  public.galaxy OWNER TO freecodecamp;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE
  public.galaxy_galaxy_id_seq OWNER TO freecodecamp;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.galaxy_type (
  galaxy_type_id integer NOT NULL,
  TYPE character varying(30) NOT NULL,
  description text,
  name character varying(30)
);


ALTER TABLE
  public.galaxy_type OWNER TO freecodecamp;


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE
  public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.moon (
  moon_id integer NOT NULL,
  name character varying(30) NOT NULL,
  diameter_km numeric(5, 1),
  description text,
  planet_id integer NOT NULL
);


ALTER TABLE
  public.moon OWNER TO freecodecamp;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE
  public.moon_moon_id_seq OWNER TO freecodecamp;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.planet (
  planet_id integer NOT NULL,
  name character varying(30) NOT NULL,
  planet_from_sun integer NOT NULL,
  has_life boolean,
  description text,
  star_id integer NOT NULL
);


ALTER TABLE
  public.planet OWNER TO freecodecamp;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE
  public.planet_planet_id_seq OWNER TO freecodecamp;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
  star_id integer NOT NULL,
  name character varying(30) NOT NULL,
  has_planets boolean NOT NULL,
  diameter_km numeric(5, 1),
  brightness integer,
  galaxy_id integer NOT NULL
);


ALTER TABLE
  public.star OWNER TO freecodecamp;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE
  public.star_star_id_seq OWNER TO freecodecamp;


--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ALTER COLUMN
  galaxy_id
SET
  DEFAULT nextval('public.galaxy_galaxy_id_seq' :: regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy_type
ALTER COLUMN
  galaxy_type_id
SET
  DEFAULT nextval(
    'public.galaxy_type_galaxy_type_id_seq' :: regclass
  );


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ALTER COLUMN
  moon_id
SET
  DEFAULT nextval('public.moon_moon_id_seq' :: regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ALTER COLUMN
  planet_id
SET
  DEFAULT nextval('public.planet_planet_id_seq' :: regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ALTER COLUMN
  star_id
SET
  DEFAULT nextval('public.star_star_id_seq' :: regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.galaxy
VALUES
  (1, 'milky way', NULL, NULL, 1);


INSERT INTO
  public.galaxy
VALUES
  (2, 'andromeda', NULL, NULL, 2);


INSERT INTO
  public.galaxy
VALUES
  (3, 'bear paw', NULL, NULL, 3);


INSERT INTO
  public.galaxy
VALUES
  (4, 'black eye', NULL, NULL, 1);


INSERT INTO
  public.galaxy
VALUES
  (5, 'butterfly', NULL, NULL, 2);


INSERT INTO
  public.galaxy
VALUES
  (6, 'cocoon', NULL, NULL, 3);


INSERT INTO
  public.galaxy
VALUES
  (7, 'cigar', NULL, NULL, 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.galaxy_type
VALUES
  (1, 'spiral', 'circle around a center', NULL);


INSERT INTO
  public.galaxy_type
VALUES
  (2, 'elliptical', 'ellipse around a center', NULL);


INSERT INTO
  public.galaxy_type
VALUES
  (3, 'irregullar', 'blob galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.moon
VALUES
  (1, 'moon', NULL, NULL, 3);


INSERT INTO
  public.moon
VALUES
  (2, 'metis', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (3, 'thebe', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (4, 'europa', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (5, 'thermisto', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (6, 'leda', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (7, 'ersa', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (8, 'mneme', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (9, 'orthosie', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (10, 'isonoe', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (11, 'erinome', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (12, 'kale', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (13, 'aitne', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (14, 'eukelade', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (15, 'arche', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (16, 'sponde', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (17, 'sinope', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (18, 'kore', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (19, 'callirrhoe', NULL, NULL, 5);


INSERT INTO
  public.moon
VALUES
  (20, 'pasiphae', NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.planet
VALUES
  (1, 'mercury', 1, NULL, NULL, 1);


INSERT INTO
  public.planet
VALUES
  (2, 'venus', 2, NULL, NULL, 1);


INSERT INTO
  public.planet
VALUES
  (3, 'earth', 3, NULL, NULL, 1);


INSERT INTO
  public.planet
VALUES
  (4, 'mars', 4, NULL, NULL, 1);


INSERT INTO
  public.planet
VALUES
  (5, 'jupiter', 5, NULL, NULL, 1);


INSERT INTO
  public.planet
VALUES
  (6, 'saturn', 6, NULL, NULL, 1);


INSERT INTO
  public.planet
VALUES
  (7, 'neptune', 7, NULL, NULL, 1);


INSERT INTO
  public.planet
VALUES
  (8, 'uranus', 8, NULL, NULL, 1);


INSERT INTO
  public.planet
VALUES
  (9, 'pluto', 9, NULL, NULL, 1);


INSERT INTO
  public.planet
VALUES
  (10, 'zenix', 10, NULL, NULL, 2);


INSERT INTO
  public.planet
VALUES
  (11, 'terraria', 11, NULL, NULL, 3);


INSERT INTO
  public.planet
VALUES
  (12, 'snarmag', 12, NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.star
VALUES
  (1, 'sun', TRUE, NULL, NULL, 1);


INSERT INTO
  public.star
VALUES
  (2, 'betelgeuse', TRUE, NULL, NULL, 2);


INSERT INTO
  public.star
VALUES
  (3, 'arcturus', TRUE, NULL, NULL, 3);


INSERT INTO
  public.star
VALUES
  (4, 'capella', TRUE, NULL, NULL, 4);


INSERT INTO
  public.star
VALUES
  (5, 'rigel', TRUE, NULL, NULL, 5);


INSERT INTO
  public.star
VALUES
  (6, 'procyon', TRUE, NULL, NULL, 6);


INSERT INTO
  public.star
VALUES
  (7, 'archernar', TRUE, NULL, NULL, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, TRUE);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, TRUE);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.moon_moon_id_seq', 20, TRUE);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.planet_planet_id_seq', 12, TRUE);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.star_star_id_seq', 7, TRUE);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ADD
  CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ADD
  CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy_type
ADD
  CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type galaxy_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy_type
ADD
  CONSTRAINT galaxy_type_type_key UNIQUE (TYPE);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ADD
  CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ADD
  CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_from_sun_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT planet_planet_from_sun_key UNIQUE (planet_from_sun);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ADD
  CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ADD
  CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
