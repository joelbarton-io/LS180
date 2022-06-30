--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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

--
-- Name: spectral; Type: TYPE; Schema: public; Owner: joelbarton
--

CREATE TYPE public.spectral AS ENUM (
    'O',
    'B',
    'A',
    'F',
    'G',
    'K',
    'M'
);


ALTER TYPE public.spectral OWNER TO joelbarton;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: moons; Type: TABLE; Schema: public; Owner: joelbarton
--

CREATE TABLE public.moons (
    id integer NOT NULL,
    designation integer NOT NULL,
    semi_major_axis numeric,
    mass numeric,
    planet_id integer NOT NULL,
    CONSTRAINT moons_designation_check CHECK ((designation > 0)),
    CONSTRAINT moons_mass_check CHECK ((mass > (0)::numeric)),
    CONSTRAINT moons_semi_major_axis_check CHECK ((semi_major_axis > (0)::numeric))
);


ALTER TABLE public.moons OWNER TO joelbarton;

--
-- Name: moons_designation_seq; Type: SEQUENCE; Schema: public; Owner: joelbarton
--

CREATE SEQUENCE public.moons_designation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_designation_seq OWNER TO joelbarton;

--
-- Name: moons_designation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joelbarton
--

ALTER SEQUENCE public.moons_designation_seq OWNED BY public.moons.designation;


--
-- Name: moons_id_seq; Type: SEQUENCE; Schema: public; Owner: joelbarton
--

CREATE SEQUENCE public.moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_id_seq OWNER TO joelbarton;

--
-- Name: moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joelbarton
--

ALTER SEQUENCE public.moons_id_seq OWNED BY public.moons.id;


--
-- Name: planets; Type: TABLE; Schema: public; Owner: joelbarton
--

CREATE TABLE public.planets (
    id integer NOT NULL,
    designation character(1) NOT NULL,
    mass numeric,
    star_id integer NOT NULL,
    CONSTRAINT postive_mass CHECK ((mass > (0)::numeric))
);


ALTER TABLE public.planets OWNER TO joelbarton;

--
-- Name: planets_id_seq; Type: SEQUENCE; Schema: public; Owner: joelbarton
--

CREATE SEQUENCE public.planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_id_seq OWNER TO joelbarton;

--
-- Name: planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joelbarton
--

ALTER SEQUENCE public.planets_id_seq OWNED BY public.planets.id;


--
-- Name: stars; Type: TABLE; Schema: public; Owner: joelbarton
--

CREATE TABLE public.stars (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance numeric NOT NULL,
    spectral_type public.spectral,
    companions integer NOT NULL,
    CONSTRAINT stars_companions_check CHECK ((companions >= 0)),
    CONSTRAINT stars_distance_check CHECK ((distance > (0)::numeric))
);


ALTER TABLE public.stars OWNER TO joelbarton;

--
-- Name: stars_id_seq; Type: SEQUENCE; Schema: public; Owner: joelbarton
--

CREATE SEQUENCE public.stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_id_seq OWNER TO joelbarton;

--
-- Name: stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joelbarton
--

ALTER SEQUENCE public.stars_id_seq OWNED BY public.stars.id;


--
-- Name: moons id; Type: DEFAULT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.moons ALTER COLUMN id SET DEFAULT nextval('public.moons_id_seq'::regclass);


--
-- Name: moons designation; Type: DEFAULT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.moons ALTER COLUMN designation SET DEFAULT nextval('public.moons_designation_seq'::regclass);


--
-- Name: planets id; Type: DEFAULT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.planets ALTER COLUMN id SET DEFAULT nextval('public.planets_id_seq'::regclass);


--
-- Name: stars id; Type: DEFAULT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.stars ALTER COLUMN id SET DEFAULT nextval('public.stars_id_seq'::regclass);


--
-- Data for Name: moons; Type: TABLE DATA; Schema: public; Owner: joelbarton
--



--
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: joelbarton
--

INSERT INTO public.planets VALUES (3, 'b', 0.0036, 3);
INSERT INTO public.planets VALUES (4, 'c', 0.1, 4);


--
-- Data for Name: stars; Type: TABLE DATA; Schema: public; Owner: joelbarton
--

INSERT INTO public.stars VALUES (3, 'Alpha Centauri B', 4.37, 'K', 3);
INSERT INTO public.stars VALUES (4, 'Epsilon Eridani', 10.5, 'K', 0);


--
-- Name: moons_designation_seq; Type: SEQUENCE SET; Schema: public; Owner: joelbarton
--

SELECT pg_catalog.setval('public.moons_designation_seq', 1, false);


--
-- Name: moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joelbarton
--

SELECT pg_catalog.setval('public.moons_id_seq', 1, false);


--
-- Name: planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joelbarton
--

SELECT pg_catalog.setval('public.planets_id_seq', 4, true);


--
-- Name: stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joelbarton
--

SELECT pg_catalog.setval('public.stars_id_seq', 4, true);


--
-- Name: moons moons_pkey; Type: CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_pkey PRIMARY KEY (id);


--
-- Name: planets planets_designation_key; Type: CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_designation_key UNIQUE (designation);


--
-- Name: planets planets_pkey; Type: CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_pkey PRIMARY KEY (id);


--
-- Name: stars stars_name_key; Type: CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.stars
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: stars stars_pkey; Type: CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.stars
    ADD CONSTRAINT stars_pkey PRIMARY KEY (id);


--
-- Name: moons moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planets(id);


--
-- Name: planets planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.stars(id);


--
-- PostgreSQL database dump complete
--

