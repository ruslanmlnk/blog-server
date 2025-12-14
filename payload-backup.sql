--
-- PostgreSQL database dump
--

\restrict NQIXhmqRrTJjudfkLjBUnZjIgon1a1mtVPHGvkchufdwrca70ZwfSc2UDn16Lei

-- Dumped from database version 15.14 (Debian 15.14-1.pgdg13+1)
-- Dumped by pg_dump version 15.14 (Debian 15.14-1.pgdg13+1)

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
-- Name: _locales; Type: TYPE; Schema: public; Owner: payload
--

CREATE TYPE public._locales AS ENUM (
    'ru',
    'uk',
    'en',
    'fr'
);


ALTER TYPE public._locales OWNER TO payload;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _site_globals_v; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public._site_globals_v (
    id integer NOT NULL,
    version_press_meta_meta_title character varying,
    version_press_meta_meta_description character varying,
    version_interview_meta_meta_title character varying,
    version_interview_meta_meta_description character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public._site_globals_v OWNER TO payload;

--
-- Name: _site_globals_v_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public._site_globals_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._site_globals_v_id_seq OWNER TO payload;

--
-- Name: _site_globals_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public._site_globals_v_id_seq OWNED BY public._site_globals_v.id;


--
-- Name: _site_globals_v_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public._site_globals_v_locales (
    version_menu_about character varying,
    version_menu_blog character varying,
    version_menu_press character varying,
    version_menu_interview character varying,
    version_menu_contacts character varying,
    version_categories_back_to_home character varying,
    version_press_all_title character varying,
    version_interview_all_title character varying,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public._site_globals_v_locales OWNER TO payload;

--
-- Name: _site_globals_v_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public._site_globals_v_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._site_globals_v_locales_id_seq OWNER TO payload;

--
-- Name: _site_globals_v_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public._site_globals_v_locales_id_seq OWNED BY public._site_globals_v_locales.id;


--
-- Name: about; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.about (
    id integer NOT NULL,
    hero_image_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    meta_meta_title character varying,
    meta_meta_description character varying
);


ALTER TABLE public.about OWNER TO payload;

--
-- Name: about_cards; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.about_cards (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL
);


ALTER TABLE public.about_cards OWNER TO payload;

--
-- Name: about_cards_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.about_cards_locales (
    title character varying NOT NULL,
    text character varying NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id character varying NOT NULL
);


ALTER TABLE public.about_cards_locales OWNER TO payload;

--
-- Name: about_cards_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.about_cards_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_cards_locales_id_seq OWNER TO payload;

--
-- Name: about_cards_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.about_cards_locales_id_seq OWNED BY public.about_cards_locales.id;


--
-- Name: about_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.about_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_id_seq OWNER TO payload;

--
-- Name: about_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.about_id_seq OWNED BY public.about.id;


--
-- Name: about_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.about_locales (
    title character varying NOT NULL,
    lead character varying NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.about_locales OWNER TO payload;

--
-- Name: about_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.about_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_locales_id_seq OWNER TO payload;

--
-- Name: about_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.about_locales_id_seq OWNED BY public.about_locales.id;


--
-- Name: article_categories; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.article_categories (
    id integer NOT NULL,
    icon_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    sort_order numeric DEFAULT 1,
    meta_meta_title character varying,
    meta_meta_description character varying
);


ALTER TABLE public.article_categories OWNER TO payload;

--
-- Name: article_categories_blocks_category_card_grid; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.article_categories_blocks_category_card_grid (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


ALTER TABLE public.article_categories_blocks_category_card_grid OWNER TO payload;

--
-- Name: article_categories_blocks_category_card_grid_items; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.article_categories_blocks_category_card_grid_items (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    article_id integer NOT NULL
);


ALTER TABLE public.article_categories_blocks_category_card_grid_items OWNER TO payload;

--
-- Name: article_categories_blocks_category_overlay_hero; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.article_categories_blocks_category_overlay_hero (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    article_id integer NOT NULL,
    block_name character varying
);


ALTER TABLE public.article_categories_blocks_category_overlay_hero OWNER TO payload;

--
-- Name: article_categories_blocks_category_overlay_pair; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.article_categories_blocks_category_overlay_pair (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


ALTER TABLE public.article_categories_blocks_category_overlay_pair OWNER TO payload;

--
-- Name: article_categories_blocks_category_overlay_pair_items; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.article_categories_blocks_category_overlay_pair_items (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    article_id integer NOT NULL
);


ALTER TABLE public.article_categories_blocks_category_overlay_pair_items OWNER TO payload;

--
-- Name: article_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.article_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_categories_id_seq OWNER TO payload;

--
-- Name: article_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.article_categories_id_seq OWNED BY public.article_categories.id;


--
-- Name: article_categories_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.article_categories_locales (
    title character varying NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.article_categories_locales OWNER TO payload;

--
-- Name: article_categories_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.article_categories_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_categories_locales_id_seq OWNER TO payload;

--
-- Name: article_categories_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.article_categories_locales_id_seq OWNED BY public.article_categories_locales.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    slug character varying NOT NULL,
    bg_id integer NOT NULL,
    category_id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    import_file_id integer,
    meta_meta_title character varying,
    meta_meta_description character varying
);


ALTER TABLE public.articles OWNER TO payload;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO payload;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: articles_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.articles_locales (
    title character varying NOT NULL,
    description character varying NOT NULL,
    rich_content jsonb,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.articles_locales OWNER TO payload;

--
-- Name: articles_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.articles_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_locales_id_seq OWNER TO payload;

--
-- Name: articles_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.articles_locales_id_seq OWNED BY public.articles_locales.id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.contact (
    id integer NOT NULL,
    side_image_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    meta_meta_title character varying,
    meta_meta_description character varying
);


ALTER TABLE public.contact OWNER TO payload;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO payload;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- Name: contact_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.contact_locales (
    title character varying NOT NULL,
    description character varying NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.contact_locales OWNER TO payload;

--
-- Name: contact_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.contact_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_locales_id_seq OWNER TO payload;

--
-- Name: contact_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.contact_locales_id_seq OWNED BY public.contact_locales.id;


--
-- Name: contact_messages; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.contact_messages (
    id integer NOT NULL,
    name character varying NOT NULL,
    phone character varying,
    email character varying,
    message character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contact_messages OWNER TO payload;

--
-- Name: contact_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.contact_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_messages_id_seq OWNER TO payload;

--
-- Name: contact_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.contact_messages_id_seq OWNED BY public.contact_messages.id;


--
-- Name: home; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.home (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    meta_meta_title character varying,
    meta_meta_description character varying
);


ALTER TABLE public.home OWNER TO payload;

--
-- Name: home_blocks_category_card_grid; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.home_blocks_category_card_grid (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


ALTER TABLE public.home_blocks_category_card_grid OWNER TO payload;

--
-- Name: home_blocks_category_card_grid_items; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.home_blocks_category_card_grid_items (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    article_id integer NOT NULL
);


ALTER TABLE public.home_blocks_category_card_grid_items OWNER TO payload;

--
-- Name: home_blocks_home_featured; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.home_blocks_home_featured (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    article_id integer NOT NULL,
    block_name character varying
);


ALTER TABLE public.home_blocks_home_featured OWNER TO payload;

--
-- Name: home_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.home_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_id_seq OWNER TO payload;

--
-- Name: home_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.home_id_seq OWNED BY public.home.id;


--
-- Name: home_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.home_locales (
    title character varying NOT NULL,
    description character varying NOT NULL,
    trends_title character varying DEFAULT 'Trends'::character varying,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.home_locales OWNER TO payload;

--
-- Name: home_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.home_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_locales_id_seq OWNER TO payload;

--
-- Name: home_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.home_locales_id_seq OWNED BY public.home_locales.id;


--
-- Name: home_trends_items; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.home_trends_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    article_id integer NOT NULL
);


ALTER TABLE public.home_trends_items OWNER TO payload;

--
-- Name: interview; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.interview (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    sort_order numeric DEFAULT 1,
    meta_meta_title character varying,
    meta_meta_description character varying
);


ALTER TABLE public.interview OWNER TO payload;

--
-- Name: interview_blocks_interview_card_grid; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.interview_blocks_interview_card_grid (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


ALTER TABLE public.interview_blocks_interview_card_grid OWNER TO payload;

--
-- Name: interview_blocks_interview_card_grid_items; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.interview_blocks_interview_card_grid_items (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    href character varying NOT NULL,
    title character varying NOT NULL,
    description character varying,
    image_id integer NOT NULL
);


ALTER TABLE public.interview_blocks_interview_card_grid_items OWNER TO payload;

--
-- Name: interview_blocks_interview_overlay_hero; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.interview_blocks_interview_overlay_hero (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    href character varying NOT NULL,
    title character varying NOT NULL,
    subtitle character varying,
    image_id integer NOT NULL,
    block_name character varying
);


ALTER TABLE public.interview_blocks_interview_overlay_hero OWNER TO payload;

--
-- Name: interview_blocks_interview_overlay_pair; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.interview_blocks_interview_overlay_pair (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


ALTER TABLE public.interview_blocks_interview_overlay_pair OWNER TO payload;

--
-- Name: interview_blocks_interview_overlay_pair_items; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.interview_blocks_interview_overlay_pair_items (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    href character varying NOT NULL,
    title character varying NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.interview_blocks_interview_overlay_pair_items OWNER TO payload;

--
-- Name: interview_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.interview_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interview_id_seq OWNER TO payload;

--
-- Name: interview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.interview_id_seq OWNED BY public.interview.id;


--
-- Name: interview_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.interview_locales (
    title character varying NOT NULL,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.interview_locales OWNER TO payload;

--
-- Name: interview_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.interview_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interview_locales_id_seq OWNER TO payload;

--
-- Name: interview_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.interview_locales_id_seq OWNED BY public.interview_locales.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.media (
    id integer NOT NULL,
    alt character varying NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    thumbnail_u_r_l character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric
);


ALTER TABLE public.media OWNER TO payload;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO payload;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: payload_locked_documents; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.payload_locked_documents (
    id integer NOT NULL,
    global_slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_locked_documents OWNER TO payload;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.payload_locked_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_locked_documents_id_seq OWNER TO payload;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.payload_locked_documents_id_seq OWNED BY public.payload_locked_documents.id;


--
-- Name: payload_locked_documents_rels; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.payload_locked_documents_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer,
    media_id integer,
    articles_id integer,
    article_categories_id integer,
    home_id integer,
    about_id integer,
    contact_id integer,
    press_id integer,
    interview_id integer,
    contact_messages_id integer,
    weekly_newsletters_id integer,
    privacy_policy_id integer
);


ALTER TABLE public.payload_locked_documents_rels OWNER TO payload;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.payload_locked_documents_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_locked_documents_rels_id_seq OWNER TO payload;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNED BY public.payload_locked_documents_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_migrations OWNER TO payload;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_migrations_id_seq OWNER TO payload;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_preferences OWNER TO payload;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_preferences_id_seq OWNER TO payload;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE public.payload_preferences_rels OWNER TO payload;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payload_preferences_rels_id_seq OWNER TO payload;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: press; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.press (
    id integer NOT NULL,
    icon_id integer,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    sort_order numeric DEFAULT 1,
    meta_meta_title character varying,
    meta_meta_description character varying
);


ALTER TABLE public.press OWNER TO payload;

--
-- Name: press_blocks_press_card_grid; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.press_blocks_press_card_grid (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


ALTER TABLE public.press_blocks_press_card_grid OWNER TO payload;

--
-- Name: press_blocks_press_card_grid_items; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.press_blocks_press_card_grid_items (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    href character varying NOT NULL,
    title character varying NOT NULL,
    description character varying,
    image_id integer NOT NULL
);


ALTER TABLE public.press_blocks_press_card_grid_items OWNER TO payload;

--
-- Name: press_blocks_press_overlay_hero; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.press_blocks_press_overlay_hero (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    visible_from timestamp(3) with time zone,
    href character varying NOT NULL,
    title character varying NOT NULL,
    subtitle character varying,
    image_id integer NOT NULL,
    block_name character varying
);


ALTER TABLE public.press_blocks_press_overlay_hero OWNER TO payload;

--
-- Name: press_blocks_press_overlay_pair; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.press_blocks_press_overlay_pair (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    block_name character varying
);


ALTER TABLE public.press_blocks_press_overlay_pair OWNER TO payload;

--
-- Name: press_blocks_press_overlay_pair_items; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.press_blocks_press_overlay_pair_items (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    _locale public._locales NOT NULL,
    id character varying NOT NULL,
    date timestamp(3) with time zone,
    visible_from timestamp(3) with time zone,
    href character varying NOT NULL,
    title character varying NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.press_blocks_press_overlay_pair_items OWNER TO payload;

--
-- Name: press_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.press_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.press_id_seq OWNER TO payload;

--
-- Name: press_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.press_id_seq OWNED BY public.press.id;


--
-- Name: press_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.press_locales (
    title character varying NOT NULL,
    description character varying,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.press_locales OWNER TO payload;

--
-- Name: press_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.press_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.press_locales_id_seq OWNER TO payload;

--
-- Name: press_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.press_locales_id_seq OWNED BY public.press_locales.id;


--
-- Name: privacy_policy; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.privacy_policy (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.privacy_policy OWNER TO payload;

--
-- Name: privacy_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.privacy_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privacy_policy_id_seq OWNER TO payload;

--
-- Name: privacy_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.privacy_policy_id_seq OWNED BY public.privacy_policy.id;


--
-- Name: privacy_policy_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.privacy_policy_locales (
    title character varying NOT NULL,
    meta_title character varying,
    meta_description character varying,
    rich_content jsonb,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.privacy_policy_locales OWNER TO payload;

--
-- Name: privacy_policy_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.privacy_policy_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privacy_policy_locales_id_seq OWNER TO payload;

--
-- Name: privacy_policy_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.privacy_policy_locales_id_seq OWNED BY public.privacy_policy_locales.id;


--
-- Name: site_globals; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.site_globals (
    id integer NOT NULL,
    press_meta_meta_title character varying,
    press_meta_meta_description character varying,
    interview_meta_meta_title character varying,
    interview_meta_meta_description character varying,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.site_globals OWNER TO payload;

--
-- Name: site_globals_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.site_globals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_globals_id_seq OWNER TO payload;

--
-- Name: site_globals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.site_globals_id_seq OWNED BY public.site_globals.id;


--
-- Name: site_globals_locales; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.site_globals_locales (
    menu_about character varying,
    menu_blog character varying,
    menu_press character varying,
    menu_interview character varying,
    menu_contacts character varying,
    categories_back_to_home character varying,
    press_all_title character varying,
    interview_all_title character varying,
    id integer NOT NULL,
    _locale public._locales NOT NULL,
    _parent_id integer NOT NULL
);


ALTER TABLE public.site_globals_locales OWNER TO payload;

--
-- Name: site_globals_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.site_globals_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_globals_locales_id_seq OWNER TO payload;

--
-- Name: site_globals_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.site_globals_locales_id_seq OWNED BY public.site_globals_locales.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.users (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric DEFAULT 0,
    lock_until timestamp(3) with time zone
);


ALTER TABLE public.users OWNER TO payload;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO payload;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_sessions; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.users_sessions (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    created_at timestamp(3) with time zone,
    expires_at timestamp(3) with time zone NOT NULL
);


ALTER TABLE public.users_sessions OWNER TO payload;

--
-- Name: weekly_newsletters; Type: TABLE; Schema: public; Owner: payload
--

CREATE TABLE public.weekly_newsletters (
    id integer NOT NULL,
    email character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.weekly_newsletters OWNER TO payload;

--
-- Name: weekly_newsletters_id_seq; Type: SEQUENCE; Schema: public; Owner: payload
--

CREATE SEQUENCE public.weekly_newsletters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weekly_newsletters_id_seq OWNER TO payload;

--
-- Name: weekly_newsletters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: payload
--

ALTER SEQUENCE public.weekly_newsletters_id_seq OWNED BY public.weekly_newsletters.id;


--
-- Name: _site_globals_v id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public._site_globals_v ALTER COLUMN id SET DEFAULT nextval('public._site_globals_v_id_seq'::regclass);


--
-- Name: _site_globals_v_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public._site_globals_v_locales ALTER COLUMN id SET DEFAULT nextval('public._site_globals_v_locales_id_seq'::regclass);


--
-- Name: about id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about ALTER COLUMN id SET DEFAULT nextval('public.about_id_seq'::regclass);


--
-- Name: about_cards_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about_cards_locales ALTER COLUMN id SET DEFAULT nextval('public.about_cards_locales_id_seq'::regclass);


--
-- Name: about_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about_locales ALTER COLUMN id SET DEFAULT nextval('public.about_locales_id_seq'::regclass);


--
-- Name: article_categories id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories ALTER COLUMN id SET DEFAULT nextval('public.article_categories_id_seq'::regclass);


--
-- Name: article_categories_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_locales ALTER COLUMN id SET DEFAULT nextval('public.article_categories_locales_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: articles_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.articles_locales ALTER COLUMN id SET DEFAULT nextval('public.articles_locales_id_seq'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- Name: contact_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.contact_locales ALTER COLUMN id SET DEFAULT nextval('public.contact_locales_id_seq'::regclass);


--
-- Name: contact_messages id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.contact_messages ALTER COLUMN id SET DEFAULT nextval('public.contact_messages_id_seq'::regclass);


--
-- Name: home id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home ALTER COLUMN id SET DEFAULT nextval('public.home_id_seq'::regclass);


--
-- Name: home_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_locales ALTER COLUMN id SET DEFAULT nextval('public.home_locales_id_seq'::regclass);


--
-- Name: interview id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview ALTER COLUMN id SET DEFAULT nextval('public.interview_id_seq'::regclass);


--
-- Name: interview_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_locales ALTER COLUMN id SET DEFAULT nextval('public.interview_locales_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: payload_locked_documents id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_id_seq'::regclass);


--
-- Name: payload_locked_documents_rels id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: press id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press ALTER COLUMN id SET DEFAULT nextval('public.press_id_seq'::regclass);


--
-- Name: press_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_locales ALTER COLUMN id SET DEFAULT nextval('public.press_locales_id_seq'::regclass);


--
-- Name: privacy_policy id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.privacy_policy ALTER COLUMN id SET DEFAULT nextval('public.privacy_policy_id_seq'::regclass);


--
-- Name: privacy_policy_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.privacy_policy_locales ALTER COLUMN id SET DEFAULT nextval('public.privacy_policy_locales_id_seq'::regclass);


--
-- Name: site_globals id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.site_globals ALTER COLUMN id SET DEFAULT nextval('public.site_globals_id_seq'::regclass);


--
-- Name: site_globals_locales id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.site_globals_locales ALTER COLUMN id SET DEFAULT nextval('public.site_globals_locales_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: weekly_newsletters id; Type: DEFAULT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.weekly_newsletters ALTER COLUMN id SET DEFAULT nextval('public.weekly_newsletters_id_seq'::regclass);


--
-- Data for Name: _site_globals_v; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public._site_globals_v (id, version_press_meta_meta_title, version_press_meta_meta_description, version_interview_meta_meta_title, version_interview_meta_meta_description, version_updated_at, version_created_at, created_at, updated_at) FROM stdin;
1	\N	\N	\N	\N	2025-11-01 00:04:46.774+00	2025-11-01 00:04:46.774+00	2025-11-01 00:04:46.78+00	2025-11-01 00:04:46.78+00
2	\N	\N	\N	\N	2025-11-01 00:05:07.139+00	2025-11-01 00:04:46.774+00	2025-11-01 00:05:07.148+00	2025-11-01 00:05:07.148+00
3	\N	\N	\N	\N	2025-11-01 00:13:20.458+00	2025-11-01 00:04:46.774+00	2025-11-01 00:13:20.465+00	2025-11-01 00:13:20.465+00
4	\N	\N	\N	\N	2025-11-01 00:14:45.195+00	2025-11-01 00:04:46.774+00	2025-11-01 00:14:45.201+00	2025-11-01 00:14:45.201+00
5	\N	\N	\N	\N	2025-11-01 00:21:01.857+00	2025-11-01 00:04:46.774+00	2025-11-01 00:21:01.864+00	2025-11-01 00:21:01.864+00
6	цц	\N	\N	\N	2025-11-01 00:25:28.454+00	2025-11-01 00:04:46.774+00	2025-11-01 00:25:28.46+00	2025-11-01 00:25:28.46+00
7	цц	\N	qwdqw	\N	2025-11-01 00:25:49.313+00	2025-11-01 00:04:46.774+00	2025-11-01 00:25:49.321+00	2025-11-01 00:25:49.321+00
8	цц	\N	qwdqw	\N	2025-11-01 00:26:33.182+00	2025-11-01 00:04:46.774+00	2025-11-01 00:26:33.191+00	2025-11-01 00:26:33.191+00
9		\N	qwdqw	\N	2025-11-01 00:29:11.286+00	2025-11-01 00:04:46.774+00	2025-11-01 00:29:11.291+00	2025-11-01 00:29:11.291+00
10		\N	qwdqw	\N	2025-11-01 00:29:33.82+00	2025-11-01 00:04:46.774+00	2025-11-01 00:29:33.826+00	2025-11-01 00:29:33.826+00
11	Тест1	Тест1 опис	qwdqw	\N	2025-11-01 00:34:21.487+00	2025-11-01 00:04:46.774+00	2025-11-01 00:34:21.494+00	2025-11-01 00:34:21.494+00
12	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:34:38.169+00	2025-11-01 00:04:46.774+00	2025-11-01 00:34:38.174+00	2025-11-01 00:34:38.174+00
13	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:34:47.515+00	2025-11-01 00:04:46.774+00	2025-11-01 00:34:47.521+00	2025-11-01 00:34:47.521+00
14	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:34:52.07+00	2025-11-01 00:04:46.774+00	2025-11-01 00:34:52.076+00	2025-11-01 00:34:52.076+00
15	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:36:16.953+00	2025-11-01 00:04:46.774+00	2025-11-01 00:36:16.96+00	2025-11-01 00:36:16.96+00
16	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:36:47.745+00	2025-11-01 00:04:46.774+00	2025-11-01 00:36:47.75+00	2025-11-01 00:36:47.75+00
17	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:37:17.474+00	2025-11-01 00:04:46.774+00	2025-11-01 00:37:17.479+00	2025-11-01 00:37:17.479+00
18	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:37:32.142+00	2025-11-01 00:04:46.774+00	2025-11-01 00:37:32.148+00	2025-11-01 00:37:32.148+00
19	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:37:39.672+00	2025-11-01 00:04:46.774+00	2025-11-01 00:37:39.677+00	2025-11-01 00:37:39.677+00
20	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:37:44.521+00	2025-11-01 00:04:46.774+00	2025-11-01 00:37:44.53+00	2025-11-01 00:37:44.53+00
21	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:38:08.707+00	2025-11-01 00:04:46.774+00	2025-11-01 00:38:08.711+00	2025-11-01 00:38:08.711+00
22	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:38:30.249+00	2025-11-01 00:04:46.774+00	2025-11-01 00:38:30.255+00	2025-11-01 00:38:30.255+00
\.


--
-- Data for Name: _site_globals_v_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public._site_globals_v_locales (version_menu_about, version_menu_blog, version_menu_press, version_menu_interview, version_menu_contacts, version_categories_back_to_home, version_press_all_title, version_interview_all_title, id, _locale, _parent_id) FROM stdin;
\N	\N	\N	dff	\N	\N	\N	\N	1	ru	1
\N	\N	\N	dff	\N	dwsd	\N	\N	2	ru	2
\N	\N	\N	dff	\N	dwsd	dfcdfd	\N	3	ru	3
в	в	в	dff	в	dwsd	\N	\N	4	ru	4
					dwsd	\N	\N	5	ru	5
					dwsd	\N	\N	6	ru	6
					dwsd	\N	\N	7	ru	7
					dwsd	sdss	\N	8	ru	8
					dwsd		\N	9	ru	9
							\N	10	ru	10
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	11	ru	11
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	12	ru	12
О центре	Публикации1	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	13	ru	13
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	14	ru	14
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	15	ru	15
About	Publications	In Media	Interviews	Contacts	Back to home	\N	\N	16	en	15
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	17	ru	16
Про центр	Публікації	У ЗМІ	Інтерв'ю	Контакти	Повернутися на головну	\N	\N	18	uk	16
About	Publications	In Media	Interviews	Contacts	Back to home	\N	\N	19	en	16
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	20	ru	17
Про центр	Публікації	У ЗМІ	Інтерв'ю	Контакти	Повернутися на головну	\N	\N	21	uk	17
About	Publications	In Media	Interviews	Contacts	Back to home	\N	\N	22	en	17
À propos	Publications	Dans les médias	Interviews	Contacts	Retour à l'accueil	\N	\N	23	fr	17
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	24	ru	18
Про центр	Публікації	У ЗМІ	Інтерв'ю	Контакти	Повернутися на головну	\N	\N	25	uk	18
About	Publications	In Media	Interviews	Contacts	Back to home	\N	\N	26	en	18
À propos	Publications	Dans les médias1	Interviews	Contacts	Retour à l'accueil	\N	\N	27	fr	18
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	28	ru	19
Про центр	Публікації	У ЗМІ	Інтерв'ю	Контакти	Повернутися на головну	\N	\N	29	uk	19
About	Publications	In Media	Interviews	Contacts	Back to home	\N	\N	30	en	19
À propos	Publications	Dans les médias	Interviews	Contacts	Retour à l'accueil1	\N	\N	31	fr	19
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	32	ru	20
Про центр	Публікації	У ЗМІ	Інтерв'ю	Контакти	Повернутися на головну	\N	\N	33	uk	20
About	Publications	In Media	Interviews	Contacts	Back to home	\N	\N	34	en	20
À propos	Publications	Dans les médias	Interviews	Contacts	Retour à l'accueil	\N	\N	35	fr	20
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	36	ru	21
Про центр	Публікації	У ЗМІ	Інтерв'ю	Контакти	Повернутися на головну	\N	\N	37	uk	21
About	Publications	In Media	Interviews	Contacts	Back to home	\N	\N	38	en	21
À propos	Publications	Dans les médias	Interviews	Contacts	Retour à l'accueil	ва	\N	39	fr	21
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	40	ru	22
Про центр	Публікації	У ЗМІ	Інтерв'ю	Контакти	Повернутися на головну	\N	\N	41	uk	22
About	Publications	In Media	Interviews	Contacts	Back to home	\N	\N	42	en	22
À propos	Publications	Dans les médias	Interviews	Contacts	Retour à l'accueil		\N	43	fr	22
\.


--
-- Data for Name: about; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.about (id, hero_image_id, updated_at, created_at, meta_meta_title, meta_meta_description) FROM stdin;
1	2	2025-10-20 00:22:59.549+00	2025-10-12 17:15:11.511+00	\N	\N
\.


--
-- Data for Name: about_cards; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.about_cards (_order, _parent_id, id) FROM stdin;
1	1	68ebe2022aa3ae34a318de04
2	1	68ebe2082aa3ae34a318de05
3	1	68ebe2102aa3ae34a318de06
4	1	68ebe2182aa3ae34a318de07
\.


--
-- Data for Name: about_cards_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.about_cards_locales (title, text, id, _locale, _parent_id) FROM stdin;
Наша миссия	Предоставлять точные и проверенные данные, которые помогают журналистам, правозащитным организациям и международным институтам принимать обоснованные решения.	73	ru	68ebe2022aa3ae34a318de04
Наша місія	Надавати точні та перевірені дані, які допомагають журналістам, правозахисним організаціям та міжнародним інститутам приймати обґрунтовані рішення.	74	uk	68ebe2022aa3ae34a318de04
Our mission	Provide accurate and verified data that helps journalists, human rights organizations, and international institutions make informed decisions.	75	en	68ebe2022aa3ae34a318de04
Notre mission	Fournir des données précises et vérifiées qui aident les journalistes, les organisations de défense des droits humains et les institutions internationales à prendre des décisions éclairées.	76	fr	68ebe2022aa3ae34a318de04
Наш подход	Мы используем современные технологии анализа данных — искусственный интеллект, Python и big data, что позволяет выявлять закономерности и получать целостную картину происходящего.	77	ru	68ebe2082aa3ae34a318de05
Наш підхід	Ми використовуємо сучасні технології аналізу даних — штучний інтелект, Python і big data, що дозволяє виявляти закономірності та отримувати цілісну картину того, що відбувається.	78	uk	68ebe2082aa3ae34a318de05
Our approach	We use modern data analysis technologies—artificial intelligence, Python, and big data—which allow us to identify patterns and obtain a comprehensive picture of what is happening.	79	en	68ebe2082aa3ae34a318de05
Notre approche	Nous utilisons des technologies modernes d'analyse des données — intelligence artificielle, Python et big data — qui permettent d'identifier des tendances et d'obtenir une vue d'ensemble de la situation.	80	fr	68ebe2082aa3ae34a318de05
Что мы делаем	Мы систематизируем факты, анализируем большие массивы данных и превращаем их в доступную аналитику: базы данных, отчёты и исследования, которые находят отражение в СМИ и докладах НКО.	81	ru	68ebe2102aa3ae34a318de06
Що ми робимо	Ми систематизуємо факти, аналізуємо великі масиви даних і перетворюємо їх на доступну аналітику: бази даних, звіти та дослідження, які знаходять відображення в ЗМІ та доповідях НКО.	82	uk	68ebe2102aa3ae34a318de06
What we do	We systematize facts, analyze large data sets, and transform them into accessible analytics: databases, reports, and studies that are reflected in the media and NGO reports.	83	en	68ebe2102aa3ae34a318de06
Ce que nous faisons	Nous systématisons les faits, analysons de grands ensembles de données et les transformons en analyses accessibles : bases de données, rapports et études qui sont repris dans les médias et les rapports des ONG.	84	fr	68ebe2102aa3ae34a318de06
Наше признание	Наши исследования уже используют крупнейшие международные СМИ — такие как Bloomberg, Die Zeit, Le Monde — а также международные организации, включая структуры ООН и Европарламент.	85	ru	68ebe2182aa3ae34a318de07
Наше визнання	Наші дослідження вже використовують найбільші міжнародні ЗМІ — такі як Bloomberg, Die Zeit, Le Monde — а також міжнародні організації, включаючи структури ООН і Європарламент.	86	uk	68ebe2182aa3ae34a318de07
Our recognition	Our research is already being used by major international media outlets such as Bloomberg, Die Zeit, and Le Monde, as well as international organizations including UN agencies and the European Parliament.	87	en	68ebe2182aa3ae34a318de07
Notre reconnaissance	Nos recherches sont déjà utilisées par les plus grands médias internationaux, tels que Bloomberg, Die Zeit, Le Monde, ainsi que par des organisations internationales, notamment les structures des Nations Unies et le Parlement européen.	88	fr	68ebe2182aa3ae34a318de07
\.


--
-- Data for Name: about_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.about_locales (title, lead, id, _locale, _parent_id) FROM stdin;
Мы — независимый аналитический центр, специализирующийся на исследовании политических репрессий, войны и нарушений прав человека  в Восточной Европе	Мы — независимый аналитический центр, специализирующийся на исследовании политических репрессий, войны и нарушений прав человека  в Восточной Европе	19	ru	1
Ми — незалежний аналітичний центр, що спеціалізується на дослідженні політичних репресій, війни та порушень прав людини  у Східній Європі	Ми — незалежний аналітичний центр, що спеціалізується на дослідженні політичних репресій, війни та порушень прав людини  у Східній Європі	20	uk	1
We are an independent think tank specializing in research on political repression, war, and human rights violations in Eastern Europe.	We are an independent think tank specializing in research on political repression, war, and human rights violations in Eastern Europe.	21	en	1
Nous sommes un centre d'analyse indépendant spécialisé dans l'étude des répressions politiques, des guerres et des violations des droits humains en Europe de l'Est.	Nous sommes un centre d'analyse indépendant spécialisé dans l'étude des répressions politiques, des guerres et des violations des droits humains en Europe de l'Est.	22	fr	1
\.


--
-- Data for Name: article_categories; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.article_categories (id, icon_id, updated_at, created_at, sort_order, meta_meta_title, meta_meta_description) FROM stdin;
4	6	2025-10-20 00:21:55.895+00	2025-10-12 17:48:31.566+00	4	\N	\N
1	3	2025-10-20 03:41:10.082+00	2025-10-12 14:59:51.06+00	1	\N	\N
5	140	2025-10-31 23:00:28.28+00	2025-10-31 22:59:17.271+00	5	\N	\N
2	4	2025-10-31 23:00:53.87+00	2025-10-12 17:45:50.306+00	2	\N	\N
3	5	2025-10-31 23:06:30.671+00	2025-10-12 17:47:18.786+00	3	\N	\N
\.


--
-- Data for Name: article_categories_blocks_category_card_grid; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.article_categories_blocks_category_card_grid (_order, _parent_id, _path, _locale, id, block_name) FROM stdin;
2	1	content	ru	68ebf74f0b5ed01d325538bb	\N
5	1	content	ru	68ebf7320b5ed01d325538b3	\N
1	5	content	ru	69053f751e5baf15190a3145	\N
1	2	content	ru	68f4b32cd6b33e75bce01efc	\N
1	3	content	ru	690540ec1e5baf15190a3147	\N
\.


--
-- Data for Name: article_categories_blocks_category_card_grid_items; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.article_categories_blocks_category_card_grid_items (_order, _parent_id, _locale, id, visible_from, article_id) FROM stdin;
1	68ebf74f0b5ed01d325538bb	ru	68ebf74f0b5ed01d325538bc	2025-10-17 21:00:00+00	1
2	68ebf74f0b5ed01d325538bb	ru	68ebf74f0b5ed01d325538bd	\N	1
3	68ebf74f0b5ed01d325538bb	ru	68ebf74f0b5ed01d325538be	\N	1
1	68ebf7320b5ed01d325538b3	ru	68ebf7350b5ed01d325538b4	\N	1
2	68ebf7320b5ed01d325538b3	ru	68ebf7370b5ed01d325538b5	\N	1
3	68ebf7320b5ed01d325538b3	ru	68ebf7390b5ed01d325538b6	\N	1
1	69053f751e5baf15190a3145	ru	69053f771e5baf15190a3146	2025-10-21 22:00:00+00	6
1	68f4b32cd6b33e75bce01efc	ru	68f4b32ed6b33e75bce01efe	2025-10-12 22:00:00+00	2
2	68f4b32cd6b33e75bce01efc	ru	68fa380731a31f09060c6cca	2025-10-21 22:00:00+00	5
1	690540ec1e5baf15190a3147	ru	690540ef1e5baf15190a3148	2025-10-31 23:00:00+00	7
\.


--
-- Data for Name: article_categories_blocks_category_overlay_hero; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.article_categories_blocks_category_overlay_hero (_order, _parent_id, _path, _locale, id, visible_from, article_id, block_name) FROM stdin;
3	1	content	ru	68ebf75d0b5ed01d325538bf	\N	1	\N
6	1	content	ru	68ebf73f0b5ed01d325538b7	\N	1	\N
\.


--
-- Data for Name: article_categories_blocks_category_overlay_pair; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.article_categories_blocks_category_overlay_pair (_order, _parent_id, _path, _locale, id, block_name) FROM stdin;
1	1	content	ru	68ebf7490b5ed01d325538b8	\N
4	1	content	ru	68ebf7240b5ed01d325538b0	\N
\.


--
-- Data for Name: article_categories_blocks_category_overlay_pair_items; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.article_categories_blocks_category_overlay_pair_items (_order, _parent_id, _locale, id, visible_from, article_id) FROM stdin;
1	68ebf7490b5ed01d325538b8	ru	68ebf7490b5ed01d325538b9	2025-10-18 21:00:00+00	1
2	68ebf7490b5ed01d325538b8	ru	68ebf7490b5ed01d325538ba	\N	1
1	68ebf7240b5ed01d325538b0	ru	68ebf7260b5ed01d325538b1	\N	1
2	68ebf7240b5ed01d325538b0	ru	68ebf7280b5ed01d325538b2	\N	1
\.


--
-- Data for Name: article_categories_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.article_categories_locales (title, id, _locale, _parent_id) FROM stdin;
Украина	82	ru	1
Україна	83	uk	1
Ukraine	84	en	1
Ukraine	85	fr	1
Кибербезопасность	108	ru	5
Репрессии в России	109	ru	2
Репресії в Росії	110	uk	2
Repression in Russia	111	en	2
Répressions en Russie	112	fr	2
Политика и выборы	113	ru	3
Політика і вибори	114	uk	3
Politics and elections	115	en	3
Politique et élections	116	fr	3
Европа	70	ru	4
Європа	71	uk	4
Europe	72	en	4
Europe	73	fr	4
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.articles (id, slug, bg_id, category_id, updated_at, created_at, import_file_id, meta_meta_title, meta_meta_description) FROM stdin;
5	ischezayushchie-prigovory-gosizmena-terrorizm	52	2	2025-10-22 19:54:01.277+00	2025-10-22 19:52:02.525+00	\N	\N	\N
6	telega-novyi-proekt-vkontakte	53	2	2025-10-23 14:46:45.014+00	2025-10-23 14:36:34.984+00	\N	\N	\N
1	94-condamnations-par-mois-pour-des-affaires-de-terrorisme-sont-prononces-en-russie-cest-35-fois-plus-quen-2021	7	1	2025-10-18 20:23:12.978+00	2025-10-12 14:59:56.92+00	\N	\N	\N
2	analysis-of-treason-and-espionage-cases-in-russia-h1-2025	21	2	2025-10-20 18:22:34.686+00	2025-10-19 09:44:32.309+00	\N	\N	\N
4	ewweweew	37	2	2025-10-30 18:28:09.559+00	2025-10-21 20:01:36.381+00	\N	\N	\N
7	from-russian-centers-to-bot-armies	142	3	2025-10-31 23:05:59.455+00	2025-10-31 23:05:59.455+00	\N	\N	\N
\.


--
-- Data for Name: articles_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.articles_locales (title, description, rich_content, id, _locale, _parent_id) FROM stdin;
Судебная тень: исчезающие приговоры по госизмене и терроризму	Суддеп ВС РФ сообщает не обо всех приговорах	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Судебная тень: исчезающие приговоры по госизмене и терроризму", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Согласно данным Судебного департамента при Верховном суде РФ, опубликованным 20 октября 2025 года на сайте cdep.ru, за первое полугодие 2025 года российские суды осудили 133 человека по статьям о государственной измене и шпионаже (ст. 275, 276, 275.1, 276.1 УК РФ) и 628 человек — по статьям террористической направленности (ст. 205, 205.1–205.5 УК РФ) в качестве основного обвинения.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "По делам о государственной измене и шпионаже, из 133 человек:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "По статьям, связанным с терроризмом из 628 человек:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "По статьям основного обвинения не было ни одного оправдательного приговора ни в делах о госизмене и шпионаже, ни в делах о терроризме", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "По статьям о госизмене и шпионаже 2 дела были прекращены по иным основаниям (вероятно, в связи со смертью обвиняемого), по делам о терроризме прекращенных дел не было.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Наконец, в делах о терроризме в отношении 28 человек применены меры медицинского характера, в делах о госизмене и шпионаже - в отношении 2 человек", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Однако, согласно совместному исследованию аналитического центра «Parubets Analytics» и правозащитного проекта «Первый отдел», основанному на анализе карточек судебных дел, за тот же период было осуждено 232 человека по статьям о госизмене и шпионаже (https://dept.one/story/gosizmena-jan-jun-2025/) и 659 человек по делам террористической направленности (https://dept.one/story/terrorizm-2025/)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Таким образом, статистика по делам террористической направленности почти совпадает (различие всего в 5%), а вот расхождение в статистике дел о госизмене и шпионаже составило почти 43% (то есть в 1.75 раза), такая разница выходит далеко за рамки статистической погрешности.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Кроме того, расходятся цифры мер. медицинского характера. Так, согласно данным суддепа, таких случаев в делах о терроризме было 28 (по подсчетам «Parubets Analytics» - 34), в делах о государственной измене и шпионаже - 2 (по подсчетам «Parubets Analytics» - 3)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Мы попросили комментарий о методологии подсчета, которой пользуется суддеп ВС РФ у госпожи Хаджаевой. Она отметила, что официальная статистика основывается на дате вынесения приговора и включает как военные суды, так и суды общей юрисдикции. Однако данные по оккупированным территориям, по ее словам, могут быть неполными.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Между тем методология «Parubets Analytics» и «Первого отдела» опирается на тот же принцип — учёт приговоров по дате вынесения, включая решения военных судов, что делает объяснение расхождений ещё менее очевидным.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В условиях засекречивания приговоров, закрытых процессов и отсутствия прозрачных данных даже в открытых источниках Верховного суда, становится невозможно достоверно оценить масштаб репрессий. «Исчезающие приговоры» — это не статистическая ошибка, а симптом системной непрозрачности российского правосудия.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	110	ru	5
94 condamnations par mois pour des affaires de « terrorisme » sont prononcées  en Russie. C'est 3,5 fois plus qu'en 2021.	Depuis 2022, on observe en Russie une augmentation significative du nombre d'affaires liées au « terrorisme » examinées par les tribunaux russes. Dès 2023, le nombre de condamnations prononcées dans ce type d'affaires a doublé par rapport à 2021.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "TerstFr", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	74	fr	1
Telega - новый проект Вконтакте?	Приложение “Телега” плотно интегрировано с экосистемой VK/OK	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Telega - новый загадочный Telegram-клиент?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Аналитический Центр “Parubets Analytics”,", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "autolink", "fields": {"url": "https://parubets.org/", "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "https://parubets.org/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "23 октября 2025 г., Франция", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Кратко из расследования:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В сети набирает обороты реклама приложения “", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Telega", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "” - якобы аналог Телеграм, позволяющий обходить блокировки Телеграм", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Разработчики - фирмы неясного происхождения АО \\"Даль\\" и \\"ТЕХНОЛОГИИ ПОЛЬЗОВАТЕЛЬСКИХ КОММУНИКАЦИЙ\\", зарегистрированные в Казани. Генеральный директор связан с “УПРАВЛЯЮЩАЯ КОМПАНИЯ ВК”", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Само приложение имеет шпионские функции - перехватывает токен доступа к Телеграм, читает сообщения, а также имеет доступ к файлам, микрофону, информации о пользователе", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Все данные приложения отправляются и хранятся на серверах Вконтакте", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Технически, это VoIP-клиент VK, замаскированный под Telegram", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Использовать приложение категорически не рекомендуется! Это несет риски компрометации всей личной информации на устройстве.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Введение", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "На фоне новых блокировок и ограничений доступа к Telegram в России пользователи всё чаще сталкиваются с рекламой приложения Telega — мессенджера, который позиционирует себя как «обновлённый Telegram» и обещает стабильную работу без VPN. Однако за внешней схожестью с популярным сервисом скрывается множество вопросов: кто стоит за проектом, насколько он безопасен и куда на самом деле уходит пользовательский трафик?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Сайт и разработчики", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Реклама в социальных сетях ведет на некий сайт по адресу telega.me, который согласно данным WhoIs принадлежит компании АО \\"Даль\\", зарегистрированной в январе этого года в Казани. Генеральный директор - Смирнов Александр Михайлович связанный с \\"УПРАВЛЯЮЩАЯ КОМПАНИЯ ВК\\".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "У организации иметтся сайт ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "autolink", "fields": {"url": "https://aodahl.com/", "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "https://aodahl.com/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": ", сделанный в конструкторе “Tilda” и явно наспех. На сайте отсутствует информация о то, кто стоит за проектом, также отсутствует портфолио, что нехарактерно для компаний, разрабатывающих ИТ-решения.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Контактный номер телефона на сайте зарегистрирован в республике Кипр.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "На сайте telega.me в числе прочего сказано, что “Telega — Telegram-клиент, созданный на базе открытого кода мессенджера”, но это соответствует действительности лишь отчасти: код серверной части Telegram полностью закрыт, поэтому telega может работать лишь как оболочка, использующая Telegram API.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Еще один разработчик?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "На сайте “мессенджера” Телега имеется раздел “Скачать”, где помимо ссылок на App Store, Google Play и RuStore имеется также ссылка на Google Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Перейдя по ссылке и заглянув раздел “Details” мы узнаем об еще одной сомнительной фирме tusco.ru", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Домен принадлежит компании \\"ТЕХНОЛОГИИ ПОЛЬЗОВАТЕЛЬСКИХ КОММУНИКАЦИЙ\\", также зарегистрированной, в Казани, имеющей уставной капитал в 10,000 рублей и чистый убыток в 1.2 млн. рублей.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Сайт компании ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "autolink", "fields": {"url": "https://tusco.ru/", "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "https://tusco.ru/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " зарегистрирован в августе 2024 и по структуре представляет почти точную копию сайта ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "autolink", "fields": {"url": "https://aodahl.com/", "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "https://aodahl.com/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": ". Также отсутствует информация о команде, портфолио и любые другие данные.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Безопасность приложения", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Анализ приложения на сервисе ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "autolink", "fields": {"url": "https://www.virustotal.com/", "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "https://www.virustotal.com/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"mode": "normal", "text": " показывает довольно много интересных особенностей:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Во-первых, приложение использует DNS tracker-api.vk-analytics.ru, подобному тому как это делает приложение “Max”, что означает передачу событий (телеметрии, метрик, данных о пользователях и устройствах) на сервера VK, которые фактически контролируются структурами, связанными с российским государством.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Во-вторых, приложение имеет небезопасные системные разрешения, в частности:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Запуск кода после перезагрузки приложения - это делает возможным запуск собственный сервиса в фоне (без открытия интерфейса), восстанавливать сетевые соединения, загружать дополнительные компоненты - это уже паттерн шпионского ПО", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Запись с микрофона в фоновым режиме, а также функция совершать телефонные вызовы в фоновом режиме - это прямой риск записи разговоров и изображений без ведома пользователя.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Возможность перехватывать вызовы других программ, что дает возможность показывать интерфейс поверх других окон, в том числе -  совершать кражу данных.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В-третьих, анализ кода приложения показывает и другие удивительные вещи:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 1, "version": 1, "children": [{"mode": "normal", "text": "Так, выясняется, что функция звонков выполняется не через API Телеграм, а через сервисы звонков VK / Одноклассников:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}], "direction": null}], "listType": "bullet", "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "То есть приложение “Телега” плотно интегрировано с экосистемой VK/OK, и намеренно вводит в заблуждение, что звонки совершается через Телеграм.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Кроме того, приложение управляет состоянием микрофона в обход системного интерфейса, то есть по сути, имеет механизм фонового аудиомониторинга", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Приложение использует уникальный идентификатор, что означает что даже при переустановке приложения и без системных разрешений на идентификаторы устройство будет оставаться уникально отслеживаемым внутри VK SDK.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Также приложение имеет интеграцию с Napier и OneLogger (официальный логгер VK (ОК SDK)), то есть приложение может передавать логи — включая технические ошибки, идентификаторы, состояние камеры/микрофона — в инфраструктуру VK.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Помимо этого есть все признаки указывающие, что приложение может перехватывать токен доступа и читать переписку Телеграм.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Выводы", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Расследование показало, что приложение Telega не является безопасным аналогом Telegram, а представляет собой потенциально опасный инструмент, связанный со структурами VK и российскими компаниями. Приложение имеет доступ к личным данным пользователей и может использоваться для слежки.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Использование Telega несёт серьёзные риски утечки переписки и личной информации, поэтому экспертное сообщество рекомендует полностью воздержаться от его установки.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "68fa3dc066eff9dac3ce3f13", "type": "upload", "value": 65, "format": "", "version": 3, "relationTo": "media"}, {"id": "68fa3dc066eff9dac3ce3f14", "type": "upload", "value": 66, "format": "", "version": 3, "relationTo": "media"}, {"id": "68fa3dc066eff9dac3ce3f15", "type": "upload", "value": 67, "format": "", "version": 3, "relationTo": "media"}, {"id": "68fa3dc066eff9dac3ce3f16", "type": "upload", "value": 68, "format": "", "version": 3, "relationTo": "media"}, {"id": "68fa3dc066eff9dac3ce3f17", "type": "upload", "value": 69, "format": "", "version": 3, "relationTo": "media"}, {"id": "68fa3dc066eff9dac3ce3f18", "type": "upload", "value": 70, "format": "", "version": 3, "relationTo": "media"}, {"id": "68fa3dc066eff9dac3ce3f19", "type": "upload", "value": 71, "format": "", "version": 3, "relationTo": "media"}, {"id": "68fa3dc066eff9dac3ce3f1a", "type": "upload", "value": 72, "format": "", "version": 3, "relationTo": "media"}, {"id": "68fa3dc066eff9dac3ce3f1b", "type": "upload", "value": 73, "format": "", "version": 3, "relationTo": "media"}, {"id": "68fa3dc066eff9dac3ce3f1c", "type": "upload", "value": 74, "format": "", "version": 3, "relationTo": "media"}], "direction": "ltr"}}	117	ru	6
wsd	weweewew	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [], "direction": "ltr"}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Telega - новый загадочный", "type": "text", "style": "font-size: 28px", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "Telegram-клиент?", "type": "text", "style": "font-size: 28px", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "font-size: 28px", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Аналитический Центр “Parubets Analytics”,", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "link", "fields": {"url": "https://parubets.org/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "https://parubets.org/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "22 октября 2025 г., Франция", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Кратко из расследования:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В сети набирает обороты реклама приложения “", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Telega", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "” - якобы аналог Телеграм, позволяющий обходить блокировки Телеграм", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Разработчики - фирмы неясного происхождения АО \\"Даль\\" и \\"ТЕХНОЛОГИИ ПОЛЬЗОВАТЕЛЬСКИХ КОММУНИКАЦИЙ\\", зарегистрированные в Казани. Генеральный директор связан с “УПРАВЛЯЮЩАЯ КОМПАНИЯ ВК”", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Само приложение имеет шпионские функции - перехватывает токен доступа к Телеграм, читает сообщения, а также имеет доступ к файлам, микрофону, информации о пользователе", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Все данные приложения отправляются и хранятся на серверах Вконтакте", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Технически, это VoIP-клиент VK, замаскированный под Telegram", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Использовать приложение категорически не рекомендуется! Это несет риски компрометации всей личной информации на устрйостве.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Введение", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "На фоне новых блокировок и ограничений доступа к Telegram в России пользователи всё чаще сталкиваются с рекламой приложения", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Telega", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "— мессенджера, который позиционирует себя как «обновлённый Telegram» и обещает стабильную работу без VPN. Однако за внешней схожестью с популярным сервисом скрывается множество вопросов: кто стоит за проектом, насколько он безопасен и куда на самом деле уходит пользовательский трафик?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Сайт и разработчики", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Реклама в социальных сетях ведет на некий сайт по адресу", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "http://telega.me", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "telega.me", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textFormat": 1}, {"mode": "normal", "text": ",", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "которыйсогласно данным WhoIs принадлежит компании АО \\"Даль\\", зарегистрированной в январе этого года в Казани. Генеральный директор - Смирнов Александр Михайлович связанный с \\"УПРАВЛЯЮЩАЯ КОМПАНИЯ ВК\\".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"id": "6903adf6fee4707dac35ec9f", "type": "upload", "value": 130, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "У организации иметтся сайт", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://aodahl.com/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "https://aodahl.com/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ", сделанный в конструкторе “Tilda” и явно наспех. На сайте отсутствует информация о то, кто стоит за проектом, также отсутствует портфолио, что нехарактерно для компаний, разрабатывающих ИТ-решения.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6903adf6fee4707dac35eca1", "type": "upload", "value": 131, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Контактный номер телефона на сайте зарегистрирован в республике Кипр.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "На сайте", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "http://telega.me", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "telega.me", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textFormat": 1}, {"mode": "normal", "text": "в числе прочего сказано, что “Telega — Telegram-клиент, созданный на базе открытого кода мессенджера”, но это соответствует действительности лишь отчасти: код серверной части Telegram полностью закрыт, поэтому telega может работать лишь как оболочка, использующая Telegram API.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Еще один разработчик?", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "На сайте “мессенджера” Телега имеется раздел “Скачать”, где помимо ссылок на App Store, Google Play и RuStore имеется также ссылка на Google Drive", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6903adf6fee4707dac35eca3", "type": "upload", "value": 132, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Перейдя по ссылке и заглянув раздел “Details” мы узнаем об еще одной сомнительной фирме", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "tusco.ru", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6903adf6fee4707dac35eca4", "type": "upload", "value": 133, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Домен принадлежит компании \\"ТЕХНОЛОГИИ ПОЛЬЗОВАТЕЛЬСКИХ КОММУНИКАЦИЙ\\", также зарегистрированной, в Казани, имеющей уставной капитал в 10,000 рублей и чистый убыток в 1.2 млн. рублей.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6903adf6fee4707dac35eca5", "type": "upload", "value": 134, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Сайт компании", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://tusco.ru/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "https://tusco.ru/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": "зарегистрирован в августе 2024 и по структуре представляет почти точную копию сайта", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://aodahl.com/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "https://aodahl.com/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ". Также отсутствует информация о команде, портфолио и любые другие данные.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Безопасность приложения", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Анализ приложения на сервисе", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.virustotal.com/", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "https://www.virustotal.com/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": "показывает довольно много интересных особенностей:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Во-первых", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", приложение использует DNS", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "http://tracker-api.vk-analytics.ru", "newTab": false, "linkType": "custom"}, "format": "", "indent": 0, "version": 3, "children": [{"mode": "normal", "text": "tracker-api.vk-analytics.ru", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ", подобному тому как это делает приложение “Max”, что означает передачу событий (телеметрии, метрик, данных о пользователях и устройствах) на сервера VK, которые фактически контролируются структурами, связанными с российским государством.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Во-вторых", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", приложение имеет небезопасные системные разрешения, в частности:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Запуск кода после перезагрузки приложения", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "- это делает возможным запуск собственный сервиса в фоне (без открытия интерфейса), восстанавливать сетевые соединения, загружать дополнительные компоненты - это уже паттерн", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "шпионского ПО", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textFormat": 1}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Запись с микрофона в фоновым режиме", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", а также функция совершать телефонные вызовы в фоновом режиме - это прямой риск записи разговоров и изображений без ведома пользователя.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 1}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Возможность перехватывать вызовы других программ", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", что дает возможность показывать интерфейс поверх других окон, в том числе - совершать кражу данных.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textFormat": 1}], "listType": "bullet", "direction": "ltr", "textFormat": 1}, {"id": "6903adf6fee4707dac35ecaa", "type": "upload", "value": 135, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В-третьих, анализ кода приложения показывает и другие удивительные вещи:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Так, выясняется, что функция звонков выполняется не через API Телеграм, а через сервисы звонков VK / Одноклассников:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6903adf6fee4707dac35ecab", "type": "upload", "value": 136, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "То есть приложение “Телега” плотно интегрировано с экосистемой VK/OK, и намеренно вводит в заблуждение, что звонки совершается черезе Телеграм.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Кроме того, приложение управляет состоянием микрофона в обход системного интерфейса, то есть по сути, имеет механизм фонового аудиомониторинга", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6903adf6fee4707dac35ecac", "type": "upload", "value": 137, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Приложение использует уникальный идентификатор, что означает что даже при переустановке приложения и без системных разрешений на идентификаторы устройство будет оставаться уникально отслеживаемым внутри VK SDK.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6903adf6fee4707dac35ecad", "type": "upload", "value": 138, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Также приложение имеет интеграцию с Napier и OneLogger (официальный логгер VK (ОК SDK)), то есть приложение может передавать логи — включая технические ошибки, идентификаторы, состояние камеры/микрофона — в инфраструктуру VK.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"id": "6903adf6fee4707dac35ecae", "type": "upload", "value": 139, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Помимо этого есть все признаки указывающие, что приложение может перехватывать токен доступа и читать переписку Телеграм.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Выводы", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Расследование показало, что приложение", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Telega", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "не является безопасным аналогом Telegram, а представляет собой потенциально опасный инструмент, связанный со структурами VK и российскими компаниями. Приложение имеет доступ к личным данным пользователей и может использоваться для слежки.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Использование", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Telega", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "несёт серьёзные риски утечки переписки и личной информации, поэтому экспертное сообщество рекомендует полностью воздержаться от его установки.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr", "textFormat": 1}}	141	ru	4
94 приговора в месяц по делам о «терроризме» выносят  в России. Это в 3,5 раза больше, чем в 2021 году	С 2022 года в России наблюдается значительный рост числа дел о «терроризме», которые рассматривают российские суды. Уже в 2023 году приговоров по таким делам было вынесено вдвое больше, чем в 2021 году	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ТестРу", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"id": "68ecf5751c5b499bf6576382", "type": "upload", "value": 7, "fields": null, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "height": 69, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Заголовок1", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 3, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Заголовок2", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Заголовок3", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Заголовок4", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Заголовок5", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "цц", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "вцв", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "-", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "-", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "-", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "цвц", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "цв", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "-", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "-", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "цвц", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "цв", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "-", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "-", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ц", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "вц", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "цв", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "-", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "вц", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "вц", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [92, 92, 92, 92, 92], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	71	ru	1
94 вироки на місяць у справах про «тероризм» виносять  у Росії. Це в 3,5 рази більше, ніж у 2021 році	З 2022 року в Росії спостерігається значне зростання кількості справ про «тероризм», які розглядають російські суди. Уже в 2023 році вироків у таких справах було винесено вдвічі більше, ніж у 2021 році.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ТестУкр", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	72	uk	1
94 convictions per month are handed down in Russia in cases involving “terrorism.” This is 3.5 times more than in 2021. 	Since 2022, Russia has seen a significant increase in the number of “terrorism” cases being heard by Russian courts. By 2023, the number of convictions in such cases had already doubled compared to 2021.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "TestEn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	73	en	1
От «Русских домов» до бот-сетей	Инструменты российской пропаганды в Европе	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "От «Русских домов» до бот-сетей: инструменты российской пропаганды в Европе", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В Европе существуют десятки учреждений, медиа-проектов и сетей, официально посвящённых культуре, русскому языку и «соотечественникам».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "На первый взгляд — это просто культурная дипломатия, языковые программы и обмен опытом.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "На деле — часть масштабной стратегии Москвы по влиянию на умы и восприятие Европы.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В этой статье — панъевропейский обзор механизмов российской пропаганды, примеры из Германии, Бельгии, Франции и заключения, почему это важно для Европы.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Оглавление", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "ol", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Что мы понимаем под российской «мягкой силой» и пропагандой", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Основные инструменты и каналы", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Примеры в Европе", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Что стоит за этим — цели и мотивы", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Последствия и рекомендации", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Выводы", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "number", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1. Что такое российская «мягкая сила» и пропаганда", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Термин «мягкая сила» (soft power) обычно означает способности влиять на других через культуру, идеи, ценности. В случае России мы сталкиваемся с гибридной формой — сочетанием культурной дипломатии, медиа-воздействия и информационных операций. Например, учёные называют это «hard soft power» — мягкая сила с элементами угроз и манипуляции.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[1]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://polisci.utk.edu/how-russia-employs-hard-soft-power-to-influence-overseas-media-and-sow-dissent-and-fear-among-foreign-populations/", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://polisci.utk.edu/how-russia-employs-hard-soft-power-to-influence-overseas-media-and-sow-dissent-and-fear-among-foreign-populations/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Россия адаптировала традиционные культурные инструменты (язык, культура, диаспора) в стратегию, направленную на дестабилизацию, ослабление доверия к западным институтам и укрепление своих геополитических позиций.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[2]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://dgap.org/system/files/article_pdfs/meister_isolationpropoganda_apr16_web_1.pdf", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://dgap.org/system/files/article_pdfs/meister_isolationpropoganda_apr16_web_1.pdf", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "2. Основные инструменты и каналы", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "2.1 Культурные центры и «русские дома»", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Институты вроде Rossotrudnichestvo (федеральное агентство при МИД России) и филиалов «Русский дом/Русский мир» официально занимаются поддержкой русскоязычных, культурой и языком. Но расследования показывают, что через них проходят и другие виды активности — от распространения прокремлёвских нарративов до сбора информации и взаимодействия со спецслужбами.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[3]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://odessa-journal.com/the-kremlin-is-promoting-propaganda-through-russian-houses-in-the-usa-and-europe", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://odessa-journal.com/the-kremlin-is-promoting-propaganda-through-russian-houses-in-the-usa-and-europe", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "2.2 Медиа и дезинформация", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Через медиа-каналы (RT, Sputnik и их локализованные версии).", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Эти структуры формально работают как СМИ, но фактически выполняют функции государственной пропаганды.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Исследование DGAP", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "показывает, что их основная цель — подорвать доверие к западным медиа и институциям, распространяя «альтернативные» интерпретации событий: от войны в Украине до миграционного кризиса.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[4]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://dgap.org/system/files/article_pdfs/meister_isolationpropoganda_apr16_web_1.pdf", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://dgap.org/system/files/article_pdfs/meister_isolationpropoganda_apr16_web_1.pdf", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Через интернет-кампании, ботов и Telegram-каналы", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "По данным arXiv.org, Россия активно использует социальные сети для координированных информационных атак: бот-сети, фейковые аккаунты «экспертов» и «журналистов», каналы с тысячами подписчиков, ретранслирующие одни и те же нарративы — от дискредитации Украины до критики НАТО.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[5]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://arxiv.org/abs/2212.00419", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://arxiv.org/abs/2212.00419", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Через влияние на выборы и поддержку пророссийских партий", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Как показало расследование The Guardian, в мае 2024 года бельгийская полиция обыскала офис Европарламента в рамках дела о российском вмешательстве.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Расследование связано с сайтом Voice of Europe — площадкой, финансируемой структурами, близкими к Кремлю, которая публиковала интервью с политиками из правых и ультраправых партий Европы и продвигала их на выборах в Европарламент.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Вскрытые документы показали, что некоторые кандидаты получали финансирование и медийную поддержку за продвижение антиевропейских и антиукраинских позиций.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[6]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.theguardian.com/world/article/2024/may/29/belgian-police-search-eu-parliament-office-russian-interference?utm_source=chatgpt.com", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://www.theguardian.com/world/article/2024/may/29/belgian-police-search-eu-parliament-office-russian-interference?utm_source=chatgpt.com", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "2.2.1. Russia Today (RT): флагман дезинформации", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Russia Today — основной инструмент внешней пропаганды Кремля, действовавший под видом международного телеканала.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Основанный в 2005 году и финансируемый напрямую из госбюджета, RT позиционировал себя как «альтернатива BBC», но фактически стал центром информационных операций России.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Цели RT:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Подорвать доверие к западным СМИ, создавая иллюзию, что «все лгут».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Продвигать крайние политические силы — ультраправые и евроскептические партии.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Оправдывать внешнюю агрессию — от Крыма до полномасштабного вторжения.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "После блокировки в ЕС в 2022 году RT перешёл в онлайн-формат: через Telegram, Rumble, Odysee и сеть блогеров, сохранив ту же риторику.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Французская редакция RT France была закрыта в 2023 году, но её бывшие журналисты продолжают вещание под новыми брендами.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Немецкая RT DE переехала в Сербию и вещает через интернет, обходя запреты.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Европейская комиссия прямо заявила, что RT и Sputnik — это не СМИ, а инструменты информационной войны.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[6a]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://2021-2025.state.gov/wp-content/uploads/2022/01/Kremlin-Funded-Media_January_update-19.pdf", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://2021-2025.state.gov/wp-content/uploads/2022/01/Kremlin-Funded-Media_January_update-19.pdf", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "2.3 Диаспора, русскоязычные сообщества и религиозные сети", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Русскоязычные общины, культурные общества и православные приходы в Европе часто становятся точками мягкого влияния, где распространяются идеи о так называемом «русском мире» (Russkiy Mir) — идеологической концепции, продвигаемой Кремлём.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Эта концепция утверждает, что все, кто говорит по-русски или имеет «русскую культуру», принадлежат к единой «цивилизации», которую Россия должна защищать от «враждебного Запада».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Через неё формируется образ России как духовного центра, а западных стран — как источника «морального разложения» и «русофобии».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Во многих странах Европы — от Германии и Чехии до Франции и Латвии — при церквях Московского патриархата и культурных ассоциациях проходят «патриотические вечера», лекции о «традиционных ценностях» и дискуссии о «лжи западных СМИ».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Часть таких инициатив координируется Россотрудничеством или посольствами РФ, а их участники становятся локальными ретрансляторами кремлёвской риторики.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В результате эти сообщества, вместо того чтобы способствовать интеграции мигрантов, нередко формируют замкнутую среду, где укрепляется ностальгия по СССР, антиукраинские настроения и недоверие к местным властям и СМИ.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[7]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.ifri.org/sites/default/files/migrated_files/documents/atoms/files/laruelle_russia_niche_soft_power_2021.pdf", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://www.ifri.org/sites/default/files/migrated_files/documents/atoms/files/laruelle_russia_niche_soft_power_2021.pdf", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "2.4. Экономическое и политическое влияние", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Через", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "инвестиции, энергетические проекты и экономические связи", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "Россия долгие годы выстраивала в Европе инфраструктуру политического влияния.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Эти каналы позволяли не только зарабатывать, но и формировать", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "зависимости", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", которые позже превращались в инструменты давления и пропаганды.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Наиболее заметный пример —", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "энергетическая политика", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ":", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "«Газпром» и аффилированные компании активно использовали долгосрочные контракты, участие в проектах вроде Nord Stream 1 и 2 и спонсорство местных инициатив для укрепления имиджа России как «надёжного партнёра».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Когда началась война в Украине, эти связи стали рычагом: Москва использовала энергетическую зависимость как инструмент шантажа, а одновременно — как", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "нарратив в медиа", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", внушая европейцам, что «санкции вредят самим Европе» и «заморозьте конфликт ради стабильности цен».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Кроме того, через", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "инвестиции в недвижимость, банки и культурные проекты", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "Россия продвигала людей, связанных с её элитами, в бизнес-среду стран ЕС.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Некоторые из них становились «неофициальными лоббистами», повторяя кремлёвские тезисы на форумах, в экспертных кругах и политике.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Отдельное направление —", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "спецоперации и кибератаки", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ":", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "группы вроде Fancy Bear (APT28) и Sandworm проводили хакерские кампании против европейских госструктур и медиа, а украденные данные затем использовались в информационных вбросах, синхронизированных с прокремлёвскими СМИ.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Таким образом, экономические интересы, энергетические контракты и кибероперации образуют", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "единое поле гибридного влияния", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "— где деньги, информация и дезинформация работают вместе.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[8]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.tandfonline.com/doi/full/10.1080/14631377.2025.2463039", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://www.tandfonline.com/doi/full/10.1080/14631377.2025.2463039", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "3. Примеры в Европе", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "3.1. Германия — Russisches Haus Berlin", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "upload", "value": {"id": 143, "alt": "От «Русских домов» до бот-сетей", "url": "https://api.parubets.org/api/media/file/article-new-1761951959428-0.jpg"}, "version": 1, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В центре Берлина, на улице Фридрихштрассе, находится", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "«Русский дом науки и культуры»", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "— официальное представительство Россотрудничества.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Согласно расследованию", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://theins.ru/en/politics/259153?utm_source=chatgpt.com", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The Insider", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ", прокуратура Берлина проверяла деятельность учреждения на предмет соблюдения санкционного законодательства: здание и счета «Русского дома» напрямую связаны с государственными структурами РФ.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[9]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://theins.ru/en/politics/259153", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://theins.ru/en/politics/259153", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Парадокс в том, что, как отмечает организация", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://vitsche.org/news/statement-against-the-continued-operation-of-the-russian-house-in-berlin/?utm_source=chatgpt.com", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Vitsche e.V.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"mode": "normal", "text": ", немецкие фонды продолжают оплачивать налоги за содержание здания, даже несмотря на то, что центр финансируется Россотрудничеством — федеральным агентством, находящимся под санкциями.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[10]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://vitsche.org/news/statement-against-the-continued-operation-of-the-russian-house-in-berlin", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://vitsche.org/news/statement-against-the-continued-operation-of-the-russian-house-in-berlin", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Сегодня «Русский дом» в Берлине стал", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "символом того, как культурная дипломатия России превращается в инструмент идеологического влияния", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Под вывеской культуры здесь проводились выставки и показы фильмов с антиукраинской риторикой, встречи с пророссийскими активистами и мероприятия, продвигающие нарративы о «русофобии Европы» и «традиционных ценностях».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "3.2.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "Бельгия / Евросоюз — вмешательство в политику", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "upload", "value": {"id": 144, "alt": "От «Русских домов» до бот-сетей", "url": "https://api.parubets.org/api/media/file/article-new-1761951959438-1.jpg"}, "version": 1, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В мае 2024 года бельгийская полиция провела обыски в здании Европейского парламента и доме одного из его сотрудников в рамках расследования о российском вмешательстве в европейские выборы.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Как сообщает The Guardian, расследование связано с порталом Voice of Europe — медийной платформой, финансируемой структурами, близкими к Кремлю.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Через этот сайт публиковались интервью и статьи, в которых европейские политики — преимущественно из ультраправых и евроскептических партий — продвигали нарративы, совпадающие с официальной линией Москвы: о «провале санкций», «вине Запада в войне», «необходимости мира с Россией» и «усталости Европы от Украины».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "По данным следствия, Voice of Europe использовался не только для медийного продвижения пророссийских позиций, но и как канал скрытого финансирования политиков и кандидатов на выборах в Европарламент.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Этот случай наглядно показывает, что российское влияние давно вышло за рамки культуры и СМИ: оно превращается в инструмент вмешательства в демократические процессы, направленный на формирование пророссийских фракций внутри ЕС, способных изнутри подрывать политику поддержки Украины и единство Европы.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[11]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.theguardian.com/world/article/2024/may/29/belgian-police-search-eu-parliament-office-russian-interference", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://www.theguardian.com/world/article/2024/may/29/belgian-police-search-eu-parliament-office-russian-interference", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "3.3. Франция / Западная Европа — информационные кампании", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "upload", "value": {"id": 145, "alt": "От «Русских домов» до бот-сетей", "url": "https://api.parubets.org/api/media/file/article-new-1761951959443-2.jpg"}, "version": 1, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Исследования французского агентства Viginum и Европейской службы внешнеполитической деятельности (EEAS) показывают, что после блокировки RT и Sputnik Россия активно перестроила свою медийную инфраструктуру в Европе.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Теперь продвижение прокремлёвских нарративов о войне в Украине, санкциях, НАТО и «загнивающем Западе» ведётся через множество взаимосвязанных каналов: Telegram, Facebook, X (Twitter), YouTube и даже TikTok.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Создаются десятки псевдонезависимых сайтов и страниц, которые маскируются под европейские СМИ.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "В 2023 году французские аналитики выявили более 350 фейковых ресурсов, имитирующих бренды реальных изданий — Le Monde, 20 Minutes, Bild, The Guardian — но публикующих тексты с подменёнными цитатами и фейковыми заголовками.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Один из таких примеров — сеть Portal Kombat, контролируемая российскими ИТ-структурами, распространяла одинаковые статьи о «росте антивоенных протестов во Франции» и «протестах против поставок оружия Украине».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Вместо прямой агитации эти кампании используют информационное размывание: вбрасывают сотни версий событий, чтобы аудитория перестала верить кому бы то ни было.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Самый известный пример — катастрофа рейса Malaysia Airlines MH17 в 2014 году. Почти сразу после трагедии российские медиа и аффилированные аккаунты запустили десятки противоречивых объяснений: что самолёт якобы сбили украинские военные, что на борту находились трупы, что это была «провокация Запада», что «ракета могла прилететь откуда угодно».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ни одна из этих версий не выдержала проверки, но именно их количество, а не достоверность, создало эффект хаоса — цель, к которой и стремились", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Так формируется «информационный туман», в котором любые факты теряют значение, а дезинформация становится лишь одной из «альтернативных точек зрения».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Это уже не просто пропаганда — это информационное загрязнение, которое превращает европейское медиапространство в поле психологической войны.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[12]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://euvsdisinfo.eu/uploads/2023/02/EEAS-ThreatReport-February2023-02.pdf", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://euvsdisinfo.eu/uploads/2023/02/EEAS-ThreatReport-February2023-02.pdf", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "4. Что стоит за этим — цели и мотивы", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Информационные и культурные операции России в Европе — это не хаотичный набор действий, а часть системной стратегии, описанной в доктринах внешней политики и национальной безопасности РФ.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Как отмечают аналитики CEPA, IFRI и DGAP, за этой деятельностью стоят четыре ключевые цели:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Ослабление единства Европы", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Москва стремится разделить Европу изнутри — сделать государства ЕС и НАТО менее сплочёнными, снизить уровень солидарности в поддержке Украины и в антироссийской политике.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Для этого используются нарративы вроде: «Санкции бьют по самой Европе», «Ваши лидеры заботятся об Украине, а не о своих гражданах», «Европа платит за войну США»", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Через подобные тезисы Кремль пытается вызвать усталость и разочарование, особенно в странах с высокими ценами на энергоносители и миграционным давлением.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "CEPA отмечает, что главная цель — не убедить всех быть “за Россию”, а добиться того, чтобы Европа перестала действовать единой позицией.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[13]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://cepa.org/article/kremlin-soft-power-harder-than-it-looks", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://cepa.org/article/kremlin-soft-power-harder-than-it-looks", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Легитимизация собственного дискурса", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Российская пропаганда строится на", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "создании альтернативной реальности", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", где Россия — «жертва» и «цитадель традиционных ценностей», а Запад — источник упадка и агрессии.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "По данным IFRI, именно через этот нарратив Россия стремится:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "оправдать внутренние репрессии и милитаризацию как “ответ на западные угрозы”;", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "внедрить за рубежом идею о том, что “мнения по Украине разделились”, тем самым", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "размывая моральную чёткость", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ";", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "придать легитимность авторитарной модели управления, противопоставив её “хаосу либерализма”.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Это формирует «симметричную ложь» — когда западные ценности и диктатура подаются как равноценные альтернативы.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[14]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://www.ifri.org/sites/default/files/migrated_files/documents/atoms/files/laruelle_russia_niche_soft_power_2021.pdf", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://www.ifri.org/sites/default/files/migrated_files/documents/atoms/files/laruelle_russia_niche_soft_power_2021.pdf", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Создание зависимостей и каналов влияния", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "По наблюдениям DGAP, Россия десятилетиями строила сеть экономических, культурных и информационных зависимостей.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Через:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "энергетические проекты (Nord Stream, «Ямал-Европа»);", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "культурные инициативы и образовательные программы (Россотрудничество, «Русский мир»);", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "русскоязычную диаспору и церковные приходы;", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Москва формировала точки входа, которые затем использовала для лоббирования своих интересов или распространения нужных нарративов.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Даже после начала войны эти структуры не исчезли — они просто сменили риторику, представив себя как «защиту русскоязычных от дискриминации».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[15]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://dgap.org/system/files/article_pdfs/meister_isolationpropoganda_apr16_web_1.pdf", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://dgap.org/system/files/article_pdfs/meister_isolationpropoganda_apr16_web_1.pdf", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Поддержка внутренней легитимности", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "bullet", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Наконец, значительная часть этих операций направлена", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "вовнутрь России", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ".", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Как подчёркивает CEPA, информационные кампании за рубежом служат доказательством для внутренней аудитории:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "«Запад нас боится — значит, мы сильны».", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Показывая “успехи влияния” за границей, Кремль укрепляет образ великой державы, окружённой врагами, и оправдывает репрессии и милитаризацию внутри страны.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Таким образом,", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "внешняя пропаганда становится элементом внутренней мобилизации", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", подпитывая страх и гордость одновременно.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "[16]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "link", "fields": {"url": "https://cepa.org/article/kremlin-soft-power-harder-than-it-looks/", "newTab": false}, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "https://cepa.org/article/kremlin-soft-power-harder-than-it-looks/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}, {"tag": "ol", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Последствия и рекомендации", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "number", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Российская стратегия «мягкой силы» в Европе приводит не просто к дезинформации — она размывает основы доверия.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Постепенно снижается вера в демократические институты: независимые медиа, партии, гражданское общество.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Выборы и политические процессы становятся уязвимыми к внешнему вмешательству, а внутри обществ возникают новые линии раскола — между русскоязычными и местными сообществами, между сторонниками и противниками России, между «пацифизмом» и поддержкой Украины.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Культурный обмен, который должен объединять, превращается в инструмент идеологического давления, где язык и искусство используются не для диалога, а для влияния.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Чтобы противостоять этому, Европе важно не замыкаться, а повысить прозрачность и устойчивость.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Необходимо требовать открытого отчёта о финансировании организаций, связанных с Россией; развивать медиаграмотность — умение распознавать манипуляции, ботов, фабрики контента.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Поддержка независимых медиа и проверенных источников информации — лучший ответ на пропаганду.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Законы о противодействии иностранному вмешательству должны работать так же активно, как и санкционные механизмы.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "А в отношении русскоязычных сообществ в Европе важно выбирать не изоляцию, а вовлечение через доверие и интеграцию — чтобы Кремль не мог использовать их как инструмент влияния.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"tag": "ol", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Выводы", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": "ltr"}], "direction": "ltr"}], "listType": "number", "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Российская стратегия «мягкой силы» в Европе — это не просто культурный обмен или просветительская деятельность. Это многоуровневая система, которая сочетает в себе культурные институты, медиа-каналы, диаспорные сети, политическое влияние и экономические связи. Эти механизмы работают не только в странах бывшего СССР, но и по всей Европе — от Берлина до Брюсселя.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Для европейского общества важно видеть: когда «культура» считается нейтральной, она может стать инструментом идеологического воздействия. Когда «медиа» — просто развлекательной, они могут быть ареной информационных войн. И когда «сообщество» — только как диаспора, оно может стать узлом влияния.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Европа должна воспринимать не только военные вызовы, но и гибридные, информационные, культурные. Ведь именно на уровне духа и восприятия зреют последствия, которые позже проявляются в реальной политике и безопасности.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": "ltr"}], "direction": "ltr"}}	142	ru	7
Анализ дел о государственной измене и шпионаже в РФ за первое полугодие 2025 года	Анализ дел о государственной измене и шпионаже в РФ за первое полугодие 2025 года	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h1", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Краткое резюме", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "За первые ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "6 месяцев 2025", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " года российские суды (в том числе, суды на оккупированных территориях) вынесли ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "224 ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "приговора по делам о госизмене и шпионаже. Фигурантами этих дел стали ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "232 ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "человека. В среднем - по ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "39", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " осужденных в месяц. Это абсолютный исторический рекорд за всю историю современной России. В месяц сейчас осуждается больше людей, чем, например, за весь ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "2022", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " год.", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "font-size: 16px;", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Для сравнения, за весь ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "2023", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " год фигурантами таких дел стали ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "167 ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": "человек, а за первое полугодие ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "2024", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " года - ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "143", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " человека.", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "font-size: 16px;", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Все приговоры - обвинительные, все осужденные - получили реальные сроки.", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "font-size: 16px;", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Всего за время войны осуждено - ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "774 человека (!)", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "font-size: 16px;", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Кроме того, в 1-м полугодии 2025 года к ", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "3", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " фигурантам были применены принудительные меры медицинского характера.", "type": "text", "style": "font-size: 16px;", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "font-size: 16px;", "textFormat": 0}, {"id": "68f4b4849b593f6922453b5d", "type": "upload", "value": 22, "fields": null, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "font-size: 14px;", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "font-size: 14px;", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "font-size: 14px;", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "font-size: 14px;", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "textStyle": "font-size: 16px;"}}	85	ru	2
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.contact (id, side_image_id, updated_at, created_at, meta_meta_title, meta_meta_description) FROM stdin;
1	2	2025-10-18 17:28:37.417+00	2025-10-12 17:12:22.288+00	\N	\N
\.


--
-- Data for Name: contact_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.contact_locales (title, description, id, _locale, _parent_id) FROM stdin;
Свяжитесь с нами	Если у вас есть вопросы, предложения по сотрудничеству или вы хотите поделиться информацией — свяжитесь с нами через форму ниже. Мы открыты к партнёрствам, экспертным комментариям и совместным проектам в области политики и прав человека.\nВсе сообщения рассматриваются конфиденциально	15	ru	1
Зв'яжіться з нами	Якщо у вас є питання, пропозиції щодо співпраці або ви хочете поділитися інформацією — зв'яжіться з нами за допомогою форми нижче. Ми відкриті до партнерства, експертних коментарів та спільних проектів у сфері політики та прав людини.\nУсі повідомлення розглядаються конфіденційно.	16	uk	1
Contact us	If you have any questions, suggestions for cooperation, or would like to share information, please contact us using the form below. We are open to partnerships, expert commentary, and joint projects in the field of politics and human rights.\nAll messages are treated confidentially.	17	en	1
Contactez-nous	Si vous avez des questions, des propositions de collaboration ou si vous souhaitez partager des informations, veuillez nous contacter via le formulaire ci-dessous. Nous sommes ouverts aux partenariats, aux commentaires d'experts et aux projets communs dans le domaine de la politique et des droits de l'homme.\nTous les messages sont traités de manière confidentielle.	18	fr	1
\.


--
-- Data for Name: contact_messages; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.contact_messages (id, name, phone, email, message, updated_at, created_at) FROM stdin;
2	Test	+3801111111111	test@test.com	TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest	2025-10-14 17:00:55.901+00	2025-10-14 17:00:55.901+00
3	Yuliya Vauchok 	+48 451 175 947 	yuliya.vauchok@tvp.pl	Добрый день!\n\nПредставляю редакцию Вот Так. Хотела бы попросить у Кирилла  комментарий сегодня, 12 ноября про отключение интернета в России. Напишите мне, пожалуйста, на емейл. 	2025-11-12 10:53:08.471+00	2025-11-12 10:53:08.47+00
\.


--
-- Data for Name: home; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.home (id, updated_at, created_at, meta_meta_title, meta_meta_description) FROM stdin;
1	2025-10-23 14:52:38.065+00	2025-10-12 14:56:52.342+00	\N	\N
\.


--
-- Data for Name: home_blocks_category_card_grid; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.home_blocks_category_card_grid (_order, _parent_id, _path, _locale, id, block_name) FROM stdin;
2	1	content	ru	68ebf6f80b5ed01d325538a4	\N
2	1	content	uk	68ebf5322aa3ae34a318de12	\N
2	1	content	fr	68ebf4f62aa3ae34a318de09	\N
\.


--
-- Data for Name: home_blocks_category_card_grid_items; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.home_blocks_category_card_grid_items (_order, _parent_id, _locale, id, visible_from, article_id) FROM stdin;
1	68ebf6f80b5ed01d325538a4	ru	68ebf6f80b5ed01d325538a5	2025-10-05 21:00:00+00	5
2	68ebf6f80b5ed01d325538a4	ru	68ebf6f80b5ed01d325538a6	2025-10-14 22:00:00+00	2
3	68ebf6f80b5ed01d325538a4	ru	68ebf6f80b5ed01d325538a8	2025-10-14 22:00:00+00	1
1	68ebf5322aa3ae34a318de12	uk	68ebf5332aa3ae34a318de13	\N	1
2	68ebf5322aa3ae34a318de12	uk	68ebf5382aa3ae34a318de14	\N	1
3	68ebf5322aa3ae34a318de12	uk	68ebf53a2aa3ae34a318de15	\N	1
1	68ebf4f62aa3ae34a318de09	fr	68ebf4fa2aa3ae34a318de0a	\N	1
2	68ebf4f62aa3ae34a318de09	fr	68ebf4fc2aa3ae34a318de0b	\N	1
3	68ebf4f62aa3ae34a318de09	fr	68ebf4fe2aa3ae34a318de0c	\N	1
\.


--
-- Data for Name: home_blocks_home_featured; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.home_blocks_home_featured (_order, _parent_id, _path, _locale, id, visible_from, article_id, block_name) FROM stdin;
1	1	content	ru	68ebc2770b5ed01d3255389f	2025-10-14 21:00:00+00	6	\N
1	1	content	uk	68ebf52e2aa3ae34a318de11	\N	1	\N
1	1	content	fr	68ebf4f22aa3ae34a318de08	\N	1	\N
\.


--
-- Data for Name: home_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.home_locales (title, description, trends_title, id, _locale, _parent_id) FROM stdin;
Parubets Analytics	Независимый аналитический центр, исследующий политические репрессии, войну и нарушения прав человека в Восточной Европе	Анонсы недавних расследований	96	ru	1
Parubets Analytics	Незалежний аналітичний центр, що досліджує політичні репресії, війну та порушення прав людини у Східній Європі	Trends	97	uk	1
Parubets Analytics	An independent analytical center researching political repression, war, and human rights violations in Eastern Europe	Анонсы недавних расследований	98	en	1
Parubets Analytics	Centre d'analyse indépendant qui étudie les répressions politiques, la guerre et les violations des droits humains en Europe de l'Est	Trends	99	fr	1
\.


--
-- Data for Name: home_trends_items; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.home_trends_items (_order, _parent_id, id, article_id) FROM stdin;
1	1	68ebc2be0b5ed01d325538a0	6
\.


--
-- Data for Name: interview; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.interview (id, updated_at, created_at, sort_order, meta_meta_title, meta_meta_description) FROM stdin;
4	2025-10-23 17:32:51.947+00	2025-10-17 15:03:22.338+00	1	\N	\N
3	2025-10-23 20:27:56.445+00	2025-10-17 14:36:47.49+00	2	\N	\N
1	2025-10-23 20:28:10.597+00	2025-10-12 14:59:12.734+00	4	\N	\N
2	2025-10-23 20:29:58.914+00	2025-10-17 14:11:08.254+00	3	\N	\N
\.


--
-- Data for Name: interview_blocks_interview_card_grid; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.interview_blocks_interview_card_grid (_order, _parent_id, _path, _locale, id, block_name) FROM stdin;
1	4	content	ru	68f25a4f94d815e583dd6653	\N
1	3	content	ru	68f2548494d815e583dd664e	\N
1	2	content	ru	68fa8ff1d9ce77756b85466b	\N
\.


--
-- Data for Name: interview_blocks_interview_card_grid_items; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.interview_blocks_interview_card_grid_items (_order, _parent_id, _locale, id, visible_from, href, title, description, image_id) FROM stdin;
1	68f25a4f94d815e583dd6653	ru	68fa6656dfc34e30ac9202ba	2025-10-22 22:00:00+00	https://www.youtube.com/live/2TAUVuGhmrY?si=EDNoYLf-6q6ETrsq&t=270	Мессенджер "Телега" - проект ВК?	Обсуждаем новую волну блокировок и новый мессенджер "Телега"	53
2	68f25a4f94d815e583dd6653	ru	68f25a5194d815e583dd6654	2025-10-06 22:00:00+00	https://www.youtube.com/live/3EHspDz72Es?si=CxzfHF8qYZ8_END0&t=358	Отключение интернета в России	Чего ждать и к чему готовиться?	15
3	68f25a4f94d815e583dd6653	ru	68f25ad394d815e583dd6655	2025-09-10 22:00:00+00	https://www.youtube.com/live/DNgu73ASUcE?t=1307s	Борьба Яндекс и ФСБ	Как сотрудничают Яндекс и силовики	16
1	68f2548494d815e583dd664e	ru	68f2548694d815e583dd664f	2025-07-07 22:00:00+00	https://www.youtube.com/live/dnWiNQ2X-EY?t=1758s	Мессенджер MAX	Риски использования и тактика властей	13
2	68f2548494d815e583dd664e	ru	68f2568594d815e583dd6652	2024-12-04 23:00:00+00	https://www.youtube.com/live/IPwJb0QYyAc?si=2EA_I4mpfiMYn4HX&t=310	ФСБ заражает телефоны	Шпионская программа для слежки за активистами 	14
1	68fa8ff1d9ce77756b85466b	ru	68fa8ff3d9ce77756b85466c	2025-01-14 23:00:00+00	https://www.youtube.com/live/fFYQU38e34o?app=desktop&t=1931s&cbrd=1	Дела о госизмене и шпионаже в РФ	Провокации ФСБ и параллели с репрессиями СССР	12
\.


--
-- Data for Name: interview_blocks_interview_overlay_hero; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.interview_blocks_interview_overlay_hero (_order, _parent_id, _path, _locale, id, visible_from, href, title, subtitle, image_id, block_name) FROM stdin;
1	1	content	ru	68ebc21f0b5ed01d3255389e	2024-12-03 23:00:00+00	https://www.youtube.com/watch?app=desktop&v=Q5YJgBlKFsw&t=1174s	Шпионское ПО Monokle	Комментарий о деталях обнаружения	11	\N
\.


--
-- Data for Name: interview_blocks_interview_overlay_pair; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.interview_blocks_interview_overlay_pair (_order, _parent_id, _path, _locale, id, block_name) FROM stdin;
\.


--
-- Data for Name: interview_blocks_interview_overlay_pair_items; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.interview_blocks_interview_overlay_pair_items (_order, _parent_id, _locale, id, visible_from, href, title, image_id) FROM stdin;
\.


--
-- Data for Name: interview_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.interview_locales (title, id, _locale, _parent_id) FROM stdin;
Радио Свобода	41	ru	4
Дождь	42	ru	3
Первый Отдел	44	ru	1
The Insider Live	45	ru	2
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.media (id, alt, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y) FROM stdin;
1	test	2025-10-12 14:59:06.265+00	2025-10-12 14:59:06.265+00	\N	\N	0ac2a8f23fa84a1bf34031b6baeaf513c8650bf6.jpg	image/jpeg	193877	2000	1334	50	50
2	main	2025-10-12 17:12:20.366+00	2025-10-12 17:12:20.366+00	\N	\N	45c46fde98615925f367e66f8f46c33eb5c54b0f (1).png	image/png	1044729	1280	853	50	50
3	ua	2025-10-12 17:44:04.165+00	2025-10-12 17:44:04.165+00	\N	\N	🇺🇦.png	image/png	874	25	25	50	50
4	Repression in Russia	2025-10-12 17:45:48.347+00	2025-10-12 17:45:48.347+00	\N	\N	Group (1).png	image/png	758	22	24	50	50
5	Politics and elections	2025-10-12 17:47:13.49+00	2025-10-12 17:47:13.49+00	\N	\N	Frame (4).png	image/png	1304	25	24	50	50
6	Europe	2025-10-12 17:48:28.258+00	2025-10-12 17:48:28.258+00	\N	\N	Group (2).png	image/png	413	25	16	50	50
7	test	2025-10-13 14:40:44.061+00	2025-10-12 17:51:54.326+00	http://91.219.63.21:3001/api/media/file/8dd29387f97908c9db505bd96fd51493daa9eee1%20(2).png	\N	8dd29387f97908c9db505bd96fd51493daa9eee1 (2)-min.png	image/png	727546	1754	1032	50	50
8	dept_one	2025-10-14 19:32:51.041+00	2025-10-14 19:32:51.041+00	\N	\N	1o.jpg	image/jpeg	245524	1075	1018	50	50
9	soilder	2025-10-14 19:35:15.784+00	2025-10-14 19:35:15.783+00	\N	\N	1932212-623393-1287x836.jpg	image/jpeg	176419	1254	836	50	50
10	1dept	2025-10-14 20:24:09.037+00	2025-10-14 20:24:09.037+00	\N	\N	1Dep_WarResearch_1_Snippet-1.png	image/png	685743	1000	500	50	50
11	Interview_Monokle	2025-10-17 14:09:46.519+00	2025-10-17 14:09:46.519+00	\N	\N	interview_monokle.png	image/png	595338	960	480	50	50
12	Interview_FSB_Espionage	2025-10-17 14:14:50.287+00	2025-10-17 14:14:50.287+00	\N	\N	inteview_FSB_Espionage.jpg	image/jpeg	191470	1200	711	50	50
13	Interview_Max_Messenger	2025-10-17 14:40:00.403+00	2025-10-17 14:40:00.403+00	\N	\N	interviw_max_messenger.jpg	image/jpeg	189257	1500	1000	50	50
14	Interview_TvRain_Monokle	2025-10-17 14:56:20.998+00	2025-10-17 14:56:20.998+00	\N	\N	interview_tv_rain_spyware-android-FSB.jpg	image/jpeg	89670	1434	572	50	50
15	No Internet Radio Freedom	2025-10-17 15:03:21.527+00	2025-10-17 15:03:21.527+00	\N	\N	interview_radiofreedom_no_internet.jpg	image/jpeg	146656	800	454	50	50
16	Interview_Yandex_FSB	2025-10-17 15:05:19.24+00	2025-10-17 15:05:19.239+00	\N	\N	interview_yandex_fsb.jpg	image/jpeg	17617	800	533	50	50
17	Media Insider Terrorism	2025-10-17 15:27:55.143+00	2025-10-17 15:27:55.143+00	\N	\N	media_insider_terrorism.jpg	image/jpeg	274415	877	516	50	50
18	Insider Sentences June	2025-10-19 09:29:11.634+00	2025-10-19 09:29:11.634+00	\N	\N	sentences_insider_june.jpg	image/jpeg	237274	877	579	50	50
19	1000 Ukranians Insider	2025-10-19 09:33:02.312+00	2025-10-19 09:33:02.311+00	\N	\N	1000_ukranians__insider.jpg	image/jpeg	463096	877	579	50	50
20	Insider Sentences Terrorism	2025-10-19 09:35:34.647+00	2025-10-19 09:35:34.647+00	\N	\N	sentences_insider_terrorism.jpg	image/jpeg	274415	877	516	50	50
21	Espionage 2025	2025-10-19 09:43:03.833+00	2025-10-19 09:43:03.833+00	\N	\N	publication_spionage_2025.png	image/png	32696	576	346	50	50
22	Espionage 2025 - Picture 1	2025-10-19 09:51:00.794+00	2025-10-19 09:51:00.794+00	\N	\N	publication_espionage_2025_graph_1.png	image/png	24315	606	363	50	50
23	DEPT_ONE_1000_DEL	2025-10-19 14:19:35.619+00	2025-10-19 14:19:35.619+00	\N	\N	1Dep_WarResearch_1_Snippet-2.png	image/png	685743	1000	500	50	50
24	DEPT_ONE_Advocates	2025-10-19 14:22:19.891+00	2025-10-19 14:22:19.891+00	\N	\N	1Dep_Law_14-03-25_1_Snippet.png	image/png	185262	1000	500	50	50
25	DET_ONE_Carousel_Arrests	2025-10-19 14:23:49.94+00	2025-10-19 14:23:49.94+00	\N	\N	1Dep_Hell_03-04-25_1_Snippet.png	image/png	156820	1000	500	50	50
26	DEPT_ONE_TERRORISM	2025-10-19 14:43:24.029+00	2025-10-19 14:43:24.029+00	\N	\N	1Dep_Stats_02-10-25_1_Snippet.png	image/png	533712	1000	500	50	50
27	DEPT_ONE_High_treason	2025-10-19 14:50:24.614+00	2025-10-19 14:50:24.614+00	\N	\N	1Dep_Stats_24-09-25_1_Snippet.png	image/png	533217	1000	500	50	50
28	Insider_Finmonitoring	2025-10-19 18:52:00.28+00	2025-10-19 18:52:00.28+00	\N	\N	insider_finmonitoring.jpg	image/jpeg	420770	877	579	50	50
29	Insinder_Sentences_July	2025-10-19 18:56:00.064+00	2025-10-19 18:56:00.064+00	\N	\N	sentences_insider_july.jpg	image/jpeg	236773	877	579	50	50
30	Insider_300_Ukrainians_Kursk.jpg	2025-10-19 18:57:41.772+00	2025-10-19 18:57:41.772+00	\N	\N	Insider_300_Ukrainians_Kursk.jpg	image/jpeg	262894	848	464	50	50
31	Insider_deserters	2025-10-19 19:05:36.803+00	2025-10-19 19:05:36.803+00	\N	\N	Insider_deserters.jpg	image/jpeg	234612	800	452	50	50
32	insider_sentences_august	2025-10-19 19:09:17.955+00	2025-10-19 19:09:17.955+00	\N	\N	sentences_insider_august.jpg	image/jpeg	389653	877	579	50	50
33	Insider_Moldova	2025-10-19 19:14:25.531+00	2025-10-19 19:14:25.531+00	\N	\N	Insider_Moldova.jpg	image/jpeg	373116	877	579	50	50
34	istories_sentences	2025-10-19 19:28:42.366+00	2025-10-19 19:28:42.366+00	\N	\N	istories_sentences.jpg	image/jpeg	160286	1920	960	50	50
35	istories_Monokle	2025-10-19 19:32:19.648+00	2025-10-19 19:32:19.648+00	\N	\N	hq720.jpg	image/jpeg	44052	686	386	50	50
36	bloomberg espionage	2025-10-19 19:36:53.838+00	2025-10-19 19:36:53.837+00	\N	\N	bloomberg_espionage.jpg	image/jpeg	38254	1200	800	50	50
37	Die_Zeit_Putin_Repressios	2025-10-20 23:21:33.709+00	2025-10-20 23:21:33.709+00	\N	\N	die_zeit_putin_repressions.jpg	image/jpeg	45846	1000	562	50	50
39	23кк23к23	2025-10-21 18:05:20.891+00	2025-10-21 18:05:20.891+00	\N	\N	test_article-1.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	37340	\N	\N	\N	\N
38	sdvdssd	2025-10-21 20:40:00.393+00	2025-10-21 17:45:09.107+00	https://api.parubets.org/api/media/file/test_article.docx	\N	test_article-2.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	37340	\N	\N	\N	\N
40	wwqdqdwdqwqw	2025-10-22 13:51:03.612+00	2025-10-22 13:51:03.612+00	\N	\N	test_article.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	9190920	\N	\N	\N	\N
41	wsd	2025-10-22 14:18:57.009+00	2025-10-22 14:18:57.009+00	\N	\N	article-4-1761142736913-0.jpg	image/jpeg	9163287	4096	2730	50	50
42	wsd	2025-10-22 15:20:58.723+00	2025-10-22 15:20:58.723+00	\N	\N	article-4-1761146458693-0.jpg	image/jpeg	9163287	4096	2730	50	50
43	Telega	2025-10-22 19:47:14.501+00	2025-10-22 19:47:14.501+00	\N	\N	Telega - новый загадочный Telegram-клиент.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	523066	\N	\N	\N	\N
44	article-new-1761162458860-0.png	2025-10-22 19:47:38.867+00	2025-10-22 19:47:38.867+00	\N	\N	article-new-1761162458860-0.png	image/png	55402	1474	366	50	50
45	article-new-1761162458892-1.png	2025-10-22 19:47:38.896+00	2025-10-22 19:47:38.896+00	\N	\N	article-new-1761162458892-1.png	image/png	235881	1023	665	50	50
46	article-new-1761162458900-2.png	2025-10-22 19:47:38.903+00	2025-10-22 19:47:38.903+00	\N	\N	article-new-1761162458900-2.png	image/png	95022	682	645	50	50
47	article-new-1761162458906-3.png	2025-10-22 19:47:38.909+00	2025-10-22 19:47:38.909+00	\N	\N	article-new-1761162458906-3.png	image/png	30071	293	497	50	50
48	article-new-1761162458912-4.png	2025-10-22 19:47:38.914+00	2025-10-22 19:47:38.914+00	\N	\N	article-new-1761162458912-4.png	image/png	17365	540	264	50	50
49	article-new-1761162458917-5.png	2025-10-22 19:47:38.92+00	2025-10-22 19:47:38.92+00	\N	\N	article-new-1761162458917-5.png	image/png	75399	575	759	50	50
50	article-new-1761162458923-6.png	2025-10-22 19:47:38.925+00	2025-10-22 19:47:38.925+00	\N	\N	article-new-1761162458923-6.png	image/png	22735	636	282	50	50
51	Sentences_Suddep_espionage	2025-10-22 19:49:13.707+00	2025-10-22 19:49:13.707+00	\N	\N	Судебная тень_ исчезающие приговоры по госизмене и терроризму.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	9566	\N	\N	\N	\N
52	Sud_Dep_RF	2025-10-22 19:52:00.818+00	2025-10-22 19:52:00.818+00	\N	\N	suddep.jpg	image/jpeg	101826	765	510	50	50
53	Telega_Messenger	2025-10-23 14:34:53.629+00	2025-10-23 14:34:53.629+00	\N	\N	iPhone.png	image/png	46168	396	704	50	50
54	Telega_Messenger	2025-10-23 14:36:19.722+00	2025-10-23 14:36:19.722+00	\N	\N	Telega - новый загадочный Telegram-клиент (1).docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	697731	\N	\N	\N	\N
55	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.498+00	2025-10-23 14:36:30.498+00	\N	\N	article-new-1761230190492-0.png	image/png	55402	1474	366	50	50
56	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.506+00	2025-10-23 14:36:30.506+00	\N	\N	article-new-1761230190502-1.png	image/png	235881	1023	665	50	50
57	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.513+00	2025-10-23 14:36:30.513+00	\N	\N	article-new-1761230190510-2.png	image/png	95022	682	645	50	50
58	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.519+00	2025-10-23 14:36:30.519+00	\N	\N	article-new-1761230190517-3.png	image/png	30071	293	497	50	50
59	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.524+00	2025-10-23 14:36:30.524+00	\N	\N	article-new-1761230190522-4.png	image/png	17365	540	264	50	50
60	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.53+00	2025-10-23 14:36:30.53+00	\N	\N	article-new-1761230190527-5.png	image/png	75399	575	759	50	50
61	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.535+00	2025-10-23 14:36:30.535+00	\N	\N	article-new-1761230190533-6.png	image/png	108318	1402	430	50	50
62	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.54+00	2025-10-23 14:36:30.54+00	\N	\N	article-new-1761230190538-7.png	image/png	27855	1674	192	50	50
63	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.545+00	2025-10-23 14:36:30.545+00	\N	\N	article-new-1761230190543-8.png	image/png	61102	1273	384	50	50
64	Telega - новый проект Вконтакте?	2025-10-23 14:36:30.551+00	2025-10-23 14:36:30.551+00	\N	\N	article-new-1761230190549-9.png	image/png	20679	1272	186	50	50
65	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.925+00	2025-10-23 14:36:34.925+00	\N	\N	article-new-1761230194918-0.png	image/png	55402	1474	366	50	50
66	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.932+00	2025-10-23 14:36:34.932+00	\N	\N	article-new-1761230194929-1.png	image/png	235881	1023	665	50	50
67	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.939+00	2025-10-23 14:36:34.939+00	\N	\N	article-new-1761230194936-2.png	image/png	95022	682	645	50	50
68	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.944+00	2025-10-23 14:36:34.944+00	\N	\N	article-new-1761230194942-3.png	image/png	30071	293	497	50	50
69	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.95+00	2025-10-23 14:36:34.95+00	\N	\N	article-new-1761230194948-4.png	image/png	17365	540	264	50	50
70	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.956+00	2025-10-23 14:36:34.956+00	\N	\N	article-new-1761230194953-5.png	image/png	75399	575	759	50	50
71	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.962+00	2025-10-23 14:36:34.962+00	\N	\N	article-new-1761230194959-6.png	image/png	108318	1402	430	50	50
72	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.968+00	2025-10-23 14:36:34.968+00	\N	\N	article-new-1761230194966-7.png	image/png	27855	1674	192	50	50
73	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.974+00	2025-10-23 14:36:34.974+00	\N	\N	article-new-1761230194971-8.png	image/png	61102	1273	384	50	50
74	Telega - новый проект Вконтакте?	2025-10-23 14:36:34.979+00	2025-10-23 14:36:34.979+00	\N	\N	article-new-1761230194976-9.png	image/png	20679	1272	186	50	50
75	wsd	2025-10-25 01:18:45.074+00	2025-10-25 01:18:45.074+00	\N	\N	article-4-1761355125065-0.png	image/png	55402	1474	366	50	50
76	wsd	2025-10-25 01:18:45.088+00	2025-10-25 01:18:45.088+00	\N	\N	article-4-1761355125083-1.png	image/png	235881	1023	665	50	50
77	wsd	2025-10-25 01:18:45.096+00	2025-10-25 01:18:45.096+00	\N	\N	article-4-1761355125093-2.png	image/png	95022	682	645	50	50
78	wsd	2025-10-25 01:18:45.12+00	2025-10-25 01:18:45.12+00	\N	\N	article-4-1761355125100-3.png	image/png	30071	293	497	50	50
79	wsd	2025-10-25 01:18:45.134+00	2025-10-25 01:18:45.134+00	\N	\N	article-4-1761355125128-4.png	image/png	17365	540	264	50	50
80	wsd	2025-10-25 01:18:45.143+00	2025-10-25 01:18:45.143+00	\N	\N	article-4-1761355125138-5.png	image/png	75399	575	759	50	50
81	wsd	2025-10-25 01:18:45.15+00	2025-10-25 01:18:45.15+00	\N	\N	article-4-1761355125147-6.png	image/png	108318	1402	430	50	50
82	wsd	2025-10-25 01:18:45.157+00	2025-10-25 01:18:45.157+00	\N	\N	article-4-1761355125154-7.png	image/png	27855	1674	192	50	50
83	wsd	2025-10-25 01:18:45.166+00	2025-10-25 01:18:45.166+00	\N	\N	article-4-1761355125163-8.png	image/png	61102	1273	384	50	50
84	wsd	2025-10-25 01:18:45.173+00	2025-10-25 01:18:45.173+00	\N	\N	article-4-1761355125170-9.png	image/png	20679	1272	186	50	50
85	wsd	2025-10-25 01:30:26.14+00	2025-10-25 01:30:26.14+00	\N	\N	article-4-1761355826106-0.png	image/png	55402	1474	366	50	50
86	wsd	2025-10-25 01:30:26.19+00	2025-10-25 01:30:26.19+00	\N	\N	article-4-1761355826158-1.png	image/png	235881	1023	665	50	50
87	wsd	2025-10-25 01:30:26.251+00	2025-10-25 01:30:26.251+00	\N	\N	article-4-1761355826217-2.png	image/png	95022	682	645	50	50
88	wsd	2025-10-25 01:30:26.314+00	2025-10-25 01:30:26.314+00	\N	\N	article-4-1761355826271-3.png	image/png	30071	293	497	50	50
89	wsd	2025-10-25 01:30:26.358+00	2025-10-25 01:30:26.358+00	\N	\N	article-4-1761355826337-4.png	image/png	17365	540	264	50	50
90	wsd	2025-10-25 01:30:26.43+00	2025-10-25 01:30:26.43+00	\N	\N	article-4-1761355826379-5.png	image/png	75399	575	759	50	50
91	wsd	2025-10-25 01:30:26.564+00	2025-10-25 01:30:26.564+00	\N	\N	article-4-1761355826490-6.png	image/png	108318	1402	430	50	50
92	wsd	2025-10-25 01:30:26.645+00	2025-10-25 01:30:26.645+00	\N	\N	article-4-1761355826603-7.png	image/png	27855	1674	192	50	50
93	wsd	2025-10-25 01:30:26.658+00	2025-10-25 01:30:26.658+00	\N	\N	article-4-1761355826651-8.png	image/png	61102	1273	384	50	50
94	wsd	2025-10-25 01:30:26.674+00	2025-10-25 01:30:26.674+00	\N	\N	article-4-1761355826663-9.png	image/png	20679	1272	186	50	50
95	wsd	2025-10-25 23:43:29.977+00	2025-10-25 23:43:29.977+00	\N	\N	article-4-1761435809966-0.png	image/png	55402	1474	366	50	50
96	wsd	2025-10-25 23:43:29.988+00	2025-10-25 23:43:29.988+00	\N	\N	article-4-1761435809984-1.png	image/png	235881	1023	665	50	50
97	wsd	2025-10-25 23:43:29.998+00	2025-10-25 23:43:29.998+00	\N	\N	article-4-1761435809993-2.png	image/png	95022	682	645	50	50
98	wsd	2025-10-25 23:43:30.01+00	2025-10-25 23:43:30.01+00	\N	\N	article-4-1761435810002-3.png	image/png	30071	293	497	50	50
99	wsd	2025-10-25 23:43:30.048+00	2025-10-25 23:43:30.048+00	\N	\N	article-4-1761435810039-4.png	image/png	17365	540	264	50	50
100	wsd	2025-10-25 23:43:30.063+00	2025-10-25 23:43:30.063+00	\N	\N	article-4-1761435810052-5.png	image/png	75399	575	759	50	50
101	wsd	2025-10-25 23:43:30.076+00	2025-10-25 23:43:30.076+00	\N	\N	article-4-1761435810072-6.png	image/png	108318	1402	430	50	50
102	wsd	2025-10-25 23:43:30.089+00	2025-10-25 23:43:30.089+00	\N	\N	article-4-1761435810083-7.png	image/png	27855	1674	192	50	50
103	wsd	2025-10-25 23:43:30.102+00	2025-10-25 23:43:30.102+00	\N	\N	article-4-1761435810095-8.png	image/png	61102	1273	384	50	50
104	wsd	2025-10-25 23:43:30.124+00	2025-10-25 23:43:30.124+00	\N	\N	article-4-1761435810110-9.png	image/png	20679	1272	186	50	50
105	wsd	2025-10-25 23:45:05.454+00	2025-10-25 23:45:05.452+00	\N	\N	article-4-1761435905277-0.png	image/png	55402	1474	366	50	50
106	wsd	2025-10-25 23:45:05.739+00	2025-10-25 23:45:05.739+00	\N	\N	article-4-1761435905617-1.png	image/png	235881	1023	665	50	50
107	wsd	2025-10-25 23:45:05.843+00	2025-10-25 23:45:05.842+00	\N	\N	article-4-1761435905778-2.png	image/png	95022	682	645	50	50
108	wsd	2025-10-25 23:45:05.992+00	2025-10-25 23:45:05.992+00	\N	\N	article-4-1761435905914-3.png	image/png	30071	293	497	50	50
109	wsd	2025-10-25 23:45:06.072+00	2025-10-25 23:45:06.072+00	\N	\N	article-4-1761435906043-4.png	image/png	17365	540	264	50	50
110	wsd	2025-10-25 23:45:06.087+00	2025-10-25 23:45:06.087+00	\N	\N	article-4-1761435906082-5.png	image/png	75399	575	759	50	50
111	wsd	2025-10-25 23:45:06.105+00	2025-10-25 23:45:06.105+00	\N	\N	article-4-1761435906094-6.png	image/png	22735	636	282	50	50
112	grre	2025-10-26 00:08:54.392+00	2025-10-26 00:08:54.392+00	\N	\N	Документ без назви.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	6930	\N	\N	\N	\N
113	пкакекекеке	2025-10-26 02:13:15.762+00	2025-10-26 02:13:15.761+00	\N	\N	Документ без назви (1).docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	7527	\N	\N	\N	\N
114	4ее4е4е4	2025-10-26 02:23:59.927+00	2025-10-26 02:23:59.926+00	\N	\N	Документ без назви (2).docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	7564	\N	\N	\N	\N
115	drrrrgeregeg	2025-10-26 02:28:39.514+00	2025-10-26 02:28:39.513+00	\N	\N	Документ без назви (4).docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	251396	\N	\N	\N	\N
116	wsd	2025-10-26 02:28:42.168+00	2025-10-26 02:28:42.168+00	\N	\N	article-4-1761445722151-0.jpg	image/jpeg	248300	2048	1348	50	50
117	wsd	2025-10-26 02:42:59.559+00	2025-10-26 02:42:59.559+00	\N	\N	article-4-1761446579530-0.jpg	image/jpeg	248300	2048	1348	50	50
118	rwegrw	2025-10-26 02:44:04.13+00	2025-10-26 02:44:04.13+00	\N	\N	Документ без назви (5).docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	251396	\N	\N	\N	\N
119	wsd	2025-10-26 02:44:08.012+00	2025-10-26 02:44:08.011+00	\N	\N	article-4-1761446647974-0.jpg	image/jpeg	248300	2048	1348	50	50
120	wsd	2025-10-30 18:15:53.833+00	2025-10-30 18:15:53.833+00	\N	\N	article-4-1761848153799-0.png	image/png	55402	1474	366	50	50
121	wsd	2025-10-30 18:15:53.849+00	2025-10-30 18:15:53.849+00	\N	\N	article-4-1761848153841-1.png	image/png	235881	1023	665	50	50
122	wsd	2025-10-30 18:15:53.862+00	2025-10-30 18:15:53.862+00	\N	\N	article-4-1761848153855-2.png	image/png	95022	682	645	50	50
123	wsd	2025-10-30 18:15:53.89+00	2025-10-30 18:15:53.89+00	\N	\N	article-4-1761848153869-3.png	image/png	30071	293	497	50	50
124	wsd	2025-10-30 18:15:53.902+00	2025-10-30 18:15:53.902+00	\N	\N	article-4-1761848153894-4.png	image/png	17365	540	264	50	50
125	wsd	2025-10-30 18:15:53.909+00	2025-10-30 18:15:53.909+00	\N	\N	article-4-1761848153906-5.png	image/png	75399	575	759	50	50
126	wsd	2025-10-30 18:15:53.915+00	2025-10-30 18:15:53.915+00	\N	\N	article-4-1761848153913-6.png	image/png	108318	1402	430	50	50
127	wsd	2025-10-30 18:15:53.922+00	2025-10-30 18:15:53.921+00	\N	\N	article-4-1761848153919-7.png	image/png	27855	1674	192	50	50
128	wsd	2025-10-30 18:15:53.929+00	2025-10-30 18:15:53.929+00	\N	\N	article-4-1761848153926-8.png	image/png	61102	1273	384	50	50
129	wsd	2025-10-30 18:15:53.935+00	2025-10-30 18:15:53.935+00	\N	\N	article-4-1761848153932-9.png	image/png	20679	1272	186	50	50
130	wsd	2025-10-30 18:27:02.733+00	2025-10-30 18:27:02.733+00	\N	\N	article-4-1761848822723-0.png	image/png	55402	1474	366	50	50
131	wsd	2025-10-30 18:27:02.743+00	2025-10-30 18:27:02.743+00	\N	\N	article-4-1761848822740-1.png	image/png	235881	1023	665	50	50
132	wsd	2025-10-30 18:27:02.75+00	2025-10-30 18:27:02.75+00	\N	\N	article-4-1761848822747-2.png	image/png	95022	682	645	50	50
133	wsd	2025-10-30 18:27:02.757+00	2025-10-30 18:27:02.757+00	\N	\N	article-4-1761848822754-3.png	image/png	30071	293	497	50	50
134	wsd	2025-10-30 18:27:02.765+00	2025-10-30 18:27:02.764+00	\N	\N	article-4-1761848822760-4.png	image/png	17365	540	264	50	50
135	wsd	2025-10-30 18:27:02.775+00	2025-10-30 18:27:02.775+00	\N	\N	article-4-1761848822770-5.png	image/png	75399	575	759	50	50
136	wsd	2025-10-30 18:27:02.782+00	2025-10-30 18:27:02.782+00	\N	\N	article-4-1761848822779-6.png	image/png	108318	1402	430	50	50
137	wsd	2025-10-30 18:27:02.791+00	2025-10-30 18:27:02.791+00	\N	\N	article-4-1761848822787-7.png	image/png	27855	1674	192	50	50
138	wsd	2025-10-30 18:27:02.797+00	2025-10-30 18:27:02.797+00	\N	\N	article-4-1761848822794-8.png	image/png	61102	1273	384	50	50
139	wsd	2025-10-30 18:27:02.804+00	2025-10-30 18:27:02.804+00	\N	\N	article-4-1761848822801-9.png	image/png	20679	1272	186	50	50
140	cybersecurity	2025-10-31 22:59:15.455+00	2025-10-31 22:59:15.455+00	\N	\N	free-icon-cyber-security-2084028.png	image/png	3552	64	64	50	50
141	From Russian Houses to Botnets	2025-10-31 23:03:23.543+00	2025-10-31 23:03:23.542+00	\N	\N	Хороший_русский_мертвый_русский.docx	application/vnd.openxmlformats-officedocument.wordprocessingml.document	507775	\N	\N	\N	\N
142	russisches_haus	2025-10-31 23:05:55.73+00	2025-10-31 23:05:55.73+00	\N	\N	russisches_haus.jpg	image/jpeg	92076	628	412	50	50
143	От «Русских домов» до бот-сетей	2025-10-31 23:05:59.434+00	2025-10-31 23:05:59.434+00	\N	\N	article-new-1761951959428-0.jpg	image/jpeg	199235	1000	654	50	50
144	От «Русских домов» до бот-сетей	2025-10-31 23:05:59.44+00	2025-10-31 23:05:59.44+00	\N	\N	article-new-1761951959438-1.jpg	image/jpeg	211317	1200	628	50	50
145	От «Русских домов» до бот-сетей	2025-10-31 23:05:59.445+00	2025-10-31 23:05:59.445+00	\N	\N	article-new-1761951959443-2.jpg	image/jpeg	49214	664	486	50	50
\.


--
-- Data for Name: payload_locked_documents; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.payload_locked_documents (id, global_slug, updated_at, created_at) FROM stdin;
251	\N	2025-10-23 20:28:11.162+00	2025-10-23 20:28:11.162+00
311	\N	2025-11-24 18:58:34.609+00	2025-11-24 18:58:34.608+00
\.


--
-- Data for Name: payload_locked_documents_rels; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.payload_locked_documents_rels (id, "order", parent_id, path, users_id, media_id, articles_id, article_categories_id, home_id, about_id, contact_id, press_id, interview_id, contact_messages_id, weekly_newsletters_id, privacy_policy_id) FROM stdin;
570	\N	311	document	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
571	\N	311	user	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
473	\N	251	document	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N
474	\N	251	user	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2025-11-01 00:09:45.416+00	2025-10-12 13:38:04.157+00
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
18	collection-interview-3	{"fields": {"content.0.items": {"collapsed": []}}}	2025-10-17 14:45:30.903+00	2025-10-17 14:37:22.893+00
12	collection-weekly-newsletters	{"limit": 10}	2025-10-14 16:01:18.141+00	2025-10-14 16:00:40.185+00
13	collection-contact-messages	{"limit": 10}	2025-10-14 16:01:28.163+00	2025-10-14 16:01:24.645+00
9	collection-about	{}	2025-10-12 17:13:54.039+00	2025-10-12 17:13:54.039+00
19	collection-press-1	{"fields": {"content": {"collapsed": ["68f535fe23056b19b419a46a", "68f532dc23056b19b419a466", "68f4af10d6b33e75bce01ef4"]}, "content.0.items": {"collapsed": ["68f5384223056b19b419a46d", "68f5369423056b19b419a46c", "68f5360023056b19b419a46b"]}}}	2025-10-19 19:24:46.004+00	2025-10-17 22:31:01.226+00
10	collection-press	{"sort": "-sortOrder", "limit": 10, "columns": [{"active": true, "accessor": "title"}, {"active": true, "accessor": "sortOrder"}, {"active": false, "accessor": "id"}, {"active": false, "accessor": "description"}, {"active": false, "accessor": "icon"}, {"active": false, "accessor": "content"}, {"active": false, "accessor": "updatedAt"}, {"active": false, "accessor": "createdAt"}, {"active": false, "accessor": "meta.metaTitle"}, {"active": false, "accessor": "meta.metaDescription"}], "editViewType": "default"}	2025-10-19 19:29:05.447+00	2025-10-12 18:44:35.888+00
26	collection-press-3	{"fields": {"content": {"collapsed": ["68f53b1323056b19b419a46e"]}, "content.0.items": {"collapsed": ["68f53b1523056b19b419a46f"]}}}	2025-10-19 19:34:04.275+00	2025-10-19 19:32:57.968+00
14	collection-about-1	{"fields": {"cards": {"collapsed": ["68ebe2082aa3ae34a318de05", "68ebe2102aa3ae34a318de06", "68ebe2182aa3ae34a318de07"]}}}	2025-10-14 17:01:26.493+00	2025-10-14 17:01:23.624+00
3	collection-interview	{"sort": "_order", "limit": 10}	2025-10-18 02:22:05.161+00	2025-10-12 14:58:35.761+00
15	collection-users	{}	2025-10-14 19:45:59.691+00	2025-10-14 19:45:59.691+00
20	collection-privacy-policy	{"editViewType": "default"}	2025-10-18 03:09:35.608+00	2025-10-18 03:09:32.789+00
2	collection-home	{"limit": 10, "editViewType": "default"}	2025-10-18 04:15:44.443+00	2025-10-12 14:56:41.077+00
7	collection-contact	{"editViewType": "default"}	2025-10-18 04:15:58.163+00	2025-10-12 17:10:52.038+00
23	global-interviewHub	{"fields": {"content": {"collapsed": ["68f56ea59f1b31b16f091ae7"]}, "content.2.items": {"collapsed": []}}, "editViewType": "default"}	2025-10-20 18:20:10.473+00	2025-10-19 02:14:38.924+00
6	collection-home-1	{"fields": {"content": {"collapsed": ["68ebf6e60b5ed01d325538a1"]}, "content.1.items": {"collapsed": []}}}	2025-10-23 14:51:33.178+00	2025-10-12 15:01:18.196+00
27	collection-interview-4	{"fields": {"content.0.items": {"collapsed": []}}}	2025-10-23 17:32:46.882+00	2025-10-23 17:32:46.642+00
21	collection-interviewHub	{"editViewType": "default"}	2025-10-19 01:08:04.293+00	2025-10-19 01:08:01.727+00
16	nav	{"groups": {"Globals": {"open": true}}}	2025-10-31 23:09:56.402+00	2025-10-14 19:46:00.27+00
22	collection-pressHub	{"editViewType": "default"}	2025-10-19 01:08:57.351+00	2025-10-19 01:08:55.214+00
28	global-siteGlobals	{"editViewType": "default"}	2025-11-01 00:01:34.403+00	2025-11-01 00:01:34.41+00
8	locale	"fr"	2025-11-01 00:36:54.182+00	2025-10-12 17:12:46.466+00
4	collection-media	{"editViewType": "default"}	2025-10-19 09:28:58.528+00	2025-10-12 14:58:53.199+00
1	collection-articles	{"limit": 10, "editViewType": "default"}	2025-10-19 09:39:43.113+00	2025-10-12 14:03:51.476+00
5	collection-article_categories	{"editViewType": "default"}	2025-10-19 09:45:11.94+00	2025-10-12 14:59:39.586+00
11	collection-article_categories-1	{"fields": {"content": {"collapsed": ["68ebf7240b5ed01d325538b0", "68ebf7320b5ed01d325538b3", "68ebf73f0b5ed01d325538b7"]}}}	2025-10-12 18:45:25.954+00	2025-10-12 18:45:25.955+00
17	collection-interview-2	{"fields": {"content": {"collapsed": []}}}	2025-10-17 14:19:24.306+00	2025-10-17 14:16:56.5+00
24	global-pressHub	{"fields": {"content": {"collapsed": ["68f4d7f6aa51ed823b259022", "68f4dedfaa51ed823b259023"]}}, "editViewType": "default"}	2025-10-19 15:12:24.487+00	2025-10-19 02:14:42.344+00
25	collection-press-2	{"fields": {"content": {"collapsed": ["68f4f56457232ec3d949b144"]}}}	2025-10-19 16:27:16.468+00	2025-10-19 16:27:16.469+00
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
128	\N	18	user	1
198	\N	19	user	1
12	\N	9	user	1
200	\N	10	user	1
77	\N	14	user	1
203	\N	26	user	1
80	\N	15	user	1
139	\N	3	user	1
141	\N	20	user	1
143	\N	2	user	1
144	\N	7	user	1
214	\N	23	user	1
217	\N	6	user	1
219	\N	27	user	1
161	\N	21	user	1
224	\N	16	user	1
163	\N	22	user	1
225	\N	28	user	1
228	\N	8	user	1
169	\N	4	user	1
170	\N	1	user	1
171	\N	5	user	1
61	\N	11	user	1
119	\N	17	user	1
65	\N	12	user	1
67	\N	13	user	1
177	\N	24	user	1
179	\N	25	user	1
\.


--
-- Data for Name: press; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.press (id, icon_id, updated_at, created_at, sort_order, meta_meta_title, meta_meta_description) FROM stdin;
2	6	2025-10-19 19:29:19.665+00	2025-10-14 19:53:43.241+00	1	\N	\N
1	3	2025-10-19 19:29:25.051+00	2025-10-14 19:35:18.478+00	2	\N	\N
3	\N	2025-10-19 19:33:26.076+00	2025-10-19 19:24:59.835+00	3	\N	\N
4	\N	2025-10-20 00:38:45.321+00	2025-10-19 19:34:17.531+00	4	\N	\N
5	\N	2025-10-26 03:21:17.935+00	2025-10-20 20:15:17.776+00	5	\N	\N
\.


--
-- Data for Name: press_blocks_press_card_grid; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.press_blocks_press_card_grid (_order, _parent_id, _path, _locale, id, block_name) FROM stdin;
1	2	content	ru	68f4f56457232ec3d949b144	\N
2	2	content	ru	68f4f32357232ec3d949b13c	\N
1	2	content	uk	68eeb10ef22c27662b9d7579	\N
1	1	content	ru	68f535fe23056b19b419a46a	\N
2	1	content	ru	68f532dc23056b19b419a466	\N
3	1	content	ru	68f4af10d6b33e75bce01ef4	\N
1	3	content	ru	68f53b1323056b19b419a46e	\N
1	4	content	ru	68f53d3c6bd4320608283821	\N
1	5	content	ru	68f6c386c1a41baa974cd150	\N
\.


--
-- Data for Name: press_blocks_press_card_grid_items; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.press_blocks_press_card_grid_items (_order, _parent_id, _locale, id, visible_from, href, title, description, image_id) FROM stdin;
1	68f535fe23056b19b419a46a	ru	68f5384223056b19b419a46d	2025-09-22 22:00:00+00	https://theins.ru/news/285149	Вмешательство РФ в выборе в Молдове	Россия наращивает усилия по пропаганде и дезинформации в Молдове	33
2	68f535fe23056b19b419a46a	ru	68f5369423056b19b419a46c	2025-09-10 22:00:00+00	https://theins.ru/news/284826	Политические приговоры в августе в России	В августе стало известно о 219 приговорах и 236 осужденных российскими судами по политическим делам	32
3	68f535fe23056b19b419a46a	ru	68f5360023056b19b419a46b	2025-08-18 22:00:00+00	https://theins.ru/news/284177	18,5 тысяч осуждено за дезертирство в РФ	Не менее 18,5 тысячи человек осудили в России за дезертирство и самовольное оставление части за время полномасштабной войны в Украине	31
1	68f532dc23056b19b419a466	ru	68f5346a23056b19b419a469	2025-08-26 22:00:00+00	https://theins.ru/news/284340	Приговоры украинцам в Курской Области	Более 300 украинских военных, участвовавших в боях в Курской области, осуждены в России	30
2	68f532dc23056b19b419a466	ru	68f533cd23056b19b419a468	2025-08-06 22:00:00+00	https://theins.ru/news/283826	Политические приговоры в июле в России	В июле стало известно о 86 приговорах и 108 осужденных российскими судами на реальные сроки по политическим делам	29
3	68f532dc23056b19b419a466	ru	68f532e623056b19b419a467	2025-07-19 22:00:00+00	https://theins.ru/news/283286	Росфинмониторинг и дела о «фейках» и «дискредитации»	В «перечень террористов и экстремистов» стали добавлять фигурантов дел о «фейках» и «дискредитации» российской армии	28
1	68f4af10d6b33e75bce01ef4	ru	68f4b084d6b33e75bce01efa	2025-07-16 22:00:00+00	https://theins.ru/news/283195	94 приговора в месяц по делам о «терроризме»	94 приговора в месяц по делам о «терроризме» выносят в России. Это в 3,5 раза больше, чем в 2021 году	20
2	68f4af10d6b33e75bce01ef4	ru	68f4afb3d6b33e75bce01ef8	2025-07-14 22:00:00+00	https://theins.ru/news/283123	РФ добавила более 1000 украинцев в «перечень террористов»	Более 1000 украинцев российские власти добавили в «перечень террористов и экстремистов» с 2022 года	19
3	68f4af10d6b33e75bce01ef4	ru	68f4af13d6b33e75bce01ef6	2025-07-10 22:00:00+00	https://theins.ru/news/282916	Политические приговоры в июне в России	145 осужденных на реальные сроки, 110 приговоров	18
1	68f6c386c1a41baa974cd150	ru	68f6c388c1a41baa974cd151	2025-07-27 22:00:00+00	https://www.zeit.de/politik/ausland/2025-07/russland-repressionen-fsb-wladimir-putin-opposition	Wie Putins Justiz Gegner zum Schweigen bringt	Seit dem Überfall auf die Ukraine werden mehr Russen wegen Landesverrats und Terrorismus eingesperrt	37
1	68f4f56457232ec3d949b144	ru	68f4f56c57232ec3d949b146	2025-10-12 22:00:00+00	https://dept.one/story/terrorizm-2025/	Пять приговоров по терроризму каждый день	Новые данные о том, как в России судят по террористическим статьям	26
2	68f4f56457232ec3d949b144	ru	68f4f93857232ec3d949b148	2025-09-23 22:00:00+00	https://dept.one/story/gosizmena-jan-jun-2025/	Два приговора в день по делам о госизмене и шпионаже	Каждый рабочий день российские суды отправляют за решетку двух человек по делам о госизмене и шпионаже	27
3	68f4f56457232ec3d949b144	ru	68f4fae857232ec3d949b14a	2025-04-03 22:00:00+00	https://dept.one/story/hroniki-adskoj-karuseli/	Хроники адской карусели	Как задержания по надуманным предлогам превращаются в уголовные дела по тяжким статьям	25
1	68f4f32357232ec3d949b13c	ru	68f4f3c757232ec3d949b140	2025-03-13 23:00:00+00	https://dept.one/story/monitoring2024/	Как нарушались права адвокатов в 2024 году	Общее количество выросло больше чем в полтора раза, количество случаев уголовного преследования — больше чем в два раза	24
2	68f4f32357232ec3d949b13c	ru	68f4f33357232ec3d949b13e	2024-12-19 23:00:00+00	https://dept.one/story/izmena-2024/	Фигурантов дел о госизмене и шпионаже уже 1000	За время войны — 792. 359 человек осуждены в 2024 году. Это значительно больше, чем по любым предыдущим подсчетам	23
1	68eeb10ef22c27662b9d7579	uk	68eeb110f22c27662b9d757a	2025-10-13 22:00:00+00	https://dept.one/story/izmena-2024/	Фігурантів справ про державну зраду, шпигунство та конфіденційне співробітництво вже 1000	\N	10
1	68f53b1323056b19b419a46e	ru	68f53b1523056b19b419a46f	2025-10-12 22:00:00+00	https://istories.media/stories/2025/10/13/sredi-osuzhdennikh-podrostki-pensioneri-i-tselie-semi/	 190 приговоров по шпионажу в отношении Украинцев	190 приговоров, среди осужденных — подростки, пенсионеры и целые семьи, 28% — женщины	34
2	68f53b1323056b19b419a46e	ru	68f53c4223056b19b419a470	2024-12-03 23:00:00+00	https://istories.media/news/2024/12/04/fsb-ispolzuet-shpionskoe-po-monokle-chtobi-komprometirovat-ustroistva-rossiyan-pri-zhestkoi-verbovke/	ФСБ использует шпионское ПО Monokle	ФСБ использует шпионское ПО Monokle, чтобы компрометировать устройства россиян при жесткой вербовке	35
1	68f53d3c6bd4320608283821	ru	68f53d606bd4320608283822	2025-07-21 22:00:00+00	https://www.bloomberg.com/news/articles/2025-07-22/putin-restores-stalin-s-victorious-ww2-legacy-as-he-cracks-down-in-russia	Stalin Makes a Comeback in Putin’s Wartime Crackdown on Dissent	Russian courts have heard 694 criminal cases of treason and espionage involving 756 people since the war started	36
\.


--
-- Data for Name: press_blocks_press_overlay_hero; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.press_blocks_press_overlay_hero (_order, _parent_id, _path, _locale, id, visible_from, href, title, subtitle, image_id, block_name) FROM stdin;
\.


--
-- Data for Name: press_blocks_press_overlay_pair; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.press_blocks_press_overlay_pair (_order, _parent_id, _path, _locale, id, block_name) FROM stdin;
\.


--
-- Data for Name: press_blocks_press_overlay_pair_items; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.press_blocks_press_overlay_pair_items (_order, _parent_id, _locale, id, date, visible_from, href, title, image_id) FROM stdin;
\.


--
-- Data for Name: press_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.press_locales (title, description, id, _locale, _parent_id) FROM stdin;
Первый Отдел	fgfgfg	92	ru	2
Перший відділ	ло	93	uk	2
The Insider	вадылоа	94	ru	1
Важные Истории	\N	97	ru	3
Bloomberg	\N	101	ru	4
Die ZEIT	\N	106	ru	5
\.


--
-- Data for Name: privacy_policy; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.privacy_policy (id, updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: privacy_policy_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.privacy_policy_locales (title, meta_title, meta_description, rich_content, id, _locale, _parent_id) FROM stdin;
\.


--
-- Data for Name: site_globals; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.site_globals (id, press_meta_meta_title, press_meta_meta_description, interview_meta_meta_title, interview_meta_meta_description, updated_at, created_at) FROM stdin;
1	Тест1	Тест1 опис	Тест 2	Тест 2 опис	2025-11-01 00:38:30.249+00	2025-11-01 00:04:46.774+00
\.


--
-- Data for Name: site_globals_locales; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.site_globals_locales (menu_about, menu_blog, menu_press, menu_interview, menu_contacts, categories_back_to_home, press_all_title, interview_all_title, id, _locale, _parent_id) FROM stdin;
О центре	Публикации	В СМИ	 Интервью	Контакты	Вернуться на главную		\N	40	ru	1
Про центр	Публікації	У ЗМІ	Інтерв'ю	Контакти	Повернутися на головну	\N	\N	41	uk	1
About	Publications	In Media	Interviews	Contacts	Back to home	\N	\N	42	en	1
À propos	Publications	Dans les médias	Interviews	Contacts	Retour à l'accueil		\N	43	fr	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.users (id, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until) FROM stdin;
1	2025-11-30 20:00:26.194+00	2025-10-12 14:03:47.52+00	blackphantom32@gmail.com	\N	\N	ae779cb6eeff0e43846cbfcfdfab5d975c103d6fa3aa5b2d44f7fb3666ac6f5e	f29e7851d2eb24179756f1e0568677a0849dd5eaf8eef315bac2a3c7d2c15ba68569a817166a0d1db013ba8174f0a3cf9430e5fc15c8de8777563216ccd504df59ec55f1c72879621bf1c23a78642555969cbc2634b2672a67915b5548e64079200e3981037a8692c12bafb4e39d80eb1978cce3a4a472b57f1ec42b0b7da9e265d74848bd70385a1d4d81aa7f76be68237065f90442a47be66564b12d6bd41dba68ccd7ce2aaefb54a0046fc80026b38fd35499c5cfb9c57073735199427c3e5ad29072d7704db37d13416b4373c76f2438bc0b7b51a91a229a5d67560f0a9cdac0560395097de1438eb84c4bf8c490a8e4ab41fa5e056e0cde023166d14a7b110236aa32d7773b1c6a0f2f7111c5479256699f7ca2a3652006ea1799f50d07c576253967eb2c3f12cc8ebeb109c8dd54058333bf98ef32b5ce9dfce302c1123809bc5067a3af9369900119c01003a1199702d4339204702f2a7018aef73c373b5a2f92400638fed4a436ce8ee01a7eeb325da66524e91bfba9cb17eb6318f2f2ac9a8594f8de4ba195491d4c2b347dc5e30d9e9b71f7388da224beb113f4e1a47da0c7ac8b090b052feb5246ff1ebedfa69aa0c25804553c18a0bfbef8de51de1a19242a49d24fc15e511ed1b299afc68ecbd0c37007297b763d13725644d0632f5aba2759448cc2435002b751b990234728d4a3f913642ce3c0eff764342f	0	\N
\.


--
-- Data for Name: users_sessions; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.users_sessions (_order, _parent_id, id, created_at, expires_at) FROM stdin;
1	1	38fae779-ab8f-4512-a60d-a478e82dbbd0	2025-11-30 20:00:26.194+00	2025-11-30 22:00:26.194+00
\.


--
-- Data for Name: weekly_newsletters; Type: TABLE DATA; Schema: public; Owner: payload
--

COPY public.weekly_newsletters (id, email, updated_at, created_at) FROM stdin;
\.


--
-- Name: _site_globals_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public._site_globals_v_id_seq', 22, true);


--
-- Name: _site_globals_v_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public._site_globals_v_locales_id_seq', 43, true);


--
-- Name: about_cards_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.about_cards_locales_id_seq', 88, true);


--
-- Name: about_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.about_id_seq', 1, true);


--
-- Name: about_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.about_locales_id_seq', 22, true);


--
-- Name: article_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.article_categories_id_seq', 5, true);


--
-- Name: article_categories_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.article_categories_locales_id_seq', 116, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.articles_id_seq', 7, true);


--
-- Name: articles_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.articles_locales_id_seq', 142, true);


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.contact_id_seq', 1, true);


--
-- Name: contact_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.contact_locales_id_seq', 18, true);


--
-- Name: contact_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.contact_messages_id_seq', 3, true);


--
-- Name: home_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.home_id_seq', 1, true);


--
-- Name: home_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.home_locales_id_seq', 99, true);


--
-- Name: interview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.interview_id_seq', 4, true);


--
-- Name: interview_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.interview_locales_id_seq', 45, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.media_id_seq', 145, true);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.payload_locked_documents_id_seq', 311, true);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.payload_locked_documents_rels_id_seq', 571, true);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 28, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 228, true);


--
-- Name: press_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.press_id_seq', 5, true);


--
-- Name: press_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.press_locales_id_seq', 106, true);


--
-- Name: privacy_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.privacy_policy_id_seq', 1, false);


--
-- Name: privacy_policy_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.privacy_policy_locales_id_seq', 1, false);


--
-- Name: site_globals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.site_globals_id_seq', 1, true);


--
-- Name: site_globals_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.site_globals_locales_id_seq', 43, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: weekly_newsletters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: payload
--

SELECT pg_catalog.setval('public.weekly_newsletters_id_seq', 1, false);


--
-- Name: _site_globals_v_locales _site_globals_v_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public._site_globals_v_locales
    ADD CONSTRAINT _site_globals_v_locales_pkey PRIMARY KEY (id);


--
-- Name: _site_globals_v _site_globals_v_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public._site_globals_v
    ADD CONSTRAINT _site_globals_v_pkey PRIMARY KEY (id);


--
-- Name: about_cards_locales about_cards_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about_cards_locales
    ADD CONSTRAINT about_cards_locales_pkey PRIMARY KEY (id);


--
-- Name: about_cards about_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about_cards
    ADD CONSTRAINT about_cards_pkey PRIMARY KEY (id);


--
-- Name: about_locales about_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about_locales
    ADD CONSTRAINT about_locales_pkey PRIMARY KEY (id);


--
-- Name: about about_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about
    ADD CONSTRAINT about_pkey PRIMARY KEY (id);


--
-- Name: article_categories_blocks_category_card_grid_items article_categories_blocks_category_card_grid_items_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_card_grid_items
    ADD CONSTRAINT article_categories_blocks_category_card_grid_items_pkey PRIMARY KEY (id);


--
-- Name: article_categories_blocks_category_card_grid article_categories_blocks_category_card_grid_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_card_grid
    ADD CONSTRAINT article_categories_blocks_category_card_grid_pkey PRIMARY KEY (id);


--
-- Name: article_categories_blocks_category_overlay_hero article_categories_blocks_category_overlay_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_overlay_hero
    ADD CONSTRAINT article_categories_blocks_category_overlay_hero_pkey PRIMARY KEY (id);


--
-- Name: article_categories_blocks_category_overlay_pair_items article_categories_blocks_category_overlay_pair_items_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_overlay_pair_items
    ADD CONSTRAINT article_categories_blocks_category_overlay_pair_items_pkey PRIMARY KEY (id);


--
-- Name: article_categories_blocks_category_overlay_pair article_categories_blocks_category_overlay_pair_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_overlay_pair
    ADD CONSTRAINT article_categories_blocks_category_overlay_pair_pkey PRIMARY KEY (id);


--
-- Name: article_categories_locales article_categories_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_locales
    ADD CONSTRAINT article_categories_locales_pkey PRIMARY KEY (id);


--
-- Name: article_categories article_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories
    ADD CONSTRAINT article_categories_pkey PRIMARY KEY (id);


--
-- Name: articles_locales articles_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.articles_locales
    ADD CONSTRAINT articles_locales_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: contact_locales contact_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.contact_locales
    ADD CONSTRAINT contact_locales_pkey PRIMARY KEY (id);


--
-- Name: contact_messages contact_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.contact_messages
    ADD CONSTRAINT contact_messages_pkey PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: home_blocks_category_card_grid_items home_blocks_category_card_grid_items_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_blocks_category_card_grid_items
    ADD CONSTRAINT home_blocks_category_card_grid_items_pkey PRIMARY KEY (id);


--
-- Name: home_blocks_category_card_grid home_blocks_category_card_grid_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_blocks_category_card_grid
    ADD CONSTRAINT home_blocks_category_card_grid_pkey PRIMARY KEY (id);


--
-- Name: home_blocks_home_featured home_blocks_home_featured_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_blocks_home_featured
    ADD CONSTRAINT home_blocks_home_featured_pkey PRIMARY KEY (id);


--
-- Name: home_locales home_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_locales
    ADD CONSTRAINT home_locales_pkey PRIMARY KEY (id);


--
-- Name: home home_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home
    ADD CONSTRAINT home_pkey PRIMARY KEY (id);


--
-- Name: home_trends_items home_trends_items_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_trends_items
    ADD CONSTRAINT home_trends_items_pkey PRIMARY KEY (id);


--
-- Name: interview_blocks_interview_card_grid_items interview_blocks_interview_card_grid_items_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_card_grid_items
    ADD CONSTRAINT interview_blocks_interview_card_grid_items_pkey PRIMARY KEY (id);


--
-- Name: interview_blocks_interview_card_grid interview_blocks_interview_card_grid_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_card_grid
    ADD CONSTRAINT interview_blocks_interview_card_grid_pkey PRIMARY KEY (id);


--
-- Name: interview_blocks_interview_overlay_hero interview_blocks_interview_overlay_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_overlay_hero
    ADD CONSTRAINT interview_blocks_interview_overlay_hero_pkey PRIMARY KEY (id);


--
-- Name: interview_blocks_interview_overlay_pair_items interview_blocks_interview_overlay_pair_items_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_overlay_pair_items
    ADD CONSTRAINT interview_blocks_interview_overlay_pair_items_pkey PRIMARY KEY (id);


--
-- Name: interview_blocks_interview_overlay_pair interview_blocks_interview_overlay_pair_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_overlay_pair
    ADD CONSTRAINT interview_blocks_interview_overlay_pair_pkey PRIMARY KEY (id);


--
-- Name: interview_locales interview_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_locales
    ADD CONSTRAINT interview_locales_pkey PRIMARY KEY (id);


--
-- Name: interview interview_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview
    ADD CONSTRAINT interview_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents payload_locked_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents
    ADD CONSTRAINT payload_locked_documents_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: press_blocks_press_card_grid_items press_blocks_press_card_grid_items_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_card_grid_items
    ADD CONSTRAINT press_blocks_press_card_grid_items_pkey PRIMARY KEY (id);


--
-- Name: press_blocks_press_card_grid press_blocks_press_card_grid_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_card_grid
    ADD CONSTRAINT press_blocks_press_card_grid_pkey PRIMARY KEY (id);


--
-- Name: press_blocks_press_overlay_hero press_blocks_press_overlay_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_overlay_hero
    ADD CONSTRAINT press_blocks_press_overlay_hero_pkey PRIMARY KEY (id);


--
-- Name: press_blocks_press_overlay_pair_items press_blocks_press_overlay_pair_items_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_overlay_pair_items
    ADD CONSTRAINT press_blocks_press_overlay_pair_items_pkey PRIMARY KEY (id);


--
-- Name: press_blocks_press_overlay_pair press_blocks_press_overlay_pair_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_overlay_pair
    ADD CONSTRAINT press_blocks_press_overlay_pair_pkey PRIMARY KEY (id);


--
-- Name: press_locales press_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_locales
    ADD CONSTRAINT press_locales_pkey PRIMARY KEY (id);


--
-- Name: press press_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press
    ADD CONSTRAINT press_pkey PRIMARY KEY (id);


--
-- Name: privacy_policy_locales privacy_policy_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.privacy_policy_locales
    ADD CONSTRAINT privacy_policy_locales_pkey PRIMARY KEY (id);


--
-- Name: privacy_policy privacy_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.privacy_policy
    ADD CONSTRAINT privacy_policy_pkey PRIMARY KEY (id);


--
-- Name: site_globals_locales site_globals_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.site_globals_locales
    ADD CONSTRAINT site_globals_locales_pkey PRIMARY KEY (id);


--
-- Name: site_globals site_globals_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.site_globals
    ADD CONSTRAINT site_globals_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_sessions users_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_pkey PRIMARY KEY (id);


--
-- Name: weekly_newsletters weekly_newsletters_pkey; Type: CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.weekly_newsletters
    ADD CONSTRAINT weekly_newsletters_pkey PRIMARY KEY (id);


--
-- Name: _site_globals_v_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX _site_globals_v_created_at_idx ON public._site_globals_v USING btree (created_at);


--
-- Name: _site_globals_v_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX _site_globals_v_locales_locale_parent_id_unique ON public._site_globals_v_locales USING btree (_locale, _parent_id);


--
-- Name: _site_globals_v_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX _site_globals_v_updated_at_idx ON public._site_globals_v USING btree (updated_at);


--
-- Name: about_cards_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX about_cards_locales_locale_parent_id_unique ON public.about_cards_locales USING btree (_locale, _parent_id);


--
-- Name: about_cards_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX about_cards_order_idx ON public.about_cards USING btree (_order);


--
-- Name: about_cards_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX about_cards_parent_id_idx ON public.about_cards USING btree (_parent_id);


--
-- Name: about_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX about_created_at_idx ON public.about USING btree (created_at);


--
-- Name: about_hero_image_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX about_hero_image_idx ON public.about USING btree (hero_image_id);


--
-- Name: about_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX about_locales_locale_parent_id_unique ON public.about_locales USING btree (_locale, _parent_id);


--
-- Name: about_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX about_updated_at_idx ON public.about USING btree (updated_at);


--
-- Name: article_categories_blocks_category_card_grid_items_artic_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_card_grid_items_artic_idx ON public.article_categories_blocks_category_card_grid_items USING btree (article_id);


--
-- Name: article_categories_blocks_category_card_grid_items_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_card_grid_items_locale_idx ON public.article_categories_blocks_category_card_grid_items USING btree (_locale);


--
-- Name: article_categories_blocks_category_card_grid_items_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_card_grid_items_order_idx ON public.article_categories_blocks_category_card_grid_items USING btree (_order);


--
-- Name: article_categories_blocks_category_card_grid_items_parent_id_id; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_card_grid_items_parent_id_id ON public.article_categories_blocks_category_card_grid_items USING btree (_parent_id);


--
-- Name: article_categories_blocks_category_card_grid_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_card_grid_locale_idx ON public.article_categories_blocks_category_card_grid USING btree (_locale);


--
-- Name: article_categories_blocks_category_card_grid_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_card_grid_order_idx ON public.article_categories_blocks_category_card_grid USING btree (_order);


--
-- Name: article_categories_blocks_category_card_grid_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_card_grid_parent_id_idx ON public.article_categories_blocks_category_card_grid USING btree (_parent_id);


--
-- Name: article_categories_blocks_category_card_grid_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_card_grid_path_idx ON public.article_categories_blocks_category_card_grid USING btree (_path);


--
-- Name: article_categories_blocks_category_overlay_hero_article_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_hero_article_idx ON public.article_categories_blocks_category_overlay_hero USING btree (article_id);


--
-- Name: article_categories_blocks_category_overlay_hero_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_hero_locale_idx ON public.article_categories_blocks_category_overlay_hero USING btree (_locale);


--
-- Name: article_categories_blocks_category_overlay_hero_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_hero_order_idx ON public.article_categories_blocks_category_overlay_hero USING btree (_order);


--
-- Name: article_categories_blocks_category_overlay_hero_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_hero_parent_id_idx ON public.article_categories_blocks_category_overlay_hero USING btree (_parent_id);


--
-- Name: article_categories_blocks_category_overlay_hero_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_hero_path_idx ON public.article_categories_blocks_category_overlay_hero USING btree (_path);


--
-- Name: article_categories_blocks_category_overlay_pair_items_ar_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_pair_items_ar_idx ON public.article_categories_blocks_category_overlay_pair_items USING btree (article_id);


--
-- Name: article_categories_blocks_category_overlay_pair_items_locale_id; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_pair_items_locale_id ON public.article_categories_blocks_category_overlay_pair_items USING btree (_locale);


--
-- Name: article_categories_blocks_category_overlay_pair_items_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_pair_items_order_idx ON public.article_categories_blocks_category_overlay_pair_items USING btree (_order);


--
-- Name: article_categories_blocks_category_overlay_pair_items_parent_id; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_pair_items_parent_id ON public.article_categories_blocks_category_overlay_pair_items USING btree (_parent_id);


--
-- Name: article_categories_blocks_category_overlay_pair_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_pair_locale_idx ON public.article_categories_blocks_category_overlay_pair USING btree (_locale);


--
-- Name: article_categories_blocks_category_overlay_pair_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_pair_order_idx ON public.article_categories_blocks_category_overlay_pair USING btree (_order);


--
-- Name: article_categories_blocks_category_overlay_pair_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_pair_parent_id_idx ON public.article_categories_blocks_category_overlay_pair USING btree (_parent_id);


--
-- Name: article_categories_blocks_category_overlay_pair_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_blocks_category_overlay_pair_path_idx ON public.article_categories_blocks_category_overlay_pair USING btree (_path);


--
-- Name: article_categories_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_created_at_idx ON public.article_categories USING btree (created_at);


--
-- Name: article_categories_icon_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_icon_idx ON public.article_categories USING btree (icon_id);


--
-- Name: article_categories_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX article_categories_locales_locale_parent_id_unique ON public.article_categories_locales USING btree (_locale, _parent_id);


--
-- Name: article_categories_sort_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_sort_order_idx ON public.article_categories USING btree (sort_order);


--
-- Name: article_categories_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX article_categories_updated_at_idx ON public.article_categories USING btree (updated_at);


--
-- Name: articles_bg_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX articles_bg_idx ON public.articles USING btree (bg_id);


--
-- Name: articles_category_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX articles_category_idx ON public.articles USING btree (category_id);


--
-- Name: articles_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX articles_created_at_idx ON public.articles USING btree (created_at);


--
-- Name: articles_import_file_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX articles_import_file_idx ON public.articles USING btree (import_file_id);


--
-- Name: articles_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX articles_locales_locale_parent_id_unique ON public.articles_locales USING btree (_locale, _parent_id);


--
-- Name: articles_slug_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX articles_slug_idx ON public.articles USING btree (slug);


--
-- Name: articles_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX articles_updated_at_idx ON public.articles USING btree (updated_at);


--
-- Name: contact_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX contact_created_at_idx ON public.contact USING btree (created_at);


--
-- Name: contact_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX contact_locales_locale_parent_id_unique ON public.contact_locales USING btree (_locale, _parent_id);


--
-- Name: contact_messages_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX contact_messages_created_at_idx ON public.contact_messages USING btree (created_at);


--
-- Name: contact_messages_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX contact_messages_updated_at_idx ON public.contact_messages USING btree (updated_at);


--
-- Name: contact_side_image_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX contact_side_image_idx ON public.contact USING btree (side_image_id);


--
-- Name: contact_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX contact_updated_at_idx ON public.contact USING btree (updated_at);


--
-- Name: home_blocks_category_card_grid_items_article_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_category_card_grid_items_article_idx ON public.home_blocks_category_card_grid_items USING btree (article_id);


--
-- Name: home_blocks_category_card_grid_items_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_category_card_grid_items_locale_idx ON public.home_blocks_category_card_grid_items USING btree (_locale);


--
-- Name: home_blocks_category_card_grid_items_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_category_card_grid_items_order_idx ON public.home_blocks_category_card_grid_items USING btree (_order);


--
-- Name: home_blocks_category_card_grid_items_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_category_card_grid_items_parent_id_idx ON public.home_blocks_category_card_grid_items USING btree (_parent_id);


--
-- Name: home_blocks_category_card_grid_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_category_card_grid_locale_idx ON public.home_blocks_category_card_grid USING btree (_locale);


--
-- Name: home_blocks_category_card_grid_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_category_card_grid_order_idx ON public.home_blocks_category_card_grid USING btree (_order);


--
-- Name: home_blocks_category_card_grid_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_category_card_grid_parent_id_idx ON public.home_blocks_category_card_grid USING btree (_parent_id);


--
-- Name: home_blocks_category_card_grid_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_category_card_grid_path_idx ON public.home_blocks_category_card_grid USING btree (_path);


--
-- Name: home_blocks_home_featured_article_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_home_featured_article_idx ON public.home_blocks_home_featured USING btree (article_id);


--
-- Name: home_blocks_home_featured_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_home_featured_locale_idx ON public.home_blocks_home_featured USING btree (_locale);


--
-- Name: home_blocks_home_featured_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_home_featured_order_idx ON public.home_blocks_home_featured USING btree (_order);


--
-- Name: home_blocks_home_featured_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_home_featured_parent_id_idx ON public.home_blocks_home_featured USING btree (_parent_id);


--
-- Name: home_blocks_home_featured_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_blocks_home_featured_path_idx ON public.home_blocks_home_featured USING btree (_path);


--
-- Name: home_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_created_at_idx ON public.home USING btree (created_at);


--
-- Name: home_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX home_locales_locale_parent_id_unique ON public.home_locales USING btree (_locale, _parent_id);


--
-- Name: home_trends_items_article_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_trends_items_article_idx ON public.home_trends_items USING btree (article_id);


--
-- Name: home_trends_items_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_trends_items_order_idx ON public.home_trends_items USING btree (_order);


--
-- Name: home_trends_items_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_trends_items_parent_id_idx ON public.home_trends_items USING btree (_parent_id);


--
-- Name: home_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX home_updated_at_idx ON public.home USING btree (updated_at);


--
-- Name: interview_blocks_interview_card_grid_items_image_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_card_grid_items_image_idx ON public.interview_blocks_interview_card_grid_items USING btree (image_id);


--
-- Name: interview_blocks_interview_card_grid_items_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_card_grid_items_locale_idx ON public.interview_blocks_interview_card_grid_items USING btree (_locale);


--
-- Name: interview_blocks_interview_card_grid_items_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_card_grid_items_order_idx ON public.interview_blocks_interview_card_grid_items USING btree (_order);


--
-- Name: interview_blocks_interview_card_grid_items_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_card_grid_items_parent_id_idx ON public.interview_blocks_interview_card_grid_items USING btree (_parent_id);


--
-- Name: interview_blocks_interview_card_grid_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_card_grid_locale_idx ON public.interview_blocks_interview_card_grid USING btree (_locale);


--
-- Name: interview_blocks_interview_card_grid_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_card_grid_order_idx ON public.interview_blocks_interview_card_grid USING btree (_order);


--
-- Name: interview_blocks_interview_card_grid_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_card_grid_parent_id_idx ON public.interview_blocks_interview_card_grid USING btree (_parent_id);


--
-- Name: interview_blocks_interview_card_grid_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_card_grid_path_idx ON public.interview_blocks_interview_card_grid USING btree (_path);


--
-- Name: interview_blocks_interview_overlay_hero_image_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_hero_image_idx ON public.interview_blocks_interview_overlay_hero USING btree (image_id);


--
-- Name: interview_blocks_interview_overlay_hero_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_hero_locale_idx ON public.interview_blocks_interview_overlay_hero USING btree (_locale);


--
-- Name: interview_blocks_interview_overlay_hero_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_hero_order_idx ON public.interview_blocks_interview_overlay_hero USING btree (_order);


--
-- Name: interview_blocks_interview_overlay_hero_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_hero_parent_id_idx ON public.interview_blocks_interview_overlay_hero USING btree (_parent_id);


--
-- Name: interview_blocks_interview_overlay_hero_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_hero_path_idx ON public.interview_blocks_interview_overlay_hero USING btree (_path);


--
-- Name: interview_blocks_interview_overlay_pair_items_image_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_pair_items_image_idx ON public.interview_blocks_interview_overlay_pair_items USING btree (image_id);


--
-- Name: interview_blocks_interview_overlay_pair_items_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_pair_items_locale_idx ON public.interview_blocks_interview_overlay_pair_items USING btree (_locale);


--
-- Name: interview_blocks_interview_overlay_pair_items_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_pair_items_order_idx ON public.interview_blocks_interview_overlay_pair_items USING btree (_order);


--
-- Name: interview_blocks_interview_overlay_pair_items_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_pair_items_parent_id_idx ON public.interview_blocks_interview_overlay_pair_items USING btree (_parent_id);


--
-- Name: interview_blocks_interview_overlay_pair_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_pair_locale_idx ON public.interview_blocks_interview_overlay_pair USING btree (_locale);


--
-- Name: interview_blocks_interview_overlay_pair_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_pair_order_idx ON public.interview_blocks_interview_overlay_pair USING btree (_order);


--
-- Name: interview_blocks_interview_overlay_pair_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_pair_parent_id_idx ON public.interview_blocks_interview_overlay_pair USING btree (_parent_id);


--
-- Name: interview_blocks_interview_overlay_pair_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_blocks_interview_overlay_pair_path_idx ON public.interview_blocks_interview_overlay_pair USING btree (_path);


--
-- Name: interview_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_created_at_idx ON public.interview USING btree (created_at);


--
-- Name: interview_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX interview_locales_locale_parent_id_unique ON public.interview_locales USING btree (_locale, _parent_id);


--
-- Name: interview_sort_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_sort_order_idx ON public.interview USING btree (sort_order);


--
-- Name: interview_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX interview_updated_at_idx ON public.interview USING btree (updated_at);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);


--
-- Name: media_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX media_updated_at_idx ON public.media USING btree (updated_at);


--
-- Name: payload_locked_documents_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_created_at_idx ON public.payload_locked_documents USING btree (created_at);


--
-- Name: payload_locked_documents_global_slug_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_global_slug_idx ON public.payload_locked_documents USING btree (global_slug);


--
-- Name: payload_locked_documents_rels_about_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_about_id_idx ON public.payload_locked_documents_rels USING btree (about_id);


--
-- Name: payload_locked_documents_rels_article_categories_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_article_categories_id_idx ON public.payload_locked_documents_rels USING btree (article_categories_id);


--
-- Name: payload_locked_documents_rels_articles_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_articles_id_idx ON public.payload_locked_documents_rels USING btree (articles_id);


--
-- Name: payload_locked_documents_rels_contact_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_contact_id_idx ON public.payload_locked_documents_rels USING btree (contact_id);


--
-- Name: payload_locked_documents_rels_contact_messages_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_contact_messages_id_idx ON public.payload_locked_documents_rels USING btree (contact_messages_id);


--
-- Name: payload_locked_documents_rels_home_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_home_id_idx ON public.payload_locked_documents_rels USING btree (home_id);


--
-- Name: payload_locked_documents_rels_interview_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_interview_id_idx ON public.payload_locked_documents_rels USING btree (interview_id);


--
-- Name: payload_locked_documents_rels_media_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_media_id_idx ON public.payload_locked_documents_rels USING btree (media_id);


--
-- Name: payload_locked_documents_rels_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_order_idx ON public.payload_locked_documents_rels USING btree ("order");


--
-- Name: payload_locked_documents_rels_parent_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_parent_idx ON public.payload_locked_documents_rels USING btree (parent_id);


--
-- Name: payload_locked_documents_rels_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_path_idx ON public.payload_locked_documents_rels USING btree (path);


--
-- Name: payload_locked_documents_rels_press_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_press_id_idx ON public.payload_locked_documents_rels USING btree (press_id);


--
-- Name: payload_locked_documents_rels_privacy_policy_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_privacy_policy_id_idx ON public.payload_locked_documents_rels USING btree (privacy_policy_id);


--
-- Name: payload_locked_documents_rels_users_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_users_id_idx ON public.payload_locked_documents_rels USING btree (users_id);


--
-- Name: payload_locked_documents_rels_weekly_newsletters_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_rels_weekly_newsletters_id_idx ON public.payload_locked_documents_rels USING btree (weekly_newsletters_id);


--
-- Name: payload_locked_documents_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_locked_documents_updated_at_idx ON public.payload_locked_documents USING btree (updated_at);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);


--
-- Name: payload_migrations_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_migrations_updated_at_idx ON public.payload_migrations USING btree (updated_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);


--
-- Name: payload_preferences_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX payload_preferences_updated_at_idx ON public.payload_preferences USING btree (updated_at);


--
-- Name: press_blocks_press_card_grid_items_image_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_card_grid_items_image_idx ON public.press_blocks_press_card_grid_items USING btree (image_id);


--
-- Name: press_blocks_press_card_grid_items_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_card_grid_items_locale_idx ON public.press_blocks_press_card_grid_items USING btree (_locale);


--
-- Name: press_blocks_press_card_grid_items_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_card_grid_items_order_idx ON public.press_blocks_press_card_grid_items USING btree (_order);


--
-- Name: press_blocks_press_card_grid_items_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_card_grid_items_parent_id_idx ON public.press_blocks_press_card_grid_items USING btree (_parent_id);


--
-- Name: press_blocks_press_card_grid_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_card_grid_locale_idx ON public.press_blocks_press_card_grid USING btree (_locale);


--
-- Name: press_blocks_press_card_grid_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_card_grid_order_idx ON public.press_blocks_press_card_grid USING btree (_order);


--
-- Name: press_blocks_press_card_grid_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_card_grid_parent_id_idx ON public.press_blocks_press_card_grid USING btree (_parent_id);


--
-- Name: press_blocks_press_card_grid_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_card_grid_path_idx ON public.press_blocks_press_card_grid USING btree (_path);


--
-- Name: press_blocks_press_overlay_hero_image_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_hero_image_idx ON public.press_blocks_press_overlay_hero USING btree (image_id);


--
-- Name: press_blocks_press_overlay_hero_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_hero_locale_idx ON public.press_blocks_press_overlay_hero USING btree (_locale);


--
-- Name: press_blocks_press_overlay_hero_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_hero_order_idx ON public.press_blocks_press_overlay_hero USING btree (_order);


--
-- Name: press_blocks_press_overlay_hero_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_hero_parent_id_idx ON public.press_blocks_press_overlay_hero USING btree (_parent_id);


--
-- Name: press_blocks_press_overlay_hero_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_hero_path_idx ON public.press_blocks_press_overlay_hero USING btree (_path);


--
-- Name: press_blocks_press_overlay_pair_items_image_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_pair_items_image_idx ON public.press_blocks_press_overlay_pair_items USING btree (image_id);


--
-- Name: press_blocks_press_overlay_pair_items_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_pair_items_locale_idx ON public.press_blocks_press_overlay_pair_items USING btree (_locale);


--
-- Name: press_blocks_press_overlay_pair_items_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_pair_items_order_idx ON public.press_blocks_press_overlay_pair_items USING btree (_order);


--
-- Name: press_blocks_press_overlay_pair_items_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_pair_items_parent_id_idx ON public.press_blocks_press_overlay_pair_items USING btree (_parent_id);


--
-- Name: press_blocks_press_overlay_pair_locale_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_pair_locale_idx ON public.press_blocks_press_overlay_pair USING btree (_locale);


--
-- Name: press_blocks_press_overlay_pair_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_pair_order_idx ON public.press_blocks_press_overlay_pair USING btree (_order);


--
-- Name: press_blocks_press_overlay_pair_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_pair_parent_id_idx ON public.press_blocks_press_overlay_pair USING btree (_parent_id);


--
-- Name: press_blocks_press_overlay_pair_path_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_blocks_press_overlay_pair_path_idx ON public.press_blocks_press_overlay_pair USING btree (_path);


--
-- Name: press_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_created_at_idx ON public.press USING btree (created_at);


--
-- Name: press_icon_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_icon_idx ON public.press USING btree (icon_id);


--
-- Name: press_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX press_locales_locale_parent_id_unique ON public.press_locales USING btree (_locale, _parent_id);


--
-- Name: press_sort_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_sort_order_idx ON public.press USING btree (sort_order);


--
-- Name: press_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX press_updated_at_idx ON public.press USING btree (updated_at);


--
-- Name: privacy_policy_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX privacy_policy_created_at_idx ON public.privacy_policy USING btree (created_at);


--
-- Name: privacy_policy_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX privacy_policy_locales_locale_parent_id_unique ON public.privacy_policy_locales USING btree (_locale, _parent_id);


--
-- Name: privacy_policy_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX privacy_policy_updated_at_idx ON public.privacy_policy USING btree (updated_at);


--
-- Name: site_globals_locales_locale_parent_id_unique; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX site_globals_locales_locale_parent_id_unique ON public.site_globals_locales USING btree (_locale, _parent_id);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_sessions_order_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX users_sessions_order_idx ON public.users_sessions USING btree (_order);


--
-- Name: users_sessions_parent_id_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX users_sessions_parent_id_idx ON public.users_sessions USING btree (_parent_id);


--
-- Name: users_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX users_updated_at_idx ON public.users USING btree (updated_at);


--
-- Name: weekly_newsletters_created_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX weekly_newsletters_created_at_idx ON public.weekly_newsletters USING btree (created_at);


--
-- Name: weekly_newsletters_updated_at_idx; Type: INDEX; Schema: public; Owner: payload
--

CREATE INDEX weekly_newsletters_updated_at_idx ON public.weekly_newsletters USING btree (updated_at);


--
-- Name: _site_globals_v_locales _site_globals_v_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public._site_globals_v_locales
    ADD CONSTRAINT _site_globals_v_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._site_globals_v(id) ON DELETE CASCADE;


--
-- Name: about_cards_locales about_cards_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about_cards_locales
    ADD CONSTRAINT about_cards_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.about_cards(id) ON DELETE CASCADE;


--
-- Name: about_cards about_cards_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about_cards
    ADD CONSTRAINT about_cards_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.about(id) ON DELETE CASCADE;


--
-- Name: about about_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about
    ADD CONSTRAINT about_hero_image_id_media_id_fk FOREIGN KEY (hero_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: about_locales about_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.about_locales
    ADD CONSTRAINT about_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.about(id) ON DELETE CASCADE;


--
-- Name: article_categories_blocks_category_card_grid_items article_categories_blocks_category_card_grid_items_article_id_a; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_card_grid_items
    ADD CONSTRAINT article_categories_blocks_category_card_grid_items_article_id_a FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE SET NULL;


--
-- Name: article_categories_blocks_category_card_grid_items article_categories_blocks_category_card_grid_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_card_grid_items
    ADD CONSTRAINT article_categories_blocks_category_card_grid_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.article_categories_blocks_category_card_grid(id) ON DELETE CASCADE;


--
-- Name: article_categories_blocks_category_card_grid article_categories_blocks_category_card_grid_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_card_grid
    ADD CONSTRAINT article_categories_blocks_category_card_grid_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.article_categories(id) ON DELETE CASCADE;


--
-- Name: article_categories_blocks_category_overlay_hero article_categories_blocks_category_overlay_hero_article_id_arti; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_overlay_hero
    ADD CONSTRAINT article_categories_blocks_category_overlay_hero_article_id_arti FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE SET NULL;


--
-- Name: article_categories_blocks_category_overlay_hero article_categories_blocks_category_overlay_hero_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_overlay_hero
    ADD CONSTRAINT article_categories_blocks_category_overlay_hero_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.article_categories(id) ON DELETE CASCADE;


--
-- Name: article_categories_blocks_category_overlay_pair_items article_categories_blocks_category_overlay_pair_items_article_i; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_overlay_pair_items
    ADD CONSTRAINT article_categories_blocks_category_overlay_pair_items_article_i FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE SET NULL;


--
-- Name: article_categories_blocks_category_overlay_pair_items article_categories_blocks_category_overlay_pair_items_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_overlay_pair_items
    ADD CONSTRAINT article_categories_blocks_category_overlay_pair_items_parent_id FOREIGN KEY (_parent_id) REFERENCES public.article_categories_blocks_category_overlay_pair(id) ON DELETE CASCADE;


--
-- Name: article_categories_blocks_category_overlay_pair article_categories_blocks_category_overlay_pair_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_blocks_category_overlay_pair
    ADD CONSTRAINT article_categories_blocks_category_overlay_pair_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.article_categories(id) ON DELETE CASCADE;


--
-- Name: article_categories article_categories_icon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories
    ADD CONSTRAINT article_categories_icon_id_media_id_fk FOREIGN KEY (icon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: article_categories_locales article_categories_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.article_categories_locales
    ADD CONSTRAINT article_categories_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.article_categories(id) ON DELETE CASCADE;


--
-- Name: articles articles_bg_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_bg_id_media_id_fk FOREIGN KEY (bg_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: articles articles_category_id_article_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_category_id_article_categories_id_fk FOREIGN KEY (category_id) REFERENCES public.article_categories(id) ON DELETE SET NULL;


--
-- Name: articles articles_import_file_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_import_file_id_media_id_fk FOREIGN KEY (import_file_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: articles_locales articles_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.articles_locales
    ADD CONSTRAINT articles_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: contact_locales contact_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.contact_locales
    ADD CONSTRAINT contact_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.contact(id) ON DELETE CASCADE;


--
-- Name: contact contact_side_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_side_image_id_media_id_fk FOREIGN KEY (side_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: home_blocks_category_card_grid_items home_blocks_category_card_grid_items_article_id_articles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_blocks_category_card_grid_items
    ADD CONSTRAINT home_blocks_category_card_grid_items_article_id_articles_id_fk FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE SET NULL;


--
-- Name: home_blocks_category_card_grid_items home_blocks_category_card_grid_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_blocks_category_card_grid_items
    ADD CONSTRAINT home_blocks_category_card_grid_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.home_blocks_category_card_grid(id) ON DELETE CASCADE;


--
-- Name: home_blocks_category_card_grid home_blocks_category_card_grid_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_blocks_category_card_grid
    ADD CONSTRAINT home_blocks_category_card_grid_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.home(id) ON DELETE CASCADE;


--
-- Name: home_blocks_home_featured home_blocks_home_featured_article_id_articles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_blocks_home_featured
    ADD CONSTRAINT home_blocks_home_featured_article_id_articles_id_fk FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE SET NULL;


--
-- Name: home_blocks_home_featured home_blocks_home_featured_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_blocks_home_featured
    ADD CONSTRAINT home_blocks_home_featured_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.home(id) ON DELETE CASCADE;


--
-- Name: home_locales home_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_locales
    ADD CONSTRAINT home_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.home(id) ON DELETE CASCADE;


--
-- Name: home_trends_items home_trends_items_article_id_articles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_trends_items
    ADD CONSTRAINT home_trends_items_article_id_articles_id_fk FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE SET NULL;


--
-- Name: home_trends_items home_trends_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.home_trends_items
    ADD CONSTRAINT home_trends_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.home(id) ON DELETE CASCADE;


--
-- Name: interview_blocks_interview_card_grid_items interview_blocks_interview_card_grid_items_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_card_grid_items
    ADD CONSTRAINT interview_blocks_interview_card_grid_items_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: interview_blocks_interview_card_grid_items interview_blocks_interview_card_grid_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_card_grid_items
    ADD CONSTRAINT interview_blocks_interview_card_grid_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.interview_blocks_interview_card_grid(id) ON DELETE CASCADE;


--
-- Name: interview_blocks_interview_card_grid interview_blocks_interview_card_grid_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_card_grid
    ADD CONSTRAINT interview_blocks_interview_card_grid_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.interview(id) ON DELETE CASCADE;


--
-- Name: interview_blocks_interview_overlay_hero interview_blocks_interview_overlay_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_overlay_hero
    ADD CONSTRAINT interview_blocks_interview_overlay_hero_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: interview_blocks_interview_overlay_hero interview_blocks_interview_overlay_hero_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_overlay_hero
    ADD CONSTRAINT interview_blocks_interview_overlay_hero_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.interview(id) ON DELETE CASCADE;


--
-- Name: interview_blocks_interview_overlay_pair_items interview_blocks_interview_overlay_pair_items_image_id_media_id; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_overlay_pair_items
    ADD CONSTRAINT interview_blocks_interview_overlay_pair_items_image_id_media_id FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: interview_blocks_interview_overlay_pair_items interview_blocks_interview_overlay_pair_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_overlay_pair_items
    ADD CONSTRAINT interview_blocks_interview_overlay_pair_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.interview_blocks_interview_overlay_pair(id) ON DELETE CASCADE;


--
-- Name: interview_blocks_interview_overlay_pair interview_blocks_interview_overlay_pair_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_blocks_interview_overlay_pair
    ADD CONSTRAINT interview_blocks_interview_overlay_pair_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.interview(id) ON DELETE CASCADE;


--
-- Name: interview_locales interview_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.interview_locales
    ADD CONSTRAINT interview_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.interview(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_about_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_about_fk FOREIGN KEY (about_id) REFERENCES public.about(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_article_categories_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_article_categories_fk FOREIGN KEY (article_categories_id) REFERENCES public.article_categories(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_articles_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_articles_fk FOREIGN KEY (articles_id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_contact_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_contact_fk FOREIGN KEY (contact_id) REFERENCES public.contact(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_contact_messages_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_contact_messages_fk FOREIGN KEY (contact_messages_id) REFERENCES public.contact_messages(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_home_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_home_fk FOREIGN KEY (home_id) REFERENCES public.home(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_interview_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_interview_fk FOREIGN KEY (interview_id) REFERENCES public.interview(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_locked_documents(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_press_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_press_fk FOREIGN KEY (press_id) REFERENCES public.press(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_privacy_policy_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_privacy_policy_fk FOREIGN KEY (privacy_policy_id) REFERENCES public.privacy_policy(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_weekly_newsletters_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_weekly_newsletters_fk FOREIGN KEY (weekly_newsletters_id) REFERENCES public.weekly_newsletters(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: press_blocks_press_card_grid_items press_blocks_press_card_grid_items_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_card_grid_items
    ADD CONSTRAINT press_blocks_press_card_grid_items_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: press_blocks_press_card_grid_items press_blocks_press_card_grid_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_card_grid_items
    ADD CONSTRAINT press_blocks_press_card_grid_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.press_blocks_press_card_grid(id) ON DELETE CASCADE;


--
-- Name: press_blocks_press_card_grid press_blocks_press_card_grid_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_card_grid
    ADD CONSTRAINT press_blocks_press_card_grid_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.press(id) ON DELETE CASCADE;


--
-- Name: press_blocks_press_overlay_hero press_blocks_press_overlay_hero_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_overlay_hero
    ADD CONSTRAINT press_blocks_press_overlay_hero_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: press_blocks_press_overlay_hero press_blocks_press_overlay_hero_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_overlay_hero
    ADD CONSTRAINT press_blocks_press_overlay_hero_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.press(id) ON DELETE CASCADE;


--
-- Name: press_blocks_press_overlay_pair_items press_blocks_press_overlay_pair_items_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_overlay_pair_items
    ADD CONSTRAINT press_blocks_press_overlay_pair_items_image_id_media_id_fk FOREIGN KEY (image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: press_blocks_press_overlay_pair_items press_blocks_press_overlay_pair_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_overlay_pair_items
    ADD CONSTRAINT press_blocks_press_overlay_pair_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.press_blocks_press_overlay_pair(id) ON DELETE CASCADE;


--
-- Name: press_blocks_press_overlay_pair press_blocks_press_overlay_pair_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_blocks_press_overlay_pair
    ADD CONSTRAINT press_blocks_press_overlay_pair_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.press(id) ON DELETE CASCADE;


--
-- Name: press press_icon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press
    ADD CONSTRAINT press_icon_id_media_id_fk FOREIGN KEY (icon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: press_locales press_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.press_locales
    ADD CONSTRAINT press_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.press(id) ON DELETE CASCADE;


--
-- Name: privacy_policy_locales privacy_policy_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.privacy_policy_locales
    ADD CONSTRAINT privacy_policy_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.privacy_policy(id) ON DELETE CASCADE;


--
-- Name: site_globals_locales site_globals_locales_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.site_globals_locales
    ADD CONSTRAINT site_globals_locales_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.site_globals(id) ON DELETE CASCADE;


--
-- Name: users_sessions users_sessions_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: payload
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict NQIXhmqRrTJjudfkLjBUnZjIgon1a1mtVPHGvkchufdwrca70ZwfSc2UDn16Lei

