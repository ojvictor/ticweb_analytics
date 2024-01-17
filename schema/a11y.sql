-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.4
-- PostgreSQL version: 15.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: ticweb | type: DATABASE --
-- DROP DATABASE IF EXISTS ticweb;
-- CREATE DATABASE ticweb;
-- ddl-end --

ALTER DATABASE ticweb SET datestyle TO "ISO, DMY";

-- object: a11y | type: SCHEMA --
-- DROP SCHEMA IF EXISTS a11y CASCADE;
CREATE SCHEMA a11y;
-- ddl-end --
ALTER SCHEMA a11y OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,a11y;
-- ddl-end --

-- object: a11y.pages | type: TABLE --
-- DROP TABLE IF EXISTS a11y.pages CASCADE;
CREATE TABLE IF NOT EXISTS a11y.pages (
	id serial NOT NULL,
  site varchar(255) NOT NULL,
	page varchar(2048) NOT NULL,
	date_time date NOT NULL,
	total_errors INT NOT NULL,
	total_warnings INT NOT NULL,
	rating_score numeric(5,2)
);
-- ddl-end --
ALTER TABLE a11y.pages OWNER TO postgres;
-- ddl-end --

-- object: a11y.orders | type: TABLE --
-- DROP TABLE IF EXISTS a11y.orders CASCADE;
CREATE TABLE IF NOT EXISTS a11y.newpages (
	id serial NOT NULL,
  site varchar(255) NOT NULL,
	page varchar(2048) NOT NULL,
	date_time date NOT NULL,
	total_errors INT NOT NULL,
	total_warnings INT NOT NULL,
	rating_score numeric(5,2)
);
-- ddl-end --
ALTER TABLE a11y.newpages OWNER TO postgres;
-- ddl-end --


