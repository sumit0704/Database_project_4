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
-- Name: toxpi; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE toxpi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE toxpi OWNER TO postgres;

\connect toxpi

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

--
-- Name: result_changes_history(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION result_changes_history() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF  TG_OP = 'INSERT' THEN
        INSERT INTO RESULTSHISTORY(RESULTS, OLDNUMRESULT, OLDSTRRESULT, OLDBOOLRESULT, NEWNUMRESULT, NEWSTRRESULT, NEWBOOLRESULT, UPDATEDBY)
        values (NEW.ID, null, null, null, NEW.NUMRESULT, NEW.STRRESULT, NEW.BOOLRESULT, 1);
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO RESULTSHISTORY(RESULTS, OLDNUMRESULT, OLDSTRRESULT, OLDBOOLRESULT, NEWNUMRESULT, NEWSTRRESULT, NEWBOOLRESULT, UPDATEDBY)
        values (NEW.ID, OLD.NUMRESULT, OLD.STRRESULT, OLD.BOOLRESULT, NEW.NUMRESULT, NEW.STRRESULT, NEW.BOOLRESULT, 1);
        RETURN NEW;
    ELSIF TG_OP = 'DELETE' THEN
        RETURN OLD;
    END IF;
END;
$$;


ALTER FUNCTION public.result_changes_history() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: casregistrynumbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE casregistrynumbers (
    id integer NOT NULL,
    code text NOT NULL,
    name text,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE casregistrynumbers OWNER TO postgres;

--
-- Name: casregistrynumbers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE casregistrynumbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE casregistrynumbers_id_seq OWNER TO postgres;

--
-- Name: casregistrynumbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE casregistrynumbers_id_seq OWNED BY casregistrynumbers.id;


--
-- Name: chemicals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chemicals (
    id integer NOT NULL,
    code text NOT NULL,
    name text,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE chemicals OWNER TO postgres;

--
-- Name: chemicals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE chemicals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chemicals_id_seq OWNER TO postgres;

--
-- Name: chemicals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE chemicals_id_seq OWNED BY chemicals.id;


--
-- Name: components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE components (
    id integer NOT NULL,
    code text NOT NULL,
    name text,
    type_id integer NOT NULL,
    compsource_id integer,
    unit integer NOT NULL,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
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
-- Name: components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE components_id_seq OWNED BY components.id;


--
-- Name: componentsources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE componentsources (
    id integer NOT NULL,
    code text NOT NULL,
    name text,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE componentsources OWNER TO postgres;

--
-- Name: componentsources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE componentsources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE componentsources_id_seq OWNER TO postgres;

--
-- Name: componentsources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE componentsources_id_seq OWNED BY componentsources.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE groups (
    id integer NOT NULL,
    code text NOT NULL,
    name text,
    weight_id integer NOT NULL,
    color integer,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


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
    id integer NOT NULL,
    user_id integer NOT NULL,
    transactiondate timestamp without time zone DEFAULT ('now'::text)::date NOT NULL,
    notes text NOT NULL,
    filename text NOT NULL
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
-- Name: importinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE importinfo_id_seq OWNED BY importinfo.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE notes (
    id integer NOT NULL,
    code text NOT NULL,
    note text,
    owner_id integer NOT NULL,
    ownertype character(1)[] NOT NULL,
    visible boolean DEFAULT true NOT NULL,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
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
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE notes_id_seq OWNED BY notes.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE orders (
    id integer NOT NULL,
    source_id integer NOT NULL,
    casr_id integer NOT NULL,
    chemical_id integer NOT NULL,
    import_id integer,
    ordnumber integer NOT NULL,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
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
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE results (
    id integer NOT NULL,
    order_id integer NOT NULL,
    component_id integer NOT NULL,
    numresult numeric,
    strresult text,
    boolresult boolean,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
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
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE results_id_seq OWNED BY results.id;


--
-- Name: resultshistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE resultshistory (
    id integer NOT NULL,
    results integer NOT NULL,
    oldnumresult numeric,
    oldstrresult text,
    oldboolresult boolean,
    newnumresult numeric,
    newstrresult text,
    newboolresult boolean,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
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
-- Name: resultshistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resultshistory_id_seq OWNED BY resultshistory.id;


--
-- Name: searchtemplates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE searchtemplates (
    id integer NOT NULL,
    user_id integer NOT NULL,
    code text NOT NULL,
    objectxml xml,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE searchtemplates OWNER TO postgres;

--
-- Name: searchtemplates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE searchtemplates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE searchtemplates_id_seq OWNER TO postgres;

--
-- Name: searchtemplates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE searchtemplates_id_seq OWNED BY searchtemplates.id;


--
-- Name: sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sources (
    id integer NOT NULL,
    code text NOT NULL,
    name text,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE sources OWNER TO postgres;

--
-- Name: sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sources_id_seq OWNER TO postgres;

--
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sources_id_seq OWNED BY sources.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE types (
    id integer NOT NULL,
    code text NOT NULL,
    name text,
    group_id integer NOT NULL,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE types OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE types_id_seq OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE types_id_seq OWNED BY types.id;


--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE units (
    id integer NOT NULL,
    code text NOT NULL,
    name text,
    relatedunit integer,
    volume numeric,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
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
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE units_id_seq OWNED BY units.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    email text NOT NULL,
    registereddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL,
    lastvisitdt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
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
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: viewtemplates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE viewtemplates (
    id integer NOT NULL,
    user_id integer NOT NULL,
    code text NOT NULL,
    objectxml xml,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE viewtemplates OWNER TO postgres;

--
-- Name: viewtemplates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE viewtemplates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE viewtemplates_id_seq OWNER TO postgres;

--
-- Name: viewtemplates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE viewtemplates_id_seq OWNED BY viewtemplates.id;


--
-- Name: weights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE weights (
    id integer NOT NULL,
    code text NOT NULL,
    name text,
    weight integer NOT NULL,
    updatedby integer NOT NULL,
    updateddt timestamp without time zone DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE weights OWNER TO postgres;

--
-- Name: weights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE weights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE weights_id_seq OWNER TO postgres;

--
-- Name: weights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE weights_id_seq OWNED BY weights.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casregistrynumbers ALTER COLUMN id SET DEFAULT nextval('casregistrynumbers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chemicals ALTER COLUMN id SET DEFAULT nextval('chemicals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components ALTER COLUMN id SET DEFAULT nextval('components_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY componentsources ALTER COLUMN id SET DEFAULT nextval('componentsources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY importinfo ALTER COLUMN id SET DEFAULT nextval('importinfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes ALTER COLUMN id SET DEFAULT nextval('notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results ALTER COLUMN id SET DEFAULT nextval('results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resultshistory ALTER COLUMN id SET DEFAULT nextval('resultshistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY searchtemplates ALTER COLUMN id SET DEFAULT nextval('searchtemplates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sources ALTER COLUMN id SET DEFAULT nextval('sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY types ALTER COLUMN id SET DEFAULT nextval('types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units ALTER COLUMN id SET DEFAULT nextval('units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viewtemplates ALTER COLUMN id SET DEFAULT nextval('viewtemplates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY weights ALTER COLUMN id SET DEFAULT nextval('weights_id_seq'::regclass);


--
-- Data for Name: casregistrynumbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY casregistrynumbers (id, code, name, updatedby, updateddt) FROM stdin;
1725	*50594-66-6	\N	1	2015-09-01 15:08:51.275
1726	*15972-60-8	\N	1	2015-09-01 15:08:51.43
1727	*116-06-3	\N	1	2015-09-01 15:08:51.575
1728	*834-12-8	\N	1	2015-09-01 15:08:51.688
1729	*33089-61-1	\N	1	2015-09-01 15:08:51.78
1730	*101-05-3	\N	1	2015-09-01 15:08:51.884
1731	*3337-71-1	\N	1	2015-09-01 15:08:51.981
1732	*1912-24-9	\N	1	2015-09-01 15:08:52.081
1733	*35575-96-3	\N	1	2015-09-01 15:08:52.187
1734	*86-50-0	\N	1	2015-09-01 15:08:52.283
1735	*131860-33-8	\N	1	2015-09-01 15:08:52.441
1736	*22781-23-3	\N	1	2015-09-01 15:08:52.619
1737	*1861-40-1	\N	1	2015-09-01 15:08:52.797
1738	*17804-35-2	\N	1	2015-09-01 15:08:52.988
1739	*83055-99-6	\N	1	2015-09-01 15:08:53.097
1740	*741-58-2	\N	1	2015-09-01 15:08:53.204
1741	*25057-89-0	\N	1	2015-09-01 15:08:53.318
1742	*149877-41-8	\N	1	2015-09-01 15:08:53.441
1743	*82657-04-3	\N	1	2015-09-01 15:08:53.563
1744	*80-05-7	\N	1	2015-09-01 15:08:53.674
1745	*10043-35-3	\N	1	2015-09-01 15:08:53.793
1746	*188425-85-6	\N	1	2015-09-01 15:08:53.922
1747	*314-40-9	\N	1	2015-09-01 15:08:54.06
1748	*1689-84-5	\N	1	2015-09-01 15:08:54.193
1749	*69327-76-0	\N	1	2015-09-01 15:08:54.324
1750	*23184-66-9	\N	1	2015-09-01 15:08:54.463
1751	*134605-64-4	\N	1	2015-09-01 15:08:54.596
1752	*33629-47-9	\N	1	2015-09-01 15:08:54.727
1753	*2008-41-5	\N	1	2015-09-01 15:08:54.866
1754	*75-60-5	\N	1	2015-09-01 15:08:55.051
1755	*133-06-2	\N	1	2015-09-01 15:08:55.283
1756	*63-25-2	\N	1	2015-09-01 15:08:55.515
1757	*5234-68-4	\N	1	2015-09-01 15:08:55.651
1758	*128639-02-1	\N	1	2015-09-01 15:08:55.789
1759	*54593-83-8	\N	1	2015-09-01 15:08:55.928
1760	*1698-60-8	\N	1	2015-09-01 15:08:56.074
1761	*2675-77-6	\N	1	2015-09-01 15:08:56.227
1762	*1897-45-6	\N	1	2015-09-01 15:08:56.389
1763	*101-21-3	\N	1	2015-09-01 15:08:56.551
1764	*5598-15-2	\N	1	2015-09-01 15:08:56.709
1765	*5598-13-0	\N	1	2015-09-01 15:08:56.862
1766	*64902-72-3	\N	1	2015-09-01 15:08:57.021
1767	*87818-31-3	\N	1	2015-09-01 15:08:57.178
1768	*2425-06-1	\N	1	2015-09-01 15:08:57.343
1769	*105512-06-9	\N	1	2015-09-01 15:08:57.517
1770	*74115-24-5	\N	1	2015-09-01 15:08:57.704
1771	*81777-89-1	\N	1	2015-09-01 15:08:58.001
\.


--
-- Name: casregistrynumbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('casregistrynumbers_id_seq', 1771, true);


--
-- Data for Name: chemicals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY chemicals (id, code, name, updatedby, updateddt) FROM stdin;
1722	Acifluorfen	\N	1	2015-09-01 15:08:51.276
1723	Alachlor	\N	1	2015-09-01 15:08:51.43
1724	Aldicarb	\N	1	2015-09-01 15:08:51.576
1725	Ametryn	\N	1	2015-09-01 15:08:51.689
1726	Amitraz	\N	1	2015-09-01 15:08:51.781
1727	Anilazine	\N	1	2015-09-01 15:08:51.885
1728	Asulam	\N	1	2015-09-01 15:08:51.982
1729	Atrazine	\N	1	2015-09-01 15:08:52.082
1730	Azamethiphos	\N	1	2015-09-01 15:08:52.188
1731	Azinphos-methyl	\N	1	2015-09-01 15:08:52.284
1732	Azoxystrobin	\N	1	2015-09-01 15:08:52.443
1733	Bendiocarb	\N	1	2015-09-01 15:08:52.621
1734	Benfluralin	\N	1	2015-09-01 15:08:52.799
1735	Benomyl	\N	1	2015-09-01 15:08:52.989
1736	Bensulfuron-methyl	\N	1	2015-09-01 15:08:53.098
1737	Bensulide	\N	1	2015-09-01 15:08:53.204
1738	Bentazone	\N	1	2015-09-01 15:08:53.319
1739	Bifenazate	\N	1	2015-09-01 15:08:53.442
1740	Bifenthrin	\N	1	2015-09-01 15:08:53.564
1741	Bisphenol A	\N	1	2015-09-01 15:08:53.675
1742	Boric acid	\N	1	2015-09-01 15:08:53.794
1743	Boscalid	\N	1	2015-09-01 15:08:53.923
1744	Bromacil	\N	1	2015-09-01 15:08:54.061
1745	Bromoxynil	\N	1	2015-09-01 15:08:54.194
1746	Buprofezin	\N	1	2015-09-01 15:08:54.325
1747	Butachlor	\N	1	2015-09-01 15:08:54.464
1748	Butafenacil	\N	1	2015-09-01 15:08:54.597
1749	Butralin	\N	1	2015-09-01 15:08:54.729
1750	Butylate	\N	1	2015-09-01 15:08:54.867
1751	Cacodylic acid	\N	1	2015-09-01 15:08:55.052
1752	Captan	\N	1	2015-09-01 15:08:55.285
1753	Carbaryl	\N	1	2015-09-01 15:08:55.516
1754	Carboxin	\N	1	2015-09-01 15:08:55.652
1755	Carfentrazone-ethyl	\N	1	2015-09-01 15:08:55.79
1756	Chlorethoxyfos	\N	1	2015-09-01 15:08:55.93
1757	Chloridazon	\N	1	2015-09-01 15:08:56.076
1758	Chloroneb	\N	1	2015-09-01 15:08:56.229
1759	Chlorothalonil	\N	1	2015-09-01 15:08:56.391
1760	Chlorpropham	\N	1	2015-09-01 15:08:56.553
1761	Chlorpyrifos oxon	\N	1	2015-09-01 15:08:56.71
1762	Chlorpyrifos-methyl	\N	1	2015-09-01 15:08:56.863
1763	Chlorsulfuron	\N	1	2015-09-01 15:08:57.022
1764	Cinmethylin	\N	1	2015-09-01 15:08:57.18
1765	Captafol	\N	1	2015-09-01 15:08:57.344
1766	Clodinafop-propargyl	\N	1	2015-09-01 15:08:57.519
1767	Clofentezine	\N	1	2015-09-01 15:08:57.707
1768	Clomazone	\N	1	2015-09-01 15:08:58.005
\.


--
-- Name: chemicals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('chemicals_id_seq', 1768, true);


--
-- Data for Name: components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY components (id, code, name, type_id, compsource_id, unit, updatedby, updateddt) FROM stdin;
1022	ACEA_IC50	\N	377	34	1	1	2015-09-01 15:08:51.303
1023	logPow_QP	\N	378	35	1	1	2015-09-01 15:08:51.323
1024	MW_QP	\N	378	35	1	1	2015-09-01 15:08:51.328
1025	PS_KEGG_Androgen_and_estrogen_metabolism	\N	379	36	1	1	2015-09-01 15:08:51.335
1026	PS_KEGG_Biosynthesis_of_steroids	\N	379	36	1	1	2015-09-01 15:08:51.339
1027	PS_GO_Function_steroid_binding	\N	379	37	1	1	2015-09-01 15:08:51.345
1028	PS_GO_Function_steroid_hormone_receptor_activity	\N	379	37	1	1	2015-09-01 15:08:51.348
1029	NCGC_AR_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.356
1030	NCGC_AR_Antagonist	\N	380	38	1	1	2015-09-01 15:08:51.359
1031	NCGC_ERalpha_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.363
1032	NCGC_ERalpha_Antagonist	\N	380	38	1	1	2015-09-01 15:08:51.366
1033	NCGC_FXR_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.37
1034	NCGC_GR_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.374
1035	NCGC_HEK293_Viability	\N	380	38	1	1	2015-09-01 15:08:51.378
1036	NCGC_LXR_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.382
1037	NCGC_p53	\N	380	38	1	1	2015-09-01 15:08:51.386
1038	NCGC_PPARa_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.393
1039	NCGC_PPARd_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.399
1040	NCGC_PPARg_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.406
1041	NCGC_PXR_Agonist_human	\N	380	38	1	1	2015-09-01 15:08:51.409
1042	NCGC_PXR_Agonist_rat	\N	380	38	1	1	2015-09-01 15:08:51.413
1043	NCGC_RXRa_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.416
1044	NCGC_TRbeta_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.42
1045	NCGC_TRbeta_Antagonist	\N	380	38	1	1	2015-09-01 15:08:51.423
1046	NCGC_VDR_Agonist	\N	380	38	1	1	2015-09-01 15:08:51.427
\.


--
-- Name: components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('components_id_seq', 1046, true);


--
-- Data for Name: componentsources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY componentsources (id, code, name, updatedby, updateddt) FROM stdin;
34	ACEA	\N	1	2015-09-01 15:08:51.295
35	QikProp	\N	1	2015-09-01 15:08:51.321
36	PS_KEGG_0	\N	1	2015-09-01 15:08:51.334
37	PS_GO	\N	1	2015-09-01 15:08:51.343
38	NCGC	\N	1	2015-09-01 15:08:51.354
\.


--
-- Name: componentsources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('componentsources_id_seq', 38, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (id, code, name, weight_id, color, updatedby, updateddt) FROM stdin;
23	Cell electronic sensing	\N	14	255	1	2015-09-01 15:08:51.292
24	LogPow and MW	\N	14	255	1	2015-09-01 15:08:51.314
25	Steroid Metabolism	\N	14	255	1	2015-09-01 15:08:51.331
26	Nuclear Receptor assays	\N	14	255	1	2015-09-01 15:08:51.351
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 26, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 1, true);


--
-- Data for Name: importinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY importinfo (id, user_id, transactiondate, notes, filename) FROM stdin;
22	1	2015-09-01 15:08:51.287	Note	EXAMPLE_data_4-slices_small.csv
\.


--
-- Name: importinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('importinfo_id_seq', 22, true);


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notes (id, code, note, owner_id, ownertype, visible, updatedby, updateddt) FROM stdin;
\.


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notes_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (id, source_id, casr_id, chemical_id, import_id, ordnumber, updatedby, updateddt) FROM stdin;
902	1736	1725	1722	22	0	1	2015-09-01 15:08:51.28
903	1737	1726	1723	22	0	1	2015-09-01 15:08:51.433
904	1738	1727	1724	22	0	1	2015-09-01 15:08:51.579
905	1739	1728	1725	22	0	1	2015-09-01 15:08:51.691
906	1740	1729	1726	22	0	1	2015-09-01 15:08:51.784
907	1741	1730	1727	22	0	1	2015-09-01 15:08:51.887
908	1742	1731	1728	22	0	1	2015-09-01 15:08:51.985
909	1743	1732	1729	22	0	1	2015-09-01 15:08:52.085
910	1744	1733	1730	22	0	1	2015-09-01 15:08:52.19
911	1745	1734	1731	22	0	1	2015-09-01 15:08:52.287
912	1746	1735	1732	22	0	1	2015-09-01 15:08:52.446
913	1747	1736	1733	22	0	1	2015-09-01 15:08:52.623
914	1748	1737	1734	22	0	1	2015-09-01 15:08:52.802
915	1749	1738	1735	22	0	1	2015-09-01 15:08:52.992
916	1750	1739	1736	22	0	1	2015-09-01 15:08:53.1
917	1751	1740	1737	22	0	1	2015-09-01 15:08:53.207
918	1752	1741	1738	22	0	1	2015-09-01 15:08:53.321
919	1753	1742	1739	22	0	1	2015-09-01 15:08:53.444
920	1754	1743	1740	22	0	1	2015-09-01 15:08:53.566
921	1755	1744	1741	22	0	1	2015-09-01 15:08:53.677
922	1756	1745	1742	22	0	1	2015-09-01 15:08:53.796
923	1757	1746	1743	22	0	1	2015-09-01 15:08:53.925
924	1758	1747	1744	22	0	1	2015-09-01 15:08:54.064
925	1759	1748	1745	22	0	1	2015-09-01 15:08:54.196
926	1760	1749	1746	22	0	1	2015-09-01 15:08:54.327
927	1761	1750	1747	22	0	1	2015-09-01 15:08:54.466
928	1762	1751	1748	22	0	1	2015-09-01 15:08:54.599
929	1763	1752	1749	22	0	1	2015-09-01 15:08:54.732
930	1764	1753	1750	22	0	1	2015-09-01 15:08:54.87
931	1765	1754	1751	22	0	1	2015-09-01 15:08:55.055
932	1766	1755	1752	22	0	1	2015-09-01 15:08:55.29
933	1767	1756	1753	22	0	1	2015-09-01 15:08:55.518
934	1768	1757	1754	22	0	1	2015-09-01 15:08:55.655
935	1769	1758	1755	22	0	1	2015-09-01 15:08:55.792
936	1770	1759	1756	22	0	1	2015-09-01 15:08:55.932
937	1771	1760	1757	22	0	1	2015-09-01 15:08:56.078
938	1772	1761	1758	22	0	1	2015-09-01 15:08:56.232
939	1773	1762	1759	22	0	1	2015-09-01 15:08:56.394
940	1774	1763	1760	22	0	1	2015-09-01 15:08:56.556
941	1775	1764	1761	22	0	1	2015-09-01 15:08:56.713
942	1776	1765	1762	22	0	1	2015-09-01 15:08:56.866
943	1777	1766	1763	22	0	1	2015-09-01 15:08:57.025
944	1778	1767	1764	22	0	1	2015-09-01 15:08:57.183
945	1779	1768	1765	22	0	1	2015-09-01 15:08:57.347
946	1780	1769	1766	22	0	1	2015-09-01 15:08:57.522
947	1781	1770	1767	22	0	1	2015-09-01 15:08:57.71
948	1782	1771	1768	22	0	1	2015-09-01 15:08:58.009
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orders_id_seq', 948, true);


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY results (id, order_id, component_id, numresult, strresult, boolresult, updatedby, updateddt) FROM stdin;
122661	902	1022	\N	1000000.0	\N	1	2015-09-01 15:08:51.31
122662	902	1023	\N	3.73	\N	1	2015-09-01 15:08:51.325
122663	902	1024	\N	361.661	\N	1	2015-09-01 15:08:51.33
122664	902	1025	\N	1000000.0	\N	1	2015-09-01 15:08:51.337
122665	902	1026	\N	1000000.0	\N	1	2015-09-01 15:08:51.341
122666	902	1027	\N	1000000.0	\N	1	2015-09-01 15:08:51.347
122667	902	1028	\N	560801.0973	\N	1	2015-09-01 15:08:51.35
122668	902	1029	\N	1000000.0	\N	1	2015-09-01 15:08:51.357
122669	902	1030	\N	1000000.0	\N	1	2015-09-01 15:08:51.361
122670	902	1031	\N	1000000.0	\N	1	2015-09-01 15:08:51.365
122671	902	1032	\N	1000000.0	\N	1	2015-09-01 15:08:51.368
122672	902	1033	\N	1000000.0	\N	1	2015-09-01 15:08:51.372
122673	902	1034	\N	1000000.0	\N	1	2015-09-01 15:08:51.376
122674	902	1035	\N	1000000.0	\N	1	2015-09-01 15:08:51.38
122675	902	1036	\N	1000000.0	\N	1	2015-09-01 15:08:51.383
122676	902	1037	\N	1000000.0	\N	1	2015-09-01 15:08:51.389
122677	902	1038	\N	1000000.0	\N	1	2015-09-01 15:08:51.397
122678	902	1039	\N	1000000.0	\N	1	2015-09-01 15:08:51.403
122679	902	1040	\N	1000000.0	\N	1	2015-09-01 15:08:51.407
122680	902	1041	\N	1000000.0	\N	1	2015-09-01 15:08:51.411
122681	902	1042	\N	1000000.0	\N	1	2015-09-01 15:08:51.414
122682	902	1043	\N	1000000.0	\N	1	2015-09-01 15:08:51.418
122683	902	1044	\N	1000000.0	\N	1	2015-09-01 15:08:51.422
122684	902	1045	\N	1000000.0	\N	1	2015-09-01 15:08:51.425
122685	902	1046	\N	1000000.0	\N	1	2015-09-01 15:08:51.428
122686	903	1022	\N	64.30000001	\N	1	2015-09-01 15:08:51.44
122687	903	1023	\N	3.154	\N	1	2015-09-01 15:08:51.445
122688	903	1024	\N	269.77	\N	1	2015-09-01 15:08:51.448
122689	903	1025	\N	184516.032	\N	1	2015-09-01 15:08:51.452
122690	903	1026	\N	7.0	\N	1	2015-09-01 15:08:51.458
122691	903	1027	\N	599535.8053	\N	1	2015-09-01 15:08:51.461
122692	903	1028	\N	276858.8667	\N	1	2015-09-01 15:08:51.468
122693	903	1029	\N	1000000.0	\N	1	2015-09-01 15:08:51.473
122694	903	1030	\N	36.0	\N	1	2015-09-01 15:08:51.476
122695	903	1031	\N	1000000.0	\N	1	2015-09-01 15:08:51.48
122696	903	1032	\N	1000000.0	\N	1	2015-09-01 15:08:51.484
122697	903	1033	\N	1000000.0	\N	1	2015-09-01 15:08:51.489
122698	903	1034	\N	1000000.0	\N	1	2015-09-01 15:08:51.493
122699	903	1035	\N	1000000.0	\N	1	2015-09-01 15:08:51.498
122700	903	1036	\N	1000000.0	\N	1	2015-09-01 15:08:51.501
122701	903	1037	\N	1000000.0	\N	1	2015-09-01 15:08:51.505
122702	903	1038	\N	1000000.0	\N	1	2015-09-01 15:08:51.508
122703	903	1039	\N	1000000.0	\N	1	2015-09-01 15:08:51.511
122704	903	1040	\N	1000000.0	\N	1	2015-09-01 15:08:51.515
122705	903	1041	\N	15.35	\N	1	2015-09-01 15:08:51.519
122706	903	1042	\N	1000000.0	\N	1	2015-09-01 15:08:51.523
122707	903	1043	\N	1000000.0	\N	1	2015-09-01 15:08:51.528
122708	903	1044	\N	1000000.0	\N	1	2015-09-01 15:08:51.563
122709	903	1045	\N	1000000.0	\N	1	2015-09-01 15:08:51.568
122710	903	1046	\N	1000000.0	\N	1	2015-09-01 15:08:51.573
122711	904	1022	\N	1000000.0	\N	1	2015-09-01 15:08:51.589
122712	904	1023	\N	1.032	\N	1	2015-09-01 15:08:51.594
122713	904	1024	\N	190.26	\N	1	2015-09-01 15:08:51.599
122714	904	1025	\N	1000000.0	\N	1	2015-09-01 15:08:51.605
122715	904	1026	\N	1000000.0	\N	1	2015-09-01 15:08:51.609
122716	904	1027	\N	1000000.0	\N	1	2015-09-01 15:08:51.612
122717	904	1028	\N	1000000.0	\N	1	2015-09-01 15:08:51.616
122718	904	1029	\N	1000000.0	\N	1	2015-09-01 15:08:51.623
122719	904	1030	\N	1000000.0	\N	1	2015-09-01 15:08:51.628
122720	904	1031	\N	1000000.0	\N	1	2015-09-01 15:08:51.632
122721	904	1032	\N	1000000.0	\N	1	2015-09-01 15:08:51.637
122722	904	1033	\N	1000000.0	\N	1	2015-09-01 15:08:51.64
122723	904	1034	\N	1000000.0	\N	1	2015-09-01 15:08:51.644
122724	904	1035	\N	1000000.0	\N	1	2015-09-01 15:08:51.649
122725	904	1036	\N	1000000.0	\N	1	2015-09-01 15:08:51.652
122726	904	1037	\N	1000000.0	\N	1	2015-09-01 15:08:51.655
122727	904	1038	\N	1000000.0	\N	1	2015-09-01 15:08:51.659
122728	904	1039	\N	1000000.0	\N	1	2015-09-01 15:08:51.662
122729	904	1040	\N	1000000.0	\N	1	2015-09-01 15:08:51.665
122730	904	1041	\N	1000000.0	\N	1	2015-09-01 15:08:51.668
122731	904	1042	\N	1000000.0	\N	1	2015-09-01 15:08:51.671
122732	904	1043	\N	1000000.0	\N	1	2015-09-01 15:08:51.674
122733	904	1044	\N	1000000.0	\N	1	2015-09-01 15:08:51.679
122734	904	1045	\N	1000000.0	\N	1	2015-09-01 15:08:51.683
122735	904	1046	\N	1000000.0	\N	1	2015-09-01 15:08:51.686
122736	905	1022	\N	1000000.0	\N	1	2015-09-01 15:08:51.696
122737	905	1023	\N	3.401	\N	1	2015-09-01 15:08:51.7
122738	905	1024	\N	227.327	\N	1	2015-09-01 15:08:51.703
122739	905	1025	\N	16586.61894	\N	1	2015-09-01 15:08:51.708
122740	905	1026	\N	35.0	\N	1	2015-09-01 15:08:51.711
122741	905	1027	\N	1000000.0	\N	1	2015-09-01 15:08:51.714
122742	905	1028	\N	568055.059	\N	1	2015-09-01 15:08:51.717
122743	905	1029	\N	1000000.0	\N	1	2015-09-01 15:08:51.721
122744	905	1030	\N	1000000.0	\N	1	2015-09-01 15:08:51.725
122745	905	1031	\N	1000000.0	\N	1	2015-09-01 15:08:51.728
122746	905	1032	\N	1000000.0	\N	1	2015-09-01 15:08:51.732
122747	905	1033	\N	1000000.0	\N	1	2015-09-01 15:08:51.734
122748	905	1034	\N	1000000.0	\N	1	2015-09-01 15:08:51.738
122749	905	1035	\N	1000000.0	\N	1	2015-09-01 15:08:51.742
122750	905	1036	\N	1000000.0	\N	1	2015-09-01 15:08:51.745
122751	905	1037	\N	1000000.0	\N	1	2015-09-01 15:08:51.748
122752	905	1038	\N	1000000.0	\N	1	2015-09-01 15:08:51.751
122753	905	1039	\N	1000000.0	\N	1	2015-09-01 15:08:51.755
122754	905	1040	\N	1000000.0	\N	1	2015-09-01 15:08:51.758
122755	905	1041	\N	1000000.0	\N	1	2015-09-01 15:08:51.761
122756	905	1042	\N	1000000.0	\N	1	2015-09-01 15:08:51.764
122757	905	1043	\N	1000000.0	\N	1	2015-09-01 15:08:51.768
122758	905	1044	\N	1000000.0	\N	1	2015-09-01 15:08:51.772
122759	905	1045	\N	1000000.0	\N	1	2015-09-01 15:08:51.775
122761	906	1022	\N	29.39999997	\N	1	2015-09-01 15:08:51.789
122762	906	1023	\N	5.497	\N	1	2015-09-01 15:08:51.794
122763	906	1024	\N	293.411	\N	1	2015-09-01 15:08:51.797
122764	906	1025	\N	1000000.0	\N	1	2015-09-01 15:08:51.803
122765	906	1026	\N	1000000.0	\N	1	2015-09-01 15:08:51.807
122766	906	1027	\N	1000000.0	\N	1	2015-09-01 15:08:51.81
122767	906	1028	\N	1000000.0	\N	1	2015-09-01 15:08:51.814
122768	906	1029	\N	1000000.0	\N	1	2015-09-01 15:08:51.819
122769	906	1030	\N	1000000.0	\N	1	2015-09-01 15:08:51.822
122770	906	1031	\N	1000000.0	\N	1	2015-09-01 15:08:51.825
122771	906	1032	\N	1000000.0	\N	1	2015-09-01 15:08:51.828
122772	906	1033	\N	1000000.0	\N	1	2015-09-01 15:08:51.831
122773	906	1034	\N	1000000.0	\N	1	2015-09-01 15:08:51.834
122774	906	1035	\N	1000000.0	\N	1	2015-09-01 15:08:51.838
122775	906	1036	\N	1000000.0	\N	1	2015-09-01 15:08:51.841
122776	906	1037	\N	1000000.0	\N	1	2015-09-01 15:08:51.844
122777	906	1038	\N	1000000.0	\N	1	2015-09-01 15:08:51.846
122778	906	1039	\N	1000000.0	\N	1	2015-09-01 15:08:51.849
122779	906	1040	\N	1000000.0	\N	1	2015-09-01 15:08:51.852
122780	906	1041	\N	1000000.0	\N	1	2015-09-01 15:08:51.855
122781	906	1042	\N	1000000.0	\N	1	2015-09-01 15:08:51.859
122782	906	1043	\N	1000000.0	\N	1	2015-09-01 15:08:51.868
122783	906	1044	\N	1000000.0	\N	1	2015-09-01 15:08:51.876
122784	906	1045	\N	1000000.0	\N	1	2015-09-01 15:08:51.88
122786	907	1022	\N	1000000.0	\N	1	2015-09-01 15:08:51.893
122787	907	1023	\N	3.101	\N	1	2015-09-01 15:08:51.897
122788	907	1024	\N	275.524	\N	1	2015-09-01 15:08:51.901
122789	907	1025	\N	1000000.0	\N	1	2015-09-01 15:08:51.905
122790	907	1026	\N	51.0	\N	1	2015-09-01 15:08:51.909
122791	907	1027	\N	1000000.0	\N	1	2015-09-01 15:08:51.912
122792	907	1028	\N	682450.1572	\N	1	2015-09-01 15:08:51.915
122793	907	1029	\N	1000000.0	\N	1	2015-09-01 15:08:51.92
122794	907	1030	\N	1000000.0	\N	1	2015-09-01 15:08:51.924
122795	907	1031	\N	1000000.0	\N	1	2015-09-01 15:08:51.927
122796	907	1032	\N	1000000.0	\N	1	2015-09-01 15:08:51.93
122797	907	1033	\N	1000000.0	\N	1	2015-09-01 15:08:51.933
122798	907	1034	\N	1000000.0	\N	1	2015-09-01 15:08:51.937
122799	907	1035	\N	1000000.0	\N	1	2015-09-01 15:08:51.94
122800	907	1036	\N	1000000.0	\N	1	2015-09-01 15:08:51.944
122801	907	1037	\N	1000000.0	\N	1	2015-09-01 15:08:51.947
122802	907	1038	\N	1000000.0	\N	1	2015-09-01 15:08:51.951
122803	907	1039	\N	1000000.0	\N	1	2015-09-01 15:08:51.955
122804	907	1040	\N	1000000.0	\N	1	2015-09-01 15:08:51.958
122805	907	1041	\N	1000000.0	\N	1	2015-09-01 15:08:51.961
122806	907	1042	\N	1000000.0	\N	1	2015-09-01 15:08:51.965
122807	907	1043	\N	1000000.0	\N	1	2015-09-01 15:08:51.968
122808	907	1044	\N	1000000.0	\N	1	2015-09-01 15:08:51.972
122809	907	1045	\N	1000000.0	\N	1	2015-09-01 15:08:51.976
122810	907	1046	\N	1000000.0	\N	1	2015-09-01 15:08:51.979
122811	908	1022	\N	1000000.0	\N	1	2015-09-01 15:08:51.991
122812	908	1023	\N	-0.071	\N	1	2015-09-01 15:08:51.995
122813	908	1024	\N	230.238	\N	1	2015-09-01 15:08:51.999
122814	908	1025	\N	36845.62222	\N	1	2015-09-01 15:08:52.003
122815	908	1026	\N	1000000.0	\N	1	2015-09-01 15:08:52.007
122816	908	1027	\N	1000000.0	\N	1	2015-09-01 15:08:52.01
122817	908	1028	\N	822842.6156	\N	1	2015-09-01 15:08:52.014
122818	908	1029	\N	1000000.0	\N	1	2015-09-01 15:08:52.019
122819	908	1030	\N	1000000.0	\N	1	2015-09-01 15:08:52.022
122820	908	1031	\N	1000000.0	\N	1	2015-09-01 15:08:52.026
122821	908	1032	\N	1000000.0	\N	1	2015-09-01 15:08:52.029
122822	908	1033	\N	1000000.0	\N	1	2015-09-01 15:08:52.032
122823	908	1034	\N	1000000.0	\N	1	2015-09-01 15:08:52.035
122824	908	1035	\N	1000000.0	\N	1	2015-09-01 15:08:52.039
122825	908	1036	\N	1000000.0	\N	1	2015-09-01 15:08:52.043
122826	908	1037	\N	1000000.0	\N	1	2015-09-01 15:08:52.047
122827	908	1038	\N	1000000.0	\N	1	2015-09-01 15:08:52.05
122828	908	1039	\N	1000000.0	\N	1	2015-09-01 15:08:52.054
122829	908	1040	\N	1000000.0	\N	1	2015-09-01 15:08:52.058
122830	908	1041	\N	1000000.0	\N	1	2015-09-01 15:08:52.061
122831	908	1042	\N	1000000.0	\N	1	2015-09-01 15:08:52.065
122832	908	1043	\N	1000000.0	\N	1	2015-09-01 15:08:52.068
122833	908	1044	\N	1000000.0	\N	1	2015-09-01 15:08:52.072
122834	908	1045	\N	1000000.0	\N	1	2015-09-01 15:08:52.076
122835	908	1046	\N	1000000.0	\N	1	2015-09-01 15:08:52.079
122836	909	1022	\N	1000000.0	\N	1	2015-09-01 15:08:52.091
122837	909	1023	\N	2.609	\N	1	2015-09-01 15:08:52.096
122838	909	1024	\N	215.685	\N	1	2015-09-01 15:08:52.1
122839	909	1025	\N	192525.1417	\N	1	2015-09-01 15:08:52.105
122840	909	1026	\N	1000000.0	\N	1	2015-09-01 15:08:52.109
122841	909	1027	\N	1000000.0	\N	1	2015-09-01 15:08:52.113
122842	909	1028	\N	827989.364	\N	1	2015-09-01 15:08:52.116
122843	909	1029	\N	1000000.0	\N	1	2015-09-01 15:08:52.122
122844	909	1030	\N	1000000.0	\N	1	2015-09-01 15:08:52.125
122845	909	1031	\N	1000000.0	\N	1	2015-09-01 15:08:52.129
122846	909	1032	\N	1000000.0	\N	1	2015-09-01 15:08:52.132
122847	909	1033	\N	1000000.0	\N	1	2015-09-01 15:08:52.136
122848	909	1034	\N	1000000.0	\N	1	2015-09-01 15:08:52.14
122849	909	1035	\N	1000000.0	\N	1	2015-09-01 15:08:52.143
122850	909	1036	\N	1000000.0	\N	1	2015-09-01 15:08:52.147
122851	909	1037	\N	1000000.0	\N	1	2015-09-01 15:08:52.15
122852	909	1038	\N	1000000.0	\N	1	2015-09-01 15:08:52.154
122853	909	1039	\N	1000000.0	\N	1	2015-09-01 15:08:52.158
122854	909	1040	\N	1000000.0	\N	1	2015-09-01 15:08:52.161
122855	909	1041	\N	1000000.0	\N	1	2015-09-01 15:08:52.166
122856	909	1042	\N	1000000.0	\N	1	2015-09-01 15:08:52.17
122857	909	1043	\N	1000000.0	\N	1	2015-09-01 15:08:52.174
122858	909	1044	\N	1000000.0	\N	1	2015-09-01 15:08:52.178
122859	909	1045	\N	1000000.0	\N	1	2015-09-01 15:08:52.181
122860	909	1046	\N	1000000.0	\N	1	2015-09-01 15:08:52.184
122861	910	1022	\N	40.60000004	\N	1	2015-09-01 15:08:52.196
122862	910	1023	\N	0.318	\N	1	2015-09-01 15:08:52.202
122863	910	1024	\N	324.675	\N	1	2015-09-01 15:08:52.206
122864	910	1025	\N	1000000.0	\N	1	2015-09-01 15:08:52.21
122865	910	1026	\N	1000000.0	\N	1	2015-09-01 15:08:52.213
122866	910	1027	\N	1000000.0	\N	1	2015-09-01 15:08:52.216
122867	910	1028	\N	663118.7162	\N	1	2015-09-01 15:08:52.22
122868	910	1029	\N	1000000.0	\N	1	2015-09-01 15:08:52.225
122869	910	1030	\N	1000000.0	\N	1	2015-09-01 15:08:52.229
122870	910	1031	\N	1000000.0	\N	1	2015-09-01 15:08:52.232
122871	910	1032	\N	1000000.0	\N	1	2015-09-01 15:08:52.235
122872	910	1033	\N	1000000.0	\N	1	2015-09-01 15:08:52.239
122873	910	1034	\N	1000000.0	\N	1	2015-09-01 15:08:52.242
122874	910	1035	\N	1000000.0	\N	1	2015-09-01 15:08:52.245
122875	910	1036	\N	1000000.0	\N	1	2015-09-01 15:08:52.248
122876	910	1037	\N	1000000.0	\N	1	2015-09-01 15:08:52.252
122877	910	1038	\N	1000000.0	\N	1	2015-09-01 15:08:52.255
122878	910	1039	\N	1000000.0	\N	1	2015-09-01 15:08:52.259
122879	910	1040	\N	1000000.0	\N	1	2015-09-01 15:08:52.262
122880	910	1041	\N	1000000.0	\N	1	2015-09-01 15:08:52.266
122881	910	1042	\N	1000000.0	\N	1	2015-09-01 15:08:52.269
122882	910	1043	\N	1000000.0	\N	1	2015-09-01 15:08:52.272
122883	910	1044	\N	1000000.0	\N	1	2015-09-01 15:08:52.275
122884	910	1045	\N	1000000.0	\N	1	2015-09-01 15:08:52.279
122885	910	1046	\N	1000000.0	\N	1	2015-09-01 15:08:52.282
122886	911	1022	\N	1000000.0	\N	1	2015-09-01 15:08:52.292
122887	911	1023	\N	2.605	\N	1	2015-09-01 15:08:52.299
122888	911	1024	\N	317.317	\N	1	2015-09-01 15:08:52.305
122889	911	1025	\N	1307.088754	\N	1	2015-09-01 15:08:52.313
122890	911	1026	\N	13.0	\N	1	2015-09-01 15:08:52.319
122891	911	1027	\N	607581.9913	\N	1	2015-09-01 15:08:52.326
122892	911	1028	\N	271450.9466	\N	1	2015-09-01 15:08:52.333
122893	911	1029	\N	1000000.0	\N	1	2015-09-01 15:08:52.344
122894	911	1030	\N	1000000.0	\N	1	2015-09-01 15:08:52.35
122895	911	1031	\N	1000000.0	\N	1	2015-09-01 15:08:52.354
122896	911	1032	\N	1000000.0	\N	1	2015-09-01 15:08:52.358
122897	911	1033	\N	1000000.0	\N	1	2015-09-01 15:08:52.361
122898	911	1034	\N	1000000.0	\N	1	2015-09-01 15:08:52.368
122899	911	1035	\N	1000000.0	\N	1	2015-09-01 15:08:52.373
122900	911	1036	\N	1000000.0	\N	1	2015-09-01 15:08:52.379
122901	911	1037	\N	1000000.0	\N	1	2015-09-01 15:08:52.385
122902	911	1038	\N	1000000.0	\N	1	2015-09-01 15:08:52.391
122903	911	1039	\N	1000000.0	\N	1	2015-09-01 15:08:52.397
122904	911	1040	\N	1000000.0	\N	1	2015-09-01 15:08:52.403
122905	911	1041	\N	1000000.0	\N	1	2015-09-01 15:08:52.409
122906	911	1042	\N	1000000.0	\N	1	2015-09-01 15:08:52.415
122907	911	1043	\N	1000000.0	\N	1	2015-09-01 15:08:52.421
122908	911	1044	\N	1000000.0	\N	1	2015-09-01 15:08:52.427
122909	911	1045	\N	52.0	\N	1	2015-09-01 15:08:52.432
122910	911	1046	\N	1000000.0	\N	1	2015-09-01 15:08:52.438
122911	912	1022	\N	1000000.0	\N	1	2015-09-01 15:08:52.455
122912	912	1023	\N	2.745	\N	1	2015-09-01 15:08:52.464
122913	912	1024	\N	403.393	\N	1	2015-09-01 15:08:52.47
122914	912	1025	\N	1000000.0	\N	1	2015-09-01 15:08:52.479
122915	912	1026	\N	24.0	\N	1	2015-09-01 15:08:52.485
122916	912	1027	\N	577460.7174	\N	1	2015-09-01 15:08:52.492
122917	912	1028	\N	192178.0797	\N	1	2015-09-01 15:08:52.498
122918	912	1029	\N	1000000.0	\N	1	2015-09-01 15:08:52.506
122919	912	1030	\N	1000000.0	\N	1	2015-09-01 15:08:52.512
122920	912	1031	\N	1000000.0	\N	1	2015-09-01 15:08:52.518
122921	912	1032	\N	1000000.0	\N	1	2015-09-01 15:08:52.523
122922	912	1033	\N	1000000.0	\N	1	2015-09-01 15:08:52.53
122923	912	1034	\N	1000000.0	\N	1	2015-09-01 15:08:52.536
122924	912	1035	\N	1000000.0	\N	1	2015-09-01 15:08:52.543
122925	912	1036	\N	1000000.0	\N	1	2015-09-01 15:08:52.551
122926	912	1037	\N	1000000.0	\N	1	2015-09-01 15:08:52.558
122927	912	1038	\N	1000000.0	\N	1	2015-09-01 15:08:52.566
122928	912	1039	\N	1000000.0	\N	1	2015-09-01 15:08:52.575
122929	912	1040	\N	1000000.0	\N	1	2015-09-01 15:08:52.58
122930	912	1041	\N	1000000.0	\N	1	2015-09-01 15:08:52.586
122931	912	1042	\N	1000000.0	\N	1	2015-09-01 15:08:52.592
122932	912	1043	\N	1000000.0	\N	1	2015-09-01 15:08:52.598
122933	912	1044	\N	1000000.0	\N	1	2015-09-01 15:08:52.604
122934	912	1045	\N	1000000.0	\N	1	2015-09-01 15:08:52.61
122935	912	1046	\N	1000000.0	\N	1	2015-09-01 15:08:52.616
122936	913	1022	\N	89.40000004	\N	1	2015-09-01 15:08:52.635
122937	913	1023	\N	1.867	\N	1	2015-09-01 15:08:52.644
122938	913	1024	\N	223.228	\N	1	2015-09-01 15:08:52.65
122939	913	1025	\N	1000000.0	\N	1	2015-09-01 15:08:52.659
122940	913	1026	\N	55.0	\N	1	2015-09-01 15:08:52.665
122941	913	1027	\N	607581.9913	\N	1	2015-09-01 15:08:52.671
122942	913	1028	\N	580674.3072	\N	1	2015-09-01 15:08:52.677
122943	913	1029	\N	1000000.0	\N	1	2015-09-01 15:08:52.685
122944	913	1030	\N	1000000.0	\N	1	2015-09-01 15:08:52.692
122945	913	1031	\N	1000000.0	\N	1	2015-09-01 15:08:52.698
122946	913	1032	\N	1000000.0	\N	1	2015-09-01 15:08:52.704
122947	913	1033	\N	1000000.0	\N	1	2015-09-01 15:08:52.71
122948	913	1034	\N	1000000.0	\N	1	2015-09-01 15:08:52.717
122949	913	1035	\N	1000000.0	\N	1	2015-09-01 15:08:52.723
122950	913	1036	\N	1000000.0	\N	1	2015-09-01 15:08:52.729
122951	913	1037	\N	1000000.0	\N	1	2015-09-01 15:08:52.735
122952	913	1038	\N	1000000.0	\N	1	2015-09-01 15:08:52.742
122953	913	1039	\N	1000000.0	\N	1	2015-09-01 15:08:52.749
122954	913	1040	\N	1000000.0	\N	1	2015-09-01 15:08:52.755
122955	913	1041	\N	1000000.0	\N	1	2015-09-01 15:08:52.761
122956	913	1042	\N	1000000.0	\N	1	2015-09-01 15:08:52.767
122957	913	1043	\N	1000000.0	\N	1	2015-09-01 15:08:52.773
122958	913	1044	\N	1000000.0	\N	1	2015-09-01 15:08:52.78
122959	913	1045	\N	1000000.0	\N	1	2015-09-01 15:08:52.787
122960	913	1046	\N	1000000.0	\N	1	2015-09-01 15:08:52.794
122961	914	1022	\N	70.5	\N	1	2015-09-01 15:08:52.814
122962	914	1023	\N	5.286	\N	1	2015-09-01 15:08:52.825
122963	914	1024	\N	335.282	\N	1	2015-09-01 15:08:52.832
122964	914	1025	\N	1200.247469	\N	1	2015-09-01 15:08:52.84
122965	914	1026	\N	14.0	\N	1	2015-09-01 15:08:52.847
122966	914	1027	\N	599535.8053	\N	1	2015-09-01 15:08:52.852
122967	914	1028	\N	384862.1525	\N	1	2015-09-01 15:08:52.858
122968	914	1029	\N	1000000.0	\N	1	2015-09-01 15:08:52.866
122969	914	1030	\N	1000000.0	\N	1	2015-09-01 15:08:52.873
122970	914	1031	\N	1000000.0	\N	1	2015-09-01 15:08:52.88
122971	914	1032	\N	1000000.0	\N	1	2015-09-01 15:08:52.886
122972	914	1033	\N	1000000.0	\N	1	2015-09-01 15:08:52.892
122973	914	1034	\N	1000000.0	\N	1	2015-09-01 15:08:52.897
122974	914	1035	\N	1000000.0	\N	1	2015-09-01 15:08:52.905
122975	914	1036	\N	1000000.0	\N	1	2015-09-01 15:08:52.91
122976	914	1037	\N	1000000.0	\N	1	2015-09-01 15:08:52.916
122977	914	1038	\N	1000000.0	\N	1	2015-09-01 15:08:52.923
122978	914	1039	\N	1000000.0	\N	1	2015-09-01 15:08:52.929
122979	914	1040	\N	1000000.0	\N	1	2015-09-01 15:08:52.935
122980	914	1041	\N	1000000.0	\N	1	2015-09-01 15:08:52.941
122981	914	1042	\N	1000000.0	\N	1	2015-09-01 15:08:52.969
122982	914	1043	\N	1000000.0	\N	1	2015-09-01 15:08:52.974
122983	914	1044	\N	1000000.0	\N	1	2015-09-01 15:08:52.979
122984	914	1045	\N	1000000.0	\N	1	2015-09-01 15:08:52.982
122985	914	1046	\N	1000000.0	\N	1	2015-09-01 15:08:52.986
122986	915	1022	\N	11.10000001	\N	1	2015-09-01 15:08:53
122987	915	1023	\N	2.097	\N	1	2015-09-01 15:08:53.006
122988	915	1024	\N	290.321	\N	1	2015-09-01 15:08:53.01
122989	915	1025	\N	172756.9766	\N	1	2015-09-01 15:08:53.015
122990	915	1026	\N	1000000.0	\N	1	2015-09-01 15:08:53.02
122991	915	1027	\N	1000000.0	\N	1	2015-09-01 15:08:53.025
122992	915	1028	\N	1000000.0	\N	1	2015-09-01 15:08:53.029
122993	915	1029	\N	1000000.0	\N	1	2015-09-01 15:08:53.033
122994	915	1030	\N	1000000.0	\N	1	2015-09-01 15:08:53.038
122995	915	1031	\N	1000000.0	\N	1	2015-09-01 15:08:53.041
122996	915	1032	\N	1000000.0	\N	1	2015-09-01 15:08:53.044
122997	915	1033	\N	1000000.0	\N	1	2015-09-01 15:08:53.047
122998	915	1034	\N	1000000.0	\N	1	2015-09-01 15:08:53.05
122999	915	1035	\N	1000000.0	\N	1	2015-09-01 15:08:53.055
123000	915	1036	\N	1000000.0	\N	1	2015-09-01 15:08:53.059
123001	915	1037	\N	14.12537545	\N	1	2015-09-01 15:08:53.063
123002	915	1038	\N	1000000.0	\N	1	2015-09-01 15:08:53.067
123003	915	1039	\N	1000000.0	\N	1	2015-09-01 15:08:53.071
123004	915	1040	\N	1000000.0	\N	1	2015-09-01 15:08:53.075
123005	915	1041	\N	1000000.0	\N	1	2015-09-01 15:08:53.078
123006	915	1042	\N	11.74	\N	1	2015-09-01 15:08:53.082
123007	915	1043	\N	1000000.0	\N	1	2015-09-01 15:08:53.086
123008	915	1044	\N	1000000.0	\N	1	2015-09-01 15:08:53.089
123009	915	1045	\N	1000000.0	\N	1	2015-09-01 15:08:53.092
123010	915	1046	\N	1000000.0	\N	1	2015-09-01 15:08:53.096
123011	916	1022	\N	1000000.0	\N	1	2015-09-01 15:08:53.107
123012	916	1023	\N	1.82	\N	1	2015-09-01 15:08:53.112
123013	916	1024	\N	410.401	\N	1	2015-09-01 15:08:53.116
123014	916	1025	\N	12500.39888	\N	1	2015-09-01 15:08:53.122
123015	916	1026	\N	1000000.0	\N	1	2015-09-01 15:08:53.125
123016	916	1027	\N	1000000.0	\N	1	2015-09-01 15:08:53.129
123017	916	1028	\N	695198.0604	\N	1	2015-09-01 15:08:53.132
123018	916	1029	\N	1000000.0	\N	1	2015-09-01 15:08:53.137
123019	916	1030	\N	1000000.0	\N	1	2015-09-01 15:08:53.141
123020	916	1031	\N	1000000.0	\N	1	2015-09-01 15:08:53.145
123021	916	1032	\N	1000000.0	\N	1	2015-09-01 15:08:53.149
123022	916	1033	\N	1000000.0	\N	1	2015-09-01 15:08:53.154
123023	916	1034	\N	1000000.0	\N	1	2015-09-01 15:08:53.158
123024	916	1035	\N	1000000.0	\N	1	2015-09-01 15:08:53.161
123025	916	1036	\N	1000000.0	\N	1	2015-09-01 15:08:53.165
123026	916	1037	\N	1000000.0	\N	1	2015-09-01 15:08:53.168
123027	916	1038	\N	1000000.0	\N	1	2015-09-01 15:08:53.171
123028	916	1039	\N	1000000.0	\N	1	2015-09-01 15:08:53.175
123029	916	1040	\N	1000000.0	\N	1	2015-09-01 15:08:53.179
123030	916	1041	\N	1000000.0	\N	1	2015-09-01 15:08:53.183
123031	916	1042	\N	1000000.0	\N	1	2015-09-01 15:08:53.186
123032	916	1043	\N	1000000.0	\N	1	2015-09-01 15:08:53.191
123033	916	1044	\N	1000000.0	\N	1	2015-09-01 15:08:53.194
123034	916	1045	\N	1000000.0	\N	1	2015-09-01 15:08:53.198
123035	916	1046	\N	1000000.0	\N	1	2015-09-01 15:08:53.202
123036	917	1022	\N	62.20000004	\N	1	2015-09-01 15:08:53.214
123037	917	1023	\N	4.355	\N	1	2015-09-01 15:08:53.218
123038	917	1024	\N	397.502	\N	1	2015-09-01 15:08:53.222
123039	917	1025	\N	4156.197253	\N	1	2015-09-01 15:08:53.227
123040	917	1026	\N	0.84	\N	1	2015-09-01 15:08:53.231
123041	917	1027	\N	578463.0637	\N	1	2015-09-01 15:08:53.235
123042	917	1028	\N	300152.8487	\N	1	2015-09-01 15:08:53.239
123043	917	1029	\N	1000000.0	\N	1	2015-09-01 15:08:53.247
123044	917	1030	\N	1000000.0	\N	1	2015-09-01 15:08:53.251
123045	917	1031	\N	1000000.0	\N	1	2015-09-01 15:08:53.256
123046	917	1032	\N	1000000.0	\N	1	2015-09-01 15:08:53.259
123047	917	1033	\N	1000000.0	\N	1	2015-09-01 15:08:53.263
123048	917	1034	\N	1000000.0	\N	1	2015-09-01 15:08:53.266
123049	917	1035	\N	1000000.0	\N	1	2015-09-01 15:08:53.271
123050	917	1036	\N	1000000.0	\N	1	2015-09-01 15:08:53.275
123051	917	1037	\N	1000000.0	\N	1	2015-09-01 15:08:53.278
123052	917	1038	\N	1000000.0	\N	1	2015-09-01 15:08:53.282
123053	917	1039	\N	1000000.0	\N	1	2015-09-01 15:08:53.285
123054	917	1040	\N	1000000.0	\N	1	2015-09-01 15:08:53.29
123055	917	1041	\N	1.57	\N	1	2015-09-01 15:08:53.294
123056	917	1042	\N	3.209	\N	1	2015-09-01 15:08:53.3
123057	917	1043	\N	1000000.0	\N	1	2015-09-01 15:08:53.305
123058	917	1044	\N	1000000.0	\N	1	2015-09-01 15:08:53.309
123059	917	1045	\N	1000000.0	\N	1	2015-09-01 15:08:53.312
123060	917	1046	\N	1000000.0	\N	1	2015-09-01 15:08:53.316
123061	918	1022	\N	1000000.0	\N	1	2015-09-01 15:08:53.327
123062	918	1023	\N	1.821	\N	1	2015-09-01 15:08:53.333
123063	918	1024	\N	240.276	\N	1	2015-09-01 15:08:53.339
123064	918	1025	\N	1000000.0	\N	1	2015-09-01 15:08:53.343
123065	918	1026	\N	29.0	\N	1	2015-09-01 15:08:53.347
123066	918	1027	\N	1000000.0	\N	1	2015-09-01 15:08:53.352
123067	918	1028	\N	398719.8874	\N	1	2015-09-01 15:08:53.356
123068	918	1029	\N	1000000.0	\N	1	2015-09-01 15:08:53.362
123069	918	1030	\N	1000000.0	\N	1	2015-09-01 15:08:53.367
123070	918	1031	\N	1000000.0	\N	1	2015-09-01 15:08:53.371
123071	918	1032	\N	1000000.0	\N	1	2015-09-01 15:08:53.375
123072	918	1033	\N	1000000.0	\N	1	2015-09-01 15:08:53.379
123073	918	1034	\N	1000000.0	\N	1	2015-09-01 15:08:53.383
123074	918	1035	\N	1000000.0	\N	1	2015-09-01 15:08:53.386
123075	918	1036	\N	1000000.0	\N	1	2015-09-01 15:08:53.392
123076	918	1037	\N	1000000.0	\N	1	2015-09-01 15:08:53.396
123077	918	1038	\N	1000000.0	\N	1	2015-09-01 15:08:53.4
123078	918	1039	\N	1000000.0	\N	1	2015-09-01 15:08:53.406
123079	918	1040	\N	1000000.0	\N	1	2015-09-01 15:08:53.409
123080	918	1041	\N	1000000.0	\N	1	2015-09-01 15:08:53.413
123081	918	1042	\N	1000000.0	\N	1	2015-09-01 15:08:53.417
123082	918	1043	\N	1000000.0	\N	1	2015-09-01 15:08:53.423
123083	918	1044	\N	1000000.0	\N	1	2015-09-01 15:08:53.427
123084	918	1045	\N	1000000.0	\N	1	2015-09-01 15:08:53.433
123085	918	1046	\N	1000000.0	\N	1	2015-09-01 15:08:53.439
123086	919	1022	\N	1000000.0	\N	1	2015-09-01 15:08:53.451
123087	919	1023	\N	3.474	\N	1	2015-09-01 15:08:53.458
123088	919	1024	\N	300.357	\N	1	2015-09-01 15:08:53.462
123089	919	1025	\N	37851.92995	\N	1	2015-09-01 15:08:53.467
123090	919	1026	\N	11.0	\N	1	2015-09-01 15:08:53.471
123091	919	1027	\N	363985.2207	\N	1	2015-09-01 15:08:53.475
123092	919	1028	\N	319306.3429	\N	1	2015-09-01 15:08:53.479
123093	919	1029	\N	1000000.0	\N	1	2015-09-01 15:08:53.486
123094	919	1030	\N	1000000.0	\N	1	2015-09-01 15:08:53.491
123095	919	1031	\N	1000000.0	\N	1	2015-09-01 15:08:53.495
123096	919	1032	\N	49.0	\N	1	2015-09-01 15:08:53.499
123097	919	1033	\N	1000000.0	\N	1	2015-09-01 15:08:53.503
123098	919	1034	\N	1000000.0	\N	1	2015-09-01 15:08:53.507
123099	919	1035	\N	1000000.0	\N	1	2015-09-01 15:08:53.511
123100	919	1036	\N	1000000.0	\N	1	2015-09-01 15:08:53.516
123101	919	1037	\N	1000000.0	\N	1	2015-09-01 15:08:53.521
123102	919	1038	\N	1000000.0	\N	1	2015-09-01 15:08:53.525
123103	919	1039	\N	1000000.0	\N	1	2015-09-01 15:08:53.53
123104	919	1040	\N	1000000.0	\N	1	2015-09-01 15:08:53.534
123105	919	1041	\N	1000000.0	\N	1	2015-09-01 15:08:53.539
123106	919	1042	\N	1000000.0	\N	1	2015-09-01 15:08:53.543
123107	919	1043	\N	1000000.0	\N	1	2015-09-01 15:08:53.547
123108	919	1044	\N	1000000.0	\N	1	2015-09-01 15:08:53.551
123109	919	1045	\N	1000000.0	\N	1	2015-09-01 15:08:53.555
123110	919	1046	\N	1000000.0	\N	1	2015-09-01 15:08:53.561
123111	920	1022	\N	34.3	\N	1	2015-09-01 15:08:53.574
123112	920	1023	\N	7.084	\N	1	2015-09-01 15:08:53.581
123113	920	1024	\N	422.874	\N	1	2015-09-01 15:08:53.584
123114	920	1025	\N	1000000.0	\N	1	2015-09-01 15:08:53.589
123115	920	1026	\N	21.0	\N	1	2015-09-01 15:08:53.593
123116	920	1027	\N	600357.7015	\N	1	2015-09-01 15:08:53.597
123117	920	1028	\N	371518.7327	\N	1	2015-09-01 15:08:53.6
123118	920	1029	\N	1000000.0	\N	1	2015-09-01 15:08:53.607
123119	920	1030	\N	1000000.0	\N	1	2015-09-01 15:08:53.61
123120	920	1031	\N	1000000.0	\N	1	2015-09-01 15:08:53.614
123121	920	1032	\N	1000000.0	\N	1	2015-09-01 15:08:53.617
123122	920	1033	\N	1000000.0	\N	1	2015-09-01 15:08:53.621
123123	920	1034	\N	1000000.0	\N	1	2015-09-01 15:08:53.625
123124	920	1035	\N	1000000.0	\N	1	2015-09-01 15:08:53.629
123125	920	1036	\N	1000000.0	\N	1	2015-09-01 15:08:53.633
123126	920	1037	\N	1000000.0	\N	1	2015-09-01 15:08:53.637
123127	920	1038	\N	1000000.0	\N	1	2015-09-01 15:08:53.641
123128	920	1039	\N	1000000.0	\N	1	2015-09-01 15:08:53.645
123129	920	1040	\N	1000000.0	\N	1	2015-09-01 15:08:53.648
123130	920	1041	\N	28.42	\N	1	2015-09-01 15:08:53.652
123131	920	1042	\N	1000000.0	\N	1	2015-09-01 15:08:53.656
123132	920	1043	\N	1000000.0	\N	1	2015-09-01 15:08:53.66
123133	920	1044	\N	1000000.0	\N	1	2015-09-01 15:08:53.664
123134	920	1045	\N	1000000.0	\N	1	2015-09-01 15:08:53.668
123135	920	1046	\N	1000000.0	\N	1	2015-09-01 15:08:53.672
123136	921	1022	\N	61.50000003	\N	1	2015-09-01 15:08:53.683
123137	921	1023	\N	3.317	\N	1	2015-09-01 15:08:53.689
123138	921	1024	\N	228.29	\N	1	2015-09-01 15:08:53.693
123139	921	1025	\N	1000000.0	\N	1	2015-09-01 15:08:53.699
123140	921	1026	\N	28.0	\N	1	2015-09-01 15:08:53.704
123141	921	1027	\N	7329.166251	\N	1	2015-09-01 15:08:53.708
123142	921	1028	\N	24652.84851	\N	1	2015-09-01 15:08:53.712
123143	921	1029	\N	1000000.0	\N	1	2015-09-01 15:08:53.718
123144	921	1030	\N	73.0	\N	1	2015-09-01 15:08:53.722
123145	921	1031	\N	1.723	\N	1	2015-09-01 15:08:53.726
123146	921	1032	\N	17.0	\N	1	2015-09-01 15:08:53.731
123147	921	1033	\N	1000000.0	\N	1	2015-09-01 15:08:53.735
123148	921	1034	\N	1000000.0	\N	1	2015-09-01 15:08:53.739
123149	921	1035	\N	1000000.0	\N	1	2015-09-01 15:08:53.743
123150	921	1036	\N	1000000.0	\N	1	2015-09-01 15:08:53.747
123151	921	1037	\N	1000000.0	\N	1	2015-09-01 15:08:53.751
123152	921	1038	\N	1000000.0	\N	1	2015-09-01 15:08:53.755
123153	921	1039	\N	1000000.0	\N	1	2015-09-01 15:08:53.76
123154	921	1040	\N	1000000.0	\N	1	2015-09-01 15:08:53.764
123155	921	1041	\N	20.53	\N	1	2015-09-01 15:08:53.768
123156	921	1042	\N	1000000.0	\N	1	2015-09-01 15:08:53.773
123157	921	1043	\N	1000000.0	\N	1	2015-09-01 15:08:53.777
123158	921	1044	\N	1000000.0	\N	1	2015-09-01 15:08:53.781
123159	921	1045	\N	1000000.0	\N	1	2015-09-01 15:08:53.785
123160	921	1046	\N	1000000.0	\N	1	2015-09-01 15:08:53.79
123161	922	1022	\N	1000000.0	\N	1	2015-09-01 15:08:53.803
123162	922	1023	\N	NaN	\N	1	2015-09-01 15:08:53.809
123163	922	1024	\N	NaN	\N	1	2015-09-01 15:08:53.813
123164	922	1025	\N	1000000.0	\N	1	2015-09-01 15:08:53.82
123165	922	1026	\N	1000000.0	\N	1	2015-09-01 15:08:53.825
123166	922	1027	\N	1000000.0	\N	1	2015-09-01 15:08:53.83
123167	922	1028	\N	837734.4982	\N	1	2015-09-01 15:08:53.833
123168	922	1029	\N	1000000.0	\N	1	2015-09-01 15:08:53.84
123169	922	1030	\N	1000000.0	\N	1	2015-09-01 15:08:53.845
123170	922	1031	\N	1000000.0	\N	1	2015-09-01 15:08:53.849
123171	922	1032	\N	1000000.0	\N	1	2015-09-01 15:08:53.855
123172	922	1033	\N	1000000.0	\N	1	2015-09-01 15:08:53.86
123173	922	1034	\N	1000000.0	\N	1	2015-09-01 15:08:53.865
123174	922	1035	\N	1000000.0	\N	1	2015-09-01 15:08:53.87
123175	922	1036	\N	1000000.0	\N	1	2015-09-01 15:08:53.874
123176	922	1037	\N	1000000.0	\N	1	2015-09-01 15:08:53.878
123177	922	1038	\N	1000000.0	\N	1	2015-09-01 15:08:53.884
123178	922	1039	\N	1000000.0	\N	1	2015-09-01 15:08:53.889
123179	922	1040	\N	1000000.0	\N	1	2015-09-01 15:08:53.893
123180	922	1041	\N	1000000.0	\N	1	2015-09-01 15:08:53.897
123181	922	1042	\N	1000000.0	\N	1	2015-09-01 15:08:53.902
123182	922	1043	\N	1000000.0	\N	1	2015-09-01 15:08:53.906
123183	922	1044	\N	1000000.0	\N	1	2015-09-01 15:08:53.91
123184	922	1045	\N	1000000.0	\N	1	2015-09-01 15:08:53.915
123185	922	1046	\N	1000000.0	\N	1	2015-09-01 15:08:53.919
123186	923	1022	\N	1000000.0	\N	1	2015-09-01 15:08:53.932
123187	923	1023	\N	4.74	\N	1	2015-09-01 15:08:53.937
123188	923	1024	\N	343.212	\N	1	2015-09-01 15:08:53.942
123189	923	1025	\N	239.9372946	\N	1	2015-09-01 15:08:53.948
123190	923	1026	\N	1000000.0	\N	1	2015-09-01 15:08:53.952
123191	923	1027	\N	590973.7466	\N	1	2015-09-01 15:08:53.956
123192	923	1028	\N	455997.5645	\N	1	2015-09-01 15:08:53.961
123193	923	1029	\N	1000000.0	\N	1	2015-09-01 15:08:53.967
123194	923	1030	\N	1000000.0	\N	1	2015-09-01 15:08:53.972
123195	923	1031	\N	1000000.0	\N	1	2015-09-01 15:08:53.977
123196	923	1032	\N	1000000.0	\N	1	2015-09-01 15:08:53.983
123197	923	1033	\N	1000000.0	\N	1	2015-09-01 15:08:53.991
123198	923	1034	\N	1000000.0	\N	1	2015-09-01 15:08:54.004
123199	923	1035	\N	1000000.0	\N	1	2015-09-01 15:08:54.008
123200	923	1036	\N	1000000.0	\N	1	2015-09-01 15:08:54.012
123201	923	1037	\N	1000000.0	\N	1	2015-09-01 15:08:54.017
123202	923	1038	\N	1000000.0	\N	1	2015-09-01 15:08:54.021
123203	923	1039	\N	1000000.0	\N	1	2015-09-01 15:08:54.025
123204	923	1040	\N	1000000.0	\N	1	2015-09-01 15:08:54.03
123205	923	1041	\N	1000000.0	\N	1	2015-09-01 15:08:54.035
123206	923	1042	\N	1000000.0	\N	1	2015-09-01 15:08:54.039
123207	923	1043	\N	1000000.0	\N	1	2015-09-01 15:08:54.044
123208	923	1044	\N	1000000.0	\N	1	2015-09-01 15:08:54.048
123209	923	1045	\N	1000000.0	\N	1	2015-09-01 15:08:54.053
123210	923	1046	\N	1000000.0	\N	1	2015-09-01 15:08:54.058
123211	924	1022	\N	1000000.0	\N	1	2015-09-01 15:08:54.071
123212	924	1023	\N	1.807	\N	1	2015-09-01 15:08:54.077
123213	924	1024	\N	261.118	\N	1	2015-09-01 15:08:54.082
123214	924	1025	\N	1218.748428	\N	1	2015-09-01 15:08:54.088
123215	924	1026	\N	1000000.0	\N	1	2015-09-01 15:08:54.093
123216	924	1027	\N	1000000.0	\N	1	2015-09-01 15:08:54.098
123217	924	1028	\N	833618.7997	\N	1	2015-09-01 15:08:54.103
123218	924	1029	\N	1000000.0	\N	1	2015-09-01 15:08:54.109
123219	924	1030	\N	1000000.0	\N	1	2015-09-01 15:08:54.114
123220	924	1031	\N	1000000.0	\N	1	2015-09-01 15:08:54.119
123221	924	1032	\N	1000000.0	\N	1	2015-09-01 15:08:54.124
123222	924	1033	\N	1000000.0	\N	1	2015-09-01 15:08:54.129
123223	924	1034	\N	1000000.0	\N	1	2015-09-01 15:08:54.133
123224	924	1035	\N	1000000.0	\N	1	2015-09-01 15:08:54.138
123225	924	1036	\N	1000000.0	\N	1	2015-09-01 15:08:54.143
123226	924	1037	\N	1000000.0	\N	1	2015-09-01 15:08:54.147
123227	924	1038	\N	1000000.0	\N	1	2015-09-01 15:08:54.152
123228	924	1039	\N	1000000.0	\N	1	2015-09-01 15:08:54.157
123229	924	1040	\N	1000000.0	\N	1	2015-09-01 15:08:54.162
123230	924	1041	\N	1000000.0	\N	1	2015-09-01 15:08:54.166
123231	924	1042	\N	1000000.0	\N	1	2015-09-01 15:08:54.171
123232	924	1043	\N	1000000.0	\N	1	2015-09-01 15:08:54.176
123233	924	1044	\N	1000000.0	\N	1	2015-09-01 15:08:54.181
123234	924	1045	\N	1000000.0	\N	1	2015-09-01 15:08:54.186
123235	924	1046	\N	1000000.0	\N	1	2015-09-01 15:08:54.19
123236	925	1022	\N	86.20000003	\N	1	2015-09-01 15:08:54.203
123237	925	1023	\N	1.898	\N	1	2015-09-01 15:08:54.209
123238	925	1024	\N	276.915	\N	1	2015-09-01 15:08:54.214
123239	925	1025	\N	1000000.0	\N	1	2015-09-01 15:08:54.22
123240	925	1026	\N	47.0	\N	1	2015-09-01 15:08:54.225
123241	925	1027	\N	344793.7101	\N	1	2015-09-01 15:08:54.229
123242	925	1028	\N	223232.2049	\N	1	2015-09-01 15:08:54.233
123243	925	1029	\N	1000000.0	\N	1	2015-09-01 15:08:54.24
123244	925	1030	\N	1000000.0	\N	1	2015-09-01 15:08:54.245
123245	925	1031	\N	1000000.0	\N	1	2015-09-01 15:08:54.25
123246	925	1032	\N	1000000.0	\N	1	2015-09-01 15:08:54.255
123247	925	1033	\N	1000000.0	\N	1	2015-09-01 15:08:54.259
123248	925	1034	\N	1000000.0	\N	1	2015-09-01 15:08:54.264
123249	925	1035	\N	1000000.0	\N	1	2015-09-01 15:08:54.268
123250	925	1036	\N	1000000.0	\N	1	2015-09-01 15:08:54.273
123251	925	1037	\N	1000000.0	\N	1	2015-09-01 15:08:54.278
123252	925	1038	\N	67.2	\N	1	2015-09-01 15:08:54.283
123253	925	1039	\N	1000000.0	\N	1	2015-09-01 15:08:54.287
123254	925	1040	\N	1000000.0	\N	1	2015-09-01 15:08:54.292
123255	925	1041	\N	1000000.0	\N	1	2015-09-01 15:08:54.297
123256	925	1042	\N	1000000.0	\N	1	2015-09-01 15:08:54.301
123257	925	1043	\N	15.24	\N	1	2015-09-01 15:08:54.307
123258	925	1044	\N	1000000.0	\N	1	2015-09-01 15:08:54.311
123259	925	1045	\N	1000000.0	\N	1	2015-09-01 15:08:54.316
123260	925	1046	\N	1000000.0	\N	1	2015-09-01 15:08:54.321
123261	926	1022	\N	47.60000003	\N	1	2015-09-01 15:08:54.335
123262	926	1023	\N	4.816	\N	1	2015-09-01 15:08:54.342
123263	926	1024	\N	305.437	\N	1	2015-09-01 15:08:54.346
123264	926	1025	\N	178099.941	\N	1	2015-09-01 15:08:54.353
123265	926	1026	\N	1000000.0	\N	1	2015-09-01 15:08:54.358
123266	926	1027	\N	1000000.0	\N	1	2015-09-01 15:08:54.363
123267	926	1028	\N	263070.0724	\N	1	2015-09-01 15:08:54.368
123268	926	1029	\N	1000000.0	\N	1	2015-09-01 15:08:54.375
123269	926	1030	\N	1000000.0	\N	1	2015-09-01 15:08:54.38
123270	926	1031	\N	1000000.0	\N	1	2015-09-01 15:08:54.384
123271	926	1032	\N	1000000.0	\N	1	2015-09-01 15:08:54.39
123272	926	1033	\N	1000000.0	\N	1	2015-09-01 15:08:54.394
123273	926	1034	\N	1000000.0	\N	1	2015-09-01 15:08:54.4
123274	926	1035	\N	1000000.0	\N	1	2015-09-01 15:08:54.405
123275	926	1036	\N	1000000.0	\N	1	2015-09-01 15:08:54.409
123276	926	1037	\N	1000000.0	\N	1	2015-09-01 15:08:54.414
123277	926	1038	\N	1000000.0	\N	1	2015-09-01 15:08:54.418
123278	926	1039	\N	1000000.0	\N	1	2015-09-01 15:08:54.422
123279	926	1040	\N	1000000.0	\N	1	2015-09-01 15:08:54.427
123280	926	1041	\N	11.57	\N	1	2015-09-01 15:08:54.433
123281	926	1042	\N	1000000.0	\N	1	2015-09-01 15:08:54.44
123282	926	1043	\N	1000000.0	\N	1	2015-09-01 15:08:54.445
123283	926	1044	\N	1000000.0	\N	1	2015-09-01 15:08:54.45
123284	926	1045	\N	1000000.0	\N	1	2015-09-01 15:08:54.455
123285	926	1046	\N	1000000.0	\N	1	2015-09-01 15:08:54.461
123286	927	1022	\N	46.00000003	\N	1	2015-09-01 15:08:54.473
123287	927	1023	\N	3.817	\N	1	2015-09-01 15:08:54.479
123288	927	1024	\N	311.851	\N	1	2015-09-01 15:08:54.483
123289	927	1025	\N	980.1583415	\N	1	2015-09-01 15:08:54.488
123290	927	1026	\N	0.81	\N	1	2015-09-01 15:08:54.493
123291	927	1027	\N	606262.3878	\N	1	2015-09-01 15:08:54.497
123292	927	1028	\N	295867.6056	\N	1	2015-09-01 15:08:54.501
123293	927	1029	\N	1000000.0	\N	1	2015-09-01 15:08:54.507
123294	927	1030	\N	45.0	\N	1	2015-09-01 15:08:54.511
123295	927	1031	\N	1000000.0	\N	1	2015-09-01 15:08:54.515
123296	927	1032	\N	1000000.0	\N	1	2015-09-01 15:08:54.521
123297	927	1033	\N	1000000.0	\N	1	2015-09-01 15:08:54.525
123298	927	1034	\N	1000000.0	\N	1	2015-09-01 15:08:54.53
123299	927	1035	\N	1000000.0	\N	1	2015-09-01 15:08:54.534
123300	927	1036	\N	1000000.0	\N	1	2015-09-01 15:08:54.54
123301	927	1037	\N	1000000.0	\N	1	2015-09-01 15:08:54.548
123302	927	1038	\N	1000000.0	\N	1	2015-09-01 15:08:54.557
123303	927	1039	\N	1000000.0	\N	1	2015-09-01 15:08:54.564
123304	927	1040	\N	1000000.0	\N	1	2015-09-01 15:08:54.569
123305	927	1041	\N	1.949	\N	1	2015-09-01 15:08:54.573
123306	927	1042	\N	1000000.0	\N	1	2015-09-01 15:08:54.577
123307	927	1043	\N	1000000.0	\N	1	2015-09-01 15:08:54.581
123308	927	1044	\N	1000000.0	\N	1	2015-09-01 15:08:54.586
123309	927	1045	\N	1000000.0	\N	1	2015-09-01 15:08:54.59
123310	927	1046	\N	1000000.0	\N	1	2015-09-01 15:08:54.594
123311	928	1022	\N	1000000.0	\N	1	2015-09-01 15:08:54.606
123312	928	1023	\N	3.616	\N	1	2015-09-01 15:08:54.612
123313	928	1024	\N	474.82	\N	1	2015-09-01 15:08:54.617
123314	928	1025	\N	1000000.0	\N	1	2015-09-01 15:08:54.624
123315	928	1026	\N	1000000.0	\N	1	2015-09-01 15:08:54.628
123316	928	1027	\N	1000000.0	\N	1	2015-09-01 15:08:54.632
123317	928	1028	\N	1000000.0	\N	1	2015-09-01 15:08:54.636
123318	928	1029	\N	1000000.0	\N	1	2015-09-01 15:08:54.643
123319	928	1030	\N	1000000.0	\N	1	2015-09-01 15:08:54.648
123320	928	1031	\N	1000000.0	\N	1	2015-09-01 15:08:54.653
123321	928	1032	\N	1000000.0	\N	1	2015-09-01 15:08:54.658
123322	928	1033	\N	1000000.0	\N	1	2015-09-01 15:08:54.662
123323	928	1034	\N	1000000.0	\N	1	2015-09-01 15:08:54.666
123324	928	1035	\N	1000000.0	\N	1	2015-09-01 15:08:54.671
123325	928	1036	\N	1000000.0	\N	1	2015-09-01 15:08:54.676
123326	928	1037	\N	1000000.0	\N	1	2015-09-01 15:08:54.681
123327	928	1038	\N	1000000.0	\N	1	2015-09-01 15:08:54.685
123328	928	1039	\N	1000000.0	\N	1	2015-09-01 15:08:54.69
123329	928	1040	\N	1000000.0	\N	1	2015-09-01 15:08:54.694
123330	928	1041	\N	1000000.0	\N	1	2015-09-01 15:08:54.699
123331	928	1042	\N	1000000.0	\N	1	2015-09-01 15:08:54.705
123332	928	1043	\N	1000000.0	\N	1	2015-09-01 15:08:54.71
123333	928	1044	\N	1000000.0	\N	1	2015-09-01 15:08:54.715
123334	928	1045	\N	1000000.0	\N	1	2015-09-01 15:08:54.719
123335	928	1046	\N	1000000.0	\N	1	2015-09-01 15:08:54.725
123336	929	1022	\N	63.49999996	\N	1	2015-09-01 15:08:54.741
123337	929	1023	\N	3.018	\N	1	2015-09-01 15:08:54.748
123338	929	1024	\N	295.338	\N	1	2015-09-01 15:08:54.753
123339	929	1025	\N	898.7799307	\N	1	2015-09-01 15:08:54.76
123340	929	1026	\N	20.0	\N	1	2015-09-01 15:08:54.765
123341	929	1027	\N	575712.9508	\N	1	2015-09-01 15:08:54.77
123342	929	1028	\N	198522.2023	\N	1	2015-09-01 15:08:54.775
123343	929	1029	\N	1000000.0	\N	1	2015-09-01 15:08:54.781
123344	929	1030	\N	1000000.0	\N	1	2015-09-01 15:08:54.785
123345	929	1031	\N	1000000.0	\N	1	2015-09-01 15:08:54.79
123346	929	1032	\N	1000000.0	\N	1	2015-09-01 15:08:54.795
123347	929	1033	\N	1000000.0	\N	1	2015-09-01 15:08:54.8
123348	929	1034	\N	1000000.0	\N	1	2015-09-01 15:08:54.805
123349	929	1035	\N	1000000.0	\N	1	2015-09-01 15:08:54.81
123350	929	1036	\N	1000000.0	\N	1	2015-09-01 15:08:54.814
123351	929	1037	\N	1000000.0	\N	1	2015-09-01 15:08:54.819
123352	929	1038	\N	1000000.0	\N	1	2015-09-01 15:08:54.823
123353	929	1039	\N	1000000.0	\N	1	2015-09-01 15:08:54.828
123354	929	1040	\N	1000000.0	\N	1	2015-09-01 15:08:54.834
123355	929	1041	\N	36.12	\N	1	2015-09-01 15:08:54.839
123356	929	1042	\N	29.28	\N	1	2015-09-01 15:08:54.844
123357	929	1043	\N	1000000.0	\N	1	2015-09-01 15:08:54.848
123358	929	1044	\N	1000000.0	\N	1	2015-09-01 15:08:54.853
123359	929	1045	\N	1000000.0	\N	1	2015-09-01 15:08:54.858
123360	929	1046	\N	1000000.0	\N	1	2015-09-01 15:08:54.863
123361	930	1022	\N	1000000.0	\N	1	2015-09-01 15:08:54.878
123362	930	1023	\N	3.615	\N	1	2015-09-01 15:08:54.885
123363	930	1024	\N	217.369	\N	1	2015-09-01 15:08:54.89
123364	930	1025	\N	1000000.0	\N	1	2015-09-01 15:08:54.897
123365	930	1026	\N	1000000.0	\N	1	2015-09-01 15:08:54.902
123366	930	1027	\N	1000000.0	\N	1	2015-09-01 15:08:54.907
123367	930	1028	\N	831335.9531	\N	1	2015-09-01 15:08:54.912
123368	930	1029	\N	1000000.0	\N	1	2015-09-01 15:08:54.92
123369	930	1030	\N	1000000.0	\N	1	2015-09-01 15:08:54.925
123370	930	1031	\N	1000000.0	\N	1	2015-09-01 15:08:54.93
123371	930	1032	\N	1000000.0	\N	1	2015-09-01 15:08:54.935
123372	930	1033	\N	1000000.0	\N	1	2015-09-01 15:08:54.94
123373	930	1034	\N	1000000.0	\N	1	2015-09-01 15:08:54.945
123374	930	1035	\N	1000000.0	\N	1	2015-09-01 15:08:54.951
123375	930	1036	\N	1000000.0	\N	1	2015-09-01 15:08:54.957
123376	930	1037	\N	1000000.0	\N	1	2015-09-01 15:08:54.968
123377	930	1038	\N	1000000.0	\N	1	2015-09-01 15:08:54.977
123378	930	1039	\N	1000000.0	\N	1	2015-09-01 15:08:54.985
123379	930	1040	\N	1000000.0	\N	1	2015-09-01 15:08:54.994
123380	930	1041	\N	1000000.0	\N	1	2015-09-01 15:08:55.003
123381	930	1042	\N	1000000.0	\N	1	2015-09-01 15:08:55.012
123382	930	1043	\N	1000000.0	\N	1	2015-09-01 15:08:55.021
123383	930	1044	\N	1000000.0	\N	1	2015-09-01 15:08:55.029
123384	930	1045	\N	1000000.0	\N	1	2015-09-01 15:08:55.037
123385	930	1046	\N	1000000.0	\N	1	2015-09-01 15:08:55.047
123386	931	1022	\N	1000000.0	\N	1	2015-09-01 15:08:55.065
123387	931	1023	\N	NaN	\N	1	2015-09-01 15:08:55.079
123388	931	1024	\N	NaN	\N	1	2015-09-01 15:08:55.087
123389	931	1025	\N	1000000.0	\N	1	2015-09-01 15:08:55.098
123390	931	1026	\N	42.0	\N	1	2015-09-01 15:08:55.107
123391	931	1027	\N	1000000.0	\N	1	2015-09-01 15:08:55.114
123392	931	1028	\N	1000000.0	\N	1	2015-09-01 15:08:55.123
123393	931	1029	\N	1000000.0	\N	1	2015-09-01 15:08:55.135
123394	931	1030	\N	1000000.0	\N	1	2015-09-01 15:08:55.143
123395	931	1031	\N	1000000.0	\N	1	2015-09-01 15:08:55.151
123396	931	1032	\N	1000000.0	\N	1	2015-09-01 15:08:55.159
123397	931	1033	\N	1000000.0	\N	1	2015-09-01 15:08:55.167
123398	931	1034	\N	1000000.0	\N	1	2015-09-01 15:08:55.177
123399	931	1035	\N	1000000.0	\N	1	2015-09-01 15:08:55.185
123400	931	1036	\N	1000000.0	\N	1	2015-09-01 15:08:55.193
123401	931	1037	\N	1000000.0	\N	1	2015-09-01 15:08:55.201
123402	931	1038	\N	1000000.0	\N	1	2015-09-01 15:08:55.209
123403	931	1039	\N	1000000.0	\N	1	2015-09-01 15:08:55.217
123404	931	1040	\N	1000000.0	\N	1	2015-09-01 15:08:55.226
123405	931	1041	\N	1000000.0	\N	1	2015-09-01 15:08:55.234
123406	931	1042	\N	1000000.0	\N	1	2015-09-01 15:08:55.242
123407	931	1043	\N	1000000.0	\N	1	2015-09-01 15:08:55.25
123408	931	1044	\N	1000000.0	\N	1	2015-09-01 15:08:55.259
123409	931	1045	\N	1000000.0	\N	1	2015-09-01 15:08:55.268
123410	931	1046	\N	1000000.0	\N	1	2015-09-01 15:08:55.278
123411	932	1022	\N	97.80000005	\N	1	2015-09-01 15:08:55.305
123412	932	1023	\N	2.913	\N	1	2015-09-01 15:08:55.319
123413	932	1024	\N	300.587	\N	1	2015-09-01 15:08:55.327
123414	932	1025	\N	1000000.0	\N	1	2015-09-01 15:08:55.34
123415	932	1026	\N	1000000.0	\N	1	2015-09-01 15:08:55.349
123416	932	1027	\N	1000000.0	\N	1	2015-09-01 15:08:55.359
123417	932	1028	\N	800040.9806	\N	1	2015-09-01 15:08:55.367
123418	932	1029	\N	1000000.0	\N	1	2015-09-01 15:08:55.38
123419	932	1030	\N	1000000.0	\N	1	2015-09-01 15:08:55.388
123420	932	1031	\N	1000000.0	\N	1	2015-09-01 15:08:55.397
123421	932	1032	\N	1000000.0	\N	1	2015-09-01 15:08:55.405
123422	932	1033	\N	1000000.0	\N	1	2015-09-01 15:08:55.414
123423	932	1034	\N	1000000.0	\N	1	2015-09-01 15:08:55.423
123424	932	1035	\N	1000000.0	\N	1	2015-09-01 15:08:55.432
123425	932	1036	\N	1000000.0	\N	1	2015-09-01 15:08:55.442
123426	932	1037	\N	1000000.0	\N	1	2015-09-01 15:08:55.451
123427	932	1038	\N	1000000.0	\N	1	2015-09-01 15:08:55.46
123428	932	1039	\N	1000000.0	\N	1	2015-09-01 15:08:55.468
123429	932	1040	\N	1000000.0	\N	1	2015-09-01 15:08:55.482
123430	932	1041	\N	1000000.0	\N	1	2015-09-01 15:08:55.487
123431	932	1042	\N	1000000.0	\N	1	2015-09-01 15:08:55.492
123432	932	1043	\N	1000000.0	\N	1	2015-09-01 15:08:55.497
123433	932	1044	\N	1000000.0	\N	1	2015-09-01 15:08:55.502
123434	932	1045	\N	1000000.0	\N	1	2015-09-01 15:08:55.507
123435	932	1046	\N	1000000.0	\N	1	2015-09-01 15:08:55.512
123436	933	1022	\N	56.30000002	\N	1	2015-09-01 15:08:55.525
123437	933	1023	\N	2.35	\N	1	2015-09-01 15:08:55.532
123438	933	1024	\N	201.224	\N	1	2015-09-01 15:08:55.538
123439	933	1025	\N	34685.44678	\N	1	2015-09-01 15:08:55.545
123440	933	1026	\N	1000000.0	\N	1	2015-09-01 15:08:55.55
123441	933	1027	\N	223265.3739	\N	1	2015-09-01 15:08:55.556
123442	933	1028	\N	232722.3117	\N	1	2015-09-01 15:08:55.562
123443	933	1029	\N	1000000.0	\N	1	2015-09-01 15:08:55.569
123444	933	1030	\N	1000000.0	\N	1	2015-09-01 15:08:55.574
123445	933	1031	\N	28.65	\N	1	2015-09-01 15:08:55.579
123446	933	1032	\N	1000000.0	\N	1	2015-09-01 15:08:55.583
123447	933	1033	\N	1000000.0	\N	1	2015-09-01 15:08:55.587
123448	933	1034	\N	1000000.0	\N	1	2015-09-01 15:08:55.592
123449	933	1035	\N	1000000.0	\N	1	2015-09-01 15:08:55.597
123450	933	1036	\N	1000000.0	\N	1	2015-09-01 15:08:55.601
123451	933	1037	\N	1000000.0	\N	1	2015-09-01 15:08:55.606
123452	933	1038	\N	1000000.0	\N	1	2015-09-01 15:08:55.61
123453	933	1039	\N	1000000.0	\N	1	2015-09-01 15:08:55.615
123454	933	1040	\N	1000000.0	\N	1	2015-09-01 15:08:55.619
123455	933	1041	\N	1000000.0	\N	1	2015-09-01 15:08:55.625
123456	933	1042	\N	1000000.0	\N	1	2015-09-01 15:08:55.629
123457	933	1043	\N	1000000.0	\N	1	2015-09-01 15:08:55.634
123458	933	1044	\N	1000000.0	\N	1	2015-09-01 15:08:55.639
123459	933	1045	\N	1000000.0	\N	1	2015-09-01 15:08:55.644
123460	933	1046	\N	1000000.0	\N	1	2015-09-01 15:08:55.648
123461	934	1022	\N	1000000.0	\N	1	2015-09-01 15:08:55.663
123462	934	1023	\N	2.557	\N	1	2015-09-01 15:08:55.669
123463	934	1024	\N	235.3	\N	1	2015-09-01 15:08:55.674
123464	934	1025	\N	1000000.0	\N	1	2015-09-01 15:08:55.68
123465	934	1026	\N	1000000.0	\N	1	2015-09-01 15:08:55.686
123466	934	1027	\N	1000000.0	\N	1	2015-09-01 15:08:55.69
123467	934	1028	\N	702128.4516	\N	1	2015-09-01 15:08:55.695
123468	934	1029	\N	1000000.0	\N	1	2015-09-01 15:08:55.702
123469	934	1030	\N	1000000.0	\N	1	2015-09-01 15:08:55.706
123470	934	1031	\N	1000000.0	\N	1	2015-09-01 15:08:55.711
123471	934	1032	\N	1000000.0	\N	1	2015-09-01 15:08:55.716
123472	934	1033	\N	1000000.0	\N	1	2015-09-01 15:08:55.721
123473	934	1034	\N	1000000.0	\N	1	2015-09-01 15:08:55.726
123474	934	1035	\N	1000000.0	\N	1	2015-09-01 15:08:55.731
123475	934	1036	\N	1000000.0	\N	1	2015-09-01 15:08:55.736
123476	934	1037	\N	1000000.0	\N	1	2015-09-01 15:08:55.74
123477	934	1038	\N	1000000.0	\N	1	2015-09-01 15:08:55.746
123478	934	1039	\N	1000000.0	\N	1	2015-09-01 15:08:55.751
123479	934	1040	\N	1000000.0	\N	1	2015-09-01 15:08:55.756
123480	934	1041	\N	1000000.0	\N	1	2015-09-01 15:08:55.761
123481	934	1042	\N	1000000.0	\N	1	2015-09-01 15:08:55.766
123482	934	1043	\N	1000000.0	\N	1	2015-09-01 15:08:55.771
123483	934	1044	\N	1000000.0	\N	1	2015-09-01 15:08:55.776
123484	934	1045	\N	1000000.0	\N	1	2015-09-01 15:08:55.781
123485	934	1046	\N	1000000.0	\N	1	2015-09-01 15:08:55.786
123486	935	1022	\N	1000000.0	\N	1	2015-09-01 15:08:55.799
123487	935	1023	\N	4.489	\N	1	2015-09-01 15:08:55.807
123488	935	1024	\N	412.195	\N	1	2015-09-01 15:08:55.812
123489	935	1025	\N	1852.08193	\N	1	2015-09-01 15:08:55.818
123490	935	1026	\N	1000000.0	\N	1	2015-09-01 15:08:55.824
123491	935	1027	\N	1000000.0	\N	1	2015-09-01 15:08:55.828
123492	935	1028	\N	579957.9431	\N	1	2015-09-01 15:08:55.833
123493	935	1029	\N	1000000.0	\N	1	2015-09-01 15:08:55.84
123494	935	1030	\N	1000000.0	\N	1	2015-09-01 15:08:55.845
123495	935	1031	\N	1000000.0	\N	1	2015-09-01 15:08:55.85
123496	935	1032	\N	1000000.0	\N	1	2015-09-01 15:08:55.855
123497	935	1033	\N	1000000.0	\N	1	2015-09-01 15:08:55.86
123498	935	1034	\N	1000000.0	\N	1	2015-09-01 15:08:55.865
123499	935	1035	\N	1000000.0	\N	1	2015-09-01 15:08:55.87
123500	935	1036	\N	1000000.0	\N	1	2015-09-01 15:08:55.876
123501	935	1037	\N	1000000.0	\N	1	2015-09-01 15:08:55.88
123502	935	1038	\N	1000000.0	\N	1	2015-09-01 15:08:55.885
123503	935	1039	\N	1000000.0	\N	1	2015-09-01 15:08:55.89
123504	935	1040	\N	1000000.0	\N	1	2015-09-01 15:08:55.895
123505	935	1041	\N	1000000.0	\N	1	2015-09-01 15:08:55.901
123506	935	1042	\N	1000000.0	\N	1	2015-09-01 15:08:55.906
123507	935	1043	\N	1000000.0	\N	1	2015-09-01 15:08:55.911
123508	935	1044	\N	1000000.0	\N	1	2015-09-01 15:08:55.916
123509	935	1045	\N	1000000.0	\N	1	2015-09-01 15:08:55.92
123510	935	1046	\N	1000000.0	\N	1	2015-09-01 15:08:55.925
123511	936	1022	\N	50.99999999	\N	1	2015-09-01 15:08:55.94
123512	936	1023	\N	5.051	\N	1	2015-09-01 15:08:55.948
123513	936	1024	\N	335.997	\N	1	2015-09-01 15:08:55.953
123514	936	1025	\N	189206.9597	\N	1	2015-09-01 15:08:55.96
123515	936	1026	\N	36.0	\N	1	2015-09-01 15:08:55.966
123516	936	1027	\N	363676.8819	\N	1	2015-09-01 15:08:55.971
123517	936	1028	\N	270286.6241	\N	1	2015-09-01 15:08:55.976
123518	936	1029	\N	1000000.0	\N	1	2015-09-01 15:08:55.983
123519	936	1030	\N	1000000.0	\N	1	2015-09-01 15:08:55.988
123520	936	1031	\N	1000000.0	\N	1	2015-09-01 15:08:55.993
123521	936	1032	\N	1000000.0	\N	1	2015-09-01 15:08:55.998
123522	936	1033	\N	1000000.0	\N	1	2015-09-01 15:08:56.003
123523	936	1034	\N	1000000.0	\N	1	2015-09-01 15:08:56.009
123524	936	1035	\N	1000000.0	\N	1	2015-09-01 15:08:56.013
123525	936	1036	\N	1000000.0	\N	1	2015-09-01 15:08:56.019
123526	936	1037	\N	1000000.0	\N	1	2015-09-01 15:08:56.025
123527	936	1038	\N	1000000.0	\N	1	2015-09-01 15:08:56.03
123528	936	1039	\N	1000000.0	\N	1	2015-09-01 15:08:56.035
123529	936	1040	\N	1000000.0	\N	1	2015-09-01 15:08:56.04
123530	936	1041	\N	1000000.0	\N	1	2015-09-01 15:08:56.045
123531	936	1042	\N	1000000.0	\N	1	2015-09-01 15:08:56.051
123532	936	1043	\N	1000000.0	\N	1	2015-09-01 15:08:56.056
123533	936	1044	\N	1000000.0	\N	1	2015-09-01 15:08:56.061
123534	936	1045	\N	1000000.0	\N	1	2015-09-01 15:08:56.067
123535	936	1046	\N	1000000.0	\N	1	2015-09-01 15:08:56.072
123536	937	1022	\N	1000000.0	\N	1	2015-09-01 15:08:56.087
123537	937	1023	\N	1.857	\N	1	2015-09-01 15:08:56.094
123538	937	1024	\N	221.646	\N	1	2015-09-01 15:08:56.099
123539	937	1025	\N	1000000.0	\N	1	2015-09-01 15:08:56.105
123540	937	1026	\N	1000000.0	\N	1	2015-09-01 15:08:56.111
123541	937	1027	\N	1000000.0	\N	1	2015-09-01 15:08:56.116
123542	937	1028	\N	831452.6815	\N	1	2015-09-01 15:08:56.121
123543	937	1029	\N	1000000.0	\N	1	2015-09-01 15:08:56.128
123544	937	1030	\N	1000000.0	\N	1	2015-09-01 15:08:56.133
123545	937	1031	\N	1000000.0	\N	1	2015-09-01 15:08:56.138
123546	937	1032	\N	1000000.0	\N	1	2015-09-01 15:08:56.143
123547	937	1033	\N	1000000.0	\N	1	2015-09-01 15:08:56.149
123548	937	1034	\N	1000000.0	\N	1	2015-09-01 15:08:56.154
123549	937	1035	\N	1000000.0	\N	1	2015-09-01 15:08:56.159
123550	937	1036	\N	1000000.0	\N	1	2015-09-01 15:08:56.164
123551	937	1037	\N	1000000.0	\N	1	2015-09-01 15:08:56.169
123552	937	1038	\N	1000000.0	\N	1	2015-09-01 15:08:56.175
123553	937	1039	\N	1000000.0	\N	1	2015-09-01 15:08:56.18
123554	937	1040	\N	1000000.0	\N	1	2015-09-01 15:08:56.185
123555	937	1041	\N	1000000.0	\N	1	2015-09-01 15:08:56.19
123556	937	1042	\N	1000000.0	\N	1	2015-09-01 15:08:56.195
123557	937	1043	\N	1000000.0	\N	1	2015-09-01 15:08:56.201
123558	937	1044	\N	1000000.0	\N	1	2015-09-01 15:08:56.209
123559	937	1045	\N	1000000.0	\N	1	2015-09-01 15:08:56.216
123560	937	1046	\N	1000000.0	\N	1	2015-09-01 15:08:56.224
123561	938	1022	\N	1000000.0	\N	1	2015-09-01 15:08:56.243
123562	938	1023	\N	3.527	\N	1	2015-09-01 15:08:56.25
123563	938	1024	\N	207.056	\N	1	2015-09-01 15:08:56.256
123564	938	1025	\N	1000000.0	\N	1	2015-09-01 15:08:56.264
123565	938	1026	\N	1000000.0	\N	1	2015-09-01 15:08:56.271
123566	938	1027	\N	1000000.0	\N	1	2015-09-01 15:08:56.276
123567	938	1028	\N	831060.0945	\N	1	2015-09-01 15:08:56.28
123568	938	1029	\N	1000000.0	\N	1	2015-09-01 15:08:56.288
123569	938	1030	\N	1000000.0	\N	1	2015-09-01 15:08:56.293
123570	938	1031	\N	1000000.0	\N	1	2015-09-01 15:08:56.299
123571	938	1032	\N	1000000.0	\N	1	2015-09-01 15:08:56.305
123572	938	1033	\N	1000000.0	\N	1	2015-09-01 15:08:56.31
123573	938	1034	\N	1000000.0	\N	1	2015-09-01 15:08:56.317
123574	938	1035	\N	1000000.0	\N	1	2015-09-01 15:08:56.322
123575	938	1036	\N	1000000.0	\N	1	2015-09-01 15:08:56.327
123576	938	1037	\N	1000000.0	\N	1	2015-09-01 15:08:56.332
123577	938	1038	\N	1000000.0	\N	1	2015-09-01 15:08:56.338
123578	938	1039	\N	1000000.0	\N	1	2015-09-01 15:08:56.343
123579	938	1040	\N	1000000.0	\N	1	2015-09-01 15:08:56.348
123580	938	1041	\N	1000000.0	\N	1	2015-09-01 15:08:56.354
123581	938	1042	\N	1000000.0	\N	1	2015-09-01 15:08:56.361
123582	938	1043	\N	1000000.0	\N	1	2015-09-01 15:08:56.366
123583	938	1044	\N	1000000.0	\N	1	2015-09-01 15:08:56.373
123584	938	1045	\N	1000000.0	\N	1	2015-09-01 15:08:56.379
123585	938	1046	\N	1000000.0	\N	1	2015-09-01 15:08:56.385
123586	939	1022	\N	2.019999998	\N	1	2015-09-01 15:08:56.403
123587	939	1023	\N	2.223	\N	1	2015-09-01 15:08:56.411
123588	939	1024	\N	265.913	\N	1	2015-09-01 15:08:56.418
123589	939	1025	\N	50162.94388	\N	1	2015-09-01 15:08:56.426
123590	939	1026	\N	0.25	\N	1	2015-09-01 15:08:56.431
123591	939	1027	\N	460006.1365	\N	1	2015-09-01 15:08:56.437
123592	939	1028	\N	358968.327	\N	1	2015-09-01 15:08:56.442
123593	939	1029	\N	1000000.0	\N	1	2015-09-01 15:08:56.45
123594	939	1030	\N	1000000.0	\N	1	2015-09-01 15:08:56.456
123595	939	1031	\N	1000000.0	\N	1	2015-09-01 15:08:56.462
123596	939	1032	\N	1000000.0	\N	1	2015-09-01 15:08:56.468
123597	939	1033	\N	1000000.0	\N	1	2015-09-01 15:08:56.473
123598	939	1034	\N	1000000.0	\N	1	2015-09-01 15:08:56.479
123599	939	1035	\N	1000000.0	\N	1	2015-09-01 15:08:56.484
123600	939	1036	\N	1000000.0	\N	1	2015-09-01 15:08:56.49
123601	939	1037	\N	1000000.0	\N	1	2015-09-01 15:08:56.495
123602	939	1038	\N	1000000.0	\N	1	2015-09-01 15:08:56.501
123603	939	1039	\N	1000000.0	\N	1	2015-09-01 15:08:56.506
123604	939	1040	\N	1000000.0	\N	1	2015-09-01 15:08:56.512
123605	939	1041	\N	17.65	\N	1	2015-09-01 15:08:56.517
123606	939	1042	\N	1000000.0	\N	1	2015-09-01 15:08:56.522
123607	939	1043	\N	1000000.0	\N	1	2015-09-01 15:08:56.528
123608	939	1044	\N	1000000.0	\N	1	2015-09-01 15:08:56.533
123609	939	1045	\N	1000000.0	\N	1	2015-09-01 15:08:56.54
123610	939	1046	\N	1000000.0	\N	1	2015-09-01 15:08:56.548
123611	940	1022	\N	1000000.0	\N	1	2015-09-01 15:08:56.566
123612	940	1023	\N	2.405	\N	1	2015-09-01 15:08:56.575
123613	940	1024	\N	213.663	\N	1	2015-09-01 15:08:56.581
123614	940	1025	\N	34450.54319	\N	1	2015-09-01 15:08:56.588
123615	940	1026	\N	50.0	\N	1	2015-09-01 15:08:56.593
123616	940	1027	\N	566529.9831	\N	1	2015-09-01 15:08:56.598
123617	940	1028	\N	480376.5089	\N	1	2015-09-01 15:08:56.605
123618	940	1029	\N	1000000.0	\N	1	2015-09-01 15:08:56.612
123619	940	1030	\N	1000000.0	\N	1	2015-09-01 15:08:56.617
123620	940	1031	\N	1000000.0	\N	1	2015-09-01 15:08:56.627
123621	940	1032	\N	1000000.0	\N	1	2015-09-01 15:08:56.633
123622	940	1033	\N	1000000.0	\N	1	2015-09-01 15:08:56.638
123623	940	1034	\N	1000000.0	\N	1	2015-09-01 15:08:56.643
123624	940	1035	\N	1000000.0	\N	1	2015-09-01 15:08:56.648
123625	940	1036	\N	1000000.0	\N	1	2015-09-01 15:08:56.653
123626	940	1037	\N	1000000.0	\N	1	2015-09-01 15:08:56.658
123627	940	1038	\N	1000000.0	\N	1	2015-09-01 15:08:56.664
123628	940	1039	\N	1000000.0	\N	1	2015-09-01 15:08:56.669
123629	940	1040	\N	1000000.0	\N	1	2015-09-01 15:08:56.675
123630	940	1041	\N	1000000.0	\N	1	2015-09-01 15:08:56.68
123631	940	1042	\N	1000000.0	\N	1	2015-09-01 15:08:56.685
123632	940	1043	\N	1000000.0	\N	1	2015-09-01 15:08:56.69
123633	940	1044	\N	1000000.0	\N	1	2015-09-01 15:08:56.696
123634	940	1045	\N	1000000.0	\N	1	2015-09-01 15:08:56.701
123635	940	1046	\N	1000000.0	\N	1	2015-09-01 15:08:56.706
123636	941	1022	\N	90.69999999	\N	1	2015-09-01 15:08:56.721
123637	941	1023	\N	2.81	\N	1	2015-09-01 15:08:56.729
123638	941	1024	\N	334.523	\N	1	2015-09-01 15:08:56.734
123639	941	1025	\N	1000000.0	\N	1	2015-09-01 15:08:56.742
123640	941	1026	\N	1000000.0	\N	1	2015-09-01 15:08:56.747
123641	941	1027	\N	369122.4244	\N	1	2015-09-01 15:08:56.752
123642	941	1028	\N	226678.8991	\N	1	2015-09-01 15:08:56.758
123643	941	1029	\N	1000000.0	\N	1	2015-09-01 15:08:56.765
123644	941	1030	\N	1000000.0	\N	1	2015-09-01 15:08:56.771
123645	941	1031	\N	1000000.0	\N	1	2015-09-01 15:08:56.776
123646	941	1032	\N	1000000.0	\N	1	2015-09-01 15:08:56.781
123647	941	1033	\N	1000000.0	\N	1	2015-09-01 15:08:56.787
123648	941	1034	\N	1000000.0	\N	1	2015-09-01 15:08:56.792
123649	941	1035	\N	1000000.0	\N	1	2015-09-01 15:08:56.798
123650	941	1036	\N	1000000.0	\N	1	2015-09-01 15:08:56.803
123651	941	1037	\N	1000000.0	\N	1	2015-09-01 15:08:56.809
123652	941	1038	\N	1000000.0	\N	1	2015-09-01 15:08:56.814
123653	941	1039	\N	1000000.0	\N	1	2015-09-01 15:08:56.82
123654	941	1040	\N	1000000.0	\N	1	2015-09-01 15:08:56.826
123655	941	1041	\N	1000000.0	\N	1	2015-09-01 15:08:56.831
123656	941	1042	\N	1000000.0	\N	1	2015-09-01 15:08:56.836
123657	941	1043	\N	1000000.0	\N	1	2015-09-01 15:08:56.841
123658	941	1044	\N	1000000.0	\N	1	2015-09-01 15:08:56.847
123659	941	1045	\N	1000000.0	\N	1	2015-09-01 15:08:56.853
123660	941	1046	\N	1000000.0	\N	1	2015-09-01 15:08:56.859
123661	942	1022	\N	65.80000006	\N	1	2015-09-01 15:08:56.874
123662	942	1023	\N	4.27	\N	1	2015-09-01 15:08:56.882
123663	942	1024	\N	322.53	\N	1	2015-09-01 15:08:56.888
123664	942	1025	\N	192749.3409	\N	1	2015-09-01 15:08:56.896
123665	942	1026	\N	30.0	\N	1	2015-09-01 15:08:56.901
123666	942	1027	\N	362720.8752	\N	1	2015-09-01 15:08:56.906
123667	942	1028	\N	255426.9346	\N	1	2015-09-01 15:08:56.913
123668	942	1029	\N	1000000.0	\N	1	2015-09-01 15:08:56.92
123669	942	1030	\N	1000000.0	\N	1	2015-09-01 15:08:56.926
123670	942	1031	\N	1000000.0	\N	1	2015-09-01 15:08:56.931
123671	942	1032	\N	1000000.0	\N	1	2015-09-01 15:08:56.936
123672	942	1033	\N	1000000.0	\N	1	2015-09-01 15:08:56.943
123673	942	1034	\N	1000000.0	\N	1	2015-09-01 15:08:56.948
123674	942	1035	\N	1000000.0	\N	1	2015-09-01 15:08:56.955
123675	942	1036	\N	1.856	\N	1	2015-09-01 15:08:56.96
123676	942	1037	\N	1000000.0	\N	1	2015-09-01 15:08:56.966
123677	942	1038	\N	1000000.0	\N	1	2015-09-01 15:08:56.972
123678	942	1039	\N	1000000.0	\N	1	2015-09-01 15:08:56.978
123679	942	1040	\N	1000000.0	\N	1	2015-09-01 15:08:56.983
123680	942	1041	\N	1000000.0	\N	1	2015-09-01 15:08:56.99
123681	942	1042	\N	1000000.0	\N	1	2015-09-01 15:08:56.995
123682	942	1043	\N	1000000.0	\N	1	2015-09-01 15:08:57.001
123683	942	1044	\N	1000000.0	\N	1	2015-09-01 15:08:57.007
123684	942	1045	\N	1000000.0	\N	1	2015-09-01 15:08:57.013
123685	942	1046	\N	1000000.0	\N	1	2015-09-01 15:08:57.018
123686	943	1022	\N	1000000.0	\N	1	2015-09-01 15:08:57.034
123687	943	1023	\N	1.495	\N	1	2015-09-01 15:08:57.042
123688	943	1024	\N	357.771	\N	1	2015-09-01 15:08:57.048
123689	943	1025	\N	1000000.0	\N	1	2015-09-01 15:08:57.055
123690	943	1026	\N	1000000.0	\N	1	2015-09-01 15:08:57.061
123691	943	1027	\N	1000000.0	\N	1	2015-09-01 15:08:57.067
123692	943	1028	\N	1000000.0	\N	1	2015-09-01 15:08:57.073
123693	943	1029	\N	1000000.0	\N	1	2015-09-01 15:08:57.081
123694	943	1030	\N	1000000.0	\N	1	2015-09-01 15:08:57.086
123695	943	1031	\N	1000000.0	\N	1	2015-09-01 15:08:57.092
123696	943	1032	\N	1000000.0	\N	1	2015-09-01 15:08:57.097
123697	943	1033	\N	1000000.0	\N	1	2015-09-01 15:08:57.103
123698	943	1034	\N	1000000.0	\N	1	2015-09-01 15:08:57.109
123699	943	1035	\N	1000000.0	\N	1	2015-09-01 15:08:57.114
123700	943	1036	\N	1000000.0	\N	1	2015-09-01 15:08:57.119
123701	943	1037	\N	1000000.0	\N	1	2015-09-01 15:08:57.125
123702	943	1038	\N	1000000.0	\N	1	2015-09-01 15:08:57.131
123703	943	1039	\N	1000000.0	\N	1	2015-09-01 15:08:57.136
123704	943	1040	\N	1000000.0	\N	1	2015-09-01 15:08:57.142
123705	943	1041	\N	1000000.0	\N	1	2015-09-01 15:08:57.147
123706	943	1042	\N	1000000.0	\N	1	2015-09-01 15:08:57.153
123707	943	1043	\N	1000000.0	\N	1	2015-09-01 15:08:57.159
123708	943	1044	\N	1000000.0	\N	1	2015-09-01 15:08:57.164
123709	943	1045	\N	1000000.0	\N	1	2015-09-01 15:08:57.17
123710	943	1046	\N	1000000.0	\N	1	2015-09-01 15:08:57.175
123711	944	1022	\N	38.3	\N	1	2015-09-01 15:08:57.193
123712	944	1023	\N	4.079	\N	1	2015-09-01 15:08:57.201
123713	944	1024	\N	274.402	\N	1	2015-09-01 15:08:57.206
123714	944	1025	\N	192425.3991	\N	1	2015-09-01 15:08:57.214
123715	944	1026	\N	27.0	\N	1	2015-09-01 15:08:57.221
123716	944	1027	\N	351733.6868	\N	1	2015-09-01 15:08:57.227
123717	944	1028	\N	209928.6274	\N	1	2015-09-01 15:08:57.232
123718	944	1029	\N	1000000.0	\N	1	2015-09-01 15:08:57.239
123719	944	1030	\N	1000000.0	\N	1	2015-09-01 15:08:57.245
123720	944	1031	\N	1000000.0	\N	1	2015-09-01 15:08:57.252
123721	944	1032	\N	1000000.0	\N	1	2015-09-01 15:08:57.259
123722	944	1033	\N	1000000.0	\N	1	2015-09-01 15:08:57.264
123723	944	1034	\N	1000000.0	\N	1	2015-09-01 15:08:57.27
123724	944	1035	\N	1000000.0	\N	1	2015-09-01 15:08:57.276
123725	944	1036	\N	1000000.0	\N	1	2015-09-01 15:08:57.282
123726	944	1037	\N	1000000.0	\N	1	2015-09-01 15:08:57.288
123727	944	1038	\N	1000000.0	\N	1	2015-09-01 15:08:57.293
123728	944	1039	\N	1000000.0	\N	1	2015-09-01 15:08:57.299
123729	944	1040	\N	1000000.0	\N	1	2015-09-01 15:08:57.304
123730	944	1041	\N	1000000.0	\N	1	2015-09-01 15:08:57.31
123731	944	1042	\N	1000000.0	\N	1	2015-09-01 15:08:57.316
123732	944	1043	\N	1000000.0	\N	1	2015-09-01 15:08:57.322
123733	944	1044	\N	1000000.0	\N	1	2015-09-01 15:08:57.327
123734	944	1045	\N	1000000.0	\N	1	2015-09-01 15:08:57.332
123735	944	1046	\N	1000000.0	\N	1	2015-09-01 15:08:57.34
123736	945	1022	\N	28.90000002	\N	1	2015-09-01 15:08:57.357
123737	945	1023	\N	3.793	\N	1	2015-09-01 15:08:57.365
123738	945	1024	\N	349.059	\N	1	2015-09-01 15:08:57.372
123739	945	1025	\N	1000000.0	\N	1	2015-09-01 15:08:57.38
123740	945	1026	\N	1000000.0	\N	1	2015-09-01 15:08:57.386
123741	945	1027	\N	1000000.0	\N	1	2015-09-01 15:08:57.393
123742	945	1028	\N	765700.7597	\N	1	2015-09-01 15:08:57.398
123743	945	1029	\N	1000000.0	\N	1	2015-09-01 15:08:57.407
123744	945	1030	\N	1000000.0	\N	1	2015-09-01 15:08:57.413
123745	945	1031	\N	1000000.0	\N	1	2015-09-01 15:08:57.419
123746	945	1032	\N	1000000.0	\N	1	2015-09-01 15:08:57.424
123747	945	1033	\N	1000000.0	\N	1	2015-09-01 15:08:57.429
123748	945	1034	\N	1000000.0	\N	1	2015-09-01 15:08:57.435
123749	945	1035	\N	1000000.0	\N	1	2015-09-01 15:08:57.441
123750	945	1036	\N	1000000.0	\N	1	2015-09-01 15:08:57.447
123751	945	1037	\N	1000000.0	\N	1	2015-09-01 15:08:57.452
123752	945	1038	\N	1000000.0	\N	1	2015-09-01 15:08:57.457
123753	945	1039	\N	1000000.0	\N	1	2015-09-01 15:08:57.464
123754	945	1040	\N	1000000.0	\N	1	2015-09-01 15:08:57.471
123755	945	1041	\N	1000000.0	\N	1	2015-09-01 15:08:57.479
123756	945	1042	\N	1000000.0	\N	1	2015-09-01 15:08:57.486
123757	945	1043	\N	1000000.0	\N	1	2015-09-01 15:08:57.494
123758	945	1044	\N	1000000.0	\N	1	2015-09-01 15:08:57.501
123759	945	1045	\N	1000000.0	\N	1	2015-09-01 15:08:57.508
123760	945	1046	\N	1000000.0	\N	1	2015-09-01 15:08:57.514
123761	946	1022	\N	1000000.0	\N	1	2015-09-01 15:08:57.534
123762	946	1023	\N	4.4	\N	1	2015-09-01 15:08:57.55
123763	946	1024	\N	349.745	\N	1	2015-09-01 15:08:57.562
123764	946	1025	\N	1000000.0	\N	1	2015-09-01 15:08:57.574
123765	946	1026	\N	1000000.0	\N	1	2015-09-01 15:08:57.579
123766	946	1027	\N	1000000.0	\N	1	2015-09-01 15:08:57.586
123767	946	1028	\N	682954.2157	\N	1	2015-09-01 15:08:57.592
123768	946	1029	\N	1000000.0	\N	1	2015-09-01 15:08:57.6
123769	946	1030	\N	1000000.0	\N	1	2015-09-01 15:08:57.606
123770	946	1031	\N	1000000.0	\N	1	2015-09-01 15:08:57.611
123771	946	1032	\N	1000000.0	\N	1	2015-09-01 15:08:57.617
123772	946	1033	\N	1000000.0	\N	1	2015-09-01 15:08:57.623
123773	946	1034	\N	1000000.0	\N	1	2015-09-01 15:08:57.628
123774	946	1035	\N	1000000.0	\N	1	2015-09-01 15:08:57.634
123775	946	1036	\N	1000000.0	\N	1	2015-09-01 15:08:57.64
123776	946	1037	\N	1000000.0	\N	1	2015-09-01 15:08:57.646
123777	946	1038	\N	1000000.0	\N	1	2015-09-01 15:08:57.652
123778	946	1039	\N	1000000.0	\N	1	2015-09-01 15:08:57.658
123779	946	1040	\N	1000000.0	\N	1	2015-09-01 15:08:57.664
123780	946	1041	\N	1000000.0	\N	1	2015-09-01 15:08:57.67
123781	946	1042	\N	1000000.0	\N	1	2015-09-01 15:08:57.676
123782	946	1043	\N	1000000.0	\N	1	2015-09-01 15:08:57.682
123783	946	1044	\N	1000000.0	\N	1	2015-09-01 15:08:57.689
123784	946	1045	\N	1000000.0	\N	1	2015-09-01 15:08:57.695
123785	946	1046	\N	1000000.0	\N	1	2015-09-01 15:08:57.7
123786	947	1022	\N	1000000.0	\N	1	2015-09-01 15:08:57.72
123787	947	1023	\N	3.487	\N	1	2015-09-01 15:08:57.728
123788	947	1024	\N	303.15	\N	1	2015-09-01 15:08:57.733
123789	947	1025	\N	5136.540337	\N	1	2015-09-01 15:08:57.747
123790	947	1026	\N	1000000.0	\N	1	2015-09-01 15:08:57.76
123791	947	1027	\N	1000000.0	\N	1	2015-09-01 15:08:57.772
123792	947	1028	\N	553769.3152	\N	1	2015-09-01 15:08:57.782
123793	947	1029	\N	1000000.0	\N	1	2015-09-01 15:08:57.8
123794	947	1030	\N	1000000.0	\N	1	2015-09-01 15:08:57.812
123795	947	1031	\N	1000000.0	\N	1	2015-09-01 15:08:57.823
123796	947	1032	\N	1000000.0	\N	1	2015-09-01 15:08:57.833
123797	947	1033	\N	1000000.0	\N	1	2015-09-01 15:08:57.844
123798	947	1034	\N	1000000.0	\N	1	2015-09-01 15:08:57.856
123799	947	1035	\N	1000000.0	\N	1	2015-09-01 15:08:57.867
123800	947	1036	\N	1000000.0	\N	1	2015-09-01 15:08:57.878
123801	947	1037	\N	1000000.0	\N	1	2015-09-01 15:08:57.89
123802	947	1038	\N	1000000.0	\N	1	2015-09-01 15:08:57.902
123803	947	1039	\N	1000000.0	\N	1	2015-09-01 15:08:57.913
123804	947	1040	\N	1000000.0	\N	1	2015-09-01 15:08:57.926
123805	947	1041	\N	11.79	\N	1	2015-09-01 15:08:57.937
123806	947	1042	\N	7.96	\N	1	2015-09-01 15:08:57.948
123807	947	1043	\N	1000000.0	\N	1	2015-09-01 15:08:57.96
123808	947	1044	\N	1000000.0	\N	1	2015-09-01 15:08:57.971
123809	947	1045	\N	1000000.0	\N	1	2015-09-01 15:08:57.982
123810	947	1046	\N	1000000.0	\N	1	2015-09-01 15:08:57.995
123811	948	1022	\N	1000000.0	\N	1	2015-09-01 15:08:58.032
123812	948	1023	\N	2.571	\N	1	2015-09-01 15:08:58.05
123813	948	1024	\N	239.701	\N	1	2015-09-01 15:08:58.062
123814	948	1025	\N	1000000.0	\N	1	2015-09-01 15:08:58.08
123815	948	1026	\N	1000000.0	\N	1	2015-09-01 15:08:58.092
123816	948	1027	\N	334187.5592	\N	1	2015-09-01 15:08:58.103
123817	948	1028	\N	472894.5096	\N	1	2015-09-01 15:08:58.115
123818	948	1029	\N	1000000.0	\N	1	2015-09-01 15:08:58.132
123819	948	1030	\N	1000000.0	\N	1	2015-09-01 15:08:58.144
123820	948	1031	\N	1000000.0	\N	1	2015-09-01 15:08:58.157
123821	948	1032	\N	1000000.0	\N	1	2015-09-01 15:08:58.169
123822	948	1033	\N	1000000.0	\N	1	2015-09-01 15:08:58.182
123823	948	1034	\N	1000000.0	\N	1	2015-09-01 15:08:58.193
123824	948	1035	\N	1000000.0	\N	1	2015-09-01 15:08:58.205
123825	948	1036	\N	1000000.0	\N	1	2015-09-01 15:08:58.217
123826	948	1037	\N	1000000.0	\N	1	2015-09-01 15:08:58.228
123827	948	1038	\N	1000000.0	\N	1	2015-09-01 15:08:58.24
123828	948	1039	\N	1000000.0	\N	1	2015-09-01 15:08:58.251
123829	948	1040	\N	1000000.0	\N	1	2015-09-01 15:08:58.263
123830	948	1041	\N	1000000.0	\N	1	2015-09-01 15:08:58.274
123831	948	1042	\N	1000000.0	\N	1	2015-09-01 15:08:58.285
123832	948	1043	\N	1000000.0	\N	1	2015-09-01 15:08:58.299
123833	948	1044	\N	1000000.0	\N	1	2015-09-01 15:08:58.389
123834	948	1045	\N	1000000.0	\N	1	2015-09-01 15:08:58.395
123835	948	1046	\N	1000000.0	\N	1	2015-09-01 15:08:58.401
122760	905	1046	\N	100fgh	\N	1	2015-09-01 15:08:51.779
122785	906	1046	\N	f45	\N	1	2015-09-01 15:08:51.883
\.


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('results_id_seq', 123835, true);


--
-- Data for Name: resultshistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resultshistory (id, results, oldnumresult, oldstrresult, oldboolresult, newnumresult, newstrresult, newboolresult, updatedby, updateddt) FROM stdin;
7929	122661	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7930	122662	\N	\N	\N	\N	3.73	\N	1	2015-09-01 00:00:00
7931	122663	\N	\N	\N	\N	361.661	\N	1	2015-09-01 00:00:00
7932	122664	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7933	122665	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7934	122666	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7935	122667	\N	\N	\N	\N	560801.0973	\N	1	2015-09-01 00:00:00
7936	122668	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7937	122669	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7938	122670	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7939	122671	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7940	122672	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7941	122673	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7942	122674	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7943	122675	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7944	122676	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7945	122677	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7946	122678	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7947	122679	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7948	122680	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7949	122681	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7950	122682	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7951	122683	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7952	122684	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7953	122685	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7954	122686	\N	\N	\N	\N	64.30000001	\N	1	2015-09-01 00:00:00
7955	122687	\N	\N	\N	\N	3.154	\N	1	2015-09-01 00:00:00
7956	122688	\N	\N	\N	\N	269.77	\N	1	2015-09-01 00:00:00
7957	122689	\N	\N	\N	\N	184516.032	\N	1	2015-09-01 00:00:00
7958	122690	\N	\N	\N	\N	7.0	\N	1	2015-09-01 00:00:00
7959	122691	\N	\N	\N	\N	599535.8053	\N	1	2015-09-01 00:00:00
7960	122692	\N	\N	\N	\N	276858.8667	\N	1	2015-09-01 00:00:00
7961	122693	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7962	122694	\N	\N	\N	\N	36.0	\N	1	2015-09-01 00:00:00
7963	122695	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7964	122696	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7965	122697	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7966	122698	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7967	122699	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7968	122700	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7969	122701	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7970	122702	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7971	122703	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7972	122704	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7973	122705	\N	\N	\N	\N	15.35	\N	1	2015-09-01 00:00:00
7974	122706	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7975	122707	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7976	122708	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7977	122709	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7978	122710	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7979	122711	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7980	122712	\N	\N	\N	\N	1.032	\N	1	2015-09-01 00:00:00
7981	122713	\N	\N	\N	\N	190.26	\N	1	2015-09-01 00:00:00
7982	122714	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7983	122715	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7984	122716	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7985	122717	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7986	122718	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7987	122719	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7988	122720	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7989	122721	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7990	122722	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7991	122723	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7992	122724	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7993	122725	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7994	122726	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7995	122727	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7996	122728	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7997	122729	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7998	122730	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
7999	122731	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8000	122732	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8001	122733	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8002	122734	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8003	122735	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8004	122736	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8005	122737	\N	\N	\N	\N	3.401	\N	1	2015-09-01 00:00:00
8006	122738	\N	\N	\N	\N	227.327	\N	1	2015-09-01 00:00:00
8007	122739	\N	\N	\N	\N	16586.61894	\N	1	2015-09-01 00:00:00
8008	122740	\N	\N	\N	\N	35.0	\N	1	2015-09-01 00:00:00
8009	122741	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8010	122742	\N	\N	\N	\N	568055.059	\N	1	2015-09-01 00:00:00
8011	122743	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8012	122744	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8013	122745	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8014	122746	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8015	122747	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8016	122748	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8017	122749	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8018	122750	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8019	122751	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8020	122752	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8021	122753	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8022	122754	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8023	122755	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8024	122756	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8025	122757	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8026	122758	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8027	122759	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8028	122760	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8029	122761	\N	\N	\N	\N	29.39999997	\N	1	2015-09-01 00:00:00
8030	122762	\N	\N	\N	\N	5.497	\N	1	2015-09-01 00:00:00
8031	122763	\N	\N	\N	\N	293.411	\N	1	2015-09-01 00:00:00
8032	122764	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8033	122765	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8034	122766	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8035	122767	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8036	122768	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8037	122769	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8038	122770	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8039	122771	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8040	122772	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8041	122773	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8042	122774	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8043	122775	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8044	122776	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8045	122777	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8046	122778	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8047	122779	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8048	122780	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8049	122781	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8050	122782	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8051	122783	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8052	122784	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8053	122785	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8054	122786	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8055	122787	\N	\N	\N	\N	3.101	\N	1	2015-09-01 00:00:00
8056	122788	\N	\N	\N	\N	275.524	\N	1	2015-09-01 00:00:00
8057	122789	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8058	122790	\N	\N	\N	\N	51.0	\N	1	2015-09-01 00:00:00
8059	122791	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8060	122792	\N	\N	\N	\N	682450.1572	\N	1	2015-09-01 00:00:00
8061	122793	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8062	122794	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8063	122795	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8064	122796	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8065	122797	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8066	122798	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8067	122799	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8068	122800	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8069	122801	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8070	122802	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8071	122803	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8072	122804	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8073	122805	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8074	122806	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8075	122807	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8076	122808	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8077	122809	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8078	122810	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8079	122811	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8080	122812	\N	\N	\N	\N	-0.071	\N	1	2015-09-01 00:00:00
8081	122813	\N	\N	\N	\N	230.238	\N	1	2015-09-01 00:00:00
8082	122814	\N	\N	\N	\N	36845.62222	\N	1	2015-09-01 00:00:00
8083	122815	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8084	122816	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8085	122817	\N	\N	\N	\N	822842.6156	\N	1	2015-09-01 00:00:00
8086	122818	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8087	122819	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8088	122820	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8089	122821	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8090	122822	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8091	122823	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8092	122824	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8093	122825	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8094	122826	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8095	122827	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8096	122828	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8097	122829	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8098	122830	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8099	122831	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8100	122832	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8101	122833	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8102	122834	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8103	122835	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8104	122836	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8105	122837	\N	\N	\N	\N	2.609	\N	1	2015-09-01 00:00:00
8106	122838	\N	\N	\N	\N	215.685	\N	1	2015-09-01 00:00:00
8107	122839	\N	\N	\N	\N	192525.1417	\N	1	2015-09-01 00:00:00
8108	122840	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8109	122841	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8110	122842	\N	\N	\N	\N	827989.364	\N	1	2015-09-01 00:00:00
8111	122843	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8112	122844	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8113	122845	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8114	122846	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8115	122847	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8116	122848	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8117	122849	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8118	122850	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8119	122851	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8120	122852	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8121	122853	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8122	122854	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8123	122855	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8124	122856	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8125	122857	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8126	122858	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8127	122859	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8128	122860	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8129	122861	\N	\N	\N	\N	40.60000004	\N	1	2015-09-01 00:00:00
8130	122862	\N	\N	\N	\N	0.318	\N	1	2015-09-01 00:00:00
8131	122863	\N	\N	\N	\N	324.675	\N	1	2015-09-01 00:00:00
8132	122864	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8133	122865	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8134	122866	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8135	122867	\N	\N	\N	\N	663118.7162	\N	1	2015-09-01 00:00:00
8136	122868	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8137	122869	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8138	122870	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8139	122871	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8140	122872	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8141	122873	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8142	122874	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8143	122875	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8144	122876	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8145	122877	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8146	122878	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8147	122879	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8148	122880	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8149	122881	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8150	122882	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8151	122883	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8152	122884	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8153	122885	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8154	122886	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8155	122887	\N	\N	\N	\N	2.605	\N	1	2015-09-01 00:00:00
8156	122888	\N	\N	\N	\N	317.317	\N	1	2015-09-01 00:00:00
8157	122889	\N	\N	\N	\N	1307.088754	\N	1	2015-09-01 00:00:00
8158	122890	\N	\N	\N	\N	13.0	\N	1	2015-09-01 00:00:00
8159	122891	\N	\N	\N	\N	607581.9913	\N	1	2015-09-01 00:00:00
8160	122892	\N	\N	\N	\N	271450.9466	\N	1	2015-09-01 00:00:00
8161	122893	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8162	122894	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8163	122895	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8164	122896	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8165	122897	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8166	122898	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8167	122899	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8168	122900	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8169	122901	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8170	122902	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8171	122903	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8172	122904	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8173	122905	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8174	122906	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8175	122907	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8176	122908	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8177	122909	\N	\N	\N	\N	52.0	\N	1	2015-09-01 00:00:00
8178	122910	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8179	122911	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8180	122912	\N	\N	\N	\N	2.745	\N	1	2015-09-01 00:00:00
8181	122913	\N	\N	\N	\N	403.393	\N	1	2015-09-01 00:00:00
8182	122914	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8183	122915	\N	\N	\N	\N	24.0	\N	1	2015-09-01 00:00:00
8184	122916	\N	\N	\N	\N	577460.7174	\N	1	2015-09-01 00:00:00
8185	122917	\N	\N	\N	\N	192178.0797	\N	1	2015-09-01 00:00:00
8186	122918	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8187	122919	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8188	122920	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8189	122921	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8190	122922	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8191	122923	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8192	122924	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8193	122925	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8194	122926	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8195	122927	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8196	122928	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8197	122929	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8198	122930	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8199	122931	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8200	122932	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8201	122933	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8202	122934	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8203	122935	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8204	122936	\N	\N	\N	\N	89.40000004	\N	1	2015-09-01 00:00:00
8205	122937	\N	\N	\N	\N	1.867	\N	1	2015-09-01 00:00:00
8206	122938	\N	\N	\N	\N	223.228	\N	1	2015-09-01 00:00:00
8207	122939	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8208	122940	\N	\N	\N	\N	55.0	\N	1	2015-09-01 00:00:00
8209	122941	\N	\N	\N	\N	607581.9913	\N	1	2015-09-01 00:00:00
8210	122942	\N	\N	\N	\N	580674.3072	\N	1	2015-09-01 00:00:00
8211	122943	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8212	122944	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8213	122945	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8214	122946	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8215	122947	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8216	122948	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8217	122949	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8218	122950	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8219	122951	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8220	122952	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8221	122953	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8222	122954	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8223	122955	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8224	122956	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8225	122957	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8226	122958	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8227	122959	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8228	122960	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8229	122961	\N	\N	\N	\N	70.5	\N	1	2015-09-01 00:00:00
8230	122962	\N	\N	\N	\N	5.286	\N	1	2015-09-01 00:00:00
8231	122963	\N	\N	\N	\N	335.282	\N	1	2015-09-01 00:00:00
8232	122964	\N	\N	\N	\N	1200.247469	\N	1	2015-09-01 00:00:00
8233	122965	\N	\N	\N	\N	14.0	\N	1	2015-09-01 00:00:00
8234	122966	\N	\N	\N	\N	599535.8053	\N	1	2015-09-01 00:00:00
8235	122967	\N	\N	\N	\N	384862.1525	\N	1	2015-09-01 00:00:00
8236	122968	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8237	122969	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8238	122970	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8239	122971	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8240	122972	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8241	122973	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8242	122974	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8243	122975	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8244	122976	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8245	122977	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8246	122978	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8247	122979	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8248	122980	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8249	122981	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8250	122982	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8251	122983	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8252	122984	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8253	122985	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8254	122986	\N	\N	\N	\N	11.10000001	\N	1	2015-09-01 00:00:00
8255	122987	\N	\N	\N	\N	2.097	\N	1	2015-09-01 00:00:00
8256	122988	\N	\N	\N	\N	290.321	\N	1	2015-09-01 00:00:00
8257	122989	\N	\N	\N	\N	172756.9766	\N	1	2015-09-01 00:00:00
8258	122990	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8259	122991	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8260	122992	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8261	122993	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8262	122994	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8263	122995	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8264	122996	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8265	122997	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8266	122998	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8267	122999	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8268	123000	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8269	123001	\N	\N	\N	\N	14.12537545	\N	1	2015-09-01 00:00:00
8270	123002	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8271	123003	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8272	123004	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8273	123005	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8274	123006	\N	\N	\N	\N	11.74	\N	1	2015-09-01 00:00:00
8275	123007	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8276	123008	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8277	123009	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8278	123010	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8279	123011	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8280	123012	\N	\N	\N	\N	1.82	\N	1	2015-09-01 00:00:00
8281	123013	\N	\N	\N	\N	410.401	\N	1	2015-09-01 00:00:00
8282	123014	\N	\N	\N	\N	12500.39888	\N	1	2015-09-01 00:00:00
8283	123015	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8284	123016	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8285	123017	\N	\N	\N	\N	695198.0604	\N	1	2015-09-01 00:00:00
8286	123018	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8287	123019	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8288	123020	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8289	123021	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8290	123022	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8291	123023	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8292	123024	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8293	123025	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8294	123026	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8295	123027	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8296	123028	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8297	123029	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8298	123030	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8299	123031	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8300	123032	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8301	123033	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8302	123034	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8303	123035	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8304	123036	\N	\N	\N	\N	62.20000004	\N	1	2015-09-01 00:00:00
8305	123037	\N	\N	\N	\N	4.355	\N	1	2015-09-01 00:00:00
8306	123038	\N	\N	\N	\N	397.502	\N	1	2015-09-01 00:00:00
8307	123039	\N	\N	\N	\N	4156.197253	\N	1	2015-09-01 00:00:00
8308	123040	\N	\N	\N	\N	0.84	\N	1	2015-09-01 00:00:00
8309	123041	\N	\N	\N	\N	578463.0637	\N	1	2015-09-01 00:00:00
8310	123042	\N	\N	\N	\N	300152.8487	\N	1	2015-09-01 00:00:00
8311	123043	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8312	123044	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8313	123045	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8314	123046	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8315	123047	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8316	123048	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8317	123049	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8318	123050	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8319	123051	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8320	123052	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8321	123053	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8322	123054	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8323	123055	\N	\N	\N	\N	1.57	\N	1	2015-09-01 00:00:00
8324	123056	\N	\N	\N	\N	3.209	\N	1	2015-09-01 00:00:00
8325	123057	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8326	123058	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8327	123059	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8328	123060	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8329	123061	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8330	123062	\N	\N	\N	\N	1.821	\N	1	2015-09-01 00:00:00
8331	123063	\N	\N	\N	\N	240.276	\N	1	2015-09-01 00:00:00
8332	123064	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8333	123065	\N	\N	\N	\N	29.0	\N	1	2015-09-01 00:00:00
8334	123066	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8335	123067	\N	\N	\N	\N	398719.8874	\N	1	2015-09-01 00:00:00
8336	123068	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8337	123069	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8338	123070	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8339	123071	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8340	123072	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8341	123073	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8342	123074	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8343	123075	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8344	123076	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8345	123077	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8346	123078	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8347	123079	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8348	123080	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8349	123081	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8350	123082	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8351	123083	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8352	123084	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8353	123085	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8354	123086	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8355	123087	\N	\N	\N	\N	3.474	\N	1	2015-09-01 00:00:00
8356	123088	\N	\N	\N	\N	300.357	\N	1	2015-09-01 00:00:00
8357	123089	\N	\N	\N	\N	37851.92995	\N	1	2015-09-01 00:00:00
8358	123090	\N	\N	\N	\N	11.0	\N	1	2015-09-01 00:00:00
8359	123091	\N	\N	\N	\N	363985.2207	\N	1	2015-09-01 00:00:00
8360	123092	\N	\N	\N	\N	319306.3429	\N	1	2015-09-01 00:00:00
8361	123093	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8362	123094	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8363	123095	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8364	123096	\N	\N	\N	\N	49.0	\N	1	2015-09-01 00:00:00
8365	123097	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8366	123098	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8367	123099	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8368	123100	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8369	123101	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8370	123102	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8371	123103	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8372	123104	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8373	123105	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8374	123106	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8375	123107	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8376	123108	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8377	123109	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8378	123110	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8379	123111	\N	\N	\N	\N	34.3	\N	1	2015-09-01 00:00:00
8380	123112	\N	\N	\N	\N	7.084	\N	1	2015-09-01 00:00:00
8381	123113	\N	\N	\N	\N	422.874	\N	1	2015-09-01 00:00:00
8382	123114	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8383	123115	\N	\N	\N	\N	21.0	\N	1	2015-09-01 00:00:00
8384	123116	\N	\N	\N	\N	600357.7015	\N	1	2015-09-01 00:00:00
8385	123117	\N	\N	\N	\N	371518.7327	\N	1	2015-09-01 00:00:00
8386	123118	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8387	123119	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8388	123120	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8389	123121	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8390	123122	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8391	123123	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8392	123124	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8393	123125	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8394	123126	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8395	123127	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8396	123128	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8397	123129	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8398	123130	\N	\N	\N	\N	28.42	\N	1	2015-09-01 00:00:00
8399	123131	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8400	123132	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8401	123133	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8402	123134	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8403	123135	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8404	123136	\N	\N	\N	\N	61.50000003	\N	1	2015-09-01 00:00:00
8405	123137	\N	\N	\N	\N	3.317	\N	1	2015-09-01 00:00:00
8406	123138	\N	\N	\N	\N	228.29	\N	1	2015-09-01 00:00:00
8407	123139	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8408	123140	\N	\N	\N	\N	28.0	\N	1	2015-09-01 00:00:00
8409	123141	\N	\N	\N	\N	7329.166251	\N	1	2015-09-01 00:00:00
8410	123142	\N	\N	\N	\N	24652.84851	\N	1	2015-09-01 00:00:00
8411	123143	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8412	123144	\N	\N	\N	\N	73.0	\N	1	2015-09-01 00:00:00
8413	123145	\N	\N	\N	\N	1.723	\N	1	2015-09-01 00:00:00
8414	123146	\N	\N	\N	\N	17.0	\N	1	2015-09-01 00:00:00
8415	123147	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8416	123148	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8417	123149	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8418	123150	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8419	123151	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8420	123152	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8421	123153	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8422	123154	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8423	123155	\N	\N	\N	\N	20.53	\N	1	2015-09-01 00:00:00
8424	123156	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8425	123157	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8426	123158	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8427	123159	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8428	123160	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8429	123161	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8430	123162	\N	\N	\N	\N	NaN	\N	1	2015-09-01 00:00:00
8431	123163	\N	\N	\N	\N	NaN	\N	1	2015-09-01 00:00:00
8432	123164	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8433	123165	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8434	123166	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8435	123167	\N	\N	\N	\N	837734.4982	\N	1	2015-09-01 00:00:00
8436	123168	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8437	123169	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8438	123170	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8439	123171	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8440	123172	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8441	123173	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8442	123174	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8443	123175	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8444	123176	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8445	123177	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8446	123178	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8447	123179	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8448	123180	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8449	123181	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8450	123182	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8451	123183	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8452	123184	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8453	123185	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8454	123186	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8455	123187	\N	\N	\N	\N	4.74	\N	1	2015-09-01 00:00:00
8456	123188	\N	\N	\N	\N	343.212	\N	1	2015-09-01 00:00:00
8457	123189	\N	\N	\N	\N	239.9372946	\N	1	2015-09-01 00:00:00
8458	123190	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8459	123191	\N	\N	\N	\N	590973.7466	\N	1	2015-09-01 00:00:00
8460	123192	\N	\N	\N	\N	455997.5645	\N	1	2015-09-01 00:00:00
8461	123193	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8462	123194	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8463	123195	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8464	123196	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8465	123197	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8466	123198	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8467	123199	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8468	123200	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8469	123201	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8470	123202	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8471	123203	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8472	123204	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8473	123205	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8474	123206	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8475	123207	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8476	123208	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8477	123209	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8478	123210	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8479	123211	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8480	123212	\N	\N	\N	\N	1.807	\N	1	2015-09-01 00:00:00
8481	123213	\N	\N	\N	\N	261.118	\N	1	2015-09-01 00:00:00
8482	123214	\N	\N	\N	\N	1218.748428	\N	1	2015-09-01 00:00:00
8483	123215	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8484	123216	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8485	123217	\N	\N	\N	\N	833618.7997	\N	1	2015-09-01 00:00:00
8486	123218	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8487	123219	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8488	123220	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8489	123221	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8490	123222	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8491	123223	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8492	123224	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8493	123225	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8494	123226	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8495	123227	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8496	123228	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8497	123229	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8498	123230	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8499	123231	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8500	123232	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8501	123233	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8502	123234	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8503	123235	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8504	123236	\N	\N	\N	\N	86.20000003	\N	1	2015-09-01 00:00:00
8505	123237	\N	\N	\N	\N	1.898	\N	1	2015-09-01 00:00:00
8506	123238	\N	\N	\N	\N	276.915	\N	1	2015-09-01 00:00:00
8507	123239	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8508	123240	\N	\N	\N	\N	47.0	\N	1	2015-09-01 00:00:00
8509	123241	\N	\N	\N	\N	344793.7101	\N	1	2015-09-01 00:00:00
8510	123242	\N	\N	\N	\N	223232.2049	\N	1	2015-09-01 00:00:00
8511	123243	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8512	123244	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8513	123245	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8514	123246	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8515	123247	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8516	123248	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8517	123249	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8518	123250	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8519	123251	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8520	123252	\N	\N	\N	\N	67.2	\N	1	2015-09-01 00:00:00
8521	123253	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8522	123254	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8523	123255	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8524	123256	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8525	123257	\N	\N	\N	\N	15.24	\N	1	2015-09-01 00:00:00
8526	123258	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8527	123259	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8528	123260	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8529	123261	\N	\N	\N	\N	47.60000003	\N	1	2015-09-01 00:00:00
8530	123262	\N	\N	\N	\N	4.816	\N	1	2015-09-01 00:00:00
8531	123263	\N	\N	\N	\N	305.437	\N	1	2015-09-01 00:00:00
8532	123264	\N	\N	\N	\N	178099.941	\N	1	2015-09-01 00:00:00
8533	123265	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8534	123266	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8535	123267	\N	\N	\N	\N	263070.0724	\N	1	2015-09-01 00:00:00
8536	123268	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8537	123269	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8538	123270	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8539	123271	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8540	123272	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8541	123273	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8542	123274	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8543	123275	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8544	123276	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8545	123277	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8546	123278	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8547	123279	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8548	123280	\N	\N	\N	\N	11.57	\N	1	2015-09-01 00:00:00
8549	123281	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8550	123282	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8551	123283	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8552	123284	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8553	123285	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8554	123286	\N	\N	\N	\N	46.00000003	\N	1	2015-09-01 00:00:00
8555	123287	\N	\N	\N	\N	3.817	\N	1	2015-09-01 00:00:00
8556	123288	\N	\N	\N	\N	311.851	\N	1	2015-09-01 00:00:00
8557	123289	\N	\N	\N	\N	980.1583415	\N	1	2015-09-01 00:00:00
8558	123290	\N	\N	\N	\N	0.81	\N	1	2015-09-01 00:00:00
8559	123291	\N	\N	\N	\N	606262.3878	\N	1	2015-09-01 00:00:00
8560	123292	\N	\N	\N	\N	295867.6056	\N	1	2015-09-01 00:00:00
8561	123293	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8562	123294	\N	\N	\N	\N	45.0	\N	1	2015-09-01 00:00:00
8563	123295	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8564	123296	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8565	123297	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8566	123298	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8567	123299	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8568	123300	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8569	123301	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8570	123302	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8571	123303	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8572	123304	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8573	123305	\N	\N	\N	\N	1.949	\N	1	2015-09-01 00:00:00
8574	123306	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8575	123307	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8576	123308	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8577	123309	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8578	123310	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8579	123311	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8580	123312	\N	\N	\N	\N	3.616	\N	1	2015-09-01 00:00:00
8581	123313	\N	\N	\N	\N	474.82	\N	1	2015-09-01 00:00:00
8582	123314	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8583	123315	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8584	123316	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8585	123317	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8586	123318	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8587	123319	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8588	123320	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8589	123321	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8590	123322	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8591	123323	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8592	123324	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8593	123325	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8594	123326	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8595	123327	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8596	123328	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8597	123329	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8598	123330	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8599	123331	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8600	123332	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8601	123333	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8602	123334	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8603	123335	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8604	123336	\N	\N	\N	\N	63.49999996	\N	1	2015-09-01 00:00:00
8605	123337	\N	\N	\N	\N	3.018	\N	1	2015-09-01 00:00:00
8606	123338	\N	\N	\N	\N	295.338	\N	1	2015-09-01 00:00:00
8607	123339	\N	\N	\N	\N	898.7799307	\N	1	2015-09-01 00:00:00
8608	123340	\N	\N	\N	\N	20.0	\N	1	2015-09-01 00:00:00
8609	123341	\N	\N	\N	\N	575712.9508	\N	1	2015-09-01 00:00:00
8610	123342	\N	\N	\N	\N	198522.2023	\N	1	2015-09-01 00:00:00
8611	123343	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8612	123344	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8613	123345	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8614	123346	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8615	123347	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8616	123348	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8617	123349	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8618	123350	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8619	123351	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8620	123352	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8621	123353	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8622	123354	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8623	123355	\N	\N	\N	\N	36.12	\N	1	2015-09-01 00:00:00
8624	123356	\N	\N	\N	\N	29.28	\N	1	2015-09-01 00:00:00
8625	123357	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8626	123358	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8627	123359	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8628	123360	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8629	123361	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8630	123362	\N	\N	\N	\N	3.615	\N	1	2015-09-01 00:00:00
8631	123363	\N	\N	\N	\N	217.369	\N	1	2015-09-01 00:00:00
8632	123364	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8633	123365	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8634	123366	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8635	123367	\N	\N	\N	\N	831335.9531	\N	1	2015-09-01 00:00:00
8636	123368	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8637	123369	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8638	123370	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8639	123371	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8640	123372	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8641	123373	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8642	123374	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8643	123375	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8644	123376	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8645	123377	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8646	123378	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8647	123379	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8648	123380	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8649	123381	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8650	123382	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8651	123383	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8652	123384	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8653	123385	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8654	123386	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8655	123387	\N	\N	\N	\N	NaN	\N	1	2015-09-01 00:00:00
8656	123388	\N	\N	\N	\N	NaN	\N	1	2015-09-01 00:00:00
8657	123389	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8658	123390	\N	\N	\N	\N	42.0	\N	1	2015-09-01 00:00:00
8659	123391	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8660	123392	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8661	123393	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8662	123394	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8663	123395	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8664	123396	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8665	123397	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8666	123398	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8667	123399	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8668	123400	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8669	123401	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8670	123402	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8671	123403	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8672	123404	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8673	123405	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8674	123406	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8675	123407	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8676	123408	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8677	123409	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8678	123410	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8679	123411	\N	\N	\N	\N	97.80000005	\N	1	2015-09-01 00:00:00
8680	123412	\N	\N	\N	\N	2.913	\N	1	2015-09-01 00:00:00
8681	123413	\N	\N	\N	\N	300.587	\N	1	2015-09-01 00:00:00
8682	123414	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8683	123415	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8684	123416	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8685	123417	\N	\N	\N	\N	800040.9806	\N	1	2015-09-01 00:00:00
8686	123418	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8687	123419	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8688	123420	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8689	123421	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8690	123422	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8691	123423	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8692	123424	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8693	123425	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8694	123426	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8695	123427	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8696	123428	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8697	123429	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8698	123430	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8699	123431	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8700	123432	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8701	123433	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8702	123434	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8703	123435	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8704	123436	\N	\N	\N	\N	56.30000002	\N	1	2015-09-01 00:00:00
8705	123437	\N	\N	\N	\N	2.35	\N	1	2015-09-01 00:00:00
8706	123438	\N	\N	\N	\N	201.224	\N	1	2015-09-01 00:00:00
8707	123439	\N	\N	\N	\N	34685.44678	\N	1	2015-09-01 00:00:00
8708	123440	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8709	123441	\N	\N	\N	\N	223265.3739	\N	1	2015-09-01 00:00:00
8710	123442	\N	\N	\N	\N	232722.3117	\N	1	2015-09-01 00:00:00
8711	123443	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8712	123444	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8713	123445	\N	\N	\N	\N	28.65	\N	1	2015-09-01 00:00:00
8714	123446	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8715	123447	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8716	123448	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8717	123449	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8718	123450	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8719	123451	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8720	123452	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8721	123453	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8722	123454	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8723	123455	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8724	123456	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8725	123457	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8726	123458	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8727	123459	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8728	123460	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8729	123461	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8730	123462	\N	\N	\N	\N	2.557	\N	1	2015-09-01 00:00:00
8731	123463	\N	\N	\N	\N	235.3	\N	1	2015-09-01 00:00:00
8732	123464	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8733	123465	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8734	123466	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8735	123467	\N	\N	\N	\N	702128.4516	\N	1	2015-09-01 00:00:00
8736	123468	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8737	123469	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8738	123470	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8739	123471	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8740	123472	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8741	123473	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8742	123474	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8743	123475	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8744	123476	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8745	123477	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8746	123478	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8747	123479	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8748	123480	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8749	123481	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8750	123482	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8751	123483	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8752	123484	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8753	123485	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8754	123486	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8755	123487	\N	\N	\N	\N	4.489	\N	1	2015-09-01 00:00:00
8756	123488	\N	\N	\N	\N	412.195	\N	1	2015-09-01 00:00:00
8757	123489	\N	\N	\N	\N	1852.08193	\N	1	2015-09-01 00:00:00
8758	123490	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8759	123491	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8760	123492	\N	\N	\N	\N	579957.9431	\N	1	2015-09-01 00:00:00
8761	123493	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8762	123494	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8763	123495	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8764	123496	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8765	123497	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8766	123498	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8767	123499	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8768	123500	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8769	123501	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8770	123502	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8771	123503	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8772	123504	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8773	123505	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8774	123506	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8775	123507	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8776	123508	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8777	123509	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8778	123510	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8779	123511	\N	\N	\N	\N	50.99999999	\N	1	2015-09-01 00:00:00
8780	123512	\N	\N	\N	\N	5.051	\N	1	2015-09-01 00:00:00
8781	123513	\N	\N	\N	\N	335.997	\N	1	2015-09-01 00:00:00
8782	123514	\N	\N	\N	\N	189206.9597	\N	1	2015-09-01 00:00:00
8783	123515	\N	\N	\N	\N	36.0	\N	1	2015-09-01 00:00:00
8784	123516	\N	\N	\N	\N	363676.8819	\N	1	2015-09-01 00:00:00
8785	123517	\N	\N	\N	\N	270286.6241	\N	1	2015-09-01 00:00:00
8786	123518	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8787	123519	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8788	123520	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8789	123521	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8790	123522	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8791	123523	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8792	123524	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8793	123525	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8794	123526	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8795	123527	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8796	123528	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8797	123529	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8798	123530	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8799	123531	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8800	123532	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8801	123533	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8802	123534	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8803	123535	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8804	123536	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8805	123537	\N	\N	\N	\N	1.857	\N	1	2015-09-01 00:00:00
8806	123538	\N	\N	\N	\N	221.646	\N	1	2015-09-01 00:00:00
8807	123539	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8808	123540	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8809	123541	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8810	123542	\N	\N	\N	\N	831452.6815	\N	1	2015-09-01 00:00:00
8811	123543	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8812	123544	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8813	123545	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8814	123546	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8815	123547	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8816	123548	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8817	123549	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8818	123550	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8819	123551	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8820	123552	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8821	123553	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8822	123554	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8823	123555	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8824	123556	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8825	123557	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8826	123558	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8827	123559	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8828	123560	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8829	123561	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8830	123562	\N	\N	\N	\N	3.527	\N	1	2015-09-01 00:00:00
8831	123563	\N	\N	\N	\N	207.056	\N	1	2015-09-01 00:00:00
8832	123564	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8833	123565	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8834	123566	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8835	123567	\N	\N	\N	\N	831060.0945	\N	1	2015-09-01 00:00:00
8836	123568	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8837	123569	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8838	123570	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8839	123571	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8840	123572	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8841	123573	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8842	123574	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8843	123575	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8844	123576	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8845	123577	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8846	123578	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8847	123579	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8848	123580	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8849	123581	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8850	123582	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8851	123583	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8852	123584	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8853	123585	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8854	123586	\N	\N	\N	\N	2.019999998	\N	1	2015-09-01 00:00:00
8855	123587	\N	\N	\N	\N	2.223	\N	1	2015-09-01 00:00:00
8856	123588	\N	\N	\N	\N	265.913	\N	1	2015-09-01 00:00:00
8857	123589	\N	\N	\N	\N	50162.94388	\N	1	2015-09-01 00:00:00
8858	123590	\N	\N	\N	\N	0.25	\N	1	2015-09-01 00:00:00
8859	123591	\N	\N	\N	\N	460006.1365	\N	1	2015-09-01 00:00:00
8860	123592	\N	\N	\N	\N	358968.327	\N	1	2015-09-01 00:00:00
8861	123593	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8862	123594	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8863	123595	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8864	123596	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8865	123597	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8866	123598	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8867	123599	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8868	123600	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8869	123601	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8870	123602	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8871	123603	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8872	123604	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8873	123605	\N	\N	\N	\N	17.65	\N	1	2015-09-01 00:00:00
8874	123606	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8875	123607	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8876	123608	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8877	123609	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8878	123610	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8879	123611	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8880	123612	\N	\N	\N	\N	2.405	\N	1	2015-09-01 00:00:00
8881	123613	\N	\N	\N	\N	213.663	\N	1	2015-09-01 00:00:00
8882	123614	\N	\N	\N	\N	34450.54319	\N	1	2015-09-01 00:00:00
8883	123615	\N	\N	\N	\N	50.0	\N	1	2015-09-01 00:00:00
8884	123616	\N	\N	\N	\N	566529.9831	\N	1	2015-09-01 00:00:00
8885	123617	\N	\N	\N	\N	480376.5089	\N	1	2015-09-01 00:00:00
8886	123618	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8887	123619	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8888	123620	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8889	123621	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8890	123622	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8891	123623	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8892	123624	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8893	123625	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8894	123626	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8895	123627	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8896	123628	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8897	123629	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8898	123630	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8899	123631	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8900	123632	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8901	123633	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8902	123634	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8903	123635	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8904	123636	\N	\N	\N	\N	90.69999999	\N	1	2015-09-01 00:00:00
8905	123637	\N	\N	\N	\N	2.81	\N	1	2015-09-01 00:00:00
8906	123638	\N	\N	\N	\N	334.523	\N	1	2015-09-01 00:00:00
8907	123639	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8908	123640	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8909	123641	\N	\N	\N	\N	369122.4244	\N	1	2015-09-01 00:00:00
8910	123642	\N	\N	\N	\N	226678.8991	\N	1	2015-09-01 00:00:00
8911	123643	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8912	123644	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8913	123645	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8914	123646	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8915	123647	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8916	123648	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8917	123649	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8918	123650	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8919	123651	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8920	123652	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8921	123653	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8922	123654	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8923	123655	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8924	123656	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8925	123657	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8926	123658	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8927	123659	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8928	123660	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8929	123661	\N	\N	\N	\N	65.80000006	\N	1	2015-09-01 00:00:00
8930	123662	\N	\N	\N	\N	4.27	\N	1	2015-09-01 00:00:00
8931	123663	\N	\N	\N	\N	322.53	\N	1	2015-09-01 00:00:00
8932	123664	\N	\N	\N	\N	192749.3409	\N	1	2015-09-01 00:00:00
8933	123665	\N	\N	\N	\N	30.0	\N	1	2015-09-01 00:00:00
8934	123666	\N	\N	\N	\N	362720.8752	\N	1	2015-09-01 00:00:00
8935	123667	\N	\N	\N	\N	255426.9346	\N	1	2015-09-01 00:00:00
8936	123668	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8937	123669	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8938	123670	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8939	123671	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8940	123672	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8941	123673	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8942	123674	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8943	123675	\N	\N	\N	\N	1.856	\N	1	2015-09-01 00:00:00
8944	123676	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8945	123677	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8946	123678	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8947	123679	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8948	123680	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8949	123681	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8950	123682	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8951	123683	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8952	123684	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8953	123685	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8954	123686	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8955	123687	\N	\N	\N	\N	1.495	\N	1	2015-09-01 00:00:00
8956	123688	\N	\N	\N	\N	357.771	\N	1	2015-09-01 00:00:00
8957	123689	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8958	123690	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8959	123691	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8960	123692	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8961	123693	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8962	123694	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8963	123695	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8964	123696	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8965	123697	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8966	123698	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8967	123699	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8968	123700	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8969	123701	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8970	123702	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8971	123703	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8972	123704	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8973	123705	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8974	123706	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8975	123707	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8976	123708	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8977	123709	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8978	123710	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8979	123711	\N	\N	\N	\N	38.3	\N	1	2015-09-01 00:00:00
8980	123712	\N	\N	\N	\N	4.079	\N	1	2015-09-01 00:00:00
8981	123713	\N	\N	\N	\N	274.402	\N	1	2015-09-01 00:00:00
8982	123714	\N	\N	\N	\N	192425.3991	\N	1	2015-09-01 00:00:00
8983	123715	\N	\N	\N	\N	27.0	\N	1	2015-09-01 00:00:00
8984	123716	\N	\N	\N	\N	351733.6868	\N	1	2015-09-01 00:00:00
8985	123717	\N	\N	\N	\N	209928.6274	\N	1	2015-09-01 00:00:00
8986	123718	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8987	123719	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8988	123720	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8989	123721	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8990	123722	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8991	123723	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8992	123724	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8993	123725	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8994	123726	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8995	123727	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8996	123728	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8997	123729	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8998	123730	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
8999	123731	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9000	123732	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9001	123733	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9002	123734	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9003	123735	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9004	123736	\N	\N	\N	\N	28.90000002	\N	1	2015-09-01 00:00:00
9005	123737	\N	\N	\N	\N	3.793	\N	1	2015-09-01 00:00:00
9006	123738	\N	\N	\N	\N	349.059	\N	1	2015-09-01 00:00:00
9007	123739	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9008	123740	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9009	123741	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9010	123742	\N	\N	\N	\N	765700.7597	\N	1	2015-09-01 00:00:00
9011	123743	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9012	123744	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9013	123745	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9014	123746	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9015	123747	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9016	123748	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9017	123749	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9018	123750	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9019	123751	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9020	123752	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9021	123753	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9022	123754	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9023	123755	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9024	123756	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9025	123757	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9026	123758	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9027	123759	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9028	123760	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9029	123761	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9030	123762	\N	\N	\N	\N	4.4	\N	1	2015-09-01 00:00:00
9031	123763	\N	\N	\N	\N	349.745	\N	1	2015-09-01 00:00:00
9032	123764	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9033	123765	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9034	123766	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9035	123767	\N	\N	\N	\N	682954.2157	\N	1	2015-09-01 00:00:00
9036	123768	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9037	123769	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9038	123770	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9039	123771	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9040	123772	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9041	123773	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9042	123774	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9043	123775	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9044	123776	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9045	123777	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9046	123778	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9047	123779	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9048	123780	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9049	123781	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9050	123782	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9051	123783	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9052	123784	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9053	123785	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9054	123786	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9055	123787	\N	\N	\N	\N	3.487	\N	1	2015-09-01 00:00:00
9056	123788	\N	\N	\N	\N	303.15	\N	1	2015-09-01 00:00:00
9057	123789	\N	\N	\N	\N	5136.540337	\N	1	2015-09-01 00:00:00
9058	123790	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9059	123791	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9060	123792	\N	\N	\N	\N	553769.3152	\N	1	2015-09-01 00:00:00
9061	123793	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9062	123794	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9063	123795	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9064	123796	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9065	123797	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9066	123798	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9067	123799	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9068	123800	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9069	123801	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9070	123802	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9071	123803	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9072	123804	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9073	123805	\N	\N	\N	\N	11.79	\N	1	2015-09-01 00:00:00
9074	123806	\N	\N	\N	\N	7.96	\N	1	2015-09-01 00:00:00
9075	123807	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9076	123808	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9077	123809	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9078	123810	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9079	123811	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9080	123812	\N	\N	\N	\N	2.571	\N	1	2015-09-01 00:00:00
9081	123813	\N	\N	\N	\N	239.701	\N	1	2015-09-01 00:00:00
9082	123814	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9083	123815	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9084	123816	\N	\N	\N	\N	334187.5592	\N	1	2015-09-01 00:00:00
9085	123817	\N	\N	\N	\N	472894.5096	\N	1	2015-09-01 00:00:00
9086	123818	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9087	123819	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9088	123820	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9089	123821	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9090	123822	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9091	123823	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9092	123824	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9093	123825	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9094	123826	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9095	123827	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9096	123828	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9097	123829	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9098	123830	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9099	123831	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9100	123832	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9101	123833	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9102	123834	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9103	123835	\N	\N	\N	\N	1000000.0	\N	1	2015-09-01 00:00:00
9104	122760	\N	1000000.0	\N	\N	100fgh	\N	1	2015-09-01 00:00:00
9105	122785	\N	1000000.0	\N	\N	f45	\N	1	2015-09-01 00:00:00
\.


--
-- Name: resultshistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resultshistory_id_seq', 9105, true);


--
-- Data for Name: searchtemplates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY searchtemplates (id, user_id, code, objectxml, updatedby, updateddt) FROM stdin;
\.


--
-- Name: searchtemplates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('searchtemplates_id_seq', 1, false);


--
-- Data for Name: sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sources (id, code, name, updatedby, updateddt) FROM stdin;
1736	DSSTOX_40338	\N	1	2015-09-01 15:08:51.274
1737	DSSTOX_40339	\N	1	2015-09-01 15:08:51.429
1738	DSSTOX_40340	\N	1	2015-09-01 15:08:51.574
1739	DSSTOX_40343	\N	1	2015-09-01 15:08:51.687
1740	DSSTOX_40344	\N	1	2015-09-01 15:08:51.779
1741	DSSTOX_40299	\N	1	2015-09-01 15:08:51.883
1742	DSSTOX_40374	\N	1	2015-09-01 15:08:51.98
1743	DSSTOX_40346	\N	1	2015-09-01 15:08:52.08
1744	DSSTOX_40557	\N	1	2015-09-01 15:08:52.186
1745	DSSTOX_40347	\N	1	2015-09-01 15:08:52.283
1746	DSSTOX_40348	\N	1	2015-09-01 15:08:52.439
1747	DSSTOX_40349	\N	1	2015-09-01 15:08:52.617
1748	DSSTOX_40350	\N	1	2015-09-01 15:08:52.796
1749	DSSTOX_40351	\N	1	2015-09-01 15:08:52.987
1750	DSSTOX_40352	\N	1	2015-09-01 15:08:53.096
1751	DSSTOX_40353	\N	1	2015-09-01 15:08:53.203
1752	DSSTOX_40354	\N	1	2015-09-01 15:08:53.317
1753	DSSTOX_40359	\N	1	2015-09-01 15:08:53.44
1754	DSSTOX_40360	\N	1	2015-09-01 15:08:53.562
1755	DSSTOX_40362	\N	1	2015-09-01 15:08:53.673
1756	DSSTOX_40364	\N	1	2015-09-01 15:08:53.792
1757	DSSTOX_40365	\N	1	2015-09-01 15:08:53.921
1758	DSSTOX_40366	\N	1	2015-09-01 15:08:54.059
1759	DSSTOX_40319	\N	1	2015-09-01 15:08:54.192
1760	DSSTOX_40367	\N	1	2015-09-01 15:08:54.322
1761	DSSTOX_40368	\N	1	2015-09-01 15:08:54.462
1762	DSSTOX_40357	\N	1	2015-09-01 15:08:54.595
1763	DSSTOX_40369	\N	1	2015-09-01 15:08:54.726
1764	DSSTOX_40370	\N	1	2015-09-01 15:08:54.864
1765	DSSTOX_40371	\N	1	2015-09-01 15:08:55.049
1766	DSSTOX_40373	\N	1	2015-09-01 15:08:55.28
1767	DSSTOX_40377	\N	1	2015-09-01 15:08:55.513
1768	DSSTOX_40378	\N	1	2015-09-01 15:08:55.65
1769	DSSTOX_40379	\N	1	2015-09-01 15:08:55.787
1770	DSSTOX_40380	\N	1	2015-09-01 15:08:55.927
1771	DSSTOX_40582	\N	1	2015-09-01 15:08:56.073
1772	DSSTOX_40382	\N	1	2015-09-01 15:08:56.225
1773	DSSTOX_40384	\N	1	2015-09-01 15:08:56.388
1774	DSSTOX_40385	\N	1	2015-09-01 15:08:56.549
1775	DSSTOX_40386	\N	1	2015-09-01 15:08:56.708
1776	DSSTOX_40387	\N	1	2015-09-01 15:08:56.861
1777	DSSTOX_40762	\N	1	2015-09-01 15:08:57.019
1778	DSSTOX_40389	\N	1	2015-09-01 15:08:57.177
1779	DSSTOX_40372	\N	1	2015-09-01 15:08:57.341
1780	DSSTOX_40390	\N	1	2015-09-01 15:08:57.516
1781	DSSTOX_40345	\N	1	2015-09-01 15:08:57.702
1782	DSSTOX_40392	\N	1	2015-09-01 15:08:57.998
\.


--
-- Name: sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sources_id_seq', 1782, true);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY types (id, code, name, group_id, updatedby, updateddt) FROM stdin;
377	Assay	\N	23	1	2015-09-01 15:08:51.294
378	ChemProp	\N	24	1	2015-09-01 15:08:51.32
379	Pathway	\N	25	1	2015-09-01 15:08:51.333
380	Assay	\N	26	1	2015-09-01 15:08:51.353
\.


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('types_id_seq', 380, true);


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY units (id, code, name, relatedunit, volume, updatedby, updateddt) FROM stdin;
1	DEFAULT		\N	\N	1	2015-08-20 00:00:00
\.


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('units_id_seq', 1, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, login, password, firstname, lastname, email, registereddt, lastvisitdt) FROM stdin;
1	SYSTEM		SYSTEM	SYSTEM	VOLIYNYK@CVM.TAMU.EDU	2015-08-13 00:00:00	2015-08-13 00:00:00
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: viewtemplates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY viewtemplates (id, user_id, code, objectxml, updatedby, updateddt) FROM stdin;
\.


--
-- Name: viewtemplates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('viewtemplates_id_seq', 1, false);


--
-- Data for Name: weights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY weights (id, code, name, weight, updatedby, updateddt) FROM stdin;
14	1	\N	1	1	2015-09-01 15:08:51.289
\.


--
-- Name: weights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('weights_id_seq', 14, true);


--
-- Name: casregistrynumbers_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casregistrynumbers
    ADD CONSTRAINT casregistrynumbers_code_key UNIQUE (code);


--
-- Name: casregistrynumbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casregistrynumbers
    ADD CONSTRAINT casregistrynumbers_pkey PRIMARY KEY (id);


--
-- Name: chemicals_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chemicals
    ADD CONSTRAINT chemicals_code_key UNIQUE (code);


--
-- Name: chemicals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chemicals
    ADD CONSTRAINT chemicals_pkey PRIMARY KEY (id);


--
-- Name: components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);


--
-- Name: componentsources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY componentsources
    ADD CONSTRAINT componentsources_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


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
-- Name: orders_source_id_casr_id_chemical_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_source_id_casr_id_chemical_id_key UNIQUE (source_id, casr_id, chemical_id);


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
-- Name: searchtemplates_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY searchtemplates
    ADD CONSTRAINT searchtemplates_code_key UNIQUE (code);


--
-- Name: searchtemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY searchtemplates
    ADD CONSTRAINT searchtemplates_pkey PRIMARY KEY (id);


--
-- Name: sources_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_code_key UNIQUE (code);


--
-- Name: sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: viewtemplates_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viewtemplates
    ADD CONSTRAINT viewtemplates_code_key UNIQUE (code);


--
-- Name: viewtemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viewtemplates
    ADD CONSTRAINT viewtemplates_pkey PRIMARY KEY (id);


--
-- Name: weights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY weights
    ADD CONSTRAINT weights_pkey PRIMARY KEY (id);


--
-- Name: t_results; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER t_results AFTER INSERT OR DELETE OR UPDATE ON results FOR EACH ROW EXECUTE PROCEDURE result_changes_history();


--
-- Name: casregistrynumbers_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casregistrynumbers
    ADD CONSTRAINT casregistrynumbers_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: chemicals_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chemicals
    ADD CONSTRAINT chemicals_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: components_compsource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT components_compsource_id_fkey FOREIGN KEY (compsource_id) REFERENCES componentsources(id);


--
-- Name: components_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT components_type_id_fkey FOREIGN KEY (type_id) REFERENCES types(id);


--
-- Name: components_unit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT components_unit_fkey FOREIGN KEY (unit) REFERENCES units(id);


--
-- Name: components_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY components
    ADD CONSTRAINT components_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: componentsources_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY componentsources
    ADD CONSTRAINT componentsources_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: groups_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: groups_weight_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_weight_id_fkey FOREIGN KEY (weight_id) REFERENCES weights(id);


--
-- Name: importinfo_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY importinfo
    ADD CONSTRAINT importinfo_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: notes_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: orders_casr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_casr_id_fkey FOREIGN KEY (casr_id) REFERENCES casregistrynumbers(id);


--
-- Name: orders_chemical_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_chemical_id_fkey FOREIGN KEY (chemical_id) REFERENCES chemicals(id);


--
-- Name: orders_import_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_import_id_fkey FOREIGN KEY (import_id) REFERENCES importinfo(id);


--
-- Name: orders_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_source_id_fkey FOREIGN KEY (source_id) REFERENCES sources(id);


--
-- Name: orders_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: results_component_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_component_id_fkey FOREIGN KEY (component_id) REFERENCES components(id);


--
-- Name: results_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: results_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: resultshistory_results_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resultshistory
    ADD CONSTRAINT resultshistory_results_fkey FOREIGN KEY (results) REFERENCES results(id);


--
-- Name: resultshistory_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resultshistory
    ADD CONSTRAINT resultshistory_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: searchtemplates_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY searchtemplates
    ADD CONSTRAINT searchtemplates_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: searchtemplates_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY searchtemplates
    ADD CONSTRAINT searchtemplates_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: sources_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: types_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: types_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: units_relatedunit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_relatedunit_fkey FOREIGN KEY (relatedunit) REFERENCES units(id);


--
-- Name: units_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: viewtemplates_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viewtemplates
    ADD CONSTRAINT viewtemplates_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


--
-- Name: viewtemplates_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY viewtemplates
    ADD CONSTRAINT viewtemplates_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: weights_updatedby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY weights
    ADD CONSTRAINT weights_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users(id);


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

