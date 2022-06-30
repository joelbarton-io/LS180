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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: devices; Type: TABLE; Schema: public; Owner: joelbarton
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.devices OWNER TO joelbarton;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: joelbarton
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO joelbarton;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joelbarton
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: joelbarton
--

CREATE TABLE public.parts (
    id integer NOT NULL,
    part_number integer NOT NULL,
    device_id integer
);


ALTER TABLE public.parts OWNER TO joelbarton;

--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: joelbarton
--

CREATE SEQUENCE public.parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_id_seq OWNER TO joelbarton;

--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joelbarton
--

ALTER SEQUENCE public.parts_id_seq OWNED BY public.parts.id;


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.parts ALTER COLUMN id SET DEFAULT nextval('public.parts_id_seq'::regclass);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: joelbarton
--

INSERT INTO public.devices VALUES (2, 'Gyroscope', '2022-06-20 16:06:52.264303');
INSERT INTO public.devices VALUES (3, 'Magnetometer', '2022-06-20 17:02:53.429146');


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: joelbarton
--

INSERT INTO public.parts VALUES (4, 103, 2);
INSERT INTO public.parts VALUES (5, 104, 2);
INSERT INTO public.parts VALUES (6, 105, 2);
INSERT INTO public.parts VALUES (9, 108, NULL);
INSERT INTO public.parts VALUES (10, 109, NULL);
INSERT INTO public.parts VALUES (11, 110, NULL);
INSERT INTO public.parts VALUES (12, 111, 3);
INSERT INTO public.parts VALUES (1, 100, 2);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joelbarton
--

SELECT pg_catalog.setval('public.devices_id_seq', 3, true);


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joelbarton
--

SELECT pg_catalog.setval('public.parts_id_seq', 12, true);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: parts parts_part_number_key; Type: CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_part_number_key UNIQUE (part_number);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: parts parts_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joelbarton
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

