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

DROP DATABASE guess_number;
--
-- Name: guess_number; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guess_number WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guess_number OWNER TO freecodecamp;

\connect guess_number

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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (1, 'rupesh', 7, 12);
INSERT INTO public.user_info VALUES (3, 'rahul', 1, 10);
INSERT INTO public.user_info VALUES (5, 'user_1735167918063', 2, 417);
INSERT INTO public.user_info VALUES (4, 'user_1735167918064', 5, 422);
INSERT INTO public.user_info VALUES (7, 'user_1735167974650', 2, 173);
INSERT INTO public.user_info VALUES (6, 'user_1735167974651', 5, 296);
INSERT INTO public.user_info VALUES (9, 'user_1735168415274', 2, 96);
INSERT INTO public.user_info VALUES (8, 'user_1735168415275', 5, 311);
INSERT INTO public.user_info VALUES (11, 'user_1735168438193', 2, 97);
INSERT INTO public.user_info VALUES (10, 'user_1735168438194', 4, 237);
INSERT INTO public.user_info VALUES (13, 'user_1735168454936', 2, 361);
INSERT INTO public.user_info VALUES (12, 'user_1735168454937', 4, 367);
INSERT INTO public.user_info VALUES (15, 'user_1735168489024', 2, 275);
INSERT INTO public.user_info VALUES (14, 'user_1735168489025', 5, 61);
INSERT INTO public.user_info VALUES (17, 'user_1735168567056', 2, 133);
INSERT INTO public.user_info VALUES (16, 'user_1735168567057', 5, 192);
INSERT INTO public.user_info VALUES (19, 'user_1735168657664', 2, 380);
INSERT INTO public.user_info VALUES (18, 'user_1735168657665', 5, 276);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 19, true);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- Name: user_info user_info_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

