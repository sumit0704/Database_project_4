--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6rc1
-- Dumped by pg_dump version 9.6rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projectusermapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projectusermapping (
    id integer NOT NULL,
    user_id integer NOT NULL,
    project_id integer NOT NULL,
    role integer NOT NULL,
    registereddt timestamp without time zone,
    lastvisitdt timestamp without time zone,
    is_active character(1) NOT NULL,
    approved character(1) DEFAULT NULL::bpchar,
    approvaldat timestamp without time zone
);


ALTER TABLE projectusermapping OWNER TO postgres;

--
-- Data for Name: projectusermapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projectusermapping (id, user_id, project_id, role, registereddt, lastvisitdt, is_active, approved, approvaldat) FROM stdin;
1	1	20	1	2016-10-26 21:51:04.95	\N	Y	Y	\N
2	1	21	3	2016-10-26 22:09:32.667	\N	Y	Y	\N
3	1	21	2	2016-10-26 22:09:33.041	\N	Y	Y	\N
4	1	25	1	2016-10-26 22:23:40.945	\N	Y	Y	\N
5	1	25	1	2016-10-27 01:55:25.225	\N	Y	Y	\N
6	1	26	1	2016-10-29 18:03:04.421	\N	Y	Y	\N
7	1	27	1	2016-11-01 21:46:11.462	\N	Y	Y	\N
\.


--
-- PostgreSQL database dump complete
--

