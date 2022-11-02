-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---
-- -- object: u0_a339 | type: ROLE --
-- -- DROP ROLE IF EXISTS u0_a339;
-- CREATE ROLE u0_a339 WITH 
-- 	SUPERUSER
-- 	CREATEDB
-- 	CREATEROLE
-- 	INHERIT
-- 	LOGIN
-- 	REPLICATION
-- 	BYPASSRLS
-- 	ENCRYPTED PASSWORD '********';
-- -- ddl-end --
-- 

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: "GIMNASIO_BD" | type: DATABASE --
-- DROP DATABASE IF EXISTS "GIMNASIO_BD";
CREATE DATABASE "GIMNASIO_BD"
	ENCODING = 'UTF8'
	LC_COLLATE = 'C.UTF-8'
	LC_CTYPE = 'C.UTF-8'
	TABLESPACE = pg_default
	OWNER = postgres;
-- ddl-end --


-- object: public.rutina_id_rut_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.rutina_id_rut_seq CASCADE;
CREATE SEQUENCE public.rutina_id_rut_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.rutina_id_rut_seq OWNER TO postgres;
-- ddl-end --

-- object: public.rutina | type: TABLE --
-- DROP TABLE IF EXISTS public.rutina CASCADE;
CREATE TABLE public.rutina (
	id_rut integer NOT NULL DEFAULT nextval('public.rutina_id_rut_seq'::regclass),
	nombre character varying(255),
	tiempo time NOT NULL,
	CONSTRAINT rutina_pkey PRIMARY KEY (id_rut)
);
-- ddl-end --
ALTER TABLE public.rutina OWNER TO postgres;
-- ddl-end --

-- object: public.persona | type: TABLE --
-- DROP TABLE IF EXISTS public.persona CASCADE;
CREATE TABLE public.persona (
	cod_pers bigint,
	cedula bigint NOT NULL,
	nombre character varying(255) NOT NULL,
	apellido character varying(255) NOT NULL,
	edad integer NOT NULL,
	direccion character varying(255),
	telefono bigint NOT NULL,
	correo character varying(255) NOT NULL,
	username character varying(255),
	password character varying(255) NOT NULL
	CONSTRAINT persona_cod_pers_key UNIQUE (cod_pers),
	CONSTRAINT persona_username_key UNIQUE (username)
);
-- ddl-end --
ALTER TABLE public.persona OWNER TO postgres;
-- ddl-end --

-- object: public.precio_id_pre_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.precio_id_pre_seq CASCADE;
CREATE SEQUENCE public.precio_id_pre_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.precio_id_pre_seq OWNER TO postgres;
-- ddl-end --

-- object: public.precio | type: TABLE --
-- DROP TABLE IF EXISTS public.precio CASCADE;
CREATE TABLE public.precio (
	id_pre integer NOT NULL DEFAULT nextval('public.precio_id_pre_seq'::regclass),
	nombre character varying(255),
	dias integer NOT NULL,
	precio bigint NOT NULL,
	CONSTRAINT precio_pkey PRIMARY KEY (id_pre)
);
-- ddl-end --
ALTER TABLE public.precio OWNER TO postgres;
-- ddl-end --

-- object: public.usuario_id_usua_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.usuario_id_usua_seq CASCADE;
CREATE SEQUENCE public.usuario_id_usua_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.usuario_id_usua_seq OWNER TO postgres;
-- ddl-end --

-- object: public.usuario | type: TABLE --
-- DROP TABLE IF EXISTS public.usuario CASCADE;
CREATE TABLE public.usuario (
	id_usua integer NOT NULL DEFAULT nextval('public.usuario_id_usua_seq'::regclass),
	dat_med text,
	id_desc integer,
	CONSTRAINT usuario_pkey PRIMARY KEY (id_usua)
);
-- ddl-end --
ALTER TABLE public.usuario OWNER TO postgres;
-- ddl-end --

-- object: public.factura_id_fac_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.factura_id_fac_seq CASCADE;
CREATE SEQUENCE public.factura_id_fac_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.factura_id_fac_seq OWNER TO postgres;
-- ddl-end --

-- object: public.factura | type: TABLE --
-- DROP TABLE IF EXISTS public.factura CASCADE;
CREATE TABLE public.factura (
	id_fac integer NOT NULL DEFAULT nextval('public.factura_id_fac_seq'::regclass),
	id_usua integer NOT NULL,
	id_descuento integer,
	id_prec integer NOT NULL,
	monto bigint NOT NULL,
	fecha_inicial date NOT NULL,
	estado character varying(1) DEFAULT 'P',
	fecha_final date NOT NULL,
	CONSTRAINT factura_estado_check CHECK ((((estado)::text = 'P'::text) OR ((estado)::text = 'A'::text))),
	CONSTRAINT factura_pkey PRIMARY KEY (id_fac)
);
-- ddl-end --
ALTER TABLE public.factura OWNER TO postgres;
-- ddl-end --

-- object: public.rutxusua | type: TABLE --
-- DROP TABLE IF EXISTS public.rutxusua CASCADE;
CREATE TABLE public.rutxusua (
	id_rut2 bigint NOT NULL,
	id_usua2 bigint NOT NULL

);
-- ddl-end --
ALTER TABLE public.rutxusua OWNER TO postgres;
-- ddl-end --

-- object: public.asistencia_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.asistencia_id_seq CASCADE;
CREATE SEQUENCE public.asistencia_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.asistencia_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.asistencia | type: TABLE --
-- DROP TABLE IF EXISTS public.asistencia CASCADE;
CREATE TABLE public.asistencia (
	id integer NOT NULL DEFAULT nextval('public.asistencia_id_seq'::regclass),
	id_usua3 bigint,
	fecha date NOT NULL,
	hora time NOT NULL,
	CONSTRAINT asistencia_pkey PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.asistencia OWNER TO postgres;
-- ddl-end --

-- object: public.administrador_id_admin_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.administrador_id_admin_seq CASCADE;
CREATE SEQUENCE public.administrador_id_admin_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.administrador_id_admin_seq OWNER TO postgres;
-- ddl-end --

-- object: public.administrador | type: TABLE --
-- DROP TABLE IF EXISTS public.administrador CASCADE;
CREATE TABLE public.administrador (
	id_admin integer NOT NULL DEFAULT nextval('public.administrador_id_admin_seq'::regclass),
	CONSTRAINT administrador_pkey PRIMARY KEY (id_admin)
);
-- ddl-end --
ALTER TABLE public.administrador OWNER TO postgres;
-- ddl-end --

-- object: public.descuento_id_desc_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.descuento_id_desc_seq CASCADE;
CREATE SEQUENCE public.descuento_id_desc_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.descuento_id_desc_seq OWNER TO postgres;
-- ddl-end --

-- object: public.descuento | type: TABLE --
-- DROP TABLE IF EXISTS public.descuento CASCADE;
CREATE TABLE public.descuento (
	id_desc integer NOT NULL DEFAULT nextval('public.descuento_id_desc_seq'::regclass),
	nombre character varying(255),
	monto bigint NOT NULL,
	CONSTRAINT descuento_pkey PRIMARY KEY (id_desc)
);
-- ddl-end --
ALTER TABLE public.descuento OWNER TO postgres;
-- ddl-end --

-- object: usuario_id_usua_fkey | type: CONSTRAINT --
-- ALTER TABLE public.usuario DROP CONSTRAINT IF EXISTS usuario_id_usua_fkey CASCADE;
ALTER TABLE public.usuario ADD CONSTRAINT usuario_id_usua_fkey FOREIGN KEY (id_usua)
REFERENCES public.persona (cod_pers) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: foregindesc | type: CONSTRAINT --
-- ALTER TABLE public.usuario DROP CONSTRAINT IF EXISTS foregindesc CASCADE;
ALTER TABLE public.usuario ADD CONSTRAINT foregindesc FOREIGN KEY (id_desc)
REFERENCES public.descuento (id_desc) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: factura_id_prec_fkey | type: CONSTRAINT --
-- ALTER TABLE public.factura DROP CONSTRAINT IF EXISTS factura_id_prec_fkey CASCADE;
ALTER TABLE public.factura ADD CONSTRAINT factura_id_prec_fkey FOREIGN KEY (id_prec)
REFERENCES public.precio (id_pre) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: factura_id_usua_fkey | type: CONSTRAINT --
-- ALTER TABLE public.factura DROP CONSTRAINT IF EXISTS factura_id_usua_fkey CASCADE;
ALTER TABLE public.factura ADD CONSTRAINT factura_id_usua_fkey FOREIGN KEY (id_usua)
REFERENCES public.usuario (id_usua) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: rutxusua_id_rut2_fkey | type: CONSTRAINT --
-- ALTER TABLE public.rutxusua DROP CONSTRAINT IF EXISTS rutxusua_id_rut2_fkey CASCADE;
ALTER TABLE public.rutxusua ADD CONSTRAINT rutxusua_id_rut2_fkey FOREIGN KEY (id_rut2)
REFERENCES public.rutina (id_rut) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: rutxusua_id_usua2_fkey | type: CONSTRAINT --
-- ALTER TABLE public.rutxusua DROP CONSTRAINT IF EXISTS rutxusua_id_usua2_fkey CASCADE;
ALTER TABLE public.rutxusua ADD CONSTRAINT rutxusua_id_usua2_fkey FOREIGN KEY (id_usua2)
REFERENCES public.usuario (id_usua) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: asistencia_id_usua3_fkey | type: CONSTRAINT --
-- ALTER TABLE public.asistencia DROP CONSTRAINT IF EXISTS asistencia_id_usua3_fkey CASCADE;
ALTER TABLE public.asistencia ADD CONSTRAINT asistencia_id_usua3_fkey FOREIGN KEY (id_usua3)
REFERENCES public.usuario (id_usua) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: administrador_id_admin_fkey | type: CONSTRAINT --
-- ALTER TABLE public.administrador DROP CONSTRAINT IF EXISTS administrador_id_admin_fkey CASCADE;
ALTER TABLE public.administrador ADD CONSTRAINT administrador_id_admin_fkey FOREIGN KEY (id_admin)
REFERENCES public.persona (cod_pers) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "grant_CU_d2427c1506" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO u0_a339;
-- ddl-end --

-- object: "grant_CU_cd8e46e7b6" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO PUBLIC;
-- ddl-end --


