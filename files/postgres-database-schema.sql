--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--
CREATE TABLE actor (
    actor_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);

--
-- PostgreSQL database dump complete
--

INSERT INTO "actor" ("actor_id", "first_name", "last_name", "last_update") VALUES
(1,	'Chien1',	'Tran1',	'2018-12-21 08:21:34.39702'),
(2,	'Chien2',	'Tran2',	'2018-12-22 08:21:34.39702'),
(3,	'Chien3',	'Tran3',	'2018-12-23 08:21:34.39702'),
(4,	'Phi4',	'Mai4',	'2018-12-24 08:21:44.370034'),
(5,	'Phi5',	'Mai5',	'2018-12-25 08:21:45.370034'),
(6,	'Phi6',	'Mai6',	'2018-12-26 08:21:46.370034'),
(7,	'Phi7',	'Mai7',	'2018-12-27 08:21:47.370034'),
(8,	'Phi8',	'Mai8',	'2018-12-28 08:21:48.370034'),
(9,	'Phi9',	'Mai9',	'2018-12-29 08:21:49.370034'),
(10,'Phi10',	'Mai10',	'2018-12-29 08:21:49.370034'),
(12,'Phi12',	'Mai12',	'2018-12-29 08:21:49.370034'),
(14,'Phi14',	'Mai14',	'2018-12-29 08:21:49.370034')
;


--
-- Name: actor; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--
CREATE TABLE student (
    id integer NOT NULL,
    full_name character varying(45) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);

--
-- PostgreSQL database dump complete
--

INSERT INTO "student" ("id", "full_name", "last_update") VALUES
(21,	'Mai Van Toi',	'2018-12-21 08:21:34.39702'),
(2,	'Tran Van Nhat',	'2018-12-22 08:21:34.39702'),
(22,	'Nguyen Huy Toan',	'2018-12-22 08:21:34.39702'),
(23,	'Ho Van Binh',	'2018-12-23 08:21:34.39702'),
(24,	'Doan Nhat Tin',	'2018-12-24 08:21:44.370034'),
(25,	'Hoang Phi Hong',	'2018-12-25 08:21:45.370034')
;
