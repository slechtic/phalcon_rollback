--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2015-08-21 12:24:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1954 (class 1262 OID 1000172)
-- Name: pdo_test; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE pdo_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Czech_Czech Republic.1250' LC_CTYPE = 'Czech_Czech Republic.1250';


\connect pdo_test

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 174 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1957 (class 0 OID 0)
-- Dependencies: 174
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 1001104)
-- Name: genders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE genders (
    id integer NOT NULL,
    key character varying
);


--
-- TOC entry 172 (class 1259 OID 1001102)
-- Name: genders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE genders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1958 (class 0 OID 0)
-- Dependencies: 172
-- Name: genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE genders_id_seq OWNED BY genders.id;


--
-- TOC entry 171 (class 1259 OID 1000176)
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    id_gender integer,
    name character(2)
);


--
-- TOC entry 170 (class 1259 OID 1000174)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 170
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 1832 (class 2604 OID 1001107)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY genders ALTER COLUMN id SET DEFAULT nextval('genders_id_seq'::regclass);


--
-- TOC entry 1831 (class 2604 OID 1000179)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 1949 (class 0 OID 1001104)
-- Dependencies: 173
-- Data for Name: genders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO genders (id, key) VALUES (1, 'MALE');


--
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 172
-- Name: genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('genders_id_seq', 1, true);


--
-- TOC entry 1947 (class 0 OID 1000176)
-- Dependencies: 171
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 170
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 54, true);


--
-- TOC entry 1837 (class 2606 OID 1001112)
-- Name: pk_gender; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY genders
    ADD CONSTRAINT pk_gender PRIMARY KEY (id);


--
-- TOC entry 1835 (class 2606 OID 1001114)
-- Name: pk_user; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT pk_user PRIMARY KEY (id);


--
-- TOC entry 1833 (class 1259 OID 1001120)
-- Name: fki_gender; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_gender ON users USING btree (id_gender);


--
-- TOC entry 1838 (class 2606 OID 1001115)
-- Name: fk_gender; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_gender FOREIGN KEY (id_gender) REFERENCES genders(id);


--
-- TOC entry 1956 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-08-21 12:24:46

--
-- PostgreSQL database dump complete
--

