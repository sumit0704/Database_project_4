--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: webtoxpi; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE webtoxpi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE webtoxpi OWNER TO postgres;

\connect webtoxpi

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chemicals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chemicals (
    id character varying(5),
    sample character varying(10),
    category character varying(10),
    cas character varying(15),
    toxpibio character varying(10),
    toxpichemo character varying(10),
    toxpibiochemo character varying(10)
);


ALTER TABLE chemicals OWNER TO postgres;

--
-- Name: columnheaders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE columnheaders (
    id bigint NOT NULL,
    parent_id bigint,
    columntype_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    color integer,
    registereddt timestamp without time zone NOT NULL
);


ALTER TABLE columnheaders OWNER TO postgres;

--
-- Name: columnheaders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE columnheaders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE columnheaders_id_seq OWNER TO postgres;

--
-- Name: columntypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE columntypes (
    id bigint NOT NULL,
    parent_id bigint,
    project_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    registereddt timestamp without time zone NOT NULL
);


ALTER TABLE columntypes OWNER TO postgres;

--
-- Name: columntypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE columntypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE columntypes_id_seq OWNER TO postgres;

--
-- Name: columntypestempl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE columntypestempl (
    id bigint NOT NULL,
    parent_id bigint,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    projecttype_id bigint NOT NULL
);


ALTER TABLE columntypestempl OWNER TO postgres;

--
-- Name: columntypestempl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE columntypestempl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE columntypestempl_id_seq OWNER TO postgres;

--
-- Name: components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE components (
    id bigint NOT NULL,
    columnheader_id bigint,
    project_id bigint NOT NULL,
    unit bigint NOT NULL,
    updatedby bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    color integer,
    updateddt timestamp without time zone NOT NULL
);


ALTER TABLE components OWNER TO postgres;

--
-- Name: components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE components_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE components_id_seq OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: importinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE importinfo (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    transactiondate timestamp without time zone NOT NULL,
    notes character varying(255) NOT NULL,
    file bytea NOT NULL,
    filename character varying(255) NOT NULL
);


ALTER TABLE importinfo OWNER TO postgres;

--
-- Name: importinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE importinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE importinfo_id_seq OWNER TO postgres;

--
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE notes (
    id bigint NOT NULL,
    updatedby bigint NOT NULL,
    code character varying(255) NOT NULL,
    note character varying(255),
    owner_id integer NOT NULL,
    ownertype bytea NOT NULL,
    visible boolean NOT NULL,
    updateddt timestamp without time zone NOT NULL
);


ALTER TABLE notes OWNER TO postgres;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notes_id_seq OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders (
    id bigint NOT NULL,
    rowheader_id bigint,
    order_id bigint NOT NULL
);


ALTER TABLE orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO postgres;

--
-- Name: ordersequence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ordersequence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ordersequence_id_seq OWNER TO postgres;

--
-- Name: projectmanagers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projectmanagers (
    project_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE projectmanagers OWNER TO postgres;

--
-- Name: projectmembers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projectmembers (
    project_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE projectmembers OWNER TO postgres;

--
-- Name: projectreviewers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projectreviewers (
    project_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE projectreviewers OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projects (
    project_id bigint NOT NULL,
    projecttype bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    access integer NOT NULL,
    status integer NOT NULL,
    notes character varying(255),
    starts timestamp without time zone,
    ends timestamp without time zone,
    registereddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL,
    lastupdatedt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL,
    createdby bigint NOT NULL,
    lastmodifiedby bigint NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO postgres;

--
-- Name: projecttypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projecttypes (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    registereddt timestamp without time zone NOT NULL,
    lastvisitdt timestamp without time zone NOT NULL
);


ALTER TABLE projecttypes OWNER TO postgres;

--
-- Name: projecttypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE projecttypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projecttypes_id_seq OWNER TO postgres;

--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE results (
    id bigint NOT NULL,
    component_id bigint NOT NULL,
    project_id bigint NOT NULL,
    updatedby bigint NOT NULL,
    order_id bigint NOT NULL,
    strresult character varying(255),
    updateddt timestamp without time zone NOT NULL
);


ALTER TABLE results OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE results_id_seq OWNER TO postgres;

--
-- Name: resultshistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE resultshistory (
    id bigint NOT NULL,
    results bigint NOT NULL,
    updatedby bigint NOT NULL,
    oldstrresult character varying(255),
    newstrresult character varying(255),
    updateddt timestamp without time zone NOT NULL
);


ALTER TABLE resultshistory OWNER TO postgres;

--
-- Name: resultshistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resultshistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resultshistory_id_seq OWNER TO postgres;

--
-- Name: rowheaders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rowheaders (
    id bigint NOT NULL,
    rowtype_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    color integer,
    registereddt timestamp without time zone NOT NULL
);


ALTER TABLE rowheaders OWNER TO postgres;

--
-- Name: rowheaders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rowheaders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rowheaders_id_seq OWNER TO postgres;

--
-- Name: rowtypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rowtypes (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    showorder integer,
    notes character varying(255),
    registereddt timestamp without time zone NOT NULL
);


ALTER TABLE rowtypes OWNER TO postgres;

--
-- Name: rowtypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rowtypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rowtypes_id_seq OWNER TO postgres;

--
-- Name: rowtypestempl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rowtypestempl (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    showorder integer,
    projecttype_id bigint NOT NULL
);


ALTER TABLE rowtypestempl OWNER TO postgres;

--
-- Name: rowtypestempl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rowtypestempl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rowtypestempl_id_seq OWNER TO postgres;

--
-- Name: sequences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sequences (
    id bigint NOT NULL
);


ALTER TABLE sequences OWNER TO postgres;

--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE units (
    id bigint NOT NULL,
    parent_id bigint,
    updatedby bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    volumeof numeric(7,0),
    updateddt timestamp without time zone NOT NULL,
    relatedunit bigint
);


ALTER TABLE units OWNER TO postgres;

--
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE units_id_seq OWNER TO postgres;

--
-- Name: userroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE userroles (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    notes character varying(255),
    registereddt timestamp without time zone NOT NULL,
    lastvisitdt timestamp without time zone NOT NULL
);


ALTER TABLE userroles OWNER TO postgres;

--
-- Name: userroles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE userroles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userroles_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    user_id bigint NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role integer NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address1 character varying(255) NOT NULL,
    address2 character varying(255),
    country character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    zip character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    sex character varying(255),
    website character varying(255),
    interests character varying(255),
    birthday timestamp without time zone,
    organization character varying(255),
    organaddress character varying(255),
    photo bytea,
    notes character varying(255),
    registereddt timestamp without time zone,
    lastvisitdt timestamp without time zone,
    approved character varying(20),
    admin character varying(20)
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Data for Name: chemicals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY chemicals (id, sample, category, cas, toxpibio, toxpichemo, toxpibiochemo) FROM stdin;
1	CON-01	SRGO	64741-43-1	9.0	9.0	2.8
2	CON-02	SRGO	68814-87-9	8.2	9.6	2.7
3	CON-03	SRGO	68814-87-9	5.9	10.1	2.1
4	CON-04	SRGO	68915-96-8	9.5	8.3	2.7
5	CON-05	SRGO	64741-43-1	7.9	8.6	2.4
6	CON-07	OGO	64742-46-7	4.1	11.1	1.8
7	CON-09	OGO	64742-80-9	5.6	10.5	2.0
8	CON-12	VHGO	64741-49-7	10.8	9.5	3.2
9	CON-13	VHGO	64741-58-8	11.5	7.8	3.0
10	CON-14	VHGO	64741-77-1	8.7	9.7	2.7
11	CON-15	VHGO	64742-87-6	9.9	9.6	3.1
12	CON-16i	VHGO	68334-30-5	8.8	12.7	2.9
13	CON-16ii	VHGO	68334-30-5	7.9	10.6	2.8
14	CON-17	VHGO	68476-30-2	6.3	11.3	2.5
15	CON-18	VHGO	68476-31-3	10.2	8.5	3.2
16	CON-20	VHGO	92045-24-4	10.5	8.1	2.8
17	CON-26	RAE	64742-10-5	1.2	4.3	0.4
18	CON-27	RAE	91995-70-9	2.7	4.4	0.7
19	A083/13	HFO	68476-33-5	6.6	-	1.3
20	A087/13	HFOe	68476-33-5	3.6	-	0.8
21	A092/13	HFOe	68476-33-5	5.4	-	1.2
\.


--
-- Data for Name: columnheaders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY columnheaders (id, parent_id, columntype_id, code, name, notes, color, registereddt) FROM stdin;
\.


--
-- Name: columnheaders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('columnheaders_id_seq', 1, false);


--
-- Data for Name: columntypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY columntypes (id, parent_id, project_id, code, name, notes, registereddt) FROM stdin;
1	\N	1	WEIGHT	Weight	\N	2015-10-16 16:34:10.589
3	2	1	SOURCE	Source	\N	2015-10-16 16:34:10.589
4	1	1	GROUP	Group	\N	2015-10-16 16:34:10.589
2	4	1	TYPE	Type	\N	2015-10-16 16:34:10.589
6	5	2	SOURCE	Source	\N	2015-10-16 16:34:59.477
7	\N	2	WEIGHT	Weight	\N	2015-10-16 16:34:59.477
8	7	2	GROUP	Group	\N	2015-10-16 16:34:59.477
5	8	2	TYPE	Type	\N	2015-10-16 16:34:59.477
10	9	3	TYPE	Type	\N	2016-09-19 09:53:13.117
11	\N	3	WEIGHT	Weight	\N	2016-09-19 09:53:13.116
12	10	3	SOURCE	Source	\N	2016-09-19 09:53:13.117
9	11	3	GROUP	Group	\N	2016-09-19 09:53:13.117
13	\N	4	WEIGHT	Weight	\N	2016-09-19 10:01:35.929
14	13	4	GROUP	Group	\N	2016-09-19 10:01:35.929
16	14	4	TYPE	Type	\N	2016-09-19 10:01:35.929
15	16	4	SOURCE	Source	\N	2016-09-19 10:01:35.929
\.


--
-- Name: columntypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('columntypes_id_seq', 16, true);


--
-- Data for Name: columntypestempl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY columntypestempl (id, parent_id, code, name, projecttype_id) FROM stdin;
1	\N	WEIGHT	Weight	1
2	1	GROUP	Group	1
3	2	TYPE	Type	1
4	3	SOURCE	Source	1
5	\N	WEIGHT	Weight	2
6	1	GROUP	Group	2
7	2	TYPE	Type	2
8	3	SOURCE	Source	2
\.


--
-- Name: columntypestempl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('columntypestempl_id_seq', 8, true);


--
-- Data for Name: components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY components (id, columnheader_id, project_id, unit, updatedby, code, name, notes, color, updateddt) FROM stdin;
\.


--
-- Name: components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('components_id_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 4, true);


--
-- Data for Name: importinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY importinfo (id, user_id, transactiondate, notes, file, filename) FROM stdin;
\.


--
-- Name: importinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('importinfo_id_seq', 1, false);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notes (id, updatedby, code, note, owner_id, ownertype, visible, updateddt) FROM stdin;
\.


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notes_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (id, rowheader_id, order_id) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- Name: ordersequence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ordersequence_id_seq', 1, false);


--
-- Data for Name: projectmanagers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projectmanagers (project_id, user_id) FROM stdin;
2	1
\.


--
-- Data for Name: projectmembers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projectmembers (project_id, user_id) FROM stdin;
\.


--
-- Data for Name: projectreviewers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projectreviewers (project_id, user_id) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projects (project_id, projecttype, code, name, access, status, notes, starts, ends, registereddt, lastupdatedt, createdby, lastmodifiedby, version) FROM stdin;
1	1	ProjectCode	ProjectName	0	0	\N	\N	\N	2015-10-16 16:34:10.544	2015-10-16 16:34:10.544	1	1	1
2	1	qwre	qwr	0	0	<p>qwr</p>\r\n	\N	\N	2015-10-16 16:34:59.417	2015-10-16 16:34:59.417	1	1	1
3	1	1122	Sample_4	0	0	<p>Sample project</p>\r\n	\N	\N	2016-09-19 09:53:13.062	2016-09-19 09:57:48.118	2	2	1
4	1	11223	sample_new	0	0	<p>sa</p>\r\n	\N	\N	2016-09-19 10:01:35.843	2016-09-19 10:01:35.843	2	2	1
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('projects_id_seq', 4, true);


--
-- Data for Name: projecttypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY projecttypes (id, code, name, notes, registereddt, lastvisitdt) FROM stdin;
1	INVIVO	In Vivo	\N	2015-10-16 16:34:09.59	2015-10-16 16:34:09.59
2	INVITRO	In Vitro	\N	2015-10-16 16:34:09.678	2015-10-16 16:34:09.678
\.


--
-- Name: projecttypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('projecttypes_id_seq', 2, true);


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY results (id, component_id, project_id, updatedby, order_id, strresult, updateddt) FROM stdin;
\.


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('results_id_seq', 1, false);


--
-- Data for Name: resultshistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resultshistory (id, results, updatedby, oldstrresult, newstrresult, updateddt) FROM stdin;
\.


--
-- Name: resultshistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resultshistory_id_seq', 1, false);


--
-- Data for Name: rowheaders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rowheaders (id, rowtype_id, code, name, notes, color, registereddt) FROM stdin;
\.


--
-- Name: rowheaders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rowheaders_id_seq', 1, false);


--
-- Data for Name: rowtypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rowtypes (id, project_id, code, name, showorder, notes, registereddt) FROM stdin;
1	1	chemical_source_sid	Source	1	\N	2015-10-16 16:34:10.629
2	1	casrn	CASR Number	2	\N	2015-10-16 16:34:10.629
3	1	chemical_name	Chemical Name	3	\N	2015-10-16 16:34:10.629
4	2	chemical_source_sid	Source	1	\N	2015-10-16 16:34:59.531
5	2	casrn	CASR Number	2	\N	2015-10-16 16:34:59.531
6	2	chemical_name	Chemical Name	3	\N	2015-10-16 16:34:59.531
7	3	chemical_source_sid	Source	1	\N	2016-09-19 09:53:13.162
8	3	chemical_name	Chemical Name	3	\N	2016-09-19 09:53:13.162
9	3	casrn	CASR Number	2	\N	2016-09-19 09:53:13.162
10	4	chemical_source_sid	Source	1	\N	2016-09-19 10:01:36
11	4	casrn	CASR Number	2	\N	2016-09-19 10:01:36
12	4	chemical_name	Chemical Name	3	\N	2016-09-19 10:01:36
\.


--
-- Name: rowtypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rowtypes_id_seq', 12, true);


--
-- Data for Name: rowtypestempl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rowtypestempl (id, code, name, showorder, projecttype_id) FROM stdin;
1	chemical_source_sid	Source	1	1
2	casrn	CASR Number	2	1
3	chemical_name	Chemical Name	3	1
4	SOURCE	Source	1	2
5	CASRN	CASR Number	2	2
6	CHEMICAL	Chemical	3	2
\.


--
-- Name: rowtypestempl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rowtypestempl_id_seq', 6, true);


--
-- Data for Name: sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sequences (id) FROM stdin;
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY units (id, parent_id, updatedby, code, name, volumeof, updateddt, relatedunit) FROM stdin;
1	\N	1	DEFAULT	Default	\N	2015-10-16 16:34:09.829	\N
\.


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('units_id_seq', 1, true);


--
-- Data for Name: userroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY userroles (id, code, name, notes, registereddt, lastvisitdt) FROM stdin;
\.


--
-- Name: userroles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('userroles_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (user_id, login, password, role, firstname, lastname, email, phone, address1, address2, country, state, zip, city, sex, website, interests, birthday, organization, organaddress, photo, notes, registereddt, lastvisitdt, approved, admin) FROM stdin;
2	test-id-1	test-id-1	1	test-id-1	test-id-1				\N					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	test-id-2	test-id-2	1	test-id-2	test-id-2				\N					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	test-id-3	test-id-3	1	test-id-3	test-id-3	1234@yahoo.com	9798451234	Whare are you?		United States	TX	77843	College Station	F	\N	\N	2000-06-20 00:00:00	TAMU	Whare are you?	\N		2016-06-17 13:48:20.156	2016-06-17 13:48:20.156	\N	\N
1	admin	admin	0	admin	admin	admin@mail.box	+380000000000	Lviv	\N	Ukraine	Lviv	79000	Lviv	M	\N	\N	2015-10-16 16:34:09.374	\N	\N	\N	\N	2015-10-16 16:34:09.374	2015-10-16 16:34:09.374	\N	YES
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: columnheaders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columnheaders
    ADD CONSTRAINT columnheaders_pkey PRIMARY KEY (id);


--
-- Name: columntypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypes
    ADD CONSTRAINT columntypes_pkey PRIMARY KEY (id);


--
-- Name: columntypestempl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypestempl
    ADD CONSTRAINT columntypestempl_pkey PRIMARY KEY (id);


--
-- Name: components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);


--
-- Name: importinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY importinfo
    ADD CONSTRAINT importinfo_pkey PRIMARY KEY (id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: projectmanagers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmanagers
    ADD CONSTRAINT projectmanagers_pkey PRIMARY KEY (project_id, user_id);


--
-- Name: projectmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmembers
    ADD CONSTRAINT projectmembers_pkey PRIMARY KEY (project_id, user_id);


--
-- Name: projectreviewers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectreviewers
    ADD CONSTRAINT projectreviewers_pkey PRIMARY KEY (project_id, user_id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- Name: projecttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projecttypes
    ADD CONSTRAINT projecttypes_pkey PRIMARY KEY (id);


--
-- Name: results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: resultshistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resultshistory
    ADD CONSTRAINT resultshistory_pkey PRIMARY KEY (id);


--
-- Name: rowheaders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowheaders
    ADD CONSTRAINT rowheaders_pkey PRIMARY KEY (id);


--
-- Name: rowtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowtypes
    ADD CONSTRAINT rowtypes_pkey PRIMARY KEY (id);


--
-- Name: rowtypestempl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowtypestempl
    ADD CONSTRAINT rowtypestempl_pkey PRIMARY KEY (id);


--
-- Name: sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sequences
    ADD CONSTRAINT sequences_pkey PRIMARY KEY (id);


--
-- Name: uk_ow0gan20590jrb00upg3va2fn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_ow0gan20590jrb00upg3va2fn UNIQUE (login);


--
-- Name: units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: userroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userroles
    ADD CONSTRAINT userroles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: components_project_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_project_id_idx ON components USING btree (project_id);


--
-- Name: orders_order_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_id_idx ON orders USING btree (order_id);


--
-- Name: results_component_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX results_component_id_idx ON results USING btree (component_id);


--
-- Name: results_order_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX results_order_id_idx ON results USING btree (order_id);


--
-- Name: results_project_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX results_project_id_idx ON results USING btree (project_id);


--
-- Name: fk_1owxhulxwlfb0at3udknjqma7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY importinfo
    ADD CONSTRAINT fk_1owxhulxwlfb0at3udknjqma7 FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_2xfgt35dutxlhmsmwu4r8rlr3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT fk_2xfgt35dutxlhmsmwu4r8rlr3 FOREIGN KEY (parent_id) REFERENCES units(id);


--
-- Name: fk_4n7egbvwjiliyv2qychp30h30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT fk_4n7egbvwjiliyv2qychp30h30 FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: fk_578egghkkct6ade81pyv9cab8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowtypestempl
    ADD CONSTRAINT fk_578egghkkct6ade81pyv9cab8 FOREIGN KEY (projecttype_id) REFERENCES projecttypes(id);


--
-- Name: fk_5hfmn0e6qs1wxmyicum7axk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resultshistory
    ADD CONSTRAINT fk_5hfmn0e6qs1wxmyicum7axk0 FOREIGN KEY (results) REFERENCES results(id);


--
-- Name: fk_6b0me8cvhguaw471wopp7ep2q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypes
    ADD CONSTRAINT fk_6b0me8cvhguaw471wopp7ep2q FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_75lysuh98e6heah650cirwjm0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypestempl
    ADD CONSTRAINT fk_75lysuh98e6heah650cirwjm0 FOREIGN KEY (parent_id) REFERENCES columntypestempl(id);


--
-- Name: fk_7a51eicqw07bc07uieh4wwwiu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_7a51eicqw07bc07uieh4wwwiu FOREIGN KEY (createdby) REFERENCES users(user_id);


--
-- Name: fk_7sgjwupi8nmfqjwia47uy0su7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resultshistory
    ADD CONSTRAINT fk_7sgjwupi8nmfqjwia47uy0su7 FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: fk_9gk7ub0etop2uds2hq1p3sg05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columnheaders
    ADD CONSTRAINT fk_9gk7ub0etop2uds2hq1p3sg05 FOREIGN KEY (columntype_id) REFERENCES columntypes(id);


--
-- Name: fk_at6u7yapiqkonwaqfgls5jtke; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT fk_at6u7yapiqkonwaqfgls5jtke FOREIGN KEY (columnheader_id) REFERENCES columnheaders(id);


--
-- Name: fk_c80a31aic7l2gvbxlqkthjpy3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_c80a31aic7l2gvbxlqkthjpy3 FOREIGN KEY (projecttype) REFERENCES projecttypes(id);


--
-- Name: fk_cv3vi79np764sg6aiyh6gbjpr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_cv3vi79np764sg6aiyh6gbjpr FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_d9lxlw8mxbtnrktp6owy5l9n6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmembers
    ADD CONSTRAINT fk_d9lxlw8mxbtnrktp6owy5l9n6 FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_grqkv3c957mesajp8cceqbg3d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columnheaders
    ADD CONSTRAINT fk_grqkv3c957mesajp8cceqbg3d FOREIGN KEY (parent_id) REFERENCES columnheaders(id);


--
-- Name: fk_h5n3sxf6wbmcmldjbij337o33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmembers
    ADD CONSTRAINT fk_h5n3sxf6wbmcmldjbij337o33 FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_hks7nvoabgj2rtj4s8cu3xll1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectreviewers
    ADD CONSTRAINT fk_hks7nvoabgj2rtj4s8cu3xll1 FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_htrutpxms1q1w8yyx2kmwhsqj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmanagers
    ADD CONSTRAINT fk_htrutpxms1q1w8yyx2kmwhsqj FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: fk_hwjwciqry9hxp1sgdx14gn6l9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectmanagers
    ADD CONSTRAINT fk_hwjwciqry9hxp1sgdx14gn6l9 FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_i3gb9lxn5coali5g6b3eb7wxl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projectreviewers
    ADD CONSTRAINT fk_i3gb9lxn5coali5g6b3eb7wxl FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_i4ykp6qlkcf71o4nbwp64mnck; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowtypes
    ADD CONSTRAINT fk_i4ykp6qlkcf71o4nbwp64mnck FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_jd1anxcj6doiu85xtqxkt2qyh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT fk_jd1anxcj6doiu85xtqxkt2qyh FOREIGN KEY (unit) REFERENCES units(id);


--
-- Name: fk_kud02e2rv68l8dmcuq5yyddj0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_kud02e2rv68l8dmcuq5yyddj0 FOREIGN KEY (component_id) REFERENCES components(id);


--
-- Name: fk_n8jusxt6ky8xkstx4jq9yk14v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_n8jusxt6ky8xkstx4jq9yk14v FOREIGN KEY (rowheader_id) REFERENCES rowheaders(id);


--
-- Name: fk_o9c01auhxnset9trxy38yol51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT fk_o9c01auhxnset9trxy38yol51 FOREIGN KEY (lastmodifiedby) REFERENCES users(user_id);


--
-- Name: fk_p2x64i5pp8mq1lqwes12p8yfv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypes
    ADD CONSTRAINT fk_p2x64i5pp8mq1lqwes12p8yfv FOREIGN KEY (parent_id) REFERENCES columntypes(id);


--
-- Name: fk_q2nosuycg80g124cuj8vrthbf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rowheaders
    ADD CONSTRAINT fk_q2nosuycg80g124cuj8vrthbf FOREIGN KEY (rowtype_id) REFERENCES rowtypes(id);


--
-- Name: fk_qh329yxcm68is2byhok1kcx1h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT fk_qh329yxcm68is2byhok1kcx1h FOREIGN KEY (project_id) REFERENCES projects(project_id);


--
-- Name: fk_sasvst3tpxcnbsv74hsh2ymmn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT fk_sasvst3tpxcnbsv74hsh2ymmn FOREIGN KEY (relatedunit) REFERENCES units(id);


--
-- Name: fk_shwiuxoeyuy0sj4ab42953fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY columntypestempl
    ADD CONSTRAINT fk_shwiuxoeyuy0sj4ab42953fk3 FOREIGN KEY (projecttype_id) REFERENCES projecttypes(id);


--
-- Name: fk_sqj53vx8qowq3mj3e1bov7m5l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT fk_sqj53vx8qowq3mj3e1bov7m5l FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: fk_sv4u816rj7w6rc134b6yjj4dn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT fk_sv4u816rj7w6rc134b6yjj4dn FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: fk_tqkk4o8b9y1lob46a7ma1sllf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT fk_tqkk4o8b9y1lob46a7ma1sllf FOREIGN KEY (updatedby) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

